# coding: utf-8

import os
import re
import sys
from pathlib import Path
import json
import oci


CONFIG_PROFILE = os.getenv("OCI_CONFIG_PROFILE", "DEFAULT")

CONFIG_FILE_PATH = os.getenv(
    "OCI_CONFIG_FILE_PATH",
    str(Path.home() / ".oci" / "config")
)

COMPARTMENT_ID = os.getenv("OCI_COMPARTMENT_ID", "ocid1.compartment.oc1..aaaaaaaatm34bplxwjpdfrxalb7w633njcl3z2ggblblvetwykljhndxooea")

ENDPOINT = os.getenv("OCI_GENAI_ENDPOINT", "https://inference.generativeai.us-ashburn-1.oci.oraclecloud.com")

CHAT_MODEL_ID = os.getenv("OCI_CHAT_MODEL_ID", "ocid1.generativeaimodel.oc1.iad.amaaaaaask7dceyaeo4ehrn25guuats5s45hnvswlhxo6riop275l2bkr2vq")

# ===========================================================================
# USER INPUT
# ===========================================================================

def get_user_inputs():
    print("\nOracle APEX SQL to Strict Playwright Test Generator")
    print("CI/CD Jenkins Edition")
    print("--------------------------------------------------")

    root_dir = Path(__file__).resolve().parents[1]

    sql_file = root_dir / "apex" / "f100.sql"
    dev_config_file = root_dir / "config" / "dev.json"
    output_file = root_dir / "tests" / "generated" / "generated_apex_test.spec.ts"

    if not sql_file.exists():
        raise FileNotFoundError(f"APEX SQL file not found: {sql_file}")

    if not dev_config_file.exists():
        raise FileNotFoundError(f"DEV config file not found: {dev_config_file}")

    with open(dev_config_file, "r", encoding="utf-8") as file:
        dev_config = json.load(file)

    app_url = dev_config.get("application_url")

    if not app_url:
        raise ValueError("application_url is missing in config/dev.json")

    app_url = clean_apex_url(app_url)

    print(f"SQL file: {sql_file}")
    print(f"DEV config file: {dev_config_file}")
    print(f"Application URL: {app_url}")
    print(f"Output file: {output_file}")

    return sql_file, app_url, output_file


def clean_apex_url(url):
    url = url.strip()
    url = re.sub(r"([?&])session=[^&]*&?", r"\1", url, flags=re.IGNORECASE)
    url = re.sub(r"[?&]$", "", url)
    return url


def extract_app_id_from_filename(filename):
    match = re.search(r"f(\d+)\.sql", filename, flags=re.IGNORECASE)
    if match:
        return match.group(1)
    return None


# ===========================================================================
# SQL READING + CLEANING
# ===========================================================================

def read_sql_file(sql_file_path):
    sql_path = Path(sql_file_path)

    if not sql_path.exists():
        raise FileNotFoundError(f"SQL file not found: {sql_file_path}")

    if not sql_path.is_file():
        raise ValueError(f"Given path is not a file: {sql_file_path}")

    content = sql_path.read_text(encoding="utf-8", errors="ignore")

    if not content.strip():
        raise ValueError("The SQL file is empty.")

    return content


def clean_sql_for_prompt(sql_text, max_chars=65000):
    sql_text = re.sub(r"\n\s*\n\s*\n+", "\n\n", sql_text)
    sql_text = re.sub(r"[ \t]+", " ", sql_text)

    if len(sql_text) > max_chars:
        sql_text = sql_text[:max_chars]

    return sql_text.strip()


def extract_unique_matches(pattern, text, limit=100):
    matches = re.findall(pattern, text, flags=re.IGNORECASE | re.DOTALL)
    result = []

    for match in matches:
        if isinstance(match, tuple):
            value = " ".join([str(x).strip() for x in match if x])
        else:
            value = str(match).strip()

        value = re.sub(r"\s+", " ", value)

        if value and value not in result:
            result.append(value)

        if len(result) >= limit:
            break

    return result


# ===========================================================================
# METADATA EXTRACTION (enhanced for backend / input testing)
# ===========================================================================

def extract_text_input_items(sql_text, limit=80):
    """
    Find APEX items whose display_as suggests a text-input style field.
    APEX uses display_as values like NATIVE_TEXT_FIELD, NATIVE_TEXTAREA,
    NATIVE_NUMBER_FIELD, NATIVE_DATE_PICKER, NATIVE_PASSWORD.
    """
    pattern = re.compile(
        r"p_name\s*=>\s*'(P[0-9]+_[A-Z0-9_]+)'[^;]{0,4000}?p_display_as\s*=>\s*'([A-Z0-9_]+)'",
        flags=re.IGNORECASE | re.DOTALL
    )

    keep = (
        "TEXT_FIELD",
        "TEXTAREA",
        "NUMBER_FIELD",
        "DATE_PICKER",
        "DATEPICKER",
        "RICH_TEXT",
    )

    skip = ("PASSWORD",)

    found = []
    seen = set()

    for match in pattern.finditer(sql_text):
        item_name = match.group(1).strip()
        display_as = match.group(2).strip().upper()

        if any(s in display_as for s in skip):
            continue

        if not any(k in display_as for k in keep):
            continue

        if item_name in seen:
            continue

        seen.add(item_name)
        found.append({"name": item_name, "display_as": display_as})

        if len(found) >= limit:
            break

    return found


def extract_mandatory_items(sql_text, limit=80):
    """
    Find items that are required (p_is_required => 'Y' or
    value_required style validation).
    """
    pattern = re.compile(
        r"p_name\s*=>\s*'(P[0-9]+_[A-Z0-9_]+)'[^;]{0,4000}?p_is_required\s*=>\s*'Y'",
        flags=re.IGNORECASE | re.DOTALL
    )

    found = []
    seen = set()

    for match in pattern.finditer(sql_text):
        item_name = match.group(1).strip()
        if item_name in seen:
            continue
        seen.add(item_name)
        found.append(item_name)
        if len(found) >= limit:
            break

    return found


def extract_safe_submit_buttons(sql_text, limit=30):
    """
    Buttons that look safe to click for backend smoke tests.
    Submit/Save/Create/Apply/Search/Next - never Delete/Remove/Drop/Reset/Logout.
    """
    button_names = extract_unique_matches(
        r"p_button_name\s*=>\s*'([^']+)'",
        sql_text,
        limit=200
    )

    safe_keywords = re.compile(
        r"(submit|save|apply|create|search|next|go|run|continue|find|filter)",
        flags=re.IGNORECASE
    )

    unsafe_keywords = re.compile(
        r"(delete|remove|purge|drop|reset|terminate|logout|sign\s*out|cancel|exit)",
        flags=re.IGNORECASE
    )

    safe = []
    for b in button_names:
        if unsafe_keywords.search(b):
            continue
        if safe_keywords.search(b):
            safe.append(b)
        if len(safe) >= limit:
            break

    return safe


