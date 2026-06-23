# coding: utf-8
"""
Oracle APEX SQL to Deployment Documentation Generator
CI/CD / Jenkins / OCI GenAI compatible edition

This generator is intentionally SQL-first and deterministic. It reads the exact
APEX SQL export for the branch build and creates one combined documentation file
for the whole application, with page-by-page documentation inside the same file.

Generated artifacts:
- documentation/generated/application_documentation.md
- documentation/generated/application_documentation.txt
- documentation/generated/apex_metadata.json
- documentation/generated/architecture_diagram.svg
- documentation/generated/architecture_diagram.mmd
- documentation/generated/architecture_diagram.html
- documentation/generated/application_documentation_bundle.zip

Optional OCI GenAI:
If OCI credentials are present, the script can ask OCI GenAI to polish short
business summaries, but extracted technical details always come from the SQL file.
If OCI is unavailable or fails, the documentation is still generated.
"""

from __future__ import annotations

import html
import json
import os
import re
import sys
import textwrap
import zipfile
from dataclasses import dataclass, asdict, field
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple

try:
    import oci  # type: ignore
except Exception:  # pragma: no cover
    oci = None

CONFIG_PROFILE = os.getenv("OCI_CONFIG_PROFILE", "DEFAULT")
CONFIG_FILE_PATH = os.getenv("OCI_CONFIG_FILE_PATH", str(Path.home() / ".oci" / "config"))
COMPARTMENT_ID = os.getenv("OCI_COMPARTMENT_ID", "ocid1.compartment.oc1..aaaaaaaatm34bplxwjpdfrxalb7w633njcl3z2ggblblvetwykljhndxooea")
ENDPOINT = os.getenv("OCI_GENAI_ENDPOINT", "https://inference.generativeai.us-ashburn-1.oci.oraclecloud.com")
CHAT_MODEL_ID = os.getenv("OCI_CHAT_MODEL_ID", "ocid1.generativeaimodel.oc1.iad.amaaaaaask7dceyaeo4ehrn25guuats5s45hnvswlhxo6riop275l2bkr2vq")

ROOT_DIR = Path(__file__).resolve().parents[1]
APEX_SQL_FILE = Path(os.getenv("APEX_SQL_FILE", str(ROOT_DIR / "apex" / "f100.sql")))
DOC_CONFIG_FILE = Path(os.getenv("DOC_CONFIG_FILE", str(ROOT_DIR / "documentation" / "documentation_config.json")))
OUTPUT_DIR = Path(os.getenv("DOC_OUTPUT_DIR", str(ROOT_DIR / "documentation" / "generated")))

DOC_MD_FILE = OUTPUT_DIR / "application_documentation.md"
DOC_TXT_FILE = OUTPUT_DIR / "application_documentation.txt"
METADATA_JSON_FILE = OUTPUT_DIR / "apex_metadata.json"
ARCH_MMD_FILE = OUTPUT_DIR / "architecture_diagram.mmd"
ARCH_SVG_FILE = OUTPUT_DIR / "architecture_diagram.svg"
ARCH_HTML_FILE = OUTPUT_DIR / "architecture_diagram.html"
DOC_ZIP_FILE = OUTPUT_DIR / "application_documentation_bundle.zip"

MAX_LIST_ITEMS = int(os.getenv("DOC_MAX_LIST_ITEMS", "300"))
ENABLE_OCI_POLISH = os.getenv("DOC_ENABLE_OCI_POLISH", "false").lower() in {"1", "true", "yes", "y"}

# =============================================================================
# Data models
# =============================================================================

@dataclass
class PageItem:
    name: str
    label: str = ""
    display_as: str = ""
    source_type: str = ""
    source: str = ""
    required: str = ""
    lov: str = ""
    default: str = ""
    help_text: str = ""
    page_id: str = ""

@dataclass
class Button:
    name: str
    label: str = ""
    action: str = ""
    target: str = ""
    page_id: str = ""

@dataclass
class Region:
    name: str
    template: str = ""
    source_type: str = ""
    source: str = ""
    region_type: str = ""
    page_id: str = ""

@dataclass
class Process:
    name: str
    process_type: str = ""
    point: str = ""
    source: str = ""
    condition: str = ""
    page_id: str = ""

@dataclass
class Validation:
    name: str
    validation_type: str = ""
    item: str = ""
    error_message: str = ""
    condition: str = ""
    page_id: str = ""

@dataclass
class DynamicAction:
    name: str
    event: str = ""
    when_element: str = ""
    condition: str = ""
    page_id: str = ""

@dataclass
class PageDoc:
    page_id: str
    title: str
    alias: str = ""
    name: str = ""
    page_mode: str = ""
    auth_required: str = ""
    protection_level: str = ""
    items: List[PageItem] = field(default_factory=list)
    buttons: List[Button] = field(default_factory=list)
    regions: List[Region] = field(default_factory=list)
    processes: List[Process] = field(default_factory=list)
    validations: List[Validation] = field(default_factory=list)
    dynamic_actions: List[DynamicAction] = field(default_factory=list)

@dataclass
class DbTable:
    name: str
    columns: List[Dict[str, str]] = field(default_factory=list)
    constraints: List[str] = field(default_factory=list)
    indexes: List[str] = field(default_factory=list)

@dataclass
class ApiEndpoint:
    method: str
    path: str
    source: str = ""
    auth: str = ""
    module: str = ""

# =============================================================================
# General helpers
# =============================================================================

def now_utc_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat()


def read_text_file(path: Path, required: bool = True) -> str:
    if not path.exists():
        if required:
            raise FileNotFoundError(f"File not found: {path}")
        return ""
    if not path.is_file():
        raise ValueError(f"Path is not a file: {path}")
    text = path.read_text(encoding="utf-8", errors="ignore")
    if required and not text.strip():
        raise ValueError(f"File is empty: {path}")
    return text


def normalize_sql(text: str) -> str:
    text = re.sub(r"\r\n?", "\n", text)
    return text


def clean_inline(value: Any, max_len: int = 240) -> str:
    if value is None:
        return ""
    text = str(value)
    text = text.replace("''", "'")
    text = re.sub(r"\s+", " ", text).strip()
    if len(text) > max_len:
        return text[: max_len - 3].rstrip() + "..."
    return text


def unique(values: Iterable[Any], limit: int = MAX_LIST_ITEMS) -> List[str]:
    out: List[str] = []
    seen = set()
    for value in values:
        if value is None:
            continue
        if isinstance(value, tuple):
            value = " ".join(str(v).strip() for v in value if v)
        value = clean_inline(value, max_len=500)
        if not value:
            continue
        key = value.lower()
        if key in seen:
            continue
        seen.add(key)
        out.append(value)
        if len(out) >= limit:
            break
    return out


def regex_find(pattern: str, text: str, limit: int = MAX_LIST_ITEMS) -> List[str]:
    return unique(re.findall(pattern, text, flags=re.IGNORECASE | re.DOTALL), limit=limit)


def first_param(block: str, param: str) -> str:
    # Handles p_name=>'X', p_name => q'[X]', p_name => nvl('X'), p_id=>123, p_security_scheme=>wwv_flow_api.id(123)
    patterns = [
        rf"{re.escape(param)}\s*=>\s*q'\[(.*?)\]'",
        rf"{re.escape(param)}\s*=>\s*q'\{{(.*?)\}}'",
        rf"{re.escape(param)}\s*=>\s*'((?:''|[^'])*)'",
        rf"{re.escape(param)}\s*=>\s*wwv_flow_api\.id\(([0-9]+)\)",
        rf"{re.escape(param)}\s*=>\s*([0-9]+)",
        rf"{re.escape(param)}\s*=>\s*([A-Z0-9_\.]+)",
    ]
    for pat in patterns:
        m = re.search(pat, block, flags=re.IGNORECASE | re.DOTALL)
        if m:
            return clean_inline(m.group(1), max_len=1200)
    return ""


