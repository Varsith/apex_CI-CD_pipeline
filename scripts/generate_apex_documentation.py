# coding: utf-8
"""
Oracle APEX SQL to Documentation Generator - SQL-first CI/CD edition

Place this file at: scripts/generate_apex_documentation.py
Run from Jenkins after deployment branch deployment.

Generated artifacts:
- documentation/generated/application_documentation.md
- documentation/generated/application_documentation.txt
- documentation/generated/apex_metadata.json
- documentation/generated/architecture_diagram.svg
- documentation/generated/architecture_diagram.html
- documentation/generated/architecture_diagram.mmd
- documentation/generated/application_documentation_bundle.zip

Important design choices:
- Technical content is extracted from the exact APEX SQL export.
- Documentation is one combined .md/.txt file with all pages inside it.
- Architecture diagram is generated locally as SVG/HTML. It does not depend on OCI GenAI image output or Mermaid rendering.
- Mermaid .mmd is also generated as a secondary artifact using safe syntax.
"""

from __future__ import annotations

import html
import json
import os
import re
import sys
import zipfile
from dataclasses import dataclass, asdict, field
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

ROOT_DIR = Path(__file__).resolve().parents[1]
APEX_SQL_FILE = Path(os.getenv("APEX_SQL_FILE", str(ROOT_DIR / "apex" / "f100.sql")))
DOC_CONFIG_FILE = Path(os.getenv("DOC_CONFIG_FILE", str(ROOT_DIR / "documentation" / "documentation_config.json")))
OUTPUT_DIR = Path(os.getenv("DOC_OUTPUT_DIR", str(ROOT_DIR / "documentation" / "generated")))

DOC_MD_FILE = OUTPUT_DIR / "application_documentation.md"
DOC_TXT_FILE = OUTPUT_DIR / "application_documentation.txt"
METADATA_JSON_FILE = OUTPUT_DIR / "apex_metadata.json"
ARCH_SVG_FILE = OUTPUT_DIR / "architecture_diagram.svg"
ARCH_HTML_FILE = OUTPUT_DIR / "architecture_diagram.html"
ARCH_MMD_FILE = OUTPUT_DIR / "architecture_diagram.mmd"
DOC_ZIP_FILE = OUTPUT_DIR / "application_documentation_bundle.zip"

MAX_ROWS = int(os.getenv("DOC_MAX_ROWS", "500"))
MAX_SOURCE_CHARS = int(os.getenv("DOC_MAX_SOURCE_CHARS", "1200"))