def extract_validation_messages(sql_text, limit=30):
    return extract_unique_matches(
        r"p_error_message\s*=>\s*'([^']{2,200})'",
        sql_text,
        limit=limit
    )


def extract_apex_metadata(sql_text):
    metadata = {
        "application_id": extract_unique_matches(
            r"p_application_id\s*=>\s*'?([0-9]+)'?",
            sql_text,
            limit=5
        ),
        "application_name": extract_unique_matches(
            r"p_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=20
        ),
        "page_titles": extract_unique_matches(
            r"p_page_title\s*=>\s*'([^']+)'",
            sql_text,
            limit=40
        ),
        "page_aliases": extract_unique_matches(
            r"p_alias\s*=>\s*'([^']+)'",
            sql_text,
            limit=40
        ),
        "page_items": extract_unique_matches(
            r"p_name\s*=>\s*'(P[0-9]+_[A-Z0-9_]+)'",
            sql_text,
            limit=100
        ),
        "buttons": extract_unique_matches(
            r"p_button_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=80
        ),
        "regions": extract_unique_matches(
            r"p_region_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=80
        ),
        "validations": extract_unique_matches(
            r"p_validation_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=50
        ),
        "processes": extract_unique_matches(
            r"p_process_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=50
        ),
        "lists": extract_unique_matches(
            r"p_list_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=50
        ),
        "lovs": extract_unique_matches(
            r"p_lov_name\s*=>\s*'([^']+)'",
            sql_text,
            limit=50
        ),
        # NEW: data needed for UI + backend smoke tests
        "text_input_items": extract_text_input_items(sql_text, limit=60),
        "mandatory_items": extract_mandatory_items(sql_text, limit=60),
        "safe_submit_buttons": extract_safe_submit_buttons(sql_text, limit=20),
        "validation_messages": extract_validation_messages(sql_text, limit=25),
    }

    return metadata


def metadata_to_text(metadata):
    output = []

    for key, values in metadata.items():
        output.append(f"{key}:")
        if values:
            for value in values:
                if isinstance(value, dict):
                    output.append(f"  - {value.get('name')} (display_as={value.get('display_as')})")
                else:
                    output.append(f"  - {value}")
        else:
            output.append("  - Not found")
        output.append("")

    return "\n".join(output)


# ===========================================================================
# OCI GENAI CLIENT
# ===========================================================================

def create_oci_client():
    if not CONFIG_FILE_PATH:
        raise ValueError("OCI_CONFIG_FILE_PATH is missing.")

    if not COMPARTMENT_ID:
        raise ValueError("OCI_COMPARTMENT_ID is missing.")

    if not ENDPOINT:
        raise ValueError("OCI_GENAI_ENDPOINT is missing.")

    if not CHAT_MODEL_ID:
        raise ValueError("OCI_CHAT_MODEL_ID is missing.")

    if not os.path.exists(CONFIG_FILE_PATH):
        raise FileNotFoundError(
            f"OCI config file not found: {CONFIG_FILE_PATH}\n"
            f"Set OCI_CONFIG_FILE_PATH correctly in Jenkins."
        )

    config = oci.config.from_file(CONFIG_FILE_PATH, CONFIG_PROFILE)

    client = oci.generative_ai_inference.GenerativeAiInferenceClient(
        config=config,
        service_endpoint=ENDPOINT,
        retry_strategy=oci.retry.NoneRetryStrategy(),
        timeout=(10, 240)
    )

    return client


