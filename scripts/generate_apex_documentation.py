# coding: utf-8
"""
Oracle APEX SQL Documentation Generator - v6 SQL-driven auto-scan edition

Place this file at: scripts/generate_apex_documentation.py

What it does:
- Scans every *.sql file under apex/ by default.
- Parses modern and older Oracle APEX exports, including wwv_flow_imp_page,
  wwv_flow_imp_shared, wwv_flow_imp, wwv_flow_api, and wwv_imp_workspace syntax.
- Generates one combined application_documentation.md/.txt and per-SQL artifacts
  when multiple SQL exports are found.
- Generates a real SVG/HTML architecture diagram from the runtime application
  metadata. Jenkins/CI/CD is intentionally not shown in the application runtime
  architecture diagram.
- Does not rely on OCI GenAI image output or Mermaid rendering.

Jenkins env vars supported:
  APEX_SQL_DIR=$WORKSPACE/apex
  DOC_SCAN_APEX_DIR=true
  DOC_CONFIG_FILE=$WORKSPACE/documentation/documentation_config.json
  DOC_OUTPUT_DIR=$WORKSPACE/documentation/generated

Optional single-file override:
  APEX_SQL_FILE=$WORKSPACE/apex/f100.sql
"""
from __future__ import annotations

import html
import json
import os
import re
import sys
import zipfile
from dataclasses import dataclass, field, asdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple

# -----------------------------------------------------------------------------
# Paths / configuration
# -----------------------------------------------------------------------------

ROOT_DIR = Path(__file__).resolve().parents[1]
APEX_SQL_FILE_ENV = os.getenv("APEX_SQL_FILE", "").strip()
APEX_SQL_DIR = Path(os.getenv("APEX_SQL_DIR", str(ROOT_DIR / "apex")))
DOC_SCAN_APEX_DIR = os.getenv("DOC_SCAN_APEX_DIR", "true").strip().lower() not in {"0", "false", "no", "n"}
DOC_CONFIG_FILE = Path(os.getenv("DOC_CONFIG_FILE", str(ROOT_DIR / "documentation" / "documentation_config.json")))
BASE_OUTPUT_DIR = Path(os.getenv("DOC_OUTPUT_DIR", str(ROOT_DIR / "documentation" / "generated")))
MAX_ROWS = int(os.getenv("DOC_MAX_ROWS", "1000"))
MAX_SOURCE_CHARS = int(os.getenv("DOC_MAX_SOURCE_CHARS", "1600"))

DEFAULT_DOC_CONFIG: Dict[str, Any] = {
    "application": {
        "purpose": "Oracle APEX application generated from the deployment SQL export.",
        "business_problem": "Update this in documentation_config.json with the actual business problem solved by the application.",
        "target_users": ["End users", "Application administrators"],
        "key_features": [],
        "scope": "Documentation generated from SQL export files under the apex/ folder during the deployment pipeline.",
        "limitations": [
            "Only metadata present in APEX SQL exports can be extracted automatically.",
            "Database objects managed outside the APEX export may only appear as referenced objects, not full table definitions.",
            "Business process descriptions, screenshots, exact cloud topology, and external API contracts should be added in documentation_config.json when needed."
        ]
    },
    "architecture": {
        "frontend": "Oracle APEX browser-based web UI",
        "backend": "Oracle APEX runtime, session state, validations, page processes, dynamic actions, SQL and PL/SQL",
        "database": "Oracle Database / APEX parsing schema",
        "cloud_infrastructure": "ORDS/APEX runtime environment configured for the target deployment",
        "third_party_integrations": []
    },
    "api": {
        "authentication": "Use the extracted APEX/ORDS authentication method when present. Update manually for external APIs.",
        "rate_limits": "Not defined in the APEX SQL export. Define ORDS/API Gateway/service-level limits if applicable.",
        "error_codes": ["400 Bad Request", "401 Unauthorized", "403 Forbidden", "404 Not Found", "429 Too Many Requests", "500 Internal Server Error"]
    },
    "security": {
        "authentication_method": "Use extracted APEX authentication schemes when present. Update manually for SSO/custom authentication.",
        "authorization_roles": [],
        "encryption_details": "Use HTTPS/TLS in transit. Database encryption depends on the configured Oracle Database/OCI environment.",
        "audit_logging": "Review APEX activity logs, custom audit tables, and database auditing configuration.",
        "best_practices": [
            "Store secrets only in approved secret stores, never in source control.",
            "Apply authorization schemes to sensitive pages, buttons, processes, and APIs.",
            "Validate input server-side and avoid leaking ORA-/ERR- details to end users.",
            "Use least privilege for database schemas and service users.",
            "Review audit logs for authentication, authorization, data changes, and administrative actions."
        ]
    },
    "user_guide": {
        "include_screenshot_placeholders": True,
        "faq": [
            {"question": "How do I access the application?", "answer": "Open the environment-specific APEX URL and sign in with an authorized account."},
            {"question": "What should I do if I see an error?", "answer": "Capture the page name, timestamp, screenshot, and steps taken, then contact the application administrator."}
        ],
        "troubleshooting": [
            "Confirm that all required fields are completed.",
            "Refresh the page and retry the action once.",
            "If the problem persists, share the page name, input values, timestamp, and screenshot with support."
        ]
    },
    "manual_page_descriptions": {},
    "manual_api_examples": [],
    "manual_database_notes": [],
    "manual_security_notes": []
}

# -----------------------------------------------------------------------------
# Models
# -----------------------------------------------------------------------------

@dataclass
class Region:
    name: str = ""
    display_point: str = ""
    type: str = ""
    template: str = ""
    source: str = ""
    condition: str = ""

@dataclass
class PageItem:
    name: str = ""
    prompt: str = ""
    display_as: str = ""
    required: str = ""
    max_length: str = ""
    placeholder: str = ""
    source_type: str = ""
    source: str = ""
    default: str = ""
    lov: str = ""
    condition: str = ""

@dataclass
class Button:
    name: str = ""
    label: str = ""
    action: str = ""
    position: str = ""
    target: str = ""
    execute_validations: str = ""
    condition: str = ""

@dataclass
class Process:
    name: str = ""
    type: str = ""
    point: str = ""
    source: str = ""
    when_button: str = ""
    error_location: str = ""
    condition: str = ""
    api_package: str = ""
    api_name: str = ""

@dataclass
class Validation:
    name: str = ""
    type: str = ""
    associated_item: str = ""
    error_message: str = ""
    condition: str = ""
    when_button: str = ""

@dataclass
class DynamicAction:
    name: str = ""
    event: str = ""
    selection_type: str = ""
    triggering_element: str = ""
    action: str = ""
    affected_elements: str = ""
    condition: str = ""

@dataclass
class Page:
    page_id: str
    name: str = ""
    alias: str = ""
    title: str = ""
    page_mode: str = ""
    is_public: str = ""
    protection_level: str = ""
    auth_scheme: str = ""
    regions: List[Region] = field(default_factory=list)
    items: List[PageItem] = field(default_factory=list)
    buttons: List[Button] = field(default_factory=list)
    processes: List[Process] = field(default_factory=list)
    validations: List[Validation] = field(default_factory=list)
    dynamic_actions: List[DynamicAction] = field(default_factory=list)

# -----------------------------------------------------------------------------
# Helpers
# -----------------------------------------------------------------------------

def clean(value: Any, max_len: int = 1000) -> str:
    if value is None:
        return ""
    s = str(value).replace("''", "'")
    s = re.sub(r"[ \t\r\f\v]+", " ", s)
    s = re.sub(r"\n\s*\n+", "\n", s).strip()
    if len(s) > max_len:
        return s[:max_len].rstrip() + " ..."
    return s


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="ignore")


def unique(values: Iterable[str], limit: int = MAX_ROWS) -> List[str]:
    out: List[str] = []
    seen = set()
    for value in values:
        v = clean(value, 1200)
        if not v:
            continue
        key = v.lower()
        if key in seen:
            continue
        seen.add(key)
        out.append(v)
        if len(out) >= limit:
            break
    return out


def deep_merge(a: Dict[str, Any], b: Dict[str, Any]) -> Dict[str, Any]:
    result = dict(a)
    for key, val in b.items():
        if isinstance(val, dict) and isinstance(result.get(key), dict):
            result[key] = deep_merge(result[key], val)
        else:
            result[key] = val
    return result