def extract_blocks(sql_text: str, api_name: str) -> List[str]:
    # APEX exports normally use wwv_flow_api.create_xxx(...); but content may contain nested parentheses.
    # This scanner finds the matching close parenthesis before the semicolon.
    starts = [m.start() for m in re.finditer(rf"wwv_flow_api\.{re.escape(api_name)}\s*\(", sql_text, flags=re.IGNORECASE)]
    blocks: List[str] = []
    for start in starts:
        open_pos = sql_text.find("(", start)
        if open_pos < 0:
            continue
        depth = 0
        in_quote = False
        i = open_pos
        while i < len(sql_text):
            ch = sql_text[i]
            nxt = sql_text[i + 1] if i + 1 < len(sql_text) else ""
            if ch == "'":
                # SQL escaped quote: '' inside a string.
                if in_quote and nxt == "'":
                    i += 2
                    continue
                in_quote = not in_quote
            elif not in_quote:
                if ch == "(":
                    depth += 1
                elif ch == ")":
                    depth -= 1
                    if depth == 0:
                        blocks.append(sql_text[open_pos + 1 : i])
                        break
            i += 1
    return blocks


def source_tables_from_text(text: str) -> List[str]:
    patterns = [
        r"\bfrom\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
        r"\bjoin\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
        r"\binto\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
        r"\bupdate\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
        r"\bmerge\s+into\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
        r"\bdelete\s+from\s+([a-zA-Z][a-zA-Z0-9_$#\.]+)",
    ]
    vals: List[str] = []
    for pat in patterns:
        vals.extend(re.findall(pat, text, flags=re.IGNORECASE))
    ignored = {"select", "dual", "table", "apex_application", "wwv_flow", "sys", "system"}
    return [v.upper() for v in unique(vals, limit=60) if v.lower() not in ignored]


def text_list(values: Iterable[str], none_text: str = "Not found in SQL export.", limit: int = 60) -> str:
    vals = [v for v in unique(values, limit=limit) if v]
    if not vals:
        return f"- {none_text}"
    return "\n".join(f"- {v}" for v in vals)


def md_table(headers: List[str], rows: List[List[Any]], empty: str = "Not found in SQL export.") -> str:
    if not rows:
        return empty
    def esc(x: Any) -> str:
        s = clean_inline(x, max_len=500)
        s = s.replace("|", "\\|")
        return s if s else "-"
    out = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]
    for row in rows:
        out.append("| " + " | ".join(esc(c) for c in row) + " |")
    return "\n".join(out)


def truncate_code(text: str, max_len: int = 700) -> str:
    text = clean_inline(text, max_len=max_len)
    return text

# =============================================================================
# Config
# =============================================================================

DEFAULT_DOC_CONFIG: Dict[str, Any] = {
    "application": {
        "purpose": "Oracle APEX application generated from the deployment SQL export.",
        "business_problem": "Update this field with the business problem solved by the application.",
        "target_users": ["End users", "Application administrators"],
        "key_features": [],
        "scope": "This documentation is generated from the APEX SQL file used in the deployment branch.",
        "limitations": [
            "Only metadata present in the APEX SQL export can be extracted automatically.",
            "Business descriptions, screenshots, external system contracts, and non-exported infrastructure details should be maintained in documentation/documentation_config.json."
        ]
    },
    "architecture": {
        "frontend": "Oracle APEX web user interface",
        "backend": "Oracle APEX runtime, PL/SQL page processes, validations, dynamic actions, and SQL sources",
        "database": "Oracle Database / APEX parsing schema",
        "cloud_infrastructure": "Oracle Cloud Infrastructure, ORDS, and APEX runtime environment configured for this deployment",
        "third_party_integrations": []
    },
    "api": {
        "exposes_apis": "auto",
        "base_url": "",
        "authentication": "Environment-specific authentication. Update when REST APIs are exposed.",
        "rate_limits": "Not defined in SQL export. Update if API gateway, ORDS, or service-level limits are configured.",
        "error_codes": ["400 Bad Request", "401 Unauthorized", "403 Forbidden", "404 Not Found", "429 Too Many Requests", "500 Internal Server Error"]
    },
    "security": {
        "authentication_method": "Extracted from APEX authentication schemes when present; otherwise update manually.",
        "authorization_roles": [],
        "encryption_details": "Use HTTPS/TLS in transit. Database encryption depends on the configured Oracle Database/OCI environment.",
        "audit_logging": "Review APEX activity logs, custom audit tables, and database auditing configuration.",
        "best_practices": [
            "Store secrets only in Jenkins credentials or OCI Vault, never in source control.",
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
            {"question": "What should I do if I see an error?", "answer": "Capture the page, timestamp, and steps taken, then contact the application administrator."}
        ],
        "troubleshooting": [
            "Confirm that all mandatory fields are completed.",
            "Refresh the page and retry the action once.",
            "If the problem persists, share the page name, input values, timestamp, and screenshot with support."
        ]
    },
    "manual_api_examples": [],
    "manual_database_notes": [],
    "manual_security_notes": []
}


def deep_merge(default: Dict[str, Any], override: Dict[str, Any]) -> Dict[str, Any]:
    merged = dict(default)
    for key, value in override.items():
        if isinstance(value, dict) and isinstance(merged.get(key), dict):
            merged[key] = deep_merge(merged[key], value)
        else:
            merged[key] = value
    return merged


def load_or_create_doc_config() -> Dict[str, Any]:
    DOC_CONFIG_FILE.parent.mkdir(parents=True, exist_ok=True)
    if not DOC_CONFIG_FILE.exists():
        DOC_CONFIG_FILE.write_text(json.dumps(DEFAULT_DOC_CONFIG, indent=2), encoding="utf-8")
        print(f"Created default documentation config: {DOC_CONFIG_FILE}")
        return DEFAULT_DOC_CONFIG
    try:
        user_config = json.loads(read_text_file(DOC_CONFIG_FILE, required=True))
    except Exception as exc:
        raise ValueError(f"Invalid JSON in {DOC_CONFIG_FILE}: {exc}") from exc
    return deep_merge(DEFAULT_DOC_CONFIG, user_config)

# =============================================================================
# APEX extraction
# =============================================================================

def extract_pages(sql_text: str) -> List[PageDoc]:
    pages: List[PageDoc] = []
    seen = set()
    for block in extract_blocks(sql_text, "create_page"):
        page_id = first_param(block, "p_page_id") or first_param(block, "p_id")
        title = first_param(block, "p_page_title") or first_param(block, "p_name") or f"Page {page_id or len(pages) + 1}"
        alias = first_param(block, "p_alias")
        name = first_param(block, "p_name")
        key = page_id or title.lower()
        if key in seen:
            continue
        seen.add(key)
        pages.append(PageDoc(
            page_id=page_id,
            title=title,
            alias=alias,
            name=name,
            page_mode=first_param(block, "p_page_mode"),
            auth_required=first_param(block, "p_authentication"),
            protection_level=first_param(block, "p_protection_level"),
        ))
    pages.sort(key=lambda p: int(p.page_id) if p.page_id.isdigit() else 999999)
    return pages


def page_map(pages: List[PageDoc]) -> Dict[str, PageDoc]:
    return {p.page_id: p for p in pages if p.page_id}


def add_orphan_page(pages: List[PageDoc], page_id: str) -> PageDoc:
    pm = page_map(pages)
    if page_id in pm:
        return pm[page_id]
    p = PageDoc(page_id=page_id, title=f"Page {page_id}")
    pages.append(p)
    return p