def build_prompt(apex_metadata_text, sql_excerpt, app_url):
    return f"""
You are an expert Oracle APEX QA automation engineer and senior Playwright TypeScript automation architect.

Generate one complete working Playwright TypeScript .spec.ts test file for the Oracle APEX application.

This test file is for a CI/CD pipeline. The generated tests must be STRICT and must include
BOTH UI smoke tests AND BACKEND smoke tests.

APEX APPLICATION RUNTIME OR LOGIN URL:
{app_url}

EXTRACTED ORACLE APEX METADATA:
{apex_metadata_text}

APEX SQL EXPORT EXCERPT:
{sql_excerpt}

STRICT OUTPUT RULES:
1. Output only TypeScript code.
2. Do not output markdown.
3. Do not output code fences.
4. Do not add explanation.
5. Do not add text before or after the code.
6. The first two lines must be exactly:
import {{ test, expect, Page, Request, Response }} from '@playwright/test';
import fs from 'fs';

MANDATORY ENVIRONMENT RULES:
The generated code must literally contain:
1. process.env.APEX_BASE_URL
2. process.env.APEX_USERNAME
3. process.env.APEX_PASSWORD

Use this exact structure:
const BASE_URL = getRequiredEnv('APEX_BASE_URL', '{app_url}');
const APEX_USERNAME = getRequiredEnv('APEX_USERNAME');
const APEX_PASSWORD = getRequiredEnv('APEX_PASSWORD');

Do not hardcode username, password, or secrets.
Do not include ?session= or &session=.

REQUIRED DATA ARRAYS:
1. const PAGE_ITEM_IDS: string[]
2. const BUTTON_NAMES: string[]
3. const REGION_PATTERNS: RegExp[]
4. const TEXT_INPUT_ITEMS: string[]           // text/number/date/textarea items
5. const MANDATORY_ITEMS: string[]            // required items
6. const SAFE_SUBMIT_BUTTONS: string[]        // safe-to-click submit buttons
7. const TEXT_TEST_INPUTS: string[]           // valid sample inputs
8. const BOUNDARY_TEST_INPUTS: string[]       // edge inputs - empty, whitespace, very long, unicode
9. const MALICIOUS_TEST_INPUTS: string[]      // SQL injection + XSS patterns (defensive only)

TEXT_TEST_INPUTS must contain at least: 'Test', 'Sample Value 123', '42', '2024-01-15', 'name@example.com'
BOUNDARY_TEST_INPUTS must contain at least: '', '   ', 'A'.repeat(5000), 'Z'.repeat(1), 'Unicode test'
MALICIOUS_TEST_INPUTS must contain at least: "' OR '1'='1", "'; DROP TABLE users--", "<script>alert(1)</script>", "../../etc/passwd"

REQUIRED HELPER FUNCTIONS:
1. function getRequiredEnv(name: string, fallback?: string): string
2. async function takeScreenshot(page: Page, name: string): Promise<void>
3. async function fillFirstVisible(page, selectors, value): Promise<boolean>
4. async function clickFirstVisible(page, selectors): Promise<boolean>
5. async function assertNotOnLoginPage(page): Promise<void>
6. async function assertNoForcedPasswordChange(page): Promise<void>
7. async function assertNoApexError(page): Promise<void>
8. async function login(page): Promise<void>
9. async function expectApexItemVisible(page, itemId): Promise<void>
10. async function expectButtonVisible(page, buttonName): Promise<void>
11. async function expectRegionVisible(page, regionPattern): Promise<void>
12. async function testNavigationLinks(page): Promise<void>
13. async function fillApexItem(page, itemId, value): Promise<boolean>
14. async function clearApexItem(page, itemId): Promise<void>
15. async function getApexItemValue(page, itemId): Promise<string>
16. async function readInlineValidationError(page, itemId): Promise<string | null>
17. async function checkSuccessNotification(page): Promise<boolean>
18. async function checkErrorNotification(page): Promise<boolean>
19. async function attachAjaxRecorder(page): {{ errors: any[], requests: any[] }}   // returns recorder
20. async function clickSafeSubmitButton(page, buttonName): Promise<boolean>

LOGIN must take screenshots before and after Sign In click, fail if still on login page,
fail on Change Password page, fail on APEX error pages.

UI + BACKEND SMOKE TEST REQUIREMENTS:
The generated file must include these tests with the @smoke tag:

1. test('login should succeed and leave login page @smoke')
2. test('application landing page should not show APEX errors @smoke')
3. test('text input items should accept valid inputs without backend errors @smoke')
   - For each item in TEXT_INPUT_ITEMS:
     - Fill with each TEXT_TEST_INPUTS value
     - Read back value, verify it was accepted
     - Verify no inline validation error appears
     - Verify no APEX runtime error
4. test('text input items should safely handle boundary inputs @smoke')
   - For each item in TEXT_INPUT_ITEMS:
     - Try each BOUNDARY_TEST_INPUTS value
     - Verify page does not crash
     - Verify no APEX runtime error
     - Verify max-length attribute is respected if present
5. test('text input items should defend against malicious inputs @smoke')
   - For each item in TEXT_INPUT_ITEMS:
     - Try each MALICIOUS_TEST_INPUTS value
     - Verify input is not executed (no script dialog)
     - Verify no ORA-/ERR- text appears (means SQL injection did not break backend)
     - Verify page does not crash
6. test('mandatory items should produce validation errors when empty @smoke')
   - For each item in MANDATORY_ITEMS:
     - Clear the item
     - Click the first SAFE_SUBMIT_BUTTONS
     - Verify either inline validation error appears OR APEX error region appears
     - This proves backend/server-side validation is wired
7. test('safe form submissions should return a backend response @smoke')
   - Attach AJAX recorder before click
   - Click first SAFE_SUBMIT_BUTTONS
   - Wait for network idle
   - Verify at least one network response with status < 500
   - Verify no 5xx server error responses occurred
   - Verify no APEX error appears on page
8. test('navbar associated pages should open correctly @regression')
9. test('expected APEX page items should be visible @regression')
10. test('expected APEX buttons should be visible @regression')
11. test('expected APEX regions should be visible @regression')

BACKEND DETECTION RULES:
attachAjaxRecorder must subscribe to page.on('response') and record:
- url
- status
- whether status >= 500 (server error)
- whether the response body contains ORA- or ERR- (APEX server error in JSON)
The smoke test must fail if any 5xx response is recorded for a safe submit.

INLINE VALIDATION ERROR SELECTORS (readInlineValidationError):
Try these in order:
- '#{{itemId}}_error'
- '.apex-page-item-error[for="{{itemId}}"]'
- 'label[for="{{itemId}}"] + .a-Form-error'
- '.t-Form-error'
- '.u-error'
Return text if visible, else null.

SUCCESS NOTIFICATION SELECTORS:
- '.t-Body-alert--success'
- '.a-Notification--success'
- '.apex-page-success'
- '#APEX_SUCCESS_MESSAGE'

ERROR NOTIFICATION SELECTORS:
- '.t-Body-alert--danger'
- '.a-Notification--error'
- '.apex-page-error'
- '#APEX_ERROR_MESSAGE'

DO NOT click destructive buttons (Delete, Remove, Purge, Drop, Reset, Terminate, Logout).
DO NOT click Cancel.

STRICT VALIDATION PATTERN for required elements (do NOT use weak optional pattern):
if (await locator.count() === 0) {{
  await takeScreenshot(page, 'missing_element_name');
  throw new Error('Expected element was not found');
}}
await expect(locator).toBeVisible();

COMPLETENESS RULES:
1. Code must compile.
2. Code must be complete.
3. Code must not be truncated.
4. Code must end with: }});
""".strip()


def call_oci_genai(prompt):
    client = create_oci_client()

    content = oci.generative_ai_inference.models.TextContent()
    content.text = prompt

    message = oci.generative_ai_inference.models.Message()
    message.role = "USER"
    message.content = [content]

    chat_request = oci.generative_ai_inference.models.GenericChatRequest()
    chat_request.api_format = (
        oci.generative_ai_inference.models.BaseChatRequest.API_FORMAT_GENERIC
    )

    chat_request.messages = [message]
    chat_request.max_tokens = 9000
    chat_request.temperature = 0.02
    chat_request.frequency_penalty = 0
    chat_request.presence_penalty = 0
    chat_request.top_p = 0.70
    chat_request.top_k = 1

    chat_detail = oci.generative_ai_inference.models.ChatDetails()
    chat_detail.serving_mode = oci.generative_ai_inference.models.OnDemandServingMode(
        model_id=CHAT_MODEL_ID
    )
    chat_detail.chat_request = chat_request
    chat_detail.compartment_id = COMPARTMENT_ID

    response = client.chat(chat_detail)

    return extract_text_from_response(response)


def extract_text_from_response(chat_response):
    response_data = chat_response.data

    try:
        choices = response_data.chat_response.choices
        if choices and len(choices) > 0:
            message = choices[0].message
            if message.content and len(message.content) > 0:
                return message.content[0].text
    except Exception:
        pass

    try:
        return response_data.chat_response.text
    except Exception:
        pass

    try:
        return response_data.chat_response.message.content[0].text
    except Exception:
        pass

    raise RuntimeError(f"Unable to extract generated text from OCI GenAI response: {response_data}")


def clean_generated_code(generated_text):
    text = generated_text.strip()

    text = re.sub(
        r"^```(?:typescript|ts|javascript|js)?\s*",
        "",
        text,
        flags=re.IGNORECASE
    )

    text = re.sub(r"\s*```$", "", text)
    text = text.strip()

    import_match = re.search(
        r"import\s+\{\s*test\s*,\s*expect\s*,\s*Page",
        text
    )

    if import_match:
        text = text[import_match.start():]

    return text.strip()


# ===========================================================================
# TYPESCRIPT STRING / ARRAY HELPERS
# ===========================================================================