def load_config() -> Dict[str, Any]:
    DOC_CONFIG_FILE.parent.mkdir(parents=True, exist_ok=True)
    if not DOC_CONFIG_FILE.exists():
        DOC_CONFIG_FILE.write_text(json.dumps(DEFAULT_DOC_CONFIG, indent=2), encoding="utf-8")
        return DEFAULT_DOC_CONFIG
    try:
        user_config = json.loads(read_text(DOC_CONFIG_FILE))
    except Exception as exc:
        raise RuntimeError(f"Invalid JSON in {DOC_CONFIG_FILE}: {exc}")
    return deep_merge(DEFAULT_DOC_CONFIG, user_config)


def slugify(value: str) -> str:
    text = re.sub(r"[^A-Za-z0-9._-]+", "_", value).strip("._-")
    return text or "apex_application"


def md_escape(value: Any) -> str:
    return clean(value, 2000).replace("|", "\\|") or "-"


def bullets(values: Iterable[str], empty: str = "Not found in SQL export.") -> str:
    vals = unique(values)
    return "\n".join(f"- {v}" for v in vals) if vals else f"- {empty}"


def table(headers: List[str], rows: List[List[Any]], empty: str = "Not found in SQL export.") -> str:
    if not rows:
        return empty
    lines = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]
    for row in rows:
        lines.append("| " + " | ".join(md_escape(c) for c in row) + " |")
    return "\n".join(lines)

# -----------------------------------------------------------------------------
# APEX call parser
# -----------------------------------------------------------------------------

API_CALL_RE = re.compile(
    r"\b(?:wwv_flow_imp_page|wwv_flow_imp_shared|wwv_flow_imp|wwv_flow_api|wwv_imp_workspace)\.([A-Za-z0-9_]+)\s*\(",
    re.IGNORECASE,
)
PROMPT_PAGE_RE = re.compile(r"prompt\s+--application/pages/page_(\d+)", re.IGNORECASE)


def find_matching_paren(text: str, open_pos: int) -> int:
    depth = 0
    in_quote = False
    q_quote_end: Optional[str] = None
    i = open_pos
    while i < len(text):
        ch = text[i]
        nxt = text[i + 1] if i + 1 < len(text) else ""
        # q'[...]' etc. Basic support.
        if not in_quote and q_quote_end is None and ch.lower() == "q" and nxt == "'" and i + 2 < len(text):
            opener = text[i + 2]
            closer = {"[": "]'", "{": "}'", "(": ")'", "<": ">'"}.get(opener)
            if closer:
                q_quote_end = closer
                i += 3
                continue
        if q_quote_end is not None:
            if text.startswith(q_quote_end, i):
                i += len(q_quote_end)
                q_quote_end = None
                continue
            i += 1
            continue
        if ch == "'":
            if in_quote and nxt == "'":
                i += 2
                continue
            in_quote = not in_quote
            i += 1
            continue
        if not in_quote:
            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    return i
        i += 1
    return -1


def find_calls(sql: str) -> List[Tuple[str, str, str, int]]:
    events: List[Tuple[int, str, Any]] = []
    for m in API_CALL_RE.finditer(sql):
        if m.group(1).lower() in {"id"}:
            continue
        events.append((m.start(), "call", m))
    for m in PROMPT_PAGE_RE.finditer(sql):
        events.append((m.start(), "prompt", m))
    events.sort(key=lambda x: x[0])

    current_page = ""
    calls: List[Tuple[str, str, str, int]] = []
    for pos, kind, match in events:
        if kind == "prompt":
            raw = match.group(1)
            current_page = str(int(raw)) if raw.isdigit() else raw
            continue
        open_pos = sql.find("(", pos)
        close_pos = find_matching_paren(sql, open_pos)
        if open_pos >= 0 and close_pos > open_pos:
            calls.append((match.group(1).lower(), sql[open_pos + 1:close_pos], current_page, pos))
    return calls


def calls_by_name(calls: List[Tuple[str, str, str, int]], *names: str) -> List[Tuple[str, str, int]]:
    wanted = {n.lower() for n in names}
    return [(args, ctx, pos) for api, args, ctx, pos in calls if api.lower() in wanted]


def extract_quoted(text: str) -> List[str]:
    return [m.group(1).replace("''", "'") for m in re.finditer(r"'((?:''|[^'])*)'", text, re.DOTALL)]


def param(args: str, name: str, max_len: int = 1000) -> str:
    n = re.escape(name)
    # wwv_flow_string.join(wwv_flow_t_varchar2('a','b'))
    m = re.search(rf"{n}\s*=>\s*wwv_flow_string\.join\s*\(\s*wwv_flow_t_varchar2\s*\((.*?)\)\s*\)", args, re.I | re.S)
    if m:
        return clean("\n".join(extract_quoted(m.group(1))), max_len)
    # q-quoted variants
    q_patterns = [
        rf"{n}\s*=>\s*q'\[(.*?)\]'",
        rf"{n}\s*=>\s*q'\{{(.*?)\}}'",
        rf"{n}\s*=>\s*q'\((.*?)\)'",
        rf"{n}\s*=>\s*q'<(.*?)>'",
    ]
    for pat in q_patterns:
        m = re.search(pat, args, re.I | re.S)
        if m:
            return clean(m.group(1), max_len)
    # nvl(anything,'value')
    m = re.search(rf"{n}\s*=>\s*nvl\([^)]*?,\s*'((?:''|[^'])*)'\s*\)", args, re.I | re.S)
    if m:
        return clean(m.group(1), max_len)
    # normal quoted string
    m = re.search(rf"{n}\s*=>\s*'((?:''|[^'])*)'", args, re.I | re.S)
    if m:
        return clean(m.group(1), max_len)
    # wwv_flow_imp.id(123)
    m = re.search(rf"{n}\s*=>\s*wwv_flow_(?:imp|api)\.id\((\d+)\)", args, re.I | re.S)
    if m:
        return clean(m.group(1), max_len)
    # numeric, Y/N constants, package constants
    m = re.search(rf"{n}\s*=>\s*([^,\n\r]+)", args, re.I | re.S)
    if m:
        val = m.group(1).strip()
        val = re.sub(r"\s*--.*$", "", val).strip()
        if val.startswith("wwv_flow_t_") or val.startswith("wwv_flow_string"):
            return ""
        return clean(val, max_len)
    return ""


def extract_application_info(sql: str, sql_file: Path, calls: List[Tuple[str, str, str, int]]) -> Dict[str, str]:
    info: Dict[str, str] = {"source_sql": str(sql_file)}
    m = re.search(r"prompt\s+APPLICATION\s+(\d+)\s+-\s+(.+)", sql, re.I)
    if m:
        info["application_id"] = clean(m.group(1), 50)
        info["application_name"] = clean(m.group(2), 250)
    for args, _ctx, _pos in calls_by_name(calls, "create_flow"):
        info.setdefault("application_id", param(args, "p_id") or "")
        info.setdefault("application_name", param(args, "p_name") or "")
        info.setdefault("alias", param(args, "p_alias") or "")
        info.setdefault("owner", param(args, "p_owner") or "")
        info.setdefault("version", param(args, "p_flow_version") or "")
        info.setdefault("status", param(args, "p_flow_status") or "")
        info.setdefault("authentication_id", param(args, "p_authentication_id") or "")
        info.setdefault("compatibility_mode", param(args, "p_compatibility_mode") or "")
        info.setdefault("logo_text", param(args, "p_logo_text") or "")
        info.setdefault("is_pwa", param(args, "p_is_pwa") or "")
        break
    header_patterns = {
        "application_id": r"Application:\s*(\d+)",
        "application_name": r"Name:\s*(.+)",
        "exported_at": r"Date and Time:\s*(.+)",
        "exported_by": r"Exported By:\s*(.+)",
        "apex_version": r"Version:\s*(.+)",
        "workspace_id": r"p_default_workspace_id\s*=>\s*(\d+)",
        "default_owner": r"p_default_owner\s*=>\s*'([^']+)'",
    }
    for k, pat in header_patterns.items():
        if not info.get(k):
            m = re.search(pat, sql, re.I)
            if m:
                info[k] = clean(m.group(1), 250)
    if not info.get("application_id"):
        fm = re.search(r"f(\d+)\.sql$", sql_file.name, re.I)
        if fm:
            info["application_id"] = fm.group(1)
    if not info.get("application_name"):
        info["application_name"] = sql_file.stem
    return info

# -----------------------------------------------------------------------------
# Extraction
# -----------------------------------------------------------------------------