DEFAULT_DOC_CONFIG: Dict[str, Any] = {
    "application": {
        "purpose": "Oracle APEX application generated from the deployment SQL export.",
        "business_problem": "Update this in documentation_config.json with the business problem solved by the application.",
        "target_users": ["End users", "Application administrators"],
        "key_features": [],
        "scope": "Documentation generated from the APEX SQL file deployed by the deployment branch.",
        "limitations": [
            "Only metadata present in the APEX SQL export can be extracted automatically.",
            "Business descriptions, screenshots, non-exported database objects, external contracts, and cloud topology should be maintained in documentation_config.json."
        ]
    },
    "architecture": {
        "frontend": "Oracle APEX web user interface",
        "backend": "Oracle APEX runtime, page processes, validations, dynamic actions, SQL, and PL/SQL",
        "database": "Oracle Database / APEX parsing schema",
        "cloud_infrastructure": "Oracle Cloud Infrastructure / ORDS / APEX runtime environment",
        "third_party_integrations": []
    },
    "api": {
        "authentication": "Environment-specific authentication. Update when REST APIs are exposed.",
        "rate_limits": "Not defined in SQL export. Update if ORDS/API gateway/service-level limits are configured.",
        "error_codes": ["400 Bad Request", "401 Unauthorized", "403 Forbidden", "404 Not Found", "429 Too Many Requests", "500 Internal Server Error"]
    },
    "security": {
        "authentication_method": "Use extracted APEX authentication scheme when present, otherwise update manually.",
        "authorization_roles": [],
        "encryption_details": "Use HTTPS/TLS in transit. Database encryption depends on Oracle Database/OCI configuration.",
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
            {"question": "What should I do if I see an error?", "answer": "Capture the page name, timestamp, screenshot, and steps taken, then contact the application administrator."}
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

@dataclass
class Region:
    name: str
    display_point: str = ""
    source_type: str = ""
    source: str = ""
    template: str = ""

@dataclass
class PageItem:
    name: str
    prompt: str = ""
    display_as: str = ""
    required: str = ""
    source_type: str = ""
    source: str = ""
    default: str = ""
    lov: str = ""
    max_length: str = ""
    placeholder: str = ""
    condition: str = ""

@dataclass
class Button:
    name: str
    label: str = ""
    action: str = ""
    position: str = ""
    target: str = ""
    execute_validations: str = ""

@dataclass
class Process:
    name: str
    process_type: str = ""
    point: str = ""
    source: str = ""
    error_location: str = ""
    condition: str = ""
    when_button: str = ""

@dataclass
class Validation:
    name: str
    validation_type: str = ""
    associated_item: str = ""
    error_message: str = ""
    condition: str = ""
    when_button: str = ""

@dataclass
class DynamicAction:
    name: str
    event: str = ""
    triggering_element: str = ""
    condition: str = ""

@dataclass
class Page:
    page_id: str
    name: str = ""
    alias: str = ""
    title: str = ""
    page_mode: str = ""
    public: str = ""
    protection_level: str = ""
    auth_scheme: str = ""
    regions: List[Region] = field(default_factory=list)
    items: List[PageItem] = field(default_factory=list)
    buttons: List[Button] = field(default_factory=list)
    processes: List[Process] = field(default_factory=list)
    validations: List[Validation] = field(default_factory=list)
    dynamic_actions: List[DynamicAction] = field(default_factory=list)

# -----------------------------------------------------------------------------
# Utility helpers
# -----------------------------------------------------------------------------

def read_text(path: Path, required: bool = True) -> str:
    if not path.exists():
        if required:
            raise FileNotFoundError(f"File not found: {path}")
        return ""
    return path.read_text(encoding="utf-8", errors="ignore")


def clean(value: Any, max_len: int = 1000) -> str:
    if value is None:
        return ""
    s = str(value)
    s = s.replace("''", "'")
    s = re.sub(r"\s+", " ", s).strip()
    if len(s) > max_len:
        return s[:max_len].rstrip() + " ..."
    return s


def unique(values: List[str], limit: int = MAX_ROWS) -> List[str]:
    out: List[str] = []
    seen = set()
    for value in values:
        v = clean(value, max_len=1200)
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
    return deep_merge(DEFAULT_DOC_CONFIG, json.loads(read_text(DOC_CONFIG_FILE)))


def parse_export_header(sql: str) -> Dict[str, str]:
    info: Dict[str, str] = {}
    m = re.search(r"prompt\s+APPLICATION\s+(\d+)\s+-\s+(.+)", sql, flags=re.IGNORECASE)
    if m:
        info["application_id"] = m.group(1).strip()
        info["application_name"] = clean(m.group(2), 200)
    patterns = {
        "application_id": r"Application:\s*(\d+)",
        "application_name": r"Name:\s*(.+)",
        "exported_at": r"Date and Time:\s*(.+)",
        "exported_by": r"Exported By:\s*(.+)",
        "version": r"Version:\s*(.+)",
        "workspace_id": r"p_default_workspace_id\s*=>\s*(\d+)",
        "default_owner": r"p_default_owner\s*=>\s*'([^']+)'",
        "alias": r"p_alias\s*=>\s*nvl\([^,]+,'([^']+)'\)",
    }
    for k, pat in patterns.items():
        m = re.search(pat, sql, flags=re.IGNORECASE)
        if m and not info.get(k):
            info[k] = clean(m.group(1), 250)
    return info


def find_calls(sql: str) -> List[Tuple[str, str, str]]:
    """Return (api_name, args_text, page_context) for wwv_flow_* create calls.

    Handles both old and new exports:
    - wwv_flow_api.create_page(...)
    - wwv_flow_imp_page.create_page(...)
    - wwv_flow_imp_shared.create_list(...)

    Also tracks the active prompt --application/pages/page_00001 section so page
    components without p_page_id still attach to the correct page.
    """
    call_re = re.compile(r"wwv_flow_(?:api|imp|imp_page|imp_shared)\.([a-zA-Z0-9_]+)\s*\(", re.IGNORECASE)
    prompt_re = re.compile(r"prompt\s+--application/pages/page_(\d+)", re.IGNORECASE)
    events: List[Tuple[int, str, Optional[re.Match[str]]]] = []
    for m in call_re.finditer(sql):
        events.append((m.start(), "call", m))
    for m in prompt_re.finditer(sql):
        events.append((m.start(), "prompt", m))
    events.sort(key=lambda x: x[0])
    calls: List[Tuple[str, str, str]] = []
    current_page = ""
    for _, kind, match in events:
        if kind == "prompt":
            current_page = str(int(match.group(1))) if match and match.group(1).isdigit() else (match.group(1) if match else "")
            continue
        if not match:
            continue
        api_name = match.group(1)
        open_pos = sql.find("(", match.start())
        if open_pos < 0:
            continue
        depth = 0
        in_quote = False
        i = open_pos
        while i < len(sql):
            ch = sql[i]
            nxt = sql[i + 1] if i + 1 < len(sql) else ""
            if ch == "'":
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
                        calls.append((api_name.lower(), sql[open_pos + 1:i], current_page))
                        break
            i += 1
    return calls


def calls_by_name(calls: List[Tuple[str, str, str]], name: str) -> List[Tuple[str, str]]:
    return [(args, page_ctx) for api, args, page_ctx in calls if api.lower() == name.lower()]


def param(args: str, name: str, max_len: int = 1000) -> str:
    # Quoted values, q-quoted values, nvl(...,'value'), ids/numbers/constants, and wwv_flow_string.join content.
    n = re.escape(name)
    # Special handling for wwv_flow_string.join(wwv_flow_t_varchar2('line1','line2')) must run before constant matching.
    m = re.search(rf"{n}\s*=>\s*wwv_flow_string\.join\s*\(\s*wwv_flow_t_varchar2\s*\((.*?)\)\s*\)", args, flags=re.IGNORECASE | re.DOTALL)
    if m:
        parts = re.findall(r"'((?:''|[^'])*)'", m.group(1), flags=re.DOTALL)
        return clean("\n".join(p.replace("''", "'") for p in parts), max_len=max_len)
    patterns = [
        rf"{n}\s*=>\s*q'\[(.*?)\]'",
        rf"{n}\s*=>\s*q'\{{(.*?)\}}'",
        rf"{n}\s*=>\s*nvl\([^,]+,\s*'((?:''|[^'])*)'\)",
        rf"{n}\s*=>\s*'((?:''|[^'])*)'",
        rf"{n}\s*=>\s*wwv_flow_(?:api|imp)\.id\((\d+)\)",
        rf"{n}\s*=>\s*(\d+)",
        rf"{n}\s*=>\s*([A-Z][A-Z0-9_\.]+)",
    ]
    for pat in patterns:
        m = re.search(pat, args, flags=re.IGNORECASE | re.DOTALL)
        if m:
            return clean(m.group(1), max_len=max_len)
    return ""


def page_id_for(args: str, context: str) -> str:
    return param(args, "p_page_id") or param(args, "p_id") if "create_page" in args[:0] else param(args, "p_page_id") or context


def table(headers: List[str], rows: List[List[Any]], empty: str = "Not found in SQL export.") -> str:
    if not rows:
        return empty
    def esc(x: Any) -> str:
        s = clean(x, 600).replace("|", "\\|")
        return s if s else "-"
    out = ["| " + " | ".join(headers) + " |", "| " + " | ".join(["---"] * len(headers)) + " |"]
    for row in rows:
        out.append("| " + " | ".join(esc(c) for c in row) + " |")
    return "\n".join(out)


def bullets(values: List[str], empty: str = "Not found in SQL export.") -> str:
    vals = unique(values)
    return "\n".join(f"- {v}" for v in vals) if vals else f"- {empty}"

# -----------------------------------------------------------------------------
# Extraction
# -----------------------------------------------------------------------------

def extract_pages(sql: str, calls: List[Tuple[str, str, str]]) -> List[Page]:
    pages: Dict[str, Page] = {}
    for args, context in calls_by_name(calls, "create_page"):
        pid = param(args, "p_id") or param(args, "p_page_id") or context
        if not pid:
            continue
        pages[pid] = Page(
            page_id=pid,
            name=param(args, "p_name"),
            alias=param(args, "p_alias"),
            title=param(args, "p_step_title") or param(args, "p_page_title") or param(args, "p_name"),
            page_mode=param(args, "p_page_mode"),
            public=param(args, "p_page_is_public_y_n"),
            protection_level=param(args, "p_protection_level"),
            auth_scheme=param(args, "p_authentication"),
        )
    def ensure(pid: str) -> Page:
        if pid not in pages:
            pages[pid] = Page(page_id=pid, name=f"Page {pid}", title=f"Page {pid}")
        return pages[pid]

    for args, context in calls_by_name(calls, "create_page_plug"):
        pid = param(args, "p_page_id") or context
        if not pid:
            continue
        ensure(pid).regions.append(Region(
            name=param(args, "p_plug_name"),
            display_point=param(args, "p_plug_display_point"),
            source_type=param(args, "p_plug_source_type") or param(args, "p_plug_template"),
            source=param(args, "p_plug_source", MAX_SOURCE_CHARS),
            template=param(args, "p_plug_template"),
        ))

    for args, context in calls_by_name(calls, "create_page_item"):
        pid = param(args, "p_page_id") or context
        if not pid:
            continue
        ensure(pid).items.append(PageItem(
            name=param(args, "p_name"), prompt=param(args, "p_prompt"), display_as=param(args, "p_display_as"),
            required=param(args, "p_is_required"), source_type=param(args, "p_source_type"), source=param(args, "p_source", MAX_SOURCE_CHARS),
            default=param(args, "p_item_default"), lov=param(args, "p_named_lov") or param(args, "p_lov"),
            max_length=param(args, "p_cMaxlength") or param(args, "p_cmaxlength"), placeholder=param(args, "p_placeholder"),
            condition=param(args, "p_display_when") or param(args, "p_display_when_type"),
        ))

    for args, context in calls_by_name(calls, "create_page_button"):
        pid = param(args, "p_page_id") or context
        if not pid:
            continue
        ensure(pid).buttons.append(Button(
            name=param(args, "p_button_name"), label=param(args, "p_button_image_alt") or param(args, "p_button_name"),
            action=param(args, "p_button_action"), position=param(args, "p_button_position"),
            target=param(args, "p_button_redirect_url"), execute_validations=param(args, "p_button_execute_validations"),
        ))

    for args, context in calls_by_name(calls, "create_page_process"):
        pid = param(args, "p_page_id") or context
        if not pid:
            continue
        ensure(pid).processes.append(Process(
            name=param(args, "p_process_name"), process_type=param(args, "p_process_type"), point=param(args, "p_process_point"),
            source=param(args, "p_process_sql_clob", MAX_SOURCE_CHARS) or param(args, "p_process_source", MAX_SOURCE_CHARS) or param(args, "p_process", MAX_SOURCE_CHARS),
            error_location=param(args, "p_error_display_location"), condition=param(args, "p_process_when") or param(args, "p_process_condition"),
            when_button=param(args, "p_process_when_button_id"),
        ))

    for args, context in calls_by_name(calls, "create_page_validation"):
        pid = param(args, "p_page_id") or context
        if not pid:
            continue
        ensure(pid).validations.append(Validation(
            name=param(args, "p_validation_name"), validation_type=param(args, "p_validation_type"),
            associated_item=param(args, "p_associated_item"), error_message=param(args, "p_error_message"),
            condition=param(args, "p_validation_condition") or param(args, "p_validation_condition_type"), when_button=param(args, "p_when_button_pressed"),
        ))

    for api in ["create_page_da_event", "create_page_da_action"]:
        for args, context in calls_by_name(calls, api):
            pid = param(args, "p_page_id") or context
            if not pid:
                continue
            ensure(pid).dynamic_actions.append(DynamicAction(
                name=param(args, "p_name") or param(args, "p_event_name"),
                event=param(args, "p_bind_event_type") or param(args, "p_action"),
                triggering_element=param(args, "p_triggering_element") or param(args, "p_affected_elements"),
                condition=param(args, "p_client_condition_type") or param(args, "p_condition_element"),
            ))

    return sorted(pages.values(), key=lambda p: int(p.page_id) if p.page_id.isdigit() else 999999)


def extract_shared(sql: str, calls: List[Tuple[str, str, str]]) -> Dict[str, Any]:
    auth = []
    for name in ["create_authentication", "create_authentication_scheme"]:
        for args, _ in calls_by_name(calls, name):
            auth.append({"name": param(args, "p_name") or param(args, "p_scheme_name"), "type": param(args, "p_scheme_type"), "invalid_session": param(args, "p_invalid_session_type")})
    authz = []
    for name in ["create_authorization_scheme", "create_security_scheme"]:
        for args, _ in calls_by_name(calls, name):
            authz.append({"name": param(args, "p_name") or param(args, "p_scheme_name"), "type": param(args, "p_scheme_type") or param(args, "p_authorization_scheme"), "error": param(args, "p_error_message")})
    lists = []
    for args, _ in calls_by_name(calls, "create_list"):
        lists.append({"name": param(args, "p_name"), "status": param(args, "p_list_status")})
    list_items = []
    for args, _ in calls_by_name(calls, "create_list_item"):
        list_items.append({"text": param(args, "p_list_item_link_text"), "target": param(args, "p_list_item_link_target"), "icon": param(args, "p_list_item_icon"), "condition": param(args, "p_list_item_disp_cond_type")})
    lovs = []
    for name in ["create_list_of_values", "create_lov"]:
        for args, _ in calls_by_name(calls, name):
            lovs.append({"name": param(args, "p_lov_name") or param(args, "p_name"), "query": param(args, "p_lov_query", MAX_SOURCE_CHARS)})
    rest = []
    for name in ["create_rest_module", "create_rest_template", "create_rest_handler", "create_restful_service"]:
        for args, _ in calls_by_name(calls, name):
            rest.append({"type": name, "name": param(args, "p_name") or param(args, "p_uri_template") or param(args, "p_pattern"), "method": param(args, "p_method"), "source": param(args, "p_source", MAX_SOURCE_CHARS)})
    return {"authentication": auth, "authorization": authz, "lists": lists, "list_items": list_items, "lovs": lovs, "rest": rest}


def extract_database(sql: str) -> Dict[str, Any]:
    tables = []
    for m in re.finditer(r"create\s+table\s+([\w.$#]+)\s*\((.*?)\)\s*;", sql, flags=re.IGNORECASE | re.DOTALL):
        name = m.group(1).upper()
        body = m.group(2)
        cols = []
        for raw in body.splitlines():
            line = raw.strip().rstrip(',')
            if not line or line.startswith('--'):
                continue
            if re.match(r"(?i)constraint|primary\s+key|foreign\s+key|unique|check", line):
                continue
            cm = re.match(r"([\w#$]+)\s+([^,]+)", line)
            if cm:
                cols.append({"name": cm.group(1).upper(), "type": clean(cm.group(2), 200)})
        tables.append({"name": name, "columns": cols})
    indexes = [{"name": m.group(1).upper(), "table": m.group(2).upper(), "columns": clean(m.group(3), 500)} for m in re.finditer(r"create\s+(?:unique\s+)?index\s+([\w.$#]+)\s+on\s+([\w.$#]+)\s*\((.*?)\)", sql, flags=re.IGNORECASE | re.DOTALL)]
    fks = []
    fk_pat = r"constraint\s+([\w#$]+)\s+foreign\s+key\s*\((.*?)\)\s+references\s+([\w.$#]+)\s*\((.*?)\)"
    for m in re.finditer(fk_pat, sql, flags=re.IGNORECASE | re.DOTALL):
        fks.append({"name": m.group(1).upper(), "columns": clean(m.group(2)), "ref_table": m.group(3).upper(), "ref_columns": clean(m.group(4))})
    object_patterns = {
        "views": r"create\s+(?:or\s+replace\s+)?view\s+([\w.$#]+)",
        "sequences": r"create\s+sequence\s+([\w.$#]+)",
        "triggers": r"create\s+(?:or\s+replace\s+)?trigger\s+([\w.$#]+)",
        "packages": r"create\s+(?:or\s+replace\s+)?package(?:\s+body)?\s+([\w.$#]+)",
        "procedures": r"create\s+(?:or\s+replace\s+)?procedure\s+([\w.$#]+)",
        "functions": r"create\s+(?:or\s+replace\s+)?function\s+([\w.$#]+)",
    }
    objs = {k: unique([x.upper() for x in re.findall(p, sql, flags=re.IGNORECASE)]) for k, p in object_patterns.items()}
    referenced_tables = unique([x.upper() for x in re.findall(r"\b(?:from|join|into|update|delete\s+from|merge\s+into)\s+([A-Z][A-Z0-9_$#.]+)", sql, flags=re.IGNORECASE) if x.lower() not in {"dual", "select"}], 200)
    return {"tables": tables, "indexes": indexes, "foreign_keys": fks, "objects": objs, "referenced_tables": referenced_tables}

# -----------------------------------------------------------------------------
# Diagram generation - no Mermaid runtime dependency
# -----------------------------------------------------------------------------

def build_mermaid(metadata: Dict[str, Any]) -> str:
    # Safe Mermaid syntax: quoted labels and <br/> instead of raw newlines.
    pages = len(metadata["pages"])
    tables = len(metadata["database"]["tables"])
    processes = sum(len(p["processes"]) for p in metadata["pages"])
    validations = sum(len(p["validations"]) for p in metadata["pages"])
    return "\n".join([
        "flowchart LR",
        '  U["End Users"] -->|"Browser / HTTPS"| FE["Oracle APEX UI"]',
        f'  FE -->|"Page submit / AJAX"| RT["APEX Runtime<br/>Pages: {pages}<br/>Processes: {processes}<br/>Validations: {validations}"]',
        f'  RT -->|"SQL / PL/SQL"| DB[("Oracle Database<br/>Tables in export: {tables}")]',
        '  J["Jenkins CI/CD"] -->|"Deploy SQL export"| FE',
        '  J -->|"Generate docs artifacts"| D["Documentation Artifacts"]',
    ]) + "\n"


def build_svg(metadata: Dict[str, Any]) -> str:
    pages = len(metadata["pages"])
    tables = len(metadata["database"]["tables"])
    processes = sum(len(p["processes"]) for p in metadata["pages"])
    validations = sum(len(p["validations"]) for p in metadata["pages"])
    def box(x: int, y: int, w: int, h: int, title: str, lines: List[str]) -> str:
        text = [f'<text x="{x + 16}" y="{y + 28}" font-size="18" font-weight="700">{html.escape(title)}</text>']
        yy = y + 56
        for line in lines:
            text.append(f'<text x="{x + 16}" y="{yy}" font-size="13">{html.escape(line)}</text>')
            yy += 20
        return f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="14" fill="#ffffff" stroke="#4b5563" stroke-width="2"/>' + "\n" + "\n".join(text)
    def arrow(x1: int, y1: int, x2: int, y2: int, label: str) -> str:
        midx = (x1 + x2) // 2
        midy = (y1 + y2) // 2 - 8
        return f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="#374151" stroke-width="2" marker-end="url(#arrow)"/><text x="{midx}" y="{midy}" text-anchor="middle" font-size="12">{html.escape(label)}</text>'
    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="1180" height="560" viewBox="0 0 1180 560">
  <defs>
    <marker id="arrow" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto" markerUnits="strokeWidth">
      <path d="M0,0 L0,6 L9,3 z" fill="#374151" />
    </marker>
  </defs>
  <rect x="0" y="0" width="1180" height="560" fill="#f8fafc"/>
  <text x="40" y="42" font-size="26" font-weight="700">System Architecture Diagram</text>
  {box(40, 90, 210, 130, "End Users", ["Browser access", "Authenticated users"])}
  {box(320, 90, 230, 130, "Oracle APEX UI", [f"Pages: {pages}", "Regions, items, buttons"])}
  {box(630, 90, 260, 150, "APEX Runtime", [f"Processes: {processes}", f"Validations: {validations}", "Dynamic actions / AJAX"])}
  {box(970, 90, 180, 150, "Oracle DB", [f"Tables in export: {tables}", "SQL / PL/SQL", "APEX schema"])}
  {box(320, 330, 230, 120, "Jenkins CI/CD", ["Deployment branch", "Deploy SQL export"])}
  {box(630, 330, 260, 120, "Docs Artifacts", ["Markdown + TXT", "Metadata JSON", "SVG + HTML + ZIP"])}
  {arrow(250, 155, 320, 155, "HTTPS")}
  {arrow(550, 155, 630, 155, "Submit/AJAX")}
  {arrow(890, 165, 970, 165, "SQL/PLSQL")}
  {arrow(435, 330, 435, 220, "Deploy")}
  {arrow(550, 390, 630, 390, "Generate")}
</svg>'''
    return svg


def write_diagrams(metadata: Dict[str, Any]) -> None:
    mmd = build_mermaid(metadata)
    svg = build_svg(metadata)
    ARCH_MMD_FILE.write_text(mmd, encoding="utf-8")
    ARCH_SVG_FILE.write_text(svg, encoding="utf-8")
    html_doc = f"""<!doctype html>
<html><head><meta charset=\"utf-8\"><title>System Architecture Diagram</title></head>
<body>
<h1>System Architecture Diagram</h1>
<p>This file embeds a generated SVG diagram directly, so it does not depend on Mermaid or OCI image output.</p>
{svg}
<h2>Mermaid Source</h2>
<pre>{html.escape(mmd)}</pre>
</body></html>
"""
    ARCH_HTML_FILE.write_text(html_doc, encoding="utf-8")

# -----------------------------------------------------------------------------
# Documentation rendering
# -----------------------------------------------------------------------------

def page_summary(p: Dict[str, Any]) -> str:
    if p["page_id"] == "0":
        return "Global Page components apply across the application."
    if p.get("public") == "Y" or "login" in (p.get("name", "") + p.get("title", "")).lower():
        return "Public/authentication page used to allow users to access the application."
    bits = []
    if p["regions"]:
        bits.append(f"contains {len(p['regions'])} region(s)")
    if p["items"]:
        bits.append(f"captures or displays {len(p['items'])} item(s)")
    if p["processes"]:
        bits.append(f"runs {len(p['processes'])} backend process(es)")
    if p["validations"]:
        bits.append(f"has {len(p['validations'])} validation rule(s)")
    return "This page " + ", ".join(bits) + "." if bits else "This page is defined in the APEX SQL export."


def render_page(p: Dict[str, Any], config: Dict[str, Any]) -> str:
    title = p.get("title") or p.get("name") or f"Page {p['page_id']}"
    lines = [f"### Page {p['page_id']} - {title}", ""]
    lines += ["#### Page Overview", "", page_summary(p), ""]
    lines += ["| Field | Value |", "| --- | --- |",
              f"| Page ID | {p['page_id']} |", f"| Name | {clean(p.get('name')) or '-'} |", f"| Alias | {clean(p.get('alias')) or '-'} |",
              f"| Title | {clean(title) or '-'} |", f"| Public Page | {clean(p.get('public')) or 'N/Not specified'} |",
              f"| Protection Level | {clean(p.get('protection_level')) or '-'} |", ""]
    lines += ["#### Page Architecture and Communication", "",
              "- Browser renders this page through Oracle APEX runtime metadata.",
              "- Page submissions, button clicks, validations, dynamic actions, and AJAX callbacks are handled by APEX runtime.",
              "- Backend communication is performed using SQL/PLSQL in page processes, region sources, LOVs, and validations.", ""]
    if config.get("user_guide", {}).get("include_screenshot_placeholders", True):
        lines += ["#### Screenshot Placeholder", "", f"Add a screenshot for Page {p['page_id']} - {title} here after deployment validation.", ""]
    lines += ["#### User Guide / Workflow", "", "1. Open the application and navigate to this page.", "2. Review visible regions and instructions.", "3. Enter required page item values."]
    if p["buttons"]:
        btns = ", ".join([b.get("label") or b.get("name") for b in p["buttons"] if b.get("label") or b.get("name")])
        lines.append(f"4. Use available action buttons: {btns}.")
    else:
        lines.append("4. Use page navigation or available controls to continue.")
    lines += ["5. Confirm success messages or correct validation errors.", ""]
    lines += ["#### Regions / UI Sections", "", table(["Region", "Display Point", "Source Type", "Source / Query"], [[r["name"], r["display_point"], r["source_type"], r["source"]] for r in p["regions"]]), ""]
    lines += ["#### Page Items / Fields", "", table(["Item", "Prompt", "Display As", "Required", "Max Length", "Source / Default / LOV"], [[i["name"], i["prompt"], i["display_as"], i["required"], i["max_length"], i["source"] or i["default"] or i["lov"]] for i in p["items"]]), ""]
    lines += ["#### Buttons / Actions", "", table(["Button", "Label", "Action", "Position", "Target / Validations"], [[b["name"], b["label"], b["action"], b["position"], b["target"] or b["execute_validations"]] for b in p["buttons"]]), ""]
    lines += ["#### Backend Processes", "", table(["Process", "Type", "Execution Point", "Source / Logic", "Error Location"], [[pr["name"], pr["process_type"], pr["point"], pr["source"], pr["error_location"]] for pr in p["processes"]]), ""]
    lines += ["#### Validations", "", table(["Validation", "Type", "Associated Item", "Error Message", "Condition"], [[v["name"], v["validation_type"], v["associated_item"], v["error_message"], v["condition"]] for v in p["validations"]]), ""]
    lines += ["#### Dynamic Actions / Client Behavior", "", table(["Dynamic Action", "Event / Action", "Triggering Element", "Condition"], [[d["name"], d["event"], d["triggering_element"], d["condition"]] for d in p["dynamic_actions"]]), ""]
    lines += ["#### Page Security Notes", "",
              f"- Public page flag: {p.get('public') or 'Not specified'}.",
              f"- Page protection level: {p.get('protection_level') or 'Not specified'}.",
              "- Confirm that sensitive page items and buttons are protected by proper authorization schemes.", ""]
    lines += ["#### Page Troubleshooting", "",
              "- Check required fields and validation messages first.",
              "- If a submit action fails, review page process errors and APEX debug logs.",
              "- If data is missing, inspect region SQL/PLSQL sources and referenced database objects.", ""]
    return "\n".join(lines)


def render_docs(metadata: Dict[str, Any], config: Dict[str, Any]) -> str:
    info = metadata["application"]
    pages = metadata["pages"]
    db = metadata["database"]
    shared = metadata["shared"]
    generated_at = metadata["generated_at_utc"]
    app_name = info.get("application_name") or "Oracle APEX Application"

    lines: List[str] = []
    lines += [f"# {app_name} - Application Documentation", "",
              f"Generated at UTC: {generated_at}  ",
              f"Source SQL file: {metadata['source_sql_file']}  ",
              f"Application ID: {info.get('application_id') or 'Not found'}  ",
              f"Application alias: {info.get('alias') or 'Not found'}  ",
              f"APEX version/export version: {info.get('version') or 'Not found'}  ", ""]
    lines += ["## 1. Overview / Introduction", "",
              "### Purpose of the Application", "", config["application"]["purpose"], "",
              "### Business Problem It Solves", "", config["application"]["business_problem"], "",
              "### Target Users", "", bullets(config["application"].get("target_users", []), "No target users configured."), "",
              "### Key Features", "", bullets(config["application"].get("key_features", []) or [f"APEX application with {len(pages)} page(s) extracted from SQL export", "Generated page-by-page technical documentation", "Architecture, user guide, API, database, and security documentation in one file"]), "",
              "### Scope", "", config["application"]["scope"], "",
              "### Limitations", "", bullets(config["application"].get("limitations", [])), "",
              "### Extracted Application Inventory", "",
              f"- Pages detected: {len(pages)}",
              f"- Regions detected: {sum(len(p['regions']) for p in pages)}",
              f"- Page items detected: {sum(len(p['items']) for p in pages)}",
              f"- Buttons detected: {sum(len(p['buttons']) for p in pages)}",
              f"- Page processes detected: {sum(len(p['processes']) for p in pages)}",
              f"- Validations detected: {sum(len(p['validations']) for p in pages)}",
              f"- Authentication schemes detected: {len(shared['authentication'])}",
              f"- Authorization schemes detected: {len(shared['authorization'])}",
              f"- Navigation/list items detected: {len(shared['list_items'])}", ""]
    lines += ["## 2. System Architecture", "",
              "### High-Level Architecture Diagram", "",
              "The architecture diagram is generated locally as SVG and embedded in the artifact bundle. It does not depend on OCI GenAI image output or Mermaid browser rendering.", "",
              "Artifacts:", "",
              "- `documentation/generated/architecture_diagram.svg`",
              "- `documentation/generated/architecture_diagram.html`",
              "- `documentation/generated/architecture_diagram.mmd`", "",
              "Markdown image reference:", "", "![System Architecture Diagram](architecture_diagram.svg)", "",
              "### Components / Services", "",
              f"- Frontend: {config['architecture']['frontend']}",
              f"- Backend: {config['architecture']['backend']}",
              f"- Database: {config['architecture']['database']}",
              f"- Cloud / Infrastructure: {config['architecture']['cloud_infrastructure']}",
              "- Third-party integrations:", bullets(config["architecture"].get("third_party_integrations", [])), "",
              "### How the System Works Internally", "",
              "Users access the Oracle APEX frontend in a browser. APEX renders pages, regions, items, buttons, navigation, and shared components from metadata in the SQL export. User actions invoke validations, dynamic actions, page processes, and SQL/PLSQL logic. The APEX runtime communicates with the Oracle Database using the parsing schema and returns rendered pages, notifications, redirects, or API responses.", "",
              "### How Components Communicate", "",
              "- Browser to APEX: HTTPS page requests, form submissions, and AJAX calls.",
              "- APEX UI to APEX runtime: page metadata, validations, processes, dynamic actions, and session state.",
              "- APEX runtime to database: SQL and PL/SQL in regions, processes, LOVs, and validations.",
              "- Jenkins to APEX: deployment branch pipeline deploys the SQL export to the configured workspace/schema/app ID.",
              "- Jenkins to artifacts: documentation generator creates Markdown, TXT, metadata JSON, SVG, HTML, Mermaid, and ZIP outputs.", ""]
    lines += ["## 3. Page-by-Page Documentation", "", "All detected APEX pages are documented below in this single combined file.", ""]
    if not pages:
        lines += ["No pages were detected. This usually means the parser did not recognize the export syntax or the wrong SQL file was passed to `APEX_SQL_FILE`.", ""]
    for p in pages:
        lines.append(render_page(p, config))
    lines += ["## 4. Shared Application Components", "",
              "### Navigation Lists", "", table(["List", "Status"], [[x["name"], x["status"]] for x in shared["lists"]]), "",
              "### Navigation/List Items", "", table(["Text", "Target", "Icon", "Condition"], [[x["text"], x["target"], x["icon"], x["condition"]] for x in shared["list_items"]]), "",
              "### List of Values / LOVs", "", table(["LOV", "Query / Source"], [[x["name"], x["query"]] for x in shared["lovs"]]), ""]
    lines += ["## 5. User Guide", "",
              "### Navigation Overview", "", bullets([x["text"] for x in shared["list_items"] if x.get("text") and x.get("text") not in {"---", "&APP_USER."}], "No navigation entries detected."), "",
              "### General Workflow", "", "1. Open the deployed APEX application URL.", "2. Sign in using an authorized account if the page is not public.", "3. Navigate to the required page from the application menu or direct link.", "4. Complete required fields and review validation messages.", "5. Submit or save using available page buttons.", "6. Confirm success notifications or correct displayed errors.", "",
              "### Page Workflows", ""]
    for p in pages:
        lines += [f"- Page {p['page_id']} - {p.get('title') or p.get('name')}: {page_summary(p)}"]
    lines += ["", "### FAQs", ""]
    for faq in config["user_guide"].get("faq", []):
        lines += [f"Q: {faq.get('question', '')}", "", f"A: {faq.get('answer', '')}", ""]
    lines += ["### Troubleshooting Tips", "", bullets(config["user_guide"].get("troubleshooting", [])), ""]
    lines += ["## 6. API Documentation", ""]
    if shared["rest"] or config.get("manual_api_examples"):
        lines += ["### Extracted REST/ORDS Endpoints", "", table(["Type", "Name / URI", "Method", "Source"], [[x["type"], x["name"], x["method"], x["source"]] for x in shared["rest"]]), ""]
    else:
        lines += ["No REST/ORDS API endpoints were detected in the provided APEX SQL export.", ""]
    lines += ["### Authentication", "", config["api"]["authentication"], "", "### Error Codes", "", bullets(config["api"].get("error_codes", [])), "", "### Rate Limits", "", config["api"]["rate_limits"], ""]
    lines += ["## 7. Database Documentation", "",
              "### Database Overview", "", f"Tables explicitly created in export: {len(db['tables'])}", "", "### Referenced Tables / Objects", "", bullets(db.get("referenced_tables", []), "No table references detected in SQL/PLSQL sources."), "",
              "### Tables and Data Dictionary", ""]
    if db["tables"]:
        for t in db["tables"]:
            lines += [f"#### Table {t['name']}", "", table(["Column", "Type / Definition"], [[c["name"], c["type"]] for c in t["columns"]]), ""]
    else:
        lines += ["No CREATE TABLE statements were found in the APEX export. This is normal when tables are managed separately from the APEX application export.", ""]
    lines += ["### ER Diagram / Relationships", "", table(["Constraint", "Columns", "Referenced Table", "Referenced Columns"], [[x["name"], x["columns"], x["ref_table"], x["ref_columns"]] for x in db["foreign_keys"]]), "",
              "### Indexing Strategy", "", table(["Index", "Table", "Columns"], [[x["name"], x["table"], x["columns"]] for x in db["indexes"]]), "",
              "### Stored Procedures, Packages, Triggers, and Supporting Objects", ""]
    for k, vals in db["objects"].items():
        lines += [f"#### {k.title()}", "", bullets(vals, f"No {k} found in SQL export."), ""]
    if config.get("manual_database_notes"):
        lines += ["### Manual Database Notes", "", bullets(config["manual_database_notes"]), ""]
    lines += ["## 8. Security Documentation", "",
              "### Authentication Method", "", config["security"]["authentication_method"], "", table(["Scheme", "Type", "Invalid Session Handling"], [[x["name"], x["type"], x["invalid_session"]] for x in shared["authentication"]]), "",
              "### Authorization Roles and Schemes", "", "Configured roles:", bullets(config["security"].get("authorization_roles", []), "No manual roles configured in documentation_config.json."), "", "Extracted authorization schemes:", "", table(["Scheme", "Type", "Error Message"], [[x["name"], x["type"], x["error"]] for x in shared["authorization"]]), "",
              "### Encryption Details", "", config["security"]["encryption_details"], "",
              "### Audit Logging", "", config["security"]["audit_logging"], "",
              "### Security Best Practices", "", bullets(config["security"].get("best_practices", [])), ""]
    if config.get("manual_security_notes"):
        lines += ["### Manual Security Notes", "", bullets(config["manual_security_notes"]), ""]
    return "\n".join(lines).replace("\n\n\n\n", "\n\n")


def markdown_to_text(md: str) -> str:
    txt = md
    txt = re.sub(r"^#{1,6}\s*", "", txt, flags=re.MULTILINE)
    txt = txt.replace("`", "")
    txt = txt.replace("![System Architecture Diagram](architecture_diagram.svg)", "See architecture_diagram.svg artifact.")
    return txt


def main() -> None:
    try:
        OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
        sql = read_text(APEX_SQL_FILE)
        config = load_config()
        calls = find_calls(sql)
        app_info = parse_export_header(sql)
        pages = extract_pages(sql, calls)
        shared = extract_shared(sql, calls)
        database = extract_database(sql)
        metadata = {
            "generated_at_utc": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "source_sql_file": APEX_SQL_FILE.name,
            "source_sql_path": str(APEX_SQL_FILE),
            "application": app_info,
            "pages": [asdict(p) for p in pages],
            "shared": shared,
            "database": database,
            "debug": {"apex_calls_detected": len(calls), "page_count": len(pages)}
        }
        METADATA_JSON_FILE.write_text(json.dumps(metadata, indent=2), encoding="utf-8")
        write_diagrams(metadata)
        md = render_docs(metadata, config)
        DOC_MD_FILE.write_text(md + "\n", encoding="utf-8")
        DOC_TXT_FILE.write_text(markdown_to_text(md) + "\n", encoding="utf-8")
        with zipfile.ZipFile(DOC_ZIP_FILE, "w", zipfile.ZIP_DEFLATED) as zf:
            for path in [DOC_MD_FILE, DOC_TXT_FILE, METADATA_JSON_FILE, ARCH_SVG_FILE, ARCH_HTML_FILE, ARCH_MMD_FILE]:
                if path.exists():
                    zf.write(path, arcname=path.name)
        print("Documentation generated successfully.")
        print(f"SQL file: {APEX_SQL_FILE}")
        print(f"APEX calls detected: {len(calls)}")
        print(f"Pages detected: {len(pages)}")
        print(f"Output directory: {OUTPUT_DIR}")
    except Exception as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