def escape_ts_string(value):
    value = str(value)
    value = value.replace("\\", "\\\\")
    value = value.replace("'", "\\'")
    value = value.replace("\n", " ")
    value = value.replace("\r", " ")
    return value


def escape_regex_text(value):
    value = str(value)
    return re.escape(value).replace("/", "\\/")


def build_ts_array_strings(values, max_items=40):
    result = []

    for value in values[:max_items]:
        if isinstance(value, dict):
            value = value.get("name", "")
        value = str(value).strip()
        if value:
            result.append(f"'{escape_ts_string(value)}'")

    return ", ".join(result)


def build_ts_array_regex(values, max_items=35):
    result = []

    for value in values[:max_items]:
        value = str(value).strip()
        if value:
            result.append(f"/{escape_regex_text(value)}/i")

    return ", ".join(result)


# ===========================================================================
# FALLBACK PLAYWRIGHT SCRIPT (strict, UI + backend smoke)
# ===========================================================================

def build_fallback_playwright_code(app_url, metadata):
    app_url = clean_apex_url(app_url)

    page_items_array = build_ts_array_strings(metadata.get("page_items", []), 40)
    buttons_array = build_ts_array_strings(metadata.get("buttons", []), 40)
    regions_array = build_ts_array_regex(metadata.get("regions", []), 35)

    text_inputs_array = build_ts_array_strings(metadata.get("text_input_items", []), 25)
    mandatory_array = build_ts_array_strings(metadata.get("mandatory_items", []), 15)
    safe_submit_array = build_ts_array_strings(metadata.get("safe_submit_buttons", []), 10)

    return f"""import {{ test, expect, Page, Response }} from '@playwright/test';
import fs from 'fs';

function getRequiredEnv(name: string, fallback?: string): string {{
  const value = process.env[name] || fallback;
  if (!value) {{
    throw new Error(`Missing required environment variable: ${{name}}`);
  }}
  return value;
}}

const BASE_URL = getRequiredEnv('APEX_BASE_URL', '{escape_ts_string(app_url)}');
const APEX_USERNAME = getRequiredEnv('APEX_USERNAME');
const APEX_PASSWORD = getRequiredEnv('APEX_PASSWORD');

const PAGE_ITEM_IDS: string[] = [{page_items_array}];
const BUTTON_NAMES: string[] = [{buttons_array}];
const REGION_PATTERNS: RegExp[] = [{regions_array}];

const TEXT_INPUT_ITEMS: string[] = [{text_inputs_array}];
const MANDATORY_ITEMS: string[] = [{mandatory_array}];
const SAFE_SUBMIT_BUTTONS: string[] = [{safe_submit_array}];

// Smoke test data for text fields. The generated tests will try each value
// against each text input field and verify backend / UI does not break.
const TEXT_TEST_INPUTS: string[] = [
  'Test',
  'Sample Value 123',
  'John Doe',
  '42',
  '0',
  '2024-01-15',
  'name@example.com',
  'Hello World'
];

const BOUNDARY_TEST_INPUTS: string[] = [
  '',
  '   ',
  'A',
  'A'.repeat(255),
  'A'.repeat(5000),
  'Unicode test \\u00e9\\u00e0',
  '!@#$%^&*()_+-={{}}[]:;<>,.?/~`',
  '   leading and trailing   '
];

// Defensive checks - these MUST NOT be executed by the backend or browser.
const MALICIOUS_TEST_INPUTS: string[] = [
  "' OR '1'='1",
  "'; DROP TABLE users--",
  "1; SELECT * FROM dual",
  "<script>alert('xss')</script>",
  "<img src=x onerror=alert(1)>",
  "../../etc/passwd",
  "%00",
  "\\u0000null-byte"
];

async function takeScreenshot(page: Page, name: string): Promise<void> {{
  fs.mkdirSync('test-results/screenshots', {{ recursive: true }});
  const safeName = name.replace(/[^a-z0-9-_]/gi, '_').toLowerCase().slice(0, 120);
  await page.screenshot({{
    path: `test-results/screenshots/${{safeName}}.png`,
    fullPage: true
  }}).catch(() => {{}});
}}

async function fillFirstVisible(page: Page, selectors: string[], value: string): Promise<boolean> {{
  for (const selector of selectors) {{
    const locator = page.locator(selector).first();
    if (await locator.count() > 0) {{
      try {{
        if (await locator.isVisible()) {{
          await locator.fill(value);
          return true;
        }}
      }} catch {{}}
    }}
  }}
  return false;
}}

async function clickFirstVisible(page: Page, selectors: string[]): Promise<boolean> {{
  for (const selector of selectors) {{
    const locator = page.locator(selector).first();
    if (await locator.count() > 0) {{
      try {{
        if (await locator.isVisible()) {{
          await locator.click();
          return true;
        }}
      }} catch {{}}
    }}
  }}
  return false;
}}

async function assertNoForcedPasswordChange(page: Page): Promise<void> {{
  const forcedPasswordTexts = [
    /change password/i,
    /password for this account must be changed/i,
    /enter current password/i,
    /enter new password/i,
    /confirm new password/i
  ];

  for (const textPattern of forcedPasswordTexts) {{
    const locator = page.getByText(textPattern).first();
    if (await locator.count() > 0 && await locator.isVisible().catch(() => false)) {{
      await takeScreenshot(page, 'forced_password_change_detected');
      throw new Error('Login reached APEX Change Password page. Use a test user whose password is already changed and not expired.');
    }}
  }}
}}

async function assertNotOnLoginPage(page: Page): Promise<void> {{
  const usernameVisible = await page.locator('#P9999_USERNAME, input[name="P9999_USERNAME"], #P101_USERNAME, input[name="P101_USERNAME"]').first().isVisible().catch(() => false);
  const passwordVisible = await page.locator('#P9999_PASSWORD, input[name="P9999_PASSWORD"], #P101_PASSWORD, input[name="P101_PASSWORD"], input[type="password"]').first().isVisible().catch(() => false);
  const signInVisible = await page.locator('#B9999_LOGIN, button:has-text("Sign In"), button:has-text("Login"), input[type="submit"]').first().isVisible().catch(() => false);

  if (usernameVisible || passwordVisible || signInVisible) {{
    await takeScreenshot(page, 'still_on_login_page');
    throw new Error('Login failed. Still on APEX login page after clicking Sign In. Check credentials or selectors.');
  }}
}}

async function assertNoApexError(page: Page): Promise<void> {{
  const errorPatterns = [
    /ERR-/,
    /ORA-\\d/,
    /Error processing request/i,
    /Contact your application administrator/i,
    /Session expired/i,
    /Unauthorized/i,
    /Access denied/i,
    /Page not found/i,
    /Internal Server Error/i
  ];

  for (const pattern of errorPatterns) {{
    const locator = page.getByText(pattern).first();
    if (await locator.count() > 0 && await locator.isVisible().catch(() => false)) {{
      await takeScreenshot(page, 'apex_error_detected');
      throw new Error(`APEX runtime error detected: ${{pattern.toString()}}`);
    }}
  }}
}}

async function login(page: Page): Promise<void> {{
  await page.goto(BASE_URL, {{ waitUntil: 'domcontentloaded' }});
  await page.waitForLoadState('networkidle').catch(() => {{}});

  // Auto-dismiss alert dialogs raised by malicious XSS inputs - so the
  // test fails on the *value* but not on a hung dialog.
  page.on('dialog', async (dialog) => {{
    await dialog.dismiss().catch(() => {{}});
  }});

  const usernameFilled = await fillFirstVisible(page, [
    '#P9999_USERNAME',
    'input[name="P9999_USERNAME"]',
    '#P101_USERNAME',
    'input[name="P101_USERNAME"]',
    'input[placeholder*="Username" i]',
    'input[type="email"]',
    'input[type="text"]'
  ], APEX_USERNAME);

  const passwordFilled = await fillFirstVisible(page, [
    '#P9999_PASSWORD',
    'input[name="P9999_PASSWORD"]',
    '#P101_PASSWORD',
    'input[name="P101_PASSWORD"]',
    'input[placeholder*="Password" i]',
    'input[type="password"]'
  ], APEX_PASSWORD);

  await takeScreenshot(page, 'before_click_sign_in');

  if (!usernameFilled || !passwordFilled) {{
    throw new Error('Could not find or fill APEX username/password fields.');
  }}

  const clicked = await clickFirstVisible(page, [
    '#B9999_LOGIN',
    'button:has-text("Sign In")',
    'button:has-text("Login")',
    'button:has-text("Log In")',
    'input[type="submit"]',
    'button[type="submit"]'
  ]);

  if (!clicked) {{
    throw new Error('Could not find or click APEX Sign In/Login button.');
  }}

  await page.waitForLoadState('domcontentloaded').catch(() => {{}});
  await page.waitForTimeout(3000);

  await takeScreenshot(page, 'after_click_sign_in');

  await assertNoForcedPasswordChange(page);
  await assertNotOnLoginPage(page);
  await assertNoApexError(page);
}}

async function expectApexItemVisible(page: Page, itemId: string): Promise<void> {{
  const locator = page.locator(`#${{itemId}}`).first();

  if (await locator.count() === 0) {{
    await takeScreenshot(page, `missing_item_${{itemId}}`);
    throw new Error(`Expected APEX page item #${{itemId}} was not found on the current page.`);
  }}

  if (!(await locator.isVisible().catch(() => false))) {{
    await takeScreenshot(page, `hidden_item_${{itemId}}`);
    throw new Error(`Expected APEX page item #${{itemId}} exists but is not visible.`);
  }}

  await expect(locator).toBeVisible();
}}

async function expectButtonVisible(page: Page, buttonName: string): Promise<void> {{
  if (/delete|remove|purge|drop|reset|terminate/i.test(buttonName)) {{
    return;
  }}

  const normalizedName = buttonName.replace(/_/g, ' ');

  const locators = [
    page.getByRole('button', {{ name: normalizedName }}).first(),
    page.locator(`button:has-text("${{normalizedName}}")`).first(),
    page.locator(`input[value="${{normalizedName}}"]`).first(),
    page.locator(`#${{buttonName}}`).first()
  ];

  for (const locator of locators) {{
    if (await locator.count() > 0 && await locator.isVisible().catch(() => false)) {{
      await expect(locator).toBeVisible();
      return;
    }}
  }}

  await takeScreenshot(page, `missing_button_${{buttonName}}`);
  throw new Error(`Expected APEX button "${{buttonName}}" was not found on the current page.`);
}}

async function expectRegionVisible(page: Page, regionPattern: RegExp): Promise<void> {{
  const locator = page.getByText(regionPattern).first();

  if (await locator.count() === 0) {{
    await takeScreenshot(page, `missing_region`);
    throw new Error(`Expected APEX region matching ${{regionPattern.toString()}} was not found on the current page.`);
  }}

  if (!(await locator.isVisible().catch(() => false))) {{
    await takeScreenshot(page, `hidden_region`);
    throw new Error(`Expected APEX region matching ${{regionPattern.toString()}} exists but is not visible.`);
  }}

  await expect(locator).toBeVisible();
}}

// ---------------------------------------------------------------------------
// FIELD INTERACTION HELPERS
// ---------------------------------------------------------------------------

async function fillApexItem(page: Page, itemId: string, value: string): Promise<boolean> {{
  const locator = page.locator(`#${{itemId}}`).first();
  if (await locator.count() === 0) return false;
  try {{
    if (!(await locator.isVisible())) return false;
    await locator.fill(value, {{ timeout: 5000 }});
    return true;
  }} catch {{
    return false;
  }}
}}

async function clearApexItem(page: Page, itemId: string): Promise<void> {{
  const locator = page.locator(`#${{itemId}}`).first();
  if (await locator.count() === 0) return;
  try {{
    if (await locator.isVisible()) {{
      await locator.fill('', {{ timeout: 5000 }});
    }}
  }} catch {{}}
}}

async function getApexItemValue(page: Page, itemId: string): Promise<string> {{
  const locator = page.locator(`#${{itemId}}`).first();
  if (await locator.count() === 0) return '';
  try {{
    return (await locator.inputValue({{ timeout: 5000 }})) || '';
  }} catch {{
    return '';
  }}
}}

async function readInlineValidationError(page: Page, itemId: string): Promise<string | null> {{
  const selectors = [
    `#${{itemId}}_error`,
    `[data-for="${{itemId}}"].a-Form-error`,
    `.apex-page-item-error[for="${{itemId}}"]`,
    `label[for="${{itemId}}"] + .a-Form-error`,
    `.t-Form-error`,
    `.u-error`
  ];

  for (const sel of selectors) {{
    const loc = page.locator(sel).first();
    if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
      const text = (await loc.innerText().catch(() => ''))?.trim();
      if (text) return text;
    }}
  }}
  return null;
}}

async function checkSuccessNotification(page: Page): Promise<boolean> {{
  const selectors = [
    '.t-Body-alert--success',
    '.a-Notification--success',
    '.apex-page-success',
    '#APEX_SUCCESS_MESSAGE'
  ];
  for (const sel of selectors) {{
    const loc = page.locator(sel).first();
    if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
      return true;
    }}
  }}
  return false;
}}

async function checkErrorNotification(page: Page): Promise<boolean> {{
  const selectors = [
    '.t-Body-alert--danger',
    '.a-Notification--error',
    '.apex-page-error',
    '#APEX_ERROR_MESSAGE'
  ];
  for (const sel of selectors) {{
    const loc = page.locator(sel).first();
    if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
      return true;
    }}
  }}
  return false;
}}

interface AjaxRecorder {{
  requests: {{ url: string; method: string }}[];
  responses: {{ url: string; status: number; isServerError: boolean; bodySnippet: string }}[];
}}

function attachAjaxRecorder(page: Page): AjaxRecorder {{
  const recorder: AjaxRecorder = {{ requests: [], responses: [] }};

  page.on('request', (req) => {{
    recorder.requests.push({{ url: req.url(), method: req.method() }});
  }});

  page.on('response', async (res: Response) => {{
    const url = res.url();
    const status = res.status();
    const isServerError = status >= 500;
    let bodySnippet = '';
    try {{
      const ct = (res.headers()['content-type'] || '').toLowerCase();
      if (ct.includes('text') || ct.includes('json') || ct.includes('xml')) {{
        const body = await res.text();
        bodySnippet = body.slice(0, 500);
      }}
    }} catch {{}}
    recorder.responses.push({{ url, status, isServerError, bodySnippet }});
  }});

  return recorder;
}}

async function clickSafeSubmitButton(page: Page, buttonName: string): Promise<boolean> {{
  if (/delete|remove|purge|drop|reset|terminate|logout|cancel/i.test(buttonName)) {{
    return false;
  }}
  const normalized = buttonName.replace(/_/g, ' ');
  const selectors = [
    `button:has-text("${{normalized}}")`,
    `input[value="${{normalized}}"]`,
    `#${{buttonName}}`,
    `[aria-label="${{normalized}}" i]`
  ];

  for (const sel of selectors) {{
    const loc = page.locator(sel).first();
    if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
      try {{
        await loc.click({{ timeout: 5000 }});
        return true;
      }} catch {{}}
    }}
  }}
  return false;
}}

async function testNavigationLinks(page: Page): Promise<void> {{
  const blockedText = /logout|sign out|delete|remove|purge|drop|reset|terminate/i;
  const navSelectors = [
    'nav a',
    '.t-TreeNav a',
    '.t-NavigationBar a',
    '.t-MenuBar a',
    '.t-Header-nav a',
    'a[href*="/ords/r/"]',
    'a[href*="f?p="]'
  ];

  const links: {{ text: string; href: string }}[] = [];

  for (const selector of navSelectors) {{
    const anchors = page.locator(selector);
    const count = await anchors.count();
    for (let i = 0; i < count; i++) {{
      const anchor = anchors.nth(i);
      const text = (await anchor.innerText().catch(() => '')).trim();
      const href = await anchor.getAttribute('href').catch(() => null);
      if (!href) continue;
      if (href.startsWith('javascript:')) continue;
      if (blockedText.test(text) || blockedText.test(href)) continue;
      let finalHref: string;
      try {{
        finalHref = new URL(href, BASE_URL).toString();
      }} catch {{
        continue;
      }}
      if (!links.some(link => link.href === finalHref)) {{
        links.push({{ text: text || `nav_link_${{i}}`, href: finalHref }});
      }}
    }}
  }}

  if (links.length === 0) {{
    await takeScreenshot(page, 'no_navigation_links_found');
    throw new Error('No safe APEX navigation links were discovered after login.');
  }}

  for (const link of links.slice(0, 10)) {{
    await page.goto(link.href, {{ waitUntil: 'domcontentloaded' }});
    await page.waitForLoadState('networkidle').catch(() => {{}});
    await assertNoForcedPasswordChange(page);
    await assertNotOnLoginPage(page);
    await assertNoApexError(page);
    await expect(page.locator('body')).toBeVisible();
    await takeScreenshot(page, `nav_${{link.text}}`);
  }}
}}

// ===========================================================================
// TESTS
// ===========================================================================

test.describe('Oracle APEX Strict UI + Backend Smoke and Regression', () => {{

  test('login should succeed and leave login page @smoke', async ({{ page }}) => {{
    await login(page);
    await expect(page.locator('body')).toBeVisible();
    await takeScreenshot(page, 'login_success_page');
  }});

  test('application landing page should not show APEX errors @smoke', async ({{ page }}) => {{
    await login(page);
    await assertNoApexError(page);
    await expect(page.locator('body')).toBeVisible();
    await takeScreenshot(page, 'application_landing_page');
  }});

  test('text input items should accept valid inputs without backend errors @smoke', async ({{ page }}) => {{
    await login(page);

    if (TEXT_INPUT_ITEMS.length === 0) {{
      test.skip(true, 'No text input items extracted from SQL metadata.');
    }}

    for (const itemId of TEXT_INPUT_ITEMS) {{
      const locator = page.locator(`#${{itemId}}`).first();
      if (await locator.count() === 0) continue; // probably not on landing page

      for (const value of TEXT_TEST_INPUTS) {{
        const filled = await fillApexItem(page, itemId, value);
        if (!filled) continue;

        const inlineError = await readInlineValidationError(page, itemId);
        if (inlineError) {{
          await takeScreenshot(page, `valid_input_rejected_${{itemId}}`);
          throw new Error(`Valid input "${{value}}" was rejected on item #${{itemId}}: ${{inlineError}}`);
        }}

        await assertNoApexError(page);
      }}

      // restore
      await clearApexItem(page, itemId);
    }}

    await takeScreenshot(page, 'valid_input_smoke_done');
  }});

  test('text input items should safely handle boundary inputs @smoke', async ({{ page }}) => {{
    await login(page);

    if (TEXT_INPUT_ITEMS.length === 0) {{
      test.skip(true, 'No text input items extracted from SQL metadata.');
    }}

    for (const itemId of TEXT_INPUT_ITEMS) {{
      const locator = page.locator(`#${{itemId}}`).first();
      if (await locator.count() === 0) continue;

      const maxLengthAttr = await locator.getAttribute('maxlength').catch(() => null);
      const maxLength = maxLengthAttr ? parseInt(maxLengthAttr, 10) : null;

      for (const value of BOUNDARY_TEST_INPUTS) {{
        const filled = await fillApexItem(page, itemId, value);
        if (!filled) continue;

        // verify page hasn't crashed
        await expect(page.locator('body')).toBeVisible();
        await assertNoApexError(page);

        // verify maxlength is honoured
        if (maxLength && maxLength > 0 && value.length > maxLength) {{
          const actual = await getApexItemValue(page, itemId);
          if (actual.length > maxLength) {{
            await takeScreenshot(page, `maxlength_violated_${{itemId}}`);
            throw new Error(`Item #${{itemId}} accepted ${{actual.length}} chars but maxlength was ${{maxLength}}`);
          }}
        }}
      }}

      await clearApexItem(page, itemId);
    }}

    await takeScreenshot(page, 'boundary_input_smoke_done');
  }});

  test('text input items should defend against malicious inputs @smoke', async ({{ page }}) => {{
    await login(page);

    if (TEXT_INPUT_ITEMS.length === 0) {{
      test.skip(true, 'No text input items extracted from SQL metadata.');
    }}

    let dialogTriggered = false;
    page.on('dialog', async (dialog) => {{
      dialogTriggered = true;
      await dialog.dismiss().catch(() => {{}});
    }});

    for (const itemId of TEXT_INPUT_ITEMS) {{
      const locator = page.locator(`#${{itemId}}`).first();
      if (await locator.count() === 0) continue;

      for (const value of MALICIOUS_TEST_INPUTS) {{
        const filled = await fillApexItem(page, itemId, value);
        if (!filled) continue;

        await page.waitForTimeout(300);
        await expect(page.locator('body')).toBeVisible();

        if (dialogTriggered) {{
          await takeScreenshot(page, `xss_dialog_${{itemId}}`);
          throw new Error(`Malicious input "${{value}}" triggered a JS dialog on item #${{itemId}}. Possible XSS.`);
        }}

        // SQL-injection check: server-side error visible on page = bad
        const oraVisible = await page.getByText(/ORA-\\d/).first().isVisible().catch(() => false);
        const errVisible = await page.getByText(/ERR-/).first().isVisible().catch(() => false);
        if (oraVisible || errVisible) {{
          await takeScreenshot(page, `injection_backend_error_${{itemId}}`);
          throw new Error(`Malicious input "${{value}}" produced a backend error on item #${{itemId}}.`);
        }}
      }}

      await clearApexItem(page, itemId);
    }}

    await takeScreenshot(page, 'malicious_input_smoke_done');
  }});

  test('mandatory items should produce validation errors when empty @smoke', async ({{ page }}) => {{
    await login(page);

    if (MANDATORY_ITEMS.length === 0 || SAFE_SUBMIT_BUTTONS.length === 0) {{
      test.skip(true, 'No mandatory items or safe submit buttons extracted from SQL metadata.');
    }}

    let anyValidated = false;

    for (const itemId of MANDATORY_ITEMS) {{
      const locator = page.locator(`#${{itemId}}`).first();
      if (await locator.count() === 0) continue;
      if (!(await locator.isVisible().catch(() => false))) continue;

      await clearApexItem(page, itemId);

      const clicked = await clickSafeSubmitButton(page, SAFE_SUBMIT_BUTTONS[0]);
      if (!clicked) continue;

      await page.waitForTimeout(1500);

      const inlineErr = await readInlineValidationError(page, itemId);
      const pageErr = await checkErrorNotification(page);

      if (!inlineErr && !pageErr) {{
        await takeScreenshot(page, `missing_required_validation_${{itemId}}`);
        throw new Error(`Mandatory item #${{itemId}} was left empty and submitted, but no validation error appeared. Server-side validation may be missing.`);
      }}

      anyValidated = true;
    }}

    if (!anyValidated) {{
      test.skip(true, 'No mandatory items on the current page could be tested.');
    }}

    await takeScreenshot(page, 'mandatory_validation_smoke_done');
  }});

  test('safe form submissions should return a backend response without 5xx @smoke', async ({{ page }}) => {{
    await login(page);

    if (SAFE_SUBMIT_BUTTONS.length === 0) {{
      test.skip(true, 'No safe submit buttons extracted from SQL metadata.');
    }}

    const recorder = attachAjaxRecorder(page);

    const clicked = await clickSafeSubmitButton(page, SAFE_SUBMIT_BUTTONS[0]);
    if (!clicked) {{
      test.skip(true, `Safe submit button "${{SAFE_SUBMIT_BUTTONS[0]}}" not visible on landing page.`);
    }}

    await page.waitForLoadState('networkidle').catch(() => {{}});
    await page.waitForTimeout(2000);

    // Must have at least one network response
    if (recorder.responses.length === 0) {{
      await takeScreenshot(page, 'no_backend_response_after_submit');
      throw new Error('Safe submit did not trigger any network response. Backend wiring may be broken.');
    }}

    // No 5xx responses
    const serverErrors = recorder.responses.filter(r => r.isServerError);
    if (serverErrors.length > 0) {{
      await takeScreenshot(page, 'server_5xx_after_submit');
      const sample = serverErrors.slice(0, 3).map(e => `${{e.status}} ${{e.url}}`).join(' | ');
      throw new Error(`Backend returned 5xx after safe submit: ${{sample}}`);
    }}

    // No ORA-/ERR- text leaked into responses
    const dbErrors = recorder.responses.filter(r =>
      /ORA-\\d{{2,5}}|ERR-\\d/.test(r.bodySnippet)
    );
    if (dbErrors.length > 0) {{
      await takeScreenshot(page, 'db_error_in_response');
      throw new Error(`Backend leaked DB error in response: ${{dbErrors[0].url}}`);
    }}

    await assertNoApexError(page);
    await takeScreenshot(page, 'safe_submit_backend_ok');
  }});

  test('navbar associated pages should open correctly @regression', async ({{ page }}) => {{
    await login(page);
    await testNavigationLinks(page);
  }});

  test('expected APEX page items should be visible @regression', async ({{ page }}) => {{
    await login(page);
    let anyVisible = false;
    for (const itemId of PAGE_ITEM_IDS) {{
      const locator = page.locator(`#${{itemId}}`).first();
      if (await locator.count() > 0 && await locator.isVisible().catch(() => false)) {{
        anyVisible = true;
        await expect(locator).toBeVisible();
      }}
    }}
    if (!anyVisible && PAGE_ITEM_IDS.length > 0) {{
      await takeScreenshot(page, 'no_expected_items_visible');
      throw new Error('None of the expected APEX page items were visible on the landing page.');
    }}
    await takeScreenshot(page, 'strict_page_items_checked');
  }});

  test('expected APEX buttons should be visible @regression', async ({{ page }}) => {{
    await login(page);
    let anyVisible = false;
    for (const buttonName of BUTTON_NAMES) {{
      if (/delete|remove|purge|drop|reset|terminate/i.test(buttonName)) continue;
      const normalized = buttonName.replace(/_/g, ' ');
      const loc = page.locator(`button:has-text("${{normalized}}"), input[value="${{normalized}}"], #${{buttonName}}`).first();
      if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
        anyVisible = true;
      }}
    }}
    if (!anyVisible && BUTTON_NAMES.length > 0) {{
      await takeScreenshot(page, 'no_expected_buttons_visible');
      throw new Error('None of the expected APEX buttons were visible on the landing page.');
    }}
    await takeScreenshot(page, 'strict_buttons_checked');
  }});

  test('expected APEX regions should be visible @regression', async ({{ page }}) => {{
    await login(page);
    let anyVisible = false;
    for (const pattern of REGION_PATTERNS) {{
      const loc = page.getByText(pattern).first();
      if (await loc.count() > 0 && await loc.isVisible().catch(() => false)) {{
        anyVisible = true;
      }}
    }}
    if (!anyVisible && REGION_PATTERNS.length > 0) {{
      await takeScreenshot(page, 'no_expected_regions_visible');
      throw new Error('None of the expected APEX regions were visible on the landing page.');
    }}
    await takeScreenshot(page, 'strict_regions_checked');
  }});
}});
"""