def ensure_page(pages: Dict[str, Page], pid: str) -> Page:
    if not pid:
        pid = "unknown"
    if pid not in pages:
        pages[pid] = Page(page_id=pid, name=f"Page {pid}", title=f"Page {pid}")
    return pages[pid]


def infer_page_id_from_item_or_context(args: str, context: str, item_name: str = "") -> str:
    pid = param(args, "p_page_id") or context
    if pid:
        return pid
    if item_name:
        m = re.match(r"P(\d+)_", item_name, re.I)
        if m:
            return str(int(m.group(1)))
    return ""


def extract_pages(sql: str, calls: List[Tuple[str, str, str, int]]) -> List[Page]:
    pages: Dict[str, Page] = {}

    # First create pages from prompt sections so components always have a parent.
    for m in PROMPT_PAGE_RE.finditer(sql):
        pid = str(int(m.group(1))) if m.group(1).isdigit() else m.group(1)
        ensure_page(pages, pid)

    for args, ctx, _ in calls_by_name(calls, "create_page", "create_page_step"):
        pid = param(args, "p_id") or param(args, "p_page_id") or param(args, "p_step_id") or ctx
        if not pid:
            continue
        p = ensure_page(pages, pid)
        p.name = param(args, "p_name") or param(args, "p_page_name") or p.name
        p.alias = param(args, "p_alias") or p.alias
        p.title = param(args, "p_step_title") or param(args, "p_page_title") or p.title or p.name
        p.page_mode = param(args, "p_page_mode") or p.page_mode
        p.is_public = param(args, "p_page_is_public_y_n") or p.is_public
        p.protection_level = param(args, "p_protection_level") or p.protection_level
        p.auth_scheme = param(args, "p_authentication") or param(args, "p_required_role") or p.auth_scheme

    for args, ctx, _ in calls_by_name(calls, "create_page_plug", "create_region"):
        pid = param(args, "p_page_id") or ctx
        if not pid:
            continue
        ensure_page(pages, pid).regions.append(Region(
            name=param(args, "p_plug_name") or param(args, "p_region_name"),
            display_point=param(args, "p_plug_display_point"),
            type=param(args, "p_plug_source_type") or param(args, "p_region_type"),
            template=param(args, "p_plug_template") or param(args, "p_region_template"),
            source=param(args, "p_plug_source", MAX_SOURCE_CHARS) or param(args, "p_query", MAX_SOURCE_CHARS),
            condition=param(args, "p_plug_display_condition_type") or param(args, "p_plug_display_when_condition"),
        ))

    for args, ctx, _ in calls_by_name(calls, "create_page_item", "create_item"):
        name = param(args, "p_name")
        pid = infer_page_id_from_item_or_context(args, ctx, name)
        if not pid:
            continue
        ensure_page(pages, pid).items.append(PageItem(
            name=name,
            prompt=param(args, "p_prompt"),
            display_as=param(args, "p_display_as"),
            required=param(args, "p_is_required") or param(args, "p_required_patch"),
            max_length=param(args, "p_cMaxlength") or param(args, "p_cmaxlength") or param(args, "p_max_length"),
            placeholder=param(args, "p_placeholder"),
            source_type=param(args, "p_source_type"),
            source=param(args, "p_source", MAX_SOURCE_CHARS),
            default=param(args, "p_item_default") or param(args, "p_default"),
            lov=param(args, "p_named_lov") or param(args, "p_lov") or param(args, "p_lov_name"),
            condition=param(args, "p_display_when") or param(args, "p_display_when_type") or param(args, "p_display_condition_type"),
        ))

    for args, ctx, _ in calls_by_name(calls, "create_page_button", "create_button"):
        pid = param(args, "p_page_id") or ctx
        if not pid:
            continue
        ensure_page(pages, pid).buttons.append(Button(
            name=param(args, "p_button_name") or param(args, "p_name"),
            label=param(args, "p_button_image_alt") or param(args, "p_button_label") or param(args, "p_button_name"),
            action=param(args, "p_button_action") or param(args, "p_action"),
            position=param(args, "p_button_position"),
            target=param(args, "p_button_redirect_url") or param(args, "p_target"),
            execute_validations=param(args, "p_button_execute_validations"),
            condition=param(args, "p_button_condition") or param(args, "p_button_condition_type"),
        ))

    for args, ctx, _ in calls_by_name(calls, "create_page_process", "create_process"):
        pid = param(args, "p_page_id") or ctx
        if not pid:
            continue
        ensure_page(pages, pid).processes.append(Process(
            name=param(args, "p_process_name") or param(args, "p_name"),
            type=param(args, "p_process_type") or param(args, "p_type"),
            point=param(args, "p_process_point") or param(args, "p_point"),
            source=param(args, "p_process_sql_clob", MAX_SOURCE_CHARS) or param(args, "p_process_source", MAX_SOURCE_CHARS) or param(args, "p_process", MAX_SOURCE_CHARS),
            when_button=param(args, "p_process_when_button_id") or param(args, "p_when_button_pressed"),
            error_location=param(args, "p_error_display_location"),
            condition=param(args, "p_process_when") or param(args, "p_process_condition") or param(args, "p_condition"),
            api_package=param(args, "p_attribute_03"),
            api_name=param(args, "p_attribute_04"),
        ))

    for args, ctx, _ in calls_by_name(calls, "create_page_validation", "create_validation"):
        pid = param(args, "p_page_id") or ctx
        if not pid:
            continue
        ensure_page(pages, pid).validations.append(Validation(
            name=param(args, "p_validation_name") or param(args, "p_name"),
            type=param(args, "p_validation_type") or param(args, "p_type"),
            associated_item=param(args, "p_associated_item") or param(args, "p_item_name"),
            error_message=param(args, "p_error_message"),
            condition=param(args, "p_validation_condition") or param(args, "p_validation_condition_type") or param(args, "p_condition"),
            when_button=param(args, "p_when_button_pressed"),
        ))

    # Dynamic action events and actions. We do not always have an easy event/action
    # relationship, but page-level lists are still useful.
    for args, ctx, _ in calls_by_name(calls, "create_page_da_event", "create_page_da_action", "create_da_event", "create_da_action"):
        pid = param(args, "p_page_id") or ctx
        if not pid:
            continue
        ensure_page(pages, pid).dynamic_actions.append(DynamicAction(
            name=param(args, "p_name") or param(args, "p_event_name"),
            event=param(args, "p_bind_event_type") or param(args, "p_event") or param(args, "p_action"),
            selection_type=param(args, "p_bind_type") or param(args, "p_selection_type"),
            triggering_element=param(args, "p_bind_event_type") or param(args, "p_triggering_element") or param(args, "p_element"),
            action=param(args, "p_action") or param(args, "p_action_name"),
            affected_elements=param(args, "p_affected_elements") or param(args, "p_affected_elements_type"),
            condition=param(args, "p_client_condition_type") or param(args, "p_condition_element") or param(args, "p_condition"),
        ))

    # Drop empty prompt-only pages only if they genuinely have no page metadata and no components.
    result = []
    for page in pages.values():
        has_details = any([page.name and not page.name.startswith("Page "), page.alias, page.title and not page.title.startswith("Page "), page.regions, page.items, page.buttons, page.processes, page.validations, page.dynamic_actions])
        if has_details:
            result.append(page)
    return sorted(result, key=lambda p: int(p.page_id) if str(p.page_id).isdigit() else 999999)