def extract_page_components(sql_text: str, pages: List[PageDoc]) -> None:
    pm = page_map(pages)

    for block in extract_blocks(sql_text, "create_page_item"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_name")
        if not name:
            continue
        item = PageItem(
            name=name,
            label=first_param(block, "p_prompt") or first_param(block, "p_field_template"),
            display_as=first_param(block, "p_display_as"),
            source_type=first_param(block, "p_source_type"),
            source=first_param(block, "p_source"),
            required=first_param(block, "p_is_required"),
            lov=first_param(block, "p_named_lov") or first_param(block, "p_lov"),
            default=first_param(block, "p_item_default"),
            help_text=first_param(block, "p_help_text"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).items.append(item)

    for block in extract_blocks(sql_text, "create_page_button"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_button_name")
        if not name:
            continue
        btn = Button(
            name=name,
            label=first_param(block, "p_button_static_id") or first_param(block, "p_button_name"),
            action=first_param(block, "p_button_action"),
            target=first_param(block, "p_button_redirect_url") or first_param(block, "p_button_execute_validations"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).buttons.append(btn)

    # Regions are create_page_plug in APEX exports.
    for block in extract_blocks(sql_text, "create_page_plug"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_plug_name")
        if not name:
            continue
        reg = Region(
            name=name,
            template=first_param(block, "p_plug_template"),
            source_type=first_param(block, "p_plug_source_type"),
            source=first_param(block, "p_plug_source"),
            region_type=first_param(block, "p_plug_display_point"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).regions.append(reg)

    for block in extract_blocks(sql_text, "create_page_process"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_process_name")
        if not name:
            continue
        proc = Process(
            name=name,
            process_type=first_param(block, "p_process_type"),
            point=first_param(block, "p_process_point"),
            source=first_param(block, "p_process_sql_clob") or first_param(block, "p_process_source") or first_param(block, "p_process"),
            condition=first_param(block, "p_process_when") or first_param(block, "p_process_condition"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).processes.append(proc)

    for block in extract_blocks(sql_text, "create_page_validation"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_validation_name")
        if not name:
            continue
        val = Validation(
            name=name,
            validation_type=first_param(block, "p_validation_type"),
            item=first_param(block, "p_associated_item"),
            error_message=first_param(block, "p_error_message"),
            condition=first_param(block, "p_validation_condition") or first_param(block, "p_when_button_pressed"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).validations.append(val)

    for block in extract_blocks(sql_text, "create_page_da_event"):
        page_id = first_param(block, "p_page_id")
        name = first_param(block, "p_name")
        if not name:
            continue
        da = DynamicAction(
            name=name,
            event=first_param(block, "p_bind_event_type"),
            when_element=first_param(block, "p_triggering_element") or first_param(block, "p_triggering_element_type"),
            condition=first_param(block, "p_condition_element") or first_param(block, "p_client_condition_type"),
            page_id=page_id,
        )
        (pm.get(page_id) or add_orphan_page(pages, page_id)).dynamic_actions.append(da)


def extract_authentication(sql_text: str) -> List[Dict[str, str]]:
    rows = []
    for block in extract_blocks(sql_text, "create_authentication"):
        rows.append({
            "name": first_param(block, "p_name") or first_param(block, "p_scheme_name"),
            "type": first_param(block, "p_scheme_type") or first_param(block, "p_authentication_function"),
            "invalid_session": first_param(block, "p_invalid_session_type"),
        })
    # older exports sometimes use create_authentication_scheme
    for block in extract_blocks(sql_text, "create_authentication_scheme"):
        rows.append({
            "name": first_param(block, "p_name") or first_param(block, "p_scheme_name"),
            "type": first_param(block, "p_scheme_type") or first_param(block, "p_authentication_function"),
            "invalid_session": first_param(block, "p_invalid_session_type"),
        })
    return [r for r in rows if any(r.values())]


def extract_authorization(sql_text: str) -> List[Dict[str, str]]:
    rows = []
    for block in extract_blocks(sql_text, "create_security_scheme"):
        rows.append({
            "name": first_param(block, "p_name"),
            "scheme_type": first_param(block, "p_scheme_type"),
            "error_message": first_param(block, "p_error_message"),
            "condition": first_param(block, "p_caching"),
        })
    return [r for r in rows if any(r.values())]


def extract_lists_and_lovs(sql_text: str) -> Tuple[List[Dict[str, str]], List[Dict[str, str]]]:
    lists = []
    for block in extract_blocks(sql_text, "create_list"):
        lists.append({"name": first_param(block, "p_name"), "status": first_param(block, "p_list_status")})
    lovs = []
    for block in extract_blocks(sql_text, "create_list_of_values"):
        lovs.append({"name": first_param(block, "p_lov_name") or first_param(block, "p_name"), "query": first_param(block, "p_lov_query")})
    for block in extract_blocks(sql_text, "create_named_lov"):
        lovs.append({"name": first_param(block, "p_name") or first_param(block, "p_lov_name"), "query": first_param(block, "p_lov_query")})
    return lists, lovs


def split_columns(definition: str) -> List[str]:
    parts: List[str] = []
    buf: List[str] = []
    depth = 0
    in_quote = False
    i = 0
    while i < len(definition):
        ch = definition[i]
        nxt = definition[i + 1] if i + 1 < len(definition) else ""
        if ch == "'":
            if in_quote and nxt == "'":
                buf.append(ch)
                buf.append(nxt)
                i += 2
                continue
            in_quote = not in_quote
        elif not in_quote:
            if ch == "(":
                depth += 1
            elif ch == ")" and depth > 0:
                depth -= 1
            elif ch == "," and depth == 0:
                part = "".join(buf).strip()
                if part:
                    parts.append(part)
                buf = []
                i += 1
                continue
        buf.append(ch)
        i += 1
    part = "".join(buf).strip()
    if part:
        parts.append(part)
    return parts


def extract_database(sql_text: str) -> Dict[str, Any]:
    tables: Dict[str, DbTable] = {}

    for m in re.finditer(r"\bcreate\s+table\s+([\w.$#]+)\s*\((.*?)\)\s*;", sql_text, flags=re.IGNORECASE | re.DOTALL):
        table_name = m.group(1).upper()
        body = m.group(2)
        table = tables.setdefault(table_name, DbTable(name=table_name))
        for part in split_columns(body):
            p = clean_inline(part, max_len=900)
            if not p:
                continue
            if re.match(r"^(constraint|primary\s+key|foreign\s+key|unique|check)\b", p, flags=re.IGNORECASE):
                table.constraints.append(p)
                continue
            col_match = re.match(r"^([\w$#]+)\s+(.+)$", p, flags=re.IGNORECASE | re.DOTALL)
            if col_match:
                col_name = col_match.group(1).upper()
                rest = clean_inline(col_match.group(2), max_len=500)
                nullable = "No" if re.search(r"\bnot\s+null\b", rest, flags=re.IGNORECASE) else "Yes/Unknown"
                table.columns.append({"column": col_name, "definition": rest, "nullable": nullable})

    for m in re.finditer(r"\balter\s+table\s+([\w.$#]+)\s+add\s+(.*?);", sql_text, flags=re.IGNORECASE | re.DOTALL):
        table_name = m.group(1).upper()
        table = tables.setdefault(table_name, DbTable(name=table_name))
        table.constraints.append(clean_inline(m.group(2), max_len=900))

    indexes = []
    for m in re.finditer(r"\bcreate\s+(unique\s+)?index\s+([\w.$#]+)\s+on\s+([\w.$#]+)\s*\((.*?)\)\s*;", sql_text, flags=re.IGNORECASE | re.DOTALL):
        unique_flag = "UNIQUE" if m.group(1) else "NON-UNIQUE"
        index_name = m.group(2).upper()
        table_name = m.group(3).upper()
        cols = clean_inline(m.group(4), max_len=500)
        idx = f"{index_name} ({unique_flag}) on {table_name}({cols})"
        indexes.append({"index": index_name, "table": table_name, "columns": cols, "type": unique_flag})
        tables.setdefault(table_name, DbTable(name=table_name)).indexes.append(idx)

    views = regex_find(r"\bcreate\s+(?:or\s+replace\s+)?view\s+([\w.$#]+)", sql_text, 200)
    sequences = regex_find(r"\bcreate\s+sequence\s+([\w.$#]+)", sql_text, 200)
    triggers = regex_find(r"\bcreate\s+(?:or\s+replace\s+)?trigger\s+([\w.$#]+)", sql_text, 200)
    packages = regex_find(r"\bcreate\s+(?:or\s+replace\s+)?package(?:\s+body)?\s+([\w.$#]+)", sql_text, 200)
    procedures = regex_find(r"\bcreate\s+(?:or\s+replace\s+)?procedure\s+([\w.$#]+)", sql_text, 200)
    functions = regex_find(r"\bcreate\s+(?:or\s+replace\s+)?function\s+([\w.$#]+)", sql_text, 200)

    relationships = []
    fk_patterns = [
        r"constraint\s+([\w$#]+)\s+foreign\s+key\s*\((.*?)\)\s+references\s+([\w.$#]+)\s*\((.*?)\)",
        r"foreign\s+key\s*\((.*?)\)\s+references\s+([\w.$#]+)\s*\((.*?)\)",
    ]
    for pat in fk_patterns:
        for m in re.finditer(pat, sql_text, flags=re.IGNORECASE | re.DOTALL):
            if len(m.groups()) == 4:
                relationships.append({"constraint": clean_inline(m.group(1)), "columns": clean_inline(m.group(2)), "references_table": m.group(3).upper(), "references_columns": clean_inline(m.group(4))})
            else:
                relationships.append({"constraint": "", "columns": clean_inline(m.group(1)), "references_table": m.group(2).upper(), "references_columns": clean_inline(m.group(3))})

    return {
        "tables": [asdict(t) for t in sorted(tables.values(), key=lambda x: x.name)],
        "indexes": indexes,
        "relationships": relationships,
        "views": views,
        "sequences": sequences,
        "triggers": triggers,
        "packages": packages,
        "procedures": procedures,
        "functions": functions,
    }


def extract_apis(sql_text: str) -> List[ApiEndpoint]:
    endpoints: List[ApiEndpoint] = []

    # ORDS modern syntax
    modules: Dict[str, str] = {}
    for m in re.finditer(r"ords\.define_module\s*\((.*?)\);", sql_text, flags=re.IGNORECASE | re.DOTALL):
        block = m.group(1)
        name = first_param(block, "p_module_name")
        base = first_param(block, "p_base_path")
        if name or base:
            modules[name or base] = base

    templates: List[Tuple[str, str]] = []
    for m in re.finditer(r"ords\.define_template\s*\((.*?)\);", sql_text, flags=re.IGNORECASE | re.DOTALL):
        block = m.group(1)
        module = first_param(block, "p_module_name")
        pattern = first_param(block, "p_pattern")
        templates.append((module, pattern))

    for m in re.finditer(r"ords\.define_handler\s*\((.*?)\);", sql_text, flags=re.IGNORECASE | re.DOTALL):
        block = m.group(1)
        module = first_param(block, "p_module_name")
        pattern = first_param(block, "p_pattern")
        method = first_param(block, "p_method") or "GET"
        source = first_param(block, "p_source")
        base = modules.get(module, "")
        path = "/".join(x.strip("/") for x in [base, pattern] if x)
        endpoints.append(ApiEndpoint(method=method.upper(), path="/" + path if path and not path.startswith("/") else path, source=source, module=module))

    # APEX/ORDS export style blocks, best effort.
    for api_name in ["create_restful_module", "create_restful_template", "create_restful_handler"]:
        for block in extract_blocks(sql_text, api_name):
            method = first_param(block, "p_method") or first_param(block, "p_http_method") or "GET"
            path = first_param(block, "p_uri_template") or first_param(block, "p_base_path") or first_param(block, "p_pattern") or first_param(block, "p_template")
            source = first_param(block, "p_source") or first_param(block, "p_source_clob")
            module = first_param(block, "p_module_name") or first_param(block, "p_name")
            if path or source or module:
                endpoints.append(ApiEndpoint(method=method.upper(), path=path or module, source=source, module=module))

    # Remove duplicates.
    seen = set()
    deduped: List[ApiEndpoint] = []
    for ep in endpoints:
        key = (ep.method.upper(), ep.path.lower(), ep.module.lower())
        if key in seen:
            continue
        seen.add(key)
        deduped.append(ep)
    return deduped


def extract_app_metadata(sql_text: str) -> Dict[str, Any]:
    app_id = regex_find(r"p_application_id\s*=>\s*'?([0-9]+)'?", sql_text, 5)
    app_name = regex_find(r"p_name\s*=>\s*'([^']+)'", sql_text, 20)
    alias = regex_find(r"p_application_alias\s*=>\s*'([^']+)'", sql_text, 5)
    return {
        "application_id": app_id[0] if app_id else "",
        "application_name_candidates": app_name[:10],
        "application_alias": alias[0] if alias else "",
    }


def build_metadata(sql_text: str, config: Dict[str, Any]) -> Dict[str, Any]:
    pages = extract_pages(sql_text)
    extract_page_components(sql_text, pages)
    pages.sort(key=lambda p: int(p.page_id) if p.page_id.isdigit() else 999999)
    lists, lovs = extract_lists_and_lovs(sql_text)
    metadata = {
        "generated_at_utc": now_utc_iso(),
        "source_sql_file": str(APEX_SQL_FILE),
        "source_sql_file_name": APEX_SQL_FILE.name,
        "app": extract_app_metadata(sql_text),
        "pages": [asdict(p) for p in pages],
        "database": extract_database(sql_text),
        "apis": [asdict(ep) for ep in extract_apis(sql_text)],
        "authentication_schemes": extract_authentication(sql_text),
        "authorization_schemes": extract_authorization(sql_text),
        "lists": lists,
        "lovs": lovs,
        "config_summary": {
            "purpose": config.get("application", {}).get("purpose", ""),
            "target_users": config.get("application", {}).get("target_users", []),
            "third_party_integrations": config.get("architecture", {}).get("third_party_integrations", []),
        },
    }
    return metadata

# =============================================================================
# Optional OCI polish, never used for technical extraction
# =============================================================================

def create_oci_client():
    if oci is None:
        raise RuntimeError("OCI SDK is not installed. Add 'oci' to requirements.txt.")
    if not COMPARTMENT_ID or not ENDPOINT or not CHAT_MODEL_ID:
        raise RuntimeError("OCI GenAI environment variables are incomplete.")
    if not CONFIG_FILE_PATH or not os.path.exists(CONFIG_FILE_PATH):
        raise RuntimeError(f"OCI config file not found: {CONFIG_FILE_PATH}")
    config = oci.config.from_file(CONFIG_FILE_PATH, CONFIG_PROFILE)
    return oci.generative_ai_inference.GenerativeAiInferenceClient(
        config=config,
        service_endpoint=ENDPOINT,
        retry_strategy=oci.retry.NoneRetryStrategy(),
        timeout=(10, 120),
    )


def call_oci_short(prompt: str, max_tokens: int = 700) -> str:
    client = create_oci_client()
    content = oci.generative_ai_inference.models.TextContent()
    content.text = prompt
    message = oci.generative_ai_inference.models.Message()
    message.role = "USER"
    message.content = [content]
    chat_request = oci.generative_ai_inference.models.GenericChatRequest()
    chat_request.api_format = oci.generative_ai_inference.models.BaseChatRequest.API_FORMAT_GENERIC
    chat_request.messages = [message]
    chat_request.max_tokens = max_tokens
    chat_request.temperature = 0.05
    chat_request.top_p = 0.7
    chat_detail = oci.generative_ai_inference.models.ChatDetails()
    chat_detail.serving_mode = oci.generative_ai_inference.models.OnDemandServingMode(model_id=CHAT_MODEL_ID)
    chat_detail.chat_request = chat_request
    chat_detail.compartment_id = COMPARTMENT_ID
    response = client.chat(chat_detail)
    data = response.data
    try:
        return data.chat_response.choices[0].message.content[0].text.strip()
    except Exception:
        pass
    try:
        return data.chat_response.text.strip()
    except Exception:
        pass
    return ""


def optional_summary(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    fallback = (
        "This documentation was generated from the deployed APEX SQL export. "
        "Technical sections are based on extracted pages, regions, items, processes, validations, APIs, database objects, and security schemes."
    )
    if not ENABLE_OCI_POLISH:
        return fallback
    try:
        slim = {
            "app": metadata.get("app", {}),
            "page_count": len(metadata.get("pages", [])),
            "table_count": len(metadata.get("database", {}).get("tables", [])),
            "api_count": len(metadata.get("apis", [])),
            "purpose": config.get("application", {}).get("purpose", ""),
            "business_problem": config.get("application", {}).get("business_problem", ""),
        }
        prompt = (
            "Write a concise 4-6 sentence executive summary for an Oracle APEX application. "
            "Use only the facts in this JSON. Do not invent pages, APIs, tables, or infrastructure. "
            "Return plain text only.\n\n" + json.dumps(slim, indent=2)
        )
        text = call_oci_short(prompt)
        return text if text and "```" not in text else fallback
    except Exception as exc:
        print(f"OCI polish skipped: {exc}")
        return fallback

# =============================================================================
# Architecture diagram artifacts
# =============================================================================

def build_mermaid(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    api_count = len(metadata.get("apis", []))
    table_count = len(metadata.get("database", {}).get("tables", []))
    process_count = sum(len(p.get("processes", [])) for p in metadata.get("pages", []))
    validation_count = sum(len(p.get("validations", [])) for p in metadata.get("pages", []))
    integrations = config.get("architecture", {}).get("third_party_integrations", []) or []
    has_auth = bool(metadata.get("authentication_schemes") or metadata.get("authorization_schemes"))

    lines = [
        "flowchart LR",
        "  U[End Users] -->|Browser / HTTPS| APEX[Oracle APEX Frontend]",
        f"  APEX -->|Page submit / AJAX| APP[APEX Runtime + PL/SQL Processes\\nProcesses: {process_count} | Validations: {validation_count}]",
        f"  APP -->|SQL / PL/SQL| DB[(Oracle Database\\nTables: {table_count})]",
    ]
    if has_auth:
        lines.append("  APEX -->|Authentication / Authorization| SEC[APEX Security Schemes]")
        lines.append("  SEC --> APP")
    if api_count:
        lines.append(f"  API[REST / ORDS APIs\\nEndpoints: {api_count}] --> APP")
        lines.append("  External[External API Consumers] -->|HTTPS| API")
    if integrations:
        for idx, name in enumerate(integrations[:8], start=1):
            safe = re.sub(r"[^A-Za-z0-9_]", "_", str(name))[:30] or f"Integration{idx}"
            label = str(name).replace('"', "'")[:60]
            lines.append(f"  APP -->|Integration| {safe}[{label}]")
    lines.append("  Jenkins[Jenkins CI/CD] -->|Deploys SQL export| APEX")
    lines.append("  Jenkins -->|Generates docs artifact| Docs[Documentation Artifacts]")
    return "\n".join(lines) + "\n"


def build_ascii_architecture(metadata: Dict[str, Any]) -> str:
    api_line = "External API Consumers -> REST/ORDS APIs -> " if metadata.get("apis") else ""
    return textwrap.dedent(f"""
    End Users
       |
       | Browser / HTTPS
       v
    Oracle APEX Frontend
       |
       | Page submit / AJAX / Dynamic actions
       v
    APEX Runtime + PL/SQL Processes + Validations
       |
       | SQL / PL/SQL
       v
    Oracle Database / APEX Parsing Schema

    {api_line}APEX Runtime
    Jenkins CI/CD -> Deploy SQL export -> APEX Workspace
    Jenkins CI/CD -> Generate documentation -> Jenkins Artifacts
    """).strip()


def build_svg_diagram(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    api_count = len(metadata.get("apis", []))
    table_count = len(metadata.get("database", {}).get("tables", []))
    page_count = len(metadata.get("pages", []))
    process_count = sum(len(p.get("processes", [])) for p in metadata.get("pages", []))
    has_api = api_count > 0
    integrations = config.get("architecture", {}).get("third_party_integrations", []) or []

    def rect(x: int, y: int, w: int, h: int, title: str, subtitle: str = "") -> str:
        title_e = html.escape(title)
        sub_e = html.escape(subtitle)
        subtitle_svg = f'<text x="{x + w/2}" y="{y + 58}" text-anchor="middle" font-family="Arial" font-size="13">{sub_e}</text>' if subtitle else ""
        return f'''
        <rect x="{x}" y="{y}" width="{w}" height="{h}" rx="14" ry="14" fill="#ffffff" stroke="#444" stroke-width="2"/>
        <text x="{x + w/2}" y="{y + 34}" text-anchor="middle" font-family="Arial" font-size="16" font-weight="bold">{title_e}</text>
        {subtitle_svg}
        '''

    def arrow(x1: int, y1: int, x2: int, y2: int, label: str = "") -> str:
        label_svg = ""
        if label:
            label_svg = f'<text x="{(x1+x2)/2}" y="{(y1+y2)/2 - 8}" text-anchor="middle" font-family="Arial" font-size="12">{html.escape(label)}</text>'
        return f'''
        <line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="#333" stroke-width="2" marker-end="url(#arrow)"/>
        {label_svg}
        '''

    parts = [f'''<svg xmlns="http://www.w3.org/2000/svg" width="1100" height="620" viewBox="0 0 1100 620">
      <defs>
        <marker id="arrow" markerWidth="10" markerHeight="10" refX="8" refY="3" orient="auto" markerUnits="strokeWidth">
          <path d="M0,0 L0,6 L9,3 z" fill="#333" />
        </marker>
      </defs>
      <rect x="0" y="0" width="1100" height="620" fill="#f8f8f8"/>
      <text x="550" y="36" text-anchor="middle" font-family="Arial" font-size="22" font-weight="bold">System Architecture</text>
    ''']
    parts.append(rect(70, 90, 190, 90, "End Users", "Browser / HTTPS"))
    parts.append(rect(330, 90, 220, 90, "Oracle APEX UI", f"Pages: {page_count}"))
    parts.append(rect(620, 90, 250, 90, "APEX Runtime", f"Processes: {process_count}"))
    parts.append(rect(620, 270, 250, 90, "Oracle Database", f"Tables: {table_count}"))
    parts.append(rect(70, 430, 220, 90, "Jenkins CI/CD", "Deployment branch"))
    parts.append(rect(380, 430, 250, 90, "Documentation", "MD / TXT / ZIP artifacts"))
    if has_api:
        parts.append(rect(70, 250, 220, 90, "REST / ORDS APIs", f"Endpoints: {api_count}"))
        parts.append(arrow(290, 295, 620, 135, "HTTPS"))
    if integrations:
        parts.append(rect(910, 90, 150, 90, "Integrations", f"Count: {len(integrations)}"))
        parts.append(arrow(870, 135, 910, 135, "Calls"))
    parts.append(arrow(260, 135, 330, 135, "HTTPS"))
    parts.append(arrow(550, 135, 620, 135, "Submit / AJAX"))
    parts.append(arrow(745, 180, 745, 270, "SQL / PL/SQL"))
    parts.append(arrow(180, 430, 430, 180, "Deploy SQL"))
    parts.append(arrow(290, 475, 380, 475, "Archive"))
    parts.append('</svg>')
    return "\n".join(parts)


def build_architecture_html() -> str:
    return """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>System Architecture Diagram</title>
  <script type="module">
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
    mermaid.initialize({ startOnLoad: true });
  </script>
</head>
<body>
  <h1>System Architecture Diagram</h1>
  <p>This HTML renders the Mermaid diagram generated from the APEX SQL export.</p>
  <pre class="mermaid">
%%MERMAID%%
  </pre>
</body>
</html>
""".replace("%%MERMAID%%", html.escape(ARCH_MMD_FILE.read_text(encoding="utf-8") if ARCH_MMD_FILE.exists() else ""))

# =============================================================================
# Documentation rendering
# =============================================================================

def infer_page_purpose(page: Dict[str, Any]) -> str:
    title = page.get("title") or f"Page {page.get('page_id', '')}"
    region_names = [r.get("name", "") for r in page.get("regions", []) if r.get("name")]
    process_names = [p.get("name", "") for p in page.get("processes", []) if p.get("name")]
    bits = []
    if region_names:
        bits.append("regions such as " + ", ".join(region_names[:4]))
    if process_names:
        bits.append("server-side processes such as " + ", ".join(process_names[:3]))
    suffix = " and ".join(bits)
    return f"The {title} page supports the application workflow" + (f" through {suffix}." if suffix else ".")


def component_comm_summary(page: Dict[str, Any]) -> str:
    has_process = bool(page.get("processes"))
    has_da = bool(page.get("dynamic_actions"))
    has_region_sql = any(source_tables_from_text(r.get("source", "")) for r in page.get("regions", []))
    parts = ["The browser renders APEX regions and page items."]
    if has_da:
        parts.append("Dynamic actions handle client-side events and may trigger AJAX behavior.")
    if has_process:
        parts.append("Page submissions invoke APEX page processes and validations in the backend.")
    if has_region_sql:
        parts.append("Region SQL sources communicate with Oracle Database objects to read application data.")
    return " ".join(parts)


def tables_used_by_page(page: Dict[str, Any]) -> List[str]:
    vals: List[str] = []
    for group in ["regions", "processes", "items"]:
        for obj in page.get(group, []):
            vals.extend(source_tables_from_text(obj.get("source", "")))
    return unique(vals, limit=50)


def render_page_section(page: Dict[str, Any], config: Dict[str, Any], metadata: Dict[str, Any]) -> str:
    page_id = page.get("page_id", "")
    title = page.get("title") or f"Page {page_id}"
    header = f"### Page {page_id}: {title}" if page_id else f"### {title}"
    screenshot_note = "Screenshot placeholder: capture this page from the deployed APEX workspace and attach it here." if config.get("user_guide", {}).get("include_screenshot_placeholders", True) else "Screenshot placeholder disabled in documentation_config.json."

    item_rows = [[i.get("name"), i.get("label"), i.get("display_as"), i.get("required"), i.get("source_type"), i.get("lov")] for i in page.get("items", [])]
    button_rows = [[b.get("name"), b.get("label"), b.get("action"), b.get("target")] for b in page.get("buttons", [])]
    region_rows = [[r.get("name"), r.get("source_type"), r.get("region_type"), truncate_code(r.get("source", ""), 300)] for r in page.get("regions", [])]
    validation_rows = [[v.get("name"), v.get("validation_type"), v.get("item"), v.get("error_message"), v.get("condition")] for v in page.get("validations", [])]
    process_rows = [[p.get("name"), p.get("process_type"), p.get("point"), truncate_code(p.get("source", ""), 300)] for p in page.get("processes", [])]
    da_rows = [[d.get("name"), d.get("event"), d.get("when_element"), d.get("condition")] for d in page.get("dynamic_actions", [])]
    tables = tables_used_by_page(page)

    nav_steps = []
    if page.get("alias"):
        nav_steps.append(f"Open the page using alias `{page.get('alias')}` or through the application navigation menu.")
    else:
        nav_steps.append("Open the page through the application navigation menu or direct APEX page URL.")
    for r in page.get("regions", [])[:4]:
        nav_steps.append(f"Review the `{r.get('name')}` region.")
    for i in page.get("items", [])[:6]:
        label = i.get("label") or i.get("name")
        nav_steps.append(f"Enter or review `{label}`.")
    for b in page.get("buttons", [])[:4]:
        nav_steps.append(f"Use the `{b.get('name')}` button when the workflow requires it.")

    return f"""
{header}

#### Page Overview
- **Purpose:** {infer_page_purpose(page)}
- **Alias:** {page.get('alias') or 'Not found in SQL export.'}
- **Page mode:** {page.get('page_mode') or 'Not found in SQL export.'}
- **Authentication setting:** {page.get('auth_required') or 'Not found in SQL export.'}
- **Protection level:** {page.get('protection_level') or 'Not found in SQL export.'}

#### Page Architecture and Internal Communication
{component_comm_summary(page)}

- **Frontend components:** {len(page.get('regions', []))} regions, {len(page.get('items', []))} page items, {len(page.get('buttons', []))} buttons.
- **Backend components:** {len(page.get('processes', []))} page processes and {len(page.get('validations', []))} validations.
- **Database objects referenced by this page:** {', '.join(tables) if tables else 'Not found from SQL sources on this page.'}

#### User Guide for This Page
{screenshot_note}

{chr(10).join(f'{idx + 1}. {step}' for idx, step in enumerate(nav_steps))}

#### UI Components

**Regions**

{md_table(['Region', 'Source type', 'Display point/type', 'Source excerpt'], region_rows)}

**Page Items**

{md_table(['Item', 'Label', 'Display type', 'Required', 'Source type', 'LOV'], item_rows)}

**Buttons / Actions**

{md_table(['Button', 'Label/static id', 'Action', 'Target / validation flag'], button_rows)}

#### Backend Logic

**Processes**

{md_table(['Process', 'Type', 'Execution point', 'Source excerpt'], process_rows)}

**Validations**

{md_table(['Validation', 'Type', 'Associated item', 'Error message', 'Condition'], validation_rows)}

**Dynamic Actions**

{md_table(['Dynamic action', 'Event', 'Triggering element', 'Condition'], da_rows)}

#### Page-Level Security Notes
- Confirm this page is protected by the expected authentication and authorization scheme before production use.
- Confirm sensitive buttons and processes cannot be invoked directly without authorization.
- Validate all item input on the server side, especially items marked as required or used in SQL/PLSQL processes.

#### Page Troubleshooting
- If the page fails to load, check APEX runtime errors, page authorization, and referenced SQL sources.
- If save/submit fails, review validations and page process errors listed above.
- If data does not appear, verify the database tables/views referenced by the page regions and processes.
""".strip()


def render_api_docs(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    endpoints = metadata.get("apis", [])
    api_config = config.get("api", {})
    exposes = api_config.get("exposes_apis", "auto")
    if exposes == "no" or (exposes == "auto" and not endpoints and not config.get("manual_api_examples")):
        return """
## 6. API Documentation

No REST/ORDS API endpoints were detected in the provided APEX SQL export.

If the application exposes APIs outside the APEX export, maintain the endpoint list in `documentation/documentation_config.json` under `manual_api_examples`.

### API Checklist
- **Endpoints:** Not found in SQL export.
- **Request/response examples:** Not found in SQL export.
- **Authentication:** Not found in SQL export; update manually if external APIs exist.
- **Error codes:** Use standard HTTP and application-specific errors if APIs are later added.
- **Rate limits:** Not found in SQL export; define based on ORDS/API gateway/service configuration.
""".strip()

    rows = [[ep.get("method"), ep.get("path"), ep.get("module"), truncate_code(ep.get("source", ""), 250)] for ep in endpoints]
    examples = []
    base = api_config.get("base_url", "").rstrip("/")
    for ep in endpoints[:20]:
        method = ep.get("method", "GET") or "GET"
        path = ep.get("path", "/") or "/"
        url = f"{base}{path}" if base else path
        body = "" if method.upper() in {"GET", "DELETE"} else "\nContent-Type: application/json\n\n{\n  \"exampleField\": \"exampleValue\"\n}"
        examples.append(f"""
#### `{method.upper()} {path}`

**Request example**

```http
{method.upper()} {url} HTTP/1.1
Authorization: Bearer <token>{body}
```

**Success response example**

```json
{{
  "status": "success",
  "data": {{}}
}}
```

**Error response example**

```json
{{
  "status": "error",
  "message": "Request could not be processed"
}}
```
""".strip())

    manual = config.get("manual_api_examples", []) or []
    manual_text = ""
    if manual:
        manual_text = "\n\n### Manually Configured API Notes\n" + text_list([json.dumps(x, ensure_ascii=False) for x in manual], limit=50)

    return f"""
## 6. API Documentation

### API Summary

{md_table(['Method', 'Endpoint/path', 'Module', 'Source excerpt'], rows)}

### Authentication
{api_config.get('authentication') or 'Update authentication details in documentation_config.json.'}

### Rate Limits
{api_config.get('rate_limits') or 'Not defined in SQL export.'}

### Error Codes
{text_list(api_config.get('error_codes', []), none_text='No API error codes configured.')}

### Request / Response Examples

{chr(10).join(examples) if examples else 'No endpoint examples could be generated.'}
{manual_text}
""".strip()


def render_database_docs(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    db = metadata.get("database", {})
    tables = db.get("tables", [])
    overview_rows = [[t.get("name"), len(t.get("columns", [])), len(t.get("constraints", [])), len(t.get("indexes", []))] for t in tables]

    table_sections = []
    for t in tables:
        col_rows = [[c.get("column"), c.get("definition"), c.get("nullable")] for c in t.get("columns", [])]
        table_sections.append(f"""
### Table `{t.get('name')}`

**Data Dictionary**

{md_table(['Column', 'Definition', 'Nullable'], col_rows)}

**Constraints**
{text_list(t.get('constraints', []), none_text='No constraints found for this table.')}

**Indexes**
{text_list(t.get('indexes', []), none_text='No indexes found for this table.')}
""".strip())

    relationship_rows = [[r.get("constraint"), r.get("columns"), r.get("references_table"), r.get("references_columns")] for r in db.get("relationships", [])]
    object_lines = []
    for key, label in [("views", "Views"), ("sequences", "Sequences"), ("triggers", "Triggers"), ("packages", "Packages"), ("procedures", "Procedures"), ("functions", "Functions")]:
        vals = db.get(key, [])
        object_lines.append(f"### {label}\n{text_list(vals, none_text=f'No {label.lower()} found in SQL export.')}")

    manual_notes = config.get("manual_database_notes", []) or []
    manual_text = "\n\n### Manual Database Notes\n" + text_list(manual_notes, limit=100) if manual_notes else ""

    er_note = "The relationship table below is the ER diagram source. The generated architecture diagram is included separately as SVG/Mermaid."

    return f"""
## 7. Database Documentation

### Database Overview

{md_table(['Table', 'Columns', 'Constraints', 'Indexes'], overview_rows)}

### ER Diagram / Relationships
{er_note}

{md_table(['Constraint', 'Local columns', 'References table', 'References columns'], relationship_rows)}

### Tables and Data Dictionary

{chr(10).join(table_sections) if table_sections else 'No CREATE TABLE statements were found in the SQL export. If tables are managed outside the APEX export, document them in documentation_config.json.'}

### Stored Procedures, Packages, Triggers, and Supporting Objects

{chr(10).join(object_lines)}

### Indexing Strategy
- Indexes extracted from the SQL export are listed under each table and in the overview above.
- Review query-heavy APEX regions and page processes to ensure filtering, joins, and lookup columns are indexed.
- Review foreign key columns for indexing when they participate in joins or cascading operations.
{manual_text}
""".strip()


def render_security_docs(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    sec = config.get("security", {})
    auth_rows = [[a.get("name"), a.get("type"), a.get("invalid_session")] for a in metadata.get("authentication_schemes", [])]
    authz_rows = [[a.get("name"), a.get("scheme_type"), a.get("error_message"), a.get("condition")] for a in metadata.get("authorization_schemes", [])]
    manual_notes = config.get("manual_security_notes", []) or []
    roles = sec.get("authorization_roles", []) or []

    return f"""
## 8. Security Documentation

### Authentication Method

Configured description: {sec.get('authentication_method') or 'Update in documentation_config.json.'}

{md_table(['Scheme', 'Type', 'Invalid session behavior'], auth_rows)}

### Authorization Roles and Schemes

Configured roles:
{text_list(roles, none_text='No manual roles configured in documentation_config.json.')}

Extracted APEX authorization schemes:

{md_table(['Scheme', 'Type', 'Error message', 'Caching/condition'], authz_rows)}

### Encryption Details
{sec.get('encryption_details') or 'Update encryption details in documentation_config.json.'}

### Audit Logging
{sec.get('audit_logging') or 'Update audit logging details in documentation_config.json.'}

### Security Best Practices
{text_list(sec.get('best_practices', []), none_text='No security best practices configured.')}

### Manual Security Notes
{text_list(manual_notes, none_text='No manual security notes configured.')}
""".strip()


def render_user_guide(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    pages = metadata.get("pages", [])
    page_rows = [[p.get("page_id"), p.get("title"), p.get("alias"), len(p.get("items", [])), len(p.get("buttons", [])), len(p.get("regions", []))] for p in pages]
    faq = config.get("user_guide", {}).get("faq", []) or []
    troubleshooting = config.get("user_guide", {}).get("troubleshooting", []) or []
    faq_text = "\n".join(f"**Q: {f.get('question', '')}**\n\nA: {f.get('answer', '')}" for f in faq)
    return f"""
## 5. User Guide

### Navigation Overview

{md_table(['Page ID', 'Page title', 'Alias', 'Items', 'Buttons', 'Regions'], page_rows)}

### General Workflow
1. Open the deployed APEX application URL.
2. Sign in using an authorized account.
3. Navigate to the required page from the application menu or direct page link.
4. Complete required fields and review validation messages.
5. Submit or save using the available page buttons.
6. Confirm success notifications or review displayed errors.

### Screenshots
Screenshot placeholders are included in each page section. For final user-facing documentation, capture screenshots from the deployed workspace and add them near the relevant page workflow.

### FAQs
{faq_text if faq_text else 'No FAQs configured.'}

### Troubleshooting Tips
{text_list(troubleshooting, none_text='No troubleshooting tips configured.')}
""".strip()


def render_document(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    app = metadata.get("app", {})
    app_cfg = config.get("application", {})
    arch_cfg = config.get("architecture", {})
    pages = metadata.get("pages", [])
    app_name = app_cfg.get("name") or (app.get("application_name_candidates") or ["Oracle APEX Application"])[0]
    summary = optional_summary(metadata, config)
    mermaid = build_mermaid(metadata, config)
    ascii_arch = build_ascii_architecture(metadata)

    overview = f"""
# {app_name} - Application Documentation

Generated at UTC: `{metadata.get('generated_at_utc')}`  
Source SQL file: `{metadata.get('source_sql_file_name')}`  
Application ID: `{app.get('application_id') or 'Not found in SQL export.'}`  
Application alias: `{app.get('application_alias') or 'Not found in SQL export.'}`

## 1. Overview / Introduction

### Purpose of the Application
{app_cfg.get('purpose')}

### Business Problem It Solves
{app_cfg.get('business_problem')}

### Target Users
{text_list(app_cfg.get('target_users', []), none_text='No target users configured.')}

### Key Features
{text_list(app_cfg.get('key_features', []), none_text='Key features were not configured manually. Page-level features are documented below from the SQL export.')}

### Scope
{app_cfg.get('scope')}

### Limitations
{text_list(app_cfg.get('limitations', []), none_text='No limitations configured.')}

### Generated Summary
{summary}

### Extracted Application Inventory
- Pages: {len(pages)}
- Tables: {len(metadata.get('database', {}).get('tables', []))}
- REST/ORDS API endpoints: {len(metadata.get('apis', []))}
- Authentication schemes: {len(metadata.get('authentication_schemes', []))}
- Authorization schemes: {len(metadata.get('authorization_schemes', []))}
- Lists: {len(metadata.get('lists', []))}
- LOVs: {len(metadata.get('lovs', []))}
""".strip()

    architecture = f"""
## 2. System Architecture

### High-Level Architecture Diagram

The repository generates a real SVG diagram artifact without relying on OCI GenAI image output:

- `documentation/generated/architecture_diagram.svg`
- `documentation/generated/architecture_diagram.mmd`
- `documentation/generated/architecture_diagram.html`

Markdown renderers that support Mermaid can render this directly:

```mermaid
{mermaid.strip()}
```

Plain-text fallback diagram:

```text
{ascii_arch}
```

### Components / Services
- **Frontend:** {arch_cfg.get('frontend')}
- **Backend:** {arch_cfg.get('backend')}
- **Database:** {arch_cfg.get('database')}
- **Cloud / Infrastructure:** {arch_cfg.get('cloud_infrastructure')}
- **Third-party integrations:** {', '.join(map(str, arch_cfg.get('third_party_integrations', []) or [])) or 'Not configured.'}

### How the System Works Internally
Users access the Oracle APEX frontend through a browser. APEX renders pages, regions, forms, reports, and navigation based on metadata in the SQL export. User actions invoke page validations, dynamic actions, AJAX calls, and page processes. Backend logic executes SQL/PLSQL against the Oracle Database and returns rendered pages, notifications, or API responses.

### How Components Communicate
- Browser to APEX: HTTPS page requests, form submissions, and AJAX calls.
- APEX UI to APEX runtime: page metadata, validations, dynamic actions, and process execution.
- APEX runtime to database: SQL and PL/SQL from regions, items, validations, LOVs, and page processes.
- CI/CD to APEX: Jenkins deploys the SQL export to the configured workspace/schema/application ID.
- CI/CD to documentation artifacts: Jenkins runs this script and archives generated Markdown, TXT, metadata JSON, SVG, Mermaid, HTML, and ZIP files.
""".strip()

    page_sections = "\n\n".join(render_page_section(p, config, metadata) for p in pages) if pages else "No pages were detected in the SQL export."

    page_doc = f"""
## 3. Page-by-Page Documentation

This section documents every detected APEX page in a single combined documentation file. Each page includes overview, architecture/communication, user guide, UI components, backend logic, security notes, and troubleshooting.

{page_sections}
""".strip()

    support_components = f"""
## 4. Shared Application Components

### Lists
{md_table(['List', 'Status'], [[x.get('name'), x.get('status')] for x in metadata.get('lists', [])])}

### List of Values / LOVs
{md_table(['LOV', 'Query/source excerpt'], [[x.get('name'), truncate_code(x.get('query', ''), 250)] for x in metadata.get('lovs', [])])}
""".strip()

    pieces = [
        overview,
        architecture,
        page_doc,
        support_components,
        render_user_guide(metadata, config),
        render_api_docs(metadata, config),
        render_database_docs(metadata, config),
        render_security_docs(metadata, config),
    ]
    return "\n\n".join(p.strip() for p in pieces if p and p.strip()) + "\n"


def markdown_to_txt(markdown: str) -> str:
    text = markdown
    text = re.sub(r"```mermaid\n(.*?)\n```", lambda m: "[Mermaid diagram]\n" + m.group(1), text, flags=re.DOTALL)
    text = re.sub(r"```(?:\w+)?\n(.*?)\n```", lambda m: m.group(1), text, flags=re.DOTALL)
    text = re.sub(r"^#{1,6}\s*", "", text, flags=re.MULTILINE)
    text = re.sub(r"\*\*(.*?)\*\*", r"\1", text)
    text = re.sub(r"`([^`]*)`", r"\1", text)
    # Convert markdown table pipes into readable spacing enough for TXT artifacts.
    return text.strip() + "\n"

# =============================================================================
# Write outputs
# =============================================================================

def write_outputs(metadata: Dict[str, Any], config: Dict[str, Any]) -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    mermaid = build_mermaid(metadata, config)
    ARCH_MMD_FILE.write_text(mermaid, encoding="utf-8")
    ARCH_SVG_FILE.write_text(build_svg_diagram(metadata, config), encoding="utf-8")
    ARCH_HTML_FILE.write_text(build_architecture_html(), encoding="utf-8")

    md = render_document(metadata, config)
    DOC_MD_FILE.write_text(md, encoding="utf-8")
    DOC_TXT_FILE.write_text(markdown_to_txt(md), encoding="utf-8")
    METADATA_JSON_FILE.write_text(json.dumps(metadata, indent=2, ensure_ascii=False), encoding="utf-8")

    with zipfile.ZipFile(DOC_ZIP_FILE, "w", zipfile.ZIP_DEFLATED) as zf:
        for path in [DOC_MD_FILE, DOC_TXT_FILE, METADATA_JSON_FILE, ARCH_MMD_FILE, ARCH_SVG_FILE, ARCH_HTML_FILE]:
            if path.exists():
                zf.write(path, arcname=path.name)


def validate_outputs() -> None:
    required = [DOC_MD_FILE, DOC_TXT_FILE, METADATA_JSON_FILE, ARCH_MMD_FILE, ARCH_SVG_FILE, ARCH_HTML_FILE, DOC_ZIP_FILE]
    for path in required:
        if not path.exists() or path.stat().st_size == 0:
            raise RuntimeError(f"Expected documentation artifact was not created: {path}")
    md = DOC_MD_FILE.read_text(encoding="utf-8", errors="ignore")
    required_sections = [
        "## 1. Overview / Introduction",
        "## 2. System Architecture",
        "## 3. Page-by-Page Documentation",
        "## 5. User Guide",
        "## 6. API Documentation",
        "## 7. Database Documentation",
        "## 8. Security Documentation",
    ]
    missing = [s for s in required_sections if s not in md]
    if missing:
        raise RuntimeError(f"Documentation is missing required sections: {missing}")

# =============================================================================
# Main
# =============================================================================

def main() -> None:
    try:
        print("Oracle APEX deployment documentation generator")
        print("------------------------------------------------")
        print(f"SQL file: {APEX_SQL_FILE}")
        print(f"Config file: {DOC_CONFIG_FILE}")
        print(f"Output dir: {OUTPUT_DIR}")

        sql_text = normalize_sql(read_text_file(APEX_SQL_FILE, required=True))
        config = load_or_create_doc_config()
        metadata = build_metadata(sql_text, config)

        print(f"Detected pages: {len(metadata.get('pages', []))}")
        print(f"Detected tables: {len(metadata.get('database', {}).get('tables', []))}")
        print(f"Detected APIs: {len(metadata.get('apis', []))}")
        print(f"Detected authentication schemes: {len(metadata.get('authentication_schemes', []))}")
        print(f"Detected authorization schemes: {len(metadata.get('authorization_schemes', []))}")

        write_outputs(metadata, config)
        validate_outputs()

        print("\nDocumentation generated successfully.")
        print(f"Markdown: {DOC_MD_FILE}")
        print(f"Text:     {DOC_TXT_FILE}")
        print(f"SVG:      {ARCH_SVG_FILE}")
        print(f"Mermaid:  {ARCH_MMD_FILE}")
        print(f"HTML:     {ARCH_HTML_FILE}")
        print(f"Metadata: {METADATA_JSON_FILE}")
        print(f"ZIP:      {DOC_ZIP_FILE}")

    except Exception as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