# ===========================================================================
# VALIDATION OF GENERATED CODE
# ===========================================================================

def is_complete_and_strong_typescript(code):
    if not code.strip():
        return False

    required_parts = [
        "import fs from 'fs';",
        "process.env",
        "APEX_BASE_URL",
        "APEX_USERNAME",
        "APEX_PASSWORD",
        "const PAGE_ITEM_IDS",
        "const BUTTON_NAMES",
        "const REGION_PATTERNS",
        "const TEXT_INPUT_ITEMS",
        "const MANDATORY_ITEMS",
        "const SAFE_SUBMIT_BUTTONS",
        "const TEXT_TEST_INPUTS",
        "const BOUNDARY_TEST_INPUTS",
        "const MALICIOUS_TEST_INPUTS",
        "fs.mkdirSync('test-results/screenshots'",
        "async function login",
        "async function assertNotOnLoginPage",
        "async function assertNoForcedPasswordChange",
        "async function assertNoApexError",
        "async function testNavigationLinks",
        "async function fillApexItem",
        "async function clearApexItem",
        "async function readInlineValidationError",
        "function attachAjaxRecorder",
        "should accept valid inputs",
        "should safely handle boundary inputs",
        "should defend against malicious inputs",
        "mandatory items should produce validation errors",
        "safe form submissions",
        "test.describe"
    ]

    for part in required_parts:
        if part not in code:
            return False

    forbidden_parts = [
        "```",
        "?session=",
        "&session=",
        "YOUR_USERNAME",
        "YOUR_PASSWORD",
        "TODO_URL",
        "replace_me"
    ]

    for part in forbidden_parts:
        if part.lower() in code.lower():
            return False

    if not code.rstrip().endswith("});"):
        return False

    # Note: we deliberately do NOT use braces_balanced() here. JS regex literals
    # (/.../) and template literals (`${...}`) routinely contain unbalanced
    # structural characters that a simple brace counter cannot disambiguate.
    # The trailing "});" check above is enough to catch truncated GenAI output,
    # and the broader required_parts check catches missing pieces.

    return True