def extract_shared(sql: str, calls: List[Tuple[str, str, str, int]]) -> Dict[str, Any]:
    auth = []
    for args, _ctx, _ in calls_by_name(calls, "create_authentication", "create_authentication_scheme"):
        auth.append({
            "name": param(args, "p_name") or param(args, "p_scheme_name"),
            "type": param(args, "p_scheme_type"),
            "invalid_session": param(args, "p_invalid_session_type"),
            "cookie_secure": param(args, "p_use_secure_cookie_yn"),
        })
    authz = []
    for args, _ctx, _ in calls_by_name(calls, "create_authorization_scheme", "create_security_scheme"):
        authz.append({
            "name": param(args, "p_name") or param(args, "p_scheme_name"),
            "type": param(args, "p_scheme_type") or param(args, "p_authorization_scheme"),
            "error": param(args, "p_error_message"),
        })
    lists = []
    for args, _ctx, _ in calls_by_name(calls, "create_list"):
        lists.append({"name": param(args, "p_name"), "status": param(args, "p_list_status")})
    list_items = []
    for args, _ctx, _ in calls_by_name(calls, "create_list_item"):
        list_items.append({
            "text": param(args, "p_list_item_link_text"),
            "target": param(args, "p_list_item_link_target"),
            "icon": param(args, "p_list_item_icon"),
            "condition": param(args, "p_list_item_disp_cond_type") or param(args, "p_list_item_disp_condition"),
        })
    lovs = []
    for args, _ctx, _ in calls_by_name(calls, "create_list_of_values", "create_lov"):
        lovs.append({"name": param(args, "p_lov_name") or param(args, "p_name"), "query": param(args, "p_lov_query", MAX_SOURCE_CHARS)})
    rest = []
    for args, _ctx, _ in calls_by_name(calls, "create_rest_module", "create_rest_template", "create_rest_handler", "create_restful_service"):
        rest.append({"type": "REST/ORDS", "name": param(args, "p_name") or param(args, "p_uri_template") or param(args, "p_pattern"), "method": param(args, "p_method"), "source": param(args, "p_source", MAX_SOURCE_CHARS)})
    return {"authentication": auth, "authorization": authz, "lists": lists, "list_items": list_items, "lovs": lovs, "rest": rest}


def clean_table_name(value: str) -> str:
    v = value.strip().strip('"')
    v = re.sub(r"[^A-Z0-9_$#.]", "", v.upper())
    bad = {"DUAL", "SELECT", "WHERE", "AND", "OR", "THE", "YOUR", "OUR", "THIS", "THAT", "WITH", "VALUES", "RETURNING", "LOOP", "END", "IF", "THEN", "ELSE", "SR", "BOT", "ORACLE"}
    if not v or v in bad or len(v) < 3:
        return ""
    return v


def extract_database(sql: str, pages: List[Page]) -> Dict[str, Any]:
    tables = []
    for m in re.finditer(r"create\s+table\s+([\w.$#\"]+)\s*\((.*?)\)\s*(?:;|/)", sql, re.I | re.S):
        name = clean_table_name(m.group(1))
        body = m.group(2)
        cols = []
        for raw in body.splitlines():
            line = raw.strip().rstrip(',')
            if not line or line.startswith('--'):
                continue
            if re.match(r"(?i)constraint|primary\s+key|foreign\s+key|unique|check\s*\(", line):
                continue
            cm = re.match(r'"?([A-Za-z][\w$#]*)"?\s+([^,]+)', line)
            if cm:
                cols.append({"name": cm.group(1).upper(), "type": clean(cm.group(2), 220)})
        if name:
            tables.append({"name": name, "columns": cols})

    indexes = []
    for m in re.finditer(r"create\s+(?:unique\s+)?index\s+([\w.$#\"]+)\s+on\s+([\w.$#\"]+)\s*\((.*?)\)", sql, re.I | re.S):
        indexes.append({"name": clean_table_name(m.group(1)), "table": clean_table_name(m.group(2)), "columns": clean(m.group(3), 700)})

    fks = []
    fk_pat = r"constraint\s+([\w$#\"]+)\s+foreign\s+key\s*\((.*?)\)\s+references\s+([\w.$#\"]+)\s*\((.*?)\)"
    for m in re.finditer(fk_pat, sql, re.I | re.S):
        fks.append({"name": clean_table_name(m.group(1)), "columns": clean(m.group(2)), "ref_table": clean_table_name(m.group(3)), "ref_columns": clean(m.group(4))})

    object_patterns = {
        "views": r"create\s+(?:or\s+replace\s+)?view\s+([\w.$#\"]+)",
        "sequences": r"create\s+sequence\s+([\w.$#\"]+)",
        "triggers": r"create\s+(?:or\s+replace\s+)?trigger\s+([\w.$#\"]+)",
        "packages": r"create\s+(?:or\s+replace\s+)?package(?:\s+body)?\s+([\w.$#\"]+)",
        "procedures": r"create\s+(?:or\s+replace\s+)?procedure\s+([\w.$#\"]+)",
        "functions": r"create\s+(?:or\s+replace\s+)?function\s+([\w.$#\"]+)",
    }
    objects = {k: unique([clean_table_name(x) for x in re.findall(pat, sql, re.I)]) for k, pat in object_patterns.items()}

    # Use only SQL/PLSQL-like source snippets to avoid normal English text in prompts.
    snippets: List[str] = []
    for p in pages:
        for r in p.regions:
            if r.source:
                snippets.append(r.source)
        for pr in p.processes:
            if pr.source:
                snippets.append(pr.source)
        for i in p.items:
            if i.source:
                snippets.append(i.source)
        for v in p.validations:
            if v.condition:
                snippets.append(v.condition)
    source_blob = "\n".join(snippets) or sql
    refs = []
    ref_patterns = [
        r"\bfrom\s+([A-Za-z][\w$#.]*)",
        r"\bjoin\s+([A-Za-z][\w$#.]*)",
        r"\binsert\s+into\s+([A-Za-z][\w$#.]*)",
        r"\bupdate\s+([A-Za-z][\w$#.]*)",
        r"\bdelete\s+from\s+([A-Za-z][\w$#.]*)",
        r"\bmerge\s+into\s+([A-Za-z][\w$#.]*)",
    ]
    for pat in ref_patterns:
        for x in re.findall(pat, source_blob, re.I):
            t = clean_table_name(x)
            if t:
                refs.append(t)
    referenced_tables = unique(refs, 300)
    return {"tables": tables, "indexes": indexes, "foreign_keys": fks, "objects": objects, "referenced_tables": referenced_tables}


def page_source_blob(page: Dict[str, Any]) -> str:
    chunks = []
    for r in page.get("regions", []):
        chunks.append(r.get("source", ""))
    for i in page.get("items", []):
        chunks.append(i.get("source", ""))
    for p in page.get("processes", []):
        chunks.append(p.get("source", ""))
    for v in page.get("validations", []):
        chunks.append(v.get("condition", ""))
    return "\n".join(chunks)


def extract_page_tables(page: Dict[str, Any]) -> List[str]:
    blob = page_source_blob(page)
    vals = []
    for pat in [r"\bfrom\s+([A-Za-z][\w$#.]*)", r"\bjoin\s+([A-Za-z][\w$#.]*)", r"\binsert\s+into\s+([A-Za-z][\w$#.]*)", r"\bupdate\s+([A-Za-z][\w$#.]*)", r"\bdelete\s+from\s+([A-Za-z][\w$#.]*)", r"\bmerge\s+into\s+([A-Za-z][\w$#.]*)"]:
        for x in re.findall(pat, blob, re.I):
            t = clean_table_name(x)
            if t:
                vals.append(t)
    return unique(vals)


def extract_metadata(sql_file: Path, config: Dict[str, Any]) -> Dict[str, Any]:
    sql = read_text(sql_file)
    calls = find_calls(sql)
    app = extract_application_info(sql, sql_file, calls)
    pages = extract_pages(sql, calls)
    shared = extract_shared(sql, calls)
    db = extract_database(sql, pages)
    page_dicts = [asdict(p) for p in pages]
    metadata = {
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "application": app,
        "pages": page_dicts,
        "shared": shared,
        "database": db,
        "counts": {
            "pages": len(page_dicts),
            "regions": sum(len(p["regions"]) for p in page_dicts),
            "items": sum(len(p["items"]) for p in page_dicts),
            "buttons": sum(len(p["buttons"]) for p in page_dicts),
            "processes": sum(len(p["processes"]) for p in page_dicts),
            "validations": sum(len(p["validations"]) for p in page_dicts),
            "dynamic_actions": sum(len(p["dynamic_actions"]) for p in page_dicts),
            "authentications": len(shared["authentication"]),
            "authorizations": len(shared["authorization"]),
            "navigation_items": len(shared["list_items"]),
            "rest_endpoints": len(shared["rest"]),
            "tables_in_export": len(db["tables"]),
            "referenced_tables": len(db["referenced_tables"]),
        }
    }
    return metadata

# -----------------------------------------------------------------------------
# Architecture diagram generation
# -----------------------------------------------------------------------------

def esc_xml(v: Any) -> str:
    return html.escape(clean(v, 400), quote=True)


def short(v: Any, limit: int = 32) -> str:
    s = clean(v, limit + 20)
    return s if len(s) <= limit else s[:limit - 3].rstrip() + "..."