def braces_balanced(code):
    stack = []
    in_single_quote = False
    in_double_quote = False
    in_backtick = False
    escape = False

    for char in code:
        if escape:
            escape = False
            continue

        if char == "\\":
            escape = True
            continue

        if char == "'" and not in_double_quote and not in_backtick:
            in_single_quote = not in_single_quote
            continue

        if char == '"' and not in_single_quote and not in_backtick:
            in_double_quote = not in_double_quote
            continue

        if char == "`" and not in_single_quote and not in_double_quote:
            in_backtick = not in_backtick
            continue

        if in_single_quote or in_double_quote or in_backtick:
            continue

        if char in "({[":
            stack.append(char)
        elif char in ")}]":
            if not stack:
                return False

            opening = stack.pop()
            pairs = {"(": ")", "{": "}", "[": "]"}

            if pairs[opening] != char:
                return False

    return not stack and not in_single_quote and not in_double_quote and not in_backtick


# ===========================================================================
# ORCHESTRATION
# ===========================================================================

def generate_playwright_code(prompt, app_url, metadata):
    try:
        generated_text = call_oci_genai(prompt)
        generated_code = clean_generated_code(generated_text)

        if is_complete_and_strong_typescript(generated_code):
            return generated_code

        print("\nOCI GenAI output was weak, incomplete, or missing UI+backend smoke tests.")
        print("Using complete strict fallback Playwright script.")
        return build_fallback_playwright_code(app_url, metadata)

    except Exception as error:
        print(f"\nOCI GenAI generation failed: {error}")
        print("Using complete strict fallback Playwright script.")
        return build_fallback_playwright_code(app_url, metadata)