def wrap(text: str, max_chars: int) -> List[str]:
    words = clean(text, 250).split()
    if not words:
        return []
    lines, cur = [], ""
    for w in words:
        if len(cur) + len(w) + 1 <= max_chars:
            cur = (cur + " " + w).strip()
        else:
            if cur:
                lines.append(cur)
            cur = w[:max_chars]
    if cur:
        lines.append(cur)
    return lines


def svg_box(x: int, y: int, w: int, h: int, title: str, lines: List[str], fill: str = "#ffffff") -> str:
    parts = [f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="16" fill="{fill}" stroke="#334155" stroke-width="2"/>']
    parts.append(f'<text x="{x+16}" y="{y+30}" font-size="18" font-weight="700" fill="#0f172a">{esc_xml(title)}</text>')
    yy = y + 57
    max_chars = max(20, int(w / 8.0))
    for line in lines:
        for sub in wrap(line, max_chars):
            if yy > y + h - 12:
                return "\n".join(parts)
            parts.append(f'<text x="{x+16}" y="{yy}" font-size="13" fill="#1f2937">{esc_xml(sub)}</text>')
            yy += 18
    return "\n".join(parts)


def svg_arrow(x1: int, y1: int, x2: int, y2: int, label: str = "") -> str:
    parts = [f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="#334155" stroke-width="2.2" marker-end="url(#arrow)"/>']
    if label:
        midx, midy = (x1 + x2) / 2, (y1 + y2) / 2 - 8
        parts.append(f'<rect x="{midx-65}" y="{midy-16}" width="130" height="22" rx="8" fill="#f8fafc" opacity="0.95"/>')
        parts.append(f'<text x="{midx}" y="{midy}" text-anchor="middle" font-size="12" fill="#334155">{esc_xml(label)}</text>')
    return "\n".join(parts)


def build_runtime_svg(metadata: Dict[str, Any]) -> str:
    app = metadata["application"]
    pages = metadata["pages"]
    shared = metadata["shared"]
    db = metadata["database"]
    counts = metadata["counts"]
    app_name = app.get("application_name") or "Oracle APEX Application"
    app_id = app.get("application_id") or "Not found"
    auth = shared.get("authentication") or []
    auth_name = auth[0].get("name") if auth else "APEX authentication"
    nav_items = [x.get("text") for x in shared.get("list_items", []) if x.get("text") and x.get("text") not in {"---", "&APP_USER."}]
    top_pages = [f"P{p['page_id']} {short(p.get('title') or p.get('name'), 24)}" for p in pages[:7]]
    if len(pages) > 7:
        top_pages.append(f"+{len(pages)-7} more pages")
    if not top_pages:
        top_pages = ["Pages not detected", "Check SQL export path"]
    table_source = db.get("referenced_tables") or [t.get("name") for t in db.get("tables", [])]
    top_tables = [short(x, 30) for x in table_source[:6]] or ["APEX parsing schema", "External application tables"]
    if len(table_source) > 6:
        top_tables.append(f"+{len(table_source)-6} more objects")
    process_names = []
    for p in pages:
        for pr in p.get("processes", []):
            if pr.get("name"):
                process_names.append(short(pr["name"], 28))
            if len(process_names) >= 5:
                break
        if len(process_names) >= 5:
            break
    if not process_names:
        process_names = ["Session state", "Page rendering", "SQL / PL/SQL execution"]
    integration_lines = []
    blob = json.dumps(metadata).lower()
    if "apex_web_service" in blob or "utl_http" in blob:
        integration_lines.append("HTTP / Web service calls detected")
    if "dbms_cloud" in blob or "object_storage" in blob or "bucket" in blob:
        integration_lines.append("Object storage / bucket logic detected")
    if "generative" in blob or "ai" in blob or "cohere" in blob or "openai" in blob:
        integration_lines.append("AI/service integration keywords detected")
    if shared.get("rest"):
        integration_lines.append(f"REST/ORDS endpoints: {len(shared['rest'])}")

    ext_box = ""
    ext_arrow = ""
    if integration_lines:
        ext_box = svg_box(940, 520, 290, 130, "External / API Layer", integration_lines[:5], "#fff7ed")
        ext_arrow = svg_arrow(940, 585, 870, 430, "service calls")

    page_cards = []
    card_x, card_y = 330, 300
    for idx, p in enumerate(pages[:8]):
        x = card_x + (idx % 4) * 180
        y = card_y + (idx // 4) * 86
        counts_line = f"R:{len(p.get('regions', []))} I:{len(p.get('items', []))} B:{len(p.get('buttons', []))} P:{len(p.get('processes', []))}"
        page_cards.append(svg_box(x, y, 160, 66, f"Page {p['page_id']}", [short(p.get('title') or p.get('name'), 24), counts_line], "#ffffff"))
    if len(pages) > 8:
        page_cards.append(svg_box(card_x + 360, card_y + 172, 160, 58, "More Pages", [f"+{len(pages)-8} additional"], "#ffffff"))

    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="1280" height="780" viewBox="0 0 1280 780">
  <defs>
    <marker id="arrow" markerWidth="12" markerHeight="12" refX="10" refY="4" orient="auto" markerUnits="strokeWidth"><path d="M0,0 L0,8 L11,4 z" fill="#334155"/></marker>
    <filter id="shadow" x="-15%" y="-15%" width="130%" height="130%"><feDropShadow dx="0" dy="3" stdDeviation="3" flood-color="#94a3b8" flood-opacity="0.35"/></filter>
  </defs>
  <rect width="1280" height="780" fill="#f8fafc"/>
  <text x="40" y="44" font-size="28" font-weight="800" fill="#0f172a">{esc_xml(app_name)} - Runtime Architecture</text>
  <text x="40" y="72" font-size="14" fill="#475569">Application ID: {esc_xml(app_id)} | Generated from APEX SQL export | CI/CD is not part of this runtime diagram</text>
  <g filter="url(#shadow)">
    {svg_box(40, 125, 225, 120, "Users / Browser", ["Target users access app", "HTTPS requests", "APEX session cookies"], "#ecfeff")}
    {svg_box(335, 105, 245, 150, "Authentication", [auth_name, f"Schemes: {counts['authentications']}", "Login / session validation", "Public pages where configured"], "#eef2ff")}
    {svg_box(660, 105, 250, 150, "Navigation", (nav_items[:4] or ["Application menu", "Direct page URL"]), "#f0fdf4")}
    {svg_box(985, 105, 245, 150, "APEX UI Layer", [f"Pages: {counts['pages']}", f"Regions: {counts['regions']}", f"Items/fields: {counts['items']}", f"Buttons/actions: {counts['buttons']}"], "#fff7ed")}
    {svg_box(40, 340, 240, 160, "Page Components", ["Forms, reports, cards", "Page items", "Buttons", "Dynamic actions"] + top_pages[:2], "#ffffff")}
    {svg_box(940, 320, 290, 170, "APEX Runtime Logic", [f"Processes: {counts['processes']}", f"Validations: {counts['validations']}", f"Dynamic actions: {counts['dynamic_actions']}"] + process_names[:4], "#fefce8")}
    {svg_box(370, 585, 520, 145, "Oracle Database / Data Layer", [f"Tables in export: {counts['tables_in_export']}", f"Referenced DB objects: {counts['referenced_tables']}"] + top_tables[:5], "#f1f5f9")}
    {''.join(page_cards)}
    {ext_box}
  </g>
  {svg_arrow(265, 185, 335, 185, "HTTPS")}
  {svg_arrow(580, 180, 660, 180, "valid session")}
  {svg_arrow(910, 180, 985, 180, "open page")}
  {svg_arrow(1108, 255, 1085, 320, "render UI")}
  {svg_arrow(280, 420, 330, 420, "page model")}
  {svg_arrow(890, 420, 940, 420, "submit/AJAX")}
  {svg_arrow(1035, 490, 760, 585, "SQL / PL/SQL")}
  {svg_arrow(490, 585, 180, 500, "data shown in UI")}
  {ext_arrow}
  <text x="40" y="755" font-size="12" fill="#64748b">Diagram is generated from pages, regions, items, buttons, processes, authentication, navigation, APIs, and database references extracted from the SQL export.</text>
</svg>'''
    return svg


def build_mermaid(metadata: Dict[str, Any]) -> str:
    c = metadata["counts"]
    return "\n".join([
        "flowchart LR",
        '  U["Users / Browser"] -->|HTTPS| A["APEX Authentication"]',
        '  A -->|valid session| N["Navigation Menu"]',
        f'  N -->|open page| P["APEX Pages: {c["pages"]}"]',
        f'  P -->|render| UI["Regions: {c["regions"]}<br/>Items: {c["items"]}<br/>Buttons: {c["buttons"]}"]',
        f'  UI -->|submit/AJAX| R["APEX Runtime<br/>Processes: {c["processes"]}<br/>Validations: {c["validations"]}"]',
        f'  R -->|SQL / PL/SQL| DB[("Oracle Database<br/>Referenced objects: {c["referenced_tables"]}")]',
    ]) + "\n"


def write_diagram_files(metadata: Dict[str, Any], out_dir: Path) -> None:
    svg = build_runtime_svg(metadata)
    mmd = build_mermaid(metadata)
    (out_dir / "architecture_diagram.svg").write_text(svg, encoding="utf-8")
    (out_dir / "architecture_diagram.mmd").write_text(mmd, encoding="utf-8")
    html_doc = f'''<!doctype html>
<html><head><meta charset="utf-8"><title>System Architecture Diagram</title>
<style>body{{font-family:Arial,sans-serif;margin:24px;background:#fff;color:#111827}} .wrap{{max-width:1320px}} pre{{background:#f8fafc;padding:16px;border:1px solid #e5e7eb;overflow:auto}}</style>
</head><body><div class="wrap">
<h1>System Architecture Diagram</h1>
<p>This runtime architecture is generated from the Oracle APEX SQL export. Jenkins/CI/CD is intentionally excluded because it is not part of the running application.</p>
{svg}
<h2>Mermaid Source</h2><pre>{html.escape(mmd)}</pre>
</div></body></html>'''
    (out_dir / "architecture_diagram.html").write_text(html_doc, encoding="utf-8")

# -----------------------------------------------------------------------------
# Documentation rendering
# -----------------------------------------------------------------------------

def infer_page_purpose(page: Dict[str, Any], config: Dict[str, Any]) -> str:
    manual = config.get("manual_page_descriptions", {}).get(str(page.get("page_id"))) or config.get("manual_page_descriptions", {}).get(page.get("name", ""))
    if manual:
        return manual
    name = (page.get("name") or page.get("title") or "").lower()
    if page.get("is_public") == "Y" or "login" in name or str(page.get("page_id")) == "9999":
        return "Handles user sign-in, session initialization, and access into the application."
    if str(page.get("page_id")) == "0":
        return "Defines global/shared page-level components that can be available across the application."
    if page.get("items") and page.get("buttons"):
        return "Provides a user workflow where users enter or review data and trigger application actions."
    if page.get("regions"):
        return "Displays APEX regions such as reports, cards, forms, static content, or custom UI components for this application area."
    return "Represents an APEX application page extracted from the SQL export."


def page_summary(page: Dict[str, Any]) -> str:
    bits = []
    if page.get("regions"):
        bits.append(f"{len(page['regions'])} region(s)")
    if page.get("items"):
        bits.append(f"{len(page['items'])} item(s)")
    if page.get("buttons"):
        bits.append(f"{len(page['buttons'])} button(s)")
    if page.get("processes"):
        bits.append(f"{len(page['processes'])} process(es)")
    if page.get("validations"):
        bits.append(f"{len(page['validations'])} validation(s)")
    if page.get("dynamic_actions"):
        bits.append(f"{len(page['dynamic_actions'])} dynamic action(s)")
    return ", ".join(bits) if bits else "No page components extracted."


def render_page(page: Dict[str, Any], config: Dict[str, Any]) -> str:
    title = page.get("title") or page.get("name") or f"Page {page.get('page_id')}"
    p_tables = extract_page_tables(page)
    lines: List[str] = []
    lines += [f"### Page {page.get('page_id')} - {title}", ""]
    lines += ["#### Page Overview", "", f"**Name:** {page.get('name') or '-'}  ", f"**Alias:** {page.get('alias') or '-'}  ", f"**Public page:** {page.get('is_public') or 'N / not specified'}  ", f"**Protection level:** {page.get('protection_level') or '-'}  ", f"**Purpose:** {infer_page_purpose(page, config)}", ""]
    lines += ["#### How This Page Works Internally", "", f"This page contains {page_summary(page)}. When users open the page, APEX renders the configured regions and items. User actions such as button clicks, form submits, dynamic actions, and AJAX callbacks execute page processes/validations and may read or update database objects.", ""]
    lines += ["#### Page Architecture / Communication", "", "- Browser loads this APEX page through ORDS/APEX runtime.", "- APEX initializes session state and renders regions/items/buttons.", "- Buttons, dynamic actions, or page submits execute validations and page processes.", "- SQL/PLSQL logic communicates with Oracle Database objects listed below.", ""]
    lines += ["#### Database Objects Used By This Page", "", bullets(p_tables, "No table/object references detected for this page."), ""]
    lines += ["#### Regions", "", table(["Region", "Type", "Display Point", "Source / Query"], [[r.get("name"), r.get("type"), r.get("display_point"), r.get("source")] for r in page.get("regions", [])]), ""]
    lines += ["#### Page Items / Fields", "", table(["Item", "Prompt", "Type", "Required", "Max Length", "LOV / Source"], [[i.get("name"), i.get("prompt"), i.get("display_as"), i.get("required"), i.get("max_length"), i.get("lov") or i.get("source_type") or i.get("source")] for i in page.get("items", [])]), ""]
    lines += ["#### Buttons / User Actions", "", table(["Button", "Label", "Action", "Position", "Target / Condition"], [[b.get("name"), b.get("label"), b.get("action"), b.get("position"), b.get("target") or b.get("condition")] for b in page.get("buttons", [])]), ""]
    lines += ["#### Backend Processes", "", table(["Process", "Type", "Point", "API / Source", "Error Handling"], [[p.get("name"), p.get("type"), p.get("point"), ((p.get("api_package") + "." + p.get("api_name")) if p.get("api_package") or p.get("api_name") else p.get("source")), p.get("error_location")] for p in page.get("processes", [])]), ""]
    lines += ["#### Validations", "", table(["Validation", "Type", "Associated Item", "Error Message", "Condition"], [[v.get("name"), v.get("type"), v.get("associated_item"), v.get("error_message"), v.get("condition")] for v in page.get("validations", [])]), ""]
    lines += ["#### Dynamic Actions / AJAX Behavior", "", table(["Dynamic Action", "Event", "Selection", "Action", "Affected Elements"], [[d.get("name"), d.get("event"), d.get("selection_type") or d.get("triggering_element"), d.get("action"), d.get("affected_elements")] for d in page.get("dynamic_actions", [])]), ""]
    lines += ["#### User Guide for This Page", "", "1. Open the page from the application menu or direct page link.", "2. Review displayed regions and page instructions.", "3. Complete visible required fields.", "4. Use the available buttons/actions listed above.", "5. Review validation, success, or error messages after submit/AJAX actions.", ""]
    if config.get("user_guide", {}).get("include_screenshot_placeholders", True):
        lines += ["#### Screenshot Placeholder", "", f"Add a screenshot for Page {page.get('page_id')} here after deployment or from Playwright test artifacts.", ""]
    lines += ["#### Troubleshooting for This Page", "", "- Confirm the user has authorization to access this page.", "- Confirm required fields are completed before submit.", "- If the page uses backend processes, check APEX debug logs and related database objects.", "- If an error occurs, capture page ID, timestamp, user, input values, and screenshot.", ""]
    return "\n".join(lines)


def render_markdown(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    app = metadata["application"]
    pages = metadata["pages"]
    shared = metadata["shared"]
    db = metadata["database"]
    c = metadata["counts"]
    lines: List[str] = []
    lines += ["# Application Documentation", "", f"Generated at UTC: {metadata['generated_at_utc']}", f"Source SQL: {app.get('source_sql')}", ""]
    lines += ["## 1. Overview / Introduction", "", f"**Application name:** {app.get('application_name') or 'Not found'}  ", f"**Application ID:** {app.get('application_id') or 'Not found'}  ", f"**Application alias:** {app.get('alias') or 'Not found'}  ", f"**Owner/schema:** {app.get('owner') or app.get('default_owner') or 'Not found'}  ", f"**Version:** {app.get('version') or app.get('apex_version') or 'Not found'}", ""]
    lines += ["### Purpose of the Application", "", config["application"].get("purpose", ""), "", "### Business Problem It Solves", "", config["application"].get("business_problem", ""), "", "### Target Users", "", bullets(config["application"].get("target_users", [])), "", "### Key Features", "", bullets(config["application"].get("key_features", []) or [f"{c['pages']} APEX page(s) extracted from SQL export", "Page-by-page UI/backend/security documentation", "Generated runtime architecture diagram", "Database/API/security sections in a single document"]), "", "### Scope", "", config["application"].get("scope", ""), "", "### Limitations", "", bullets(config["application"].get("limitations", [])), "", "### Extracted Application Inventory", "", f"- Pages: {c['pages']}", f"- Regions: {c['regions']}", f"- Page items/fields: {c['items']}", f"- Buttons/actions: {c['buttons']}", f"- Page processes: {c['processes']}", f"- Validations: {c['validations']}", f"- Dynamic actions/AJAX: {c['dynamic_actions']}", f"- Authentication schemes: {c['authentications']}", f"- Authorization schemes: {c['authorizations']}", f"- Navigation/list items: {c['navigation_items']}", f"- REST/ORDS endpoints: {c['rest_endpoints']}", f"- Tables in export: {c['tables_in_export']}", f"- Referenced database objects: {c['referenced_tables']}", ""]

    lines += ["## 2. System Architecture", "", "### High-Level Runtime Architecture Diagram", "", "The architecture diagram is generated from the actual APEX SQL export metadata. It represents the running application only; Jenkins/CI/CD is not shown because it is not part of the APEX runtime.", "", "![System Architecture Diagram](architecture_diagram.svg)", "", "Generated diagram artifacts:", "", "- `architecture_diagram.svg`", "- `architecture_diagram.html`", "- `architecture_diagram.mmd`", "", "### Components / Services", "", f"- **Frontend:** {config['architecture']['frontend']}", f"- **Backend:** {config['architecture']['backend']}", f"- **Database:** {config['architecture']['database']}", f"- **Infrastructure:** {config['architecture']['cloud_infrastructure']}", "- **Third-party integrations:**", bullets(config["architecture"].get("third_party_integrations", []), "No third-party integrations configured manually."), "", "### How the System Works Internally", "", "Users access the application through a browser. ORDS/APEX handles HTTP routing, sessions, authentication, and page rendering. APEX renders pages using regions, items, buttons, lists, LOVs, and shared components. User interactions execute validations, dynamic actions, page processes, SQL, PL/SQL, and built-in APEX APIs. Data is read from or written to Oracle Database objects referenced by the page sources and processes.", "", "### How Components Communicate", "", "1. Browser sends HTTPS requests to ORDS/APEX.", "2. Authentication establishes or validates the APEX session.", "3. Navigation opens APEX pages and passes page/session state.", "4. Regions/items/buttons render the frontend UI.", "5. Buttons, form submits, and dynamic actions call APEX runtime logic.", "6. APEX runtime executes SQL/PLSQL against Oracle Database objects and returns rendered HTML, JSON, validations, redirects, or notifications.", ""]

    lines += ["## 3. Page-by-Page Documentation", "", "Every detected page is documented below in this single combined document.", ""]
    if not pages:
        lines += ["No pages were detected. Check that Jenkins is scanning the correct `apex/` folder and that the SQL export contains `create_page` calls or `prompt --application/pages/page_XXXXX` sections.", ""]
    for p in pages:
        lines.append(render_page(p, config))

    lines += ["## 4. Shared Application Components", "", "### Authentication Schemes", "", table(["Scheme", "Type", "Invalid Session", "Secure Cookie"], [[x.get("name"), x.get("type"), x.get("invalid_session"), x.get("cookie_secure")] for x in shared.get("authentication", [])]), "", "### Authorization Schemes", "", table(["Scheme", "Type", "Error Message"], [[x.get("name"), x.get("type"), x.get("error")] for x in shared.get("authorization", [])]), "", "### Lists / Navigation", "", table(["List", "Status"], [[x.get("name"), x.get("status")] for x in shared.get("lists", [])]), "", "### List Items / Menu Entries", "", table(["Text", "Target", "Icon", "Condition"], [[x.get("text"), x.get("target"), x.get("icon"), x.get("condition")] for x in shared.get("list_items", [])]), "", "### LOVs", "", table(["LOV", "Query / Source"], [[x.get("name"), x.get("query")] for x in shared.get("lovs", [])]), ""]

    lines += ["## 5. User Guide", "", "### Navigation Instructions", "", bullets([x.get("text") for x in shared.get("list_items", []) if x.get("text") and x.get("text") not in {"---", "&APP_USER."}], "Use direct page links or application navigation defined in APEX."), "", "### Workflow Examples", "", "1. Open the deployed APEX application URL.", "2. Sign in with an authorized user if authentication is required.", "3. Use the navigation menu to open the required page.", "4. Complete the page fields documented in the page sections above.", "5. Click the required button/action.", "6. Review success, validation, or error messages.", "", "### Page Workflow Summary", ""]
    for p in pages:
        lines.append(f"- **Page {p.get('page_id')} - {p.get('title') or p.get('name')}:** {page_summary(p)}")
    lines += ["", "### Screenshots", "", "Add screenshots from Playwright reports or manually capture from the deployed APEX workspace. Each page section includes a screenshot placeholder.", "", "### FAQs", ""]
    for faq in config.get("user_guide", {}).get("faq", []):
        lines += [f"**Q: {faq.get('question', '')}**", "", f"A: {faq.get('answer', '')}", ""]
    lines += ["### Troubleshooting Tips", "", bullets(config.get("user_guide", {}).get("troubleshooting", [])), ""]

    lines += ["## 6. API Documentation", ""]
    if shared.get("rest"):
        lines += ["### Extracted REST/ORDS Endpoints", "", table(["Endpoint / Template", "Method", "Source"], [[x.get("name"), x.get("method"), x.get("source")] for x in shared.get("rest", [])]), ""]
    else:
        lines += ["No REST/ORDS API endpoints were detected in this APEX SQL export.", ""]
    if config.get("manual_api_examples"):
        lines += ["### Manual API Examples", "", table(["Endpoint", "Method", "Request", "Response"], [[x.get("endpoint"), x.get("method"), x.get("request"), x.get("response")] for x in config.get("manual_api_examples", [])]), ""]
    lines += ["### Authentication", "", config["api"].get("authentication", ""), "", "### Error Codes", "", bullets(config["api"].get("error_codes", [])), "", "### Rate Limits", "", config["api"].get("rate_limits", ""), ""]

    lines += ["## 7. Database Documentation", "", "### ER Diagram / Relationships", "", table(["Constraint", "Columns", "Referenced Table", "Referenced Columns"], [[x.get("name"), x.get("columns"), x.get("ref_table"), x.get("ref_columns")] for x in db.get("foreign_keys", [])], "No foreign key relationships were found in this SQL export. If the application tables are outside the APEX export, add ER details manually in documentation_config.json."), "", "### Tables and Relationships", "", "#### Tables Explicitly Created in Export", ""]
    if db.get("tables"):
        for t in db["tables"]:
            lines += [f"##### {t.get('name')}", "", table(["Column", "Data Type / Definition"], [[c.get("name"), c.get("type")] for c in t.get("columns", [])]), ""]
    else:
        lines += ["No `CREATE TABLE` statements were found in the APEX export. This is common when database objects are deployed separately from the APEX application export.", ""]
    lines += ["#### Referenced Tables / Objects", "", bullets(db.get("referenced_tables", []), "No referenced tables/objects detected in page SQL/PLSQL sources."), "", "### Data Dictionary", "", table(["Table/Object", "Column", "Data Type", "Notes"], [[t.get("name"), c.get("name"), c.get("type"), "Extracted from CREATE TABLE"] for t in db.get("tables", []) for c in t.get("columns", [])], "Full column metadata was not present in this APEX export. Referenced objects are listed above."), "", "### Stored Procedures / Functions / Packages / Triggers", ""]
    for k, vals in db.get("objects", {}).items():
        lines += [f"#### {k.title()}", "", bullets(vals, f"No {k} found in SQL export."), ""]
    lines += ["### Indexing Strategy", "", table(["Index", "Table", "Columns"], [[x.get("name"), x.get("table"), x.get("columns")] for x in db.get("indexes", [])], "No indexes were found in this SQL export. Review indexes on referenced tables, foreign keys, search/filter columns, and report query predicates."), ""]
    if config.get("manual_database_notes"):
        lines += ["### Manual Database Notes", "", bullets(config.get("manual_database_notes", [])), ""]

    lines += ["## 8. Security Documentation", "", "### Authentication Method", "", config["security"].get("authentication_method", ""), "", table(["Scheme", "Type", "Invalid Session", "Secure Cookie"], [[x.get("name"), x.get("type"), x.get("invalid_session"), x.get("cookie_secure")] for x in shared.get("authentication", [])]), "", "### Authorization Roles / Schemes", "", "Configured roles:", bullets(config["security"].get("authorization_roles", []), "No manual roles configured in documentation_config.json."), "", "Extracted authorization schemes:", "", table(["Scheme", "Type", "Error Message"], [[x.get("name"), x.get("type"), x.get("error")] for x in shared.get("authorization", [])]), "", "### Encryption Details", "", config["security"].get("encryption_details", ""), "", "### Audit Logging", "", config["security"].get("audit_logging", ""), "", "### Security Best Practices", "", bullets(config["security"].get("best_practices", [])), "", "### Security Review Checklist", "", "- Confirm sensitive pages are protected by authorization schemes.", "- Confirm destructive buttons are protected and require confirmation.", "- Confirm server-side validations exist for critical inputs.", "- Confirm application errors do not leak ORA-/ERR- internals to end users.", "- Confirm credentials, private keys, wallets, and API keys are not committed to source control.", ""]
    if config.get("manual_security_notes"):
        lines += ["### Manual Security Notes", "", bullets(config.get("manual_security_notes", [])), ""]
    return "\n".join(lines).replace("\n\n\n\n", "\n\n")


def markdown_to_text(md: str) -> str:
    txt = md
    txt = re.sub(r"^#{1,6}\s*", "", txt, flags=re.M)
    txt = txt.replace("![System Architecture Diagram](architecture_diagram.svg)", "See architecture_diagram.svg artifact.")
    txt = re.sub(r"\*\*(.*?)\*\*", r"\1", txt)
    txt = txt.replace("`", "")
    return txt

# -----------------------------------------------------------------------------
# Output orchestration
# -----------------------------------------------------------------------------

def discover_sql_files() -> List[Path]:
    if APEX_SQL_FILE_ENV:
        p = Path(APEX_SQL_FILE_ENV)
        if not p.is_absolute():
            p = ROOT_DIR / p
        if not p.exists():
            raise FileNotFoundError(f"APEX_SQL_FILE was set but does not exist: {p}")
        return [p]
    if DOC_SCAN_APEX_DIR:
        if not APEX_SQL_DIR.exists():
            raise FileNotFoundError(f"APEX SQL directory not found: {APEX_SQL_DIR}")
        files = sorted([p for p in APEX_SQL_DIR.rglob("*.sql") if p.is_file()])
        if not files:
            raise FileNotFoundError(f"No .sql files found under {APEX_SQL_DIR}")
        return files
    default = ROOT_DIR / "apex" / "f100.sql"
    if not default.exists():
        raise FileNotFoundError(f"No APEX SQL file found. Set APEX_SQL_FILE or APEX_SQL_DIR. Tried: {default}")
    return [default]


def write_zip(out_dir: Path, zip_path: Path) -> None:
    if zip_path.exists():
        zip_path.unlink()
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
        for p in sorted(out_dir.rglob("*")):
            if p.is_file() and p != zip_path:
                zf.write(p, p.relative_to(out_dir))


def generate_for_sql(sql_file: Path, out_dir: Path, config: Dict[str, Any]) -> Dict[str, Any]:
    out_dir.mkdir(parents=True, exist_ok=True)
    metadata = extract_metadata(sql_file, config)
    write_diagram_files(metadata, out_dir)
    md = render_markdown(metadata, config)
    (out_dir / "application_documentation.md").write_text(md + "\n", encoding="utf-8")
    (out_dir / "application_documentation.txt").write_text(markdown_to_text(md) + "\n", encoding="utf-8")
    (out_dir / "apex_metadata.json").write_text(json.dumps(metadata, indent=2), encoding="utf-8")
    write_zip(out_dir, out_dir / "application_documentation_bundle.zip")
    return metadata


def render_repository_index(items: List[Tuple[Path, Path, Dict[str, Any]]]) -> str:
    lines = ["# Repository APEX Documentation", "", f"Generated at UTC: {datetime.now(timezone.utc).isoformat()}", "", "This combined file summarizes every `.sql` export discovered under the configured `apex/` folder. Each SQL file also has its own folder with full documentation and architecture artifacts.", ""]
    lines += ["## Applications / SQL Exports", "", table(["SQL File", "Application", "Application ID", "Pages", "Items", "Processes", "Referenced DB Objects", "Folder"], [[sql.name, md["application"].get("application_name"), md["application"].get("application_id"), md["counts"]["pages"], md["counts"]["items"], md["counts"]["processes"], md["counts"]["referenced_tables"], str(out.relative_to(BASE_OUTPUT_DIR))] for sql, out, md in items]), ""]
    for sql, out, md in items:
        lines += [f"## {md['application'].get('application_name') or sql.stem}", "", f"- Source SQL: `{sql}`", f"- Application ID: {md['application'].get('application_id') or 'Not found'}", f"- Pages: {md['counts']['pages']}", f"- Regions: {md['counts']['regions']}", f"- Items: {md['counts']['items']}", f"- Buttons: {md['counts']['buttons']}", f"- Processes: {md['counts']['processes']}", f"- Full documentation: `{out.relative_to(BASE_OUTPUT_DIR)}/application_documentation.md`", f"- Architecture diagram: `{out.relative_to(BASE_OUTPUT_DIR)}/architecture_diagram.html`", ""]
        if md.get("pages"):
            lines += ["### Pages", "", table(["Page", "Title", "Summary"], [[p.get("page_id"), p.get("title") or p.get("name"), page_summary(p)] for p in md.get("pages", [])]), ""]
    return "\n".join(lines)


def main() -> None:
    try:
        config = load_config()
        sql_files = discover_sql_files()
        BASE_OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
        print(f"Discovered {len(sql_files)} SQL file(s):")
        for f in sql_files:
            print(f" - {f}")

        generated: List[Tuple[Path, Path, Dict[str, Any]]] = []
        if len(sql_files) == 1:
            metadata = generate_for_sql(sql_files[0], BASE_OUTPUT_DIR, config)
            generated.append((sql_files[0], BASE_OUTPUT_DIR, metadata))
        else:
            for sql_file in sql_files:
                preview_metadata = extract_metadata(sql_file, config)
                app_id = preview_metadata["application"].get("application_id") or sql_file.stem
                app_name = preview_metadata["application"].get("application_name") or sql_file.stem
                folder = BASE_OUTPUT_DIR / slugify(f"{sql_file.stem}_{app_id}_{app_name}")
                metadata = generate_for_sql(sql_file, folder, config)
                generated.append((sql_file, folder, metadata))
            index_md = render_repository_index(generated)
            (BASE_OUTPUT_DIR / "application_documentation.md").write_text(index_md + "\n", encoding="utf-8")
            (BASE_OUTPUT_DIR / "application_documentation.txt").write_text(markdown_to_text(index_md) + "\n", encoding="utf-8")
            combined = {"generated_at_utc": datetime.now(timezone.utc).isoformat(), "applications": [m for _s, _o, m in generated]}
            (BASE_OUTPUT_DIR / "apex_metadata.json").write_text(json.dumps(combined, indent=2), encoding="utf-8")
            # Use first app's diagram as top-level preview and keep per-app diagrams in folders.
            if generated:
                first_meta = generated[0][2]
                write_diagram_files(first_meta, BASE_OUTPUT_DIR)
            write_zip(BASE_OUTPUT_DIR, BASE_OUTPUT_DIR / "application_documentation_bundle.zip")

        print("Documentation generated successfully.")
        print(f"Output directory: {BASE_OUTPUT_DIR}")
        print(f"Main markdown: {BASE_OUTPUT_DIR / 'application_documentation.md'}")
        print(f"Main txt: {BASE_OUTPUT_DIR / 'application_documentation.txt'}")
        print(f"Main zip: {BASE_OUTPUT_DIR / 'application_documentation_bundle.zip'}")
        for _sql, _out, md in generated:
            c = md["counts"]
            print(f"Parsed {md['application'].get('application_name')}: pages={c['pages']}, regions={c['regions']}, items={c['items']}, buttons={c['buttons']}, processes={c['processes']}, refs={c['referenced_tables']}")
    except Exception as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