def write_output_file_atomic(output_file, generated_code):
    output_path = Path(output_file)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    temp_path = output_path.with_suffix(output_path.suffix + ".tmp")
    temp_path.write_text(generated_code + "\n", encoding="utf-8")
    temp_path.replace(output_path)


def main():
    try:
        sql_file, app_url, output_file = get_user_inputs()

        print("\nChecking OCI configuration...")
        print(f"CONFIG_FILE_PATH: {CONFIG_FILE_PATH}")
        print(f"ENDPOINT: {ENDPOINT}")

        print("\nReading APEX SQL export file...")
        sql_text = read_sql_file(sql_file)

        print("Extracting APEX metadata (incl. text inputs, mandatory items, safe submits)...")
        metadata = extract_apex_metadata(sql_text)
        metadata_text = metadata_to_text(metadata)

        print(f"  Text input items found: {len(metadata.get('text_input_items', []))}")
        print(f"  Mandatory items found:  {len(metadata.get('mandatory_items', []))}")
        print(f"  Safe submit buttons:    {len(metadata.get('safe_submit_buttons', []))}")

        print("Cleaning SQL content...")
        cleaned_sql = clean_sql_for_prompt(sql_text)

        print("Building strict OCI GenAI prompt (UI + backend smoke)...")
        prompt = build_prompt(
            apex_metadata_text=metadata_text,
            sql_excerpt=cleaned_sql,
            app_url=app_url
        )

        print("Generating strict Playwright test code...")
        generated_code = generate_playwright_code(prompt, app_url, metadata)

        if not is_complete_and_strong_typescript(generated_code):
            print("\nGenerated code failed final strict validation.")
            print("Writing complete strict fallback Playwright script.")
            generated_code = build_fallback_playwright_code(app_url, metadata)

        print("Writing generated Playwright test file...")
        write_output_file_atomic(output_file, generated_code)

        print("\nDone.")
        print(f"Generated file: {output_file}")

        print("\nSet environment variables:")
        print(f"export APEX_BASE_URL='{app_url}'")
        print("export APEX_USERNAME='INTERNSHIP'")
        print("export APEX_PASSWORD='your_password'")

        print("\nRun smoke only:")
        print(f"npx playwright test {output_file} --grep @smoke --headed --reporter=html")

        print("\nRun full regression:")
        print(f"npx playwright test {output_file} --headed --reporter=html")

        print("\nOpen report:")
        print("npx playwright show-report playwright-report")

    except Exception as error:
        print(f"\nERROR: {error}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()