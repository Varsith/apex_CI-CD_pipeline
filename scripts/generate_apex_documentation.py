# coding: utf-8
"""
Oracle APEX SQL to CI/CD Documentation Generator
Jenkins / OCI GenAI Edition

What it does
------------
Reads an Oracle APEX SQL export, extracts useful metadata, optionally calls
OCI Generative AI, and writes downloadable documentation artifacts:

- documentation/generated/application_documentation.txt
- documentation/generated/application_documentation.md
- documentation/generated/apex_metadata.json
- documentation/generated/application_documentation_bundle.zip

Designed to run on the Jenkins deployment branch after APEX deployment.
"""

import json
import os
import re
import sys
import zipfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional

try:
    import oci  # type: ignore
except Exception:  # pragma: no cover - fallback mode still works without OCI SDK
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
DOC_TXT_FILE = OUTPUT_DIR / "application_documentation.txt"
DOC_MD_FILE = OUTPUT_DIR / "application_documentation.md"
METADATA_JSON_FILE = OUTPUT_DIR / "apex_metadata.json"
DOC_ZIP_FILE = OUTPUT_DIR / "application_documentation_bundle.zip"


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


def clean_for_prompt(text: str, max_chars: int = 90000) -> str:
    text = re.sub(r"\r\n?", "\n", text)
    text = re.sub(r"\n\s*\n\s*\n+", "\n\n", text)
    text = re.sub(r"[ \t]+", " ", text)
    text = text.strip()
    if len(text) > max_chars:
        return text[:max_chars] + "\n\n-- TRUNCATED FOR PROMPT --"
    return text


def unique(values: Iterable[Any], limit: int = 100) -> List[str]:
    result: List[str] = []
    seen = set()
    for value in values:
        if value is None:
            continue
        if isinstance(value, tuple):
            value = " ".join(str(v).strip() for v in value if v)
        value = re.sub(r"\s+", " ", str(value).strip())
        if not value:
            continue
        key = value.lower()
        if key in seen:
            continue
        seen.add(key)
        result.append(value)
        if len(result) >= limit:
            break
    return result


def regex_find(pattern: str, text: str, limit: int = 100) -> List[str]:
    return unique(re.findall(pattern, text, flags=re.IGNORECASE | re.DOTALL), limit=limit)


def safe_filename(value: str) -> str:
    return re.sub(r"[^a-zA-Z0-9_.-]+", "_", value).strip("_") or "file"


# =============================================================================
# Config / lightweight UI definition
# =============================================================================

DEFAULT_DOC_CONFIG: Dict[str, Any] = {
    "application": {
        "purpose": "Describe the purpose of this Oracle APEX application here.",
        "business_problem": "Describe the business problem this application solves here.",
        "target_users": ["Business users", "Administrators"],
        "key_features": [],
        "scope": "Generated from the APEX SQL export. Update this field with business-specific scope.",
        "limitations": ["Generated documentation depends on metadata present in the APEX SQL export."]
    },
    "architecture": {
        "frontend": "Oracle APEX web UI",
        "backend": "Oracle APEX runtime, PL/SQL processes, validations, and dynamic actions",
        "database": "Oracle Database / APEX parsing schema",
        "cloud_infrastructure": "Oracle Cloud Infrastructure / ORDS / APEX service as configured by the environment",
        "third_party_integrations": []
    },
    "api": {
        "exposes_apis": "auto",
        "base_url": "",
        "authentication": "Use environment-specific authentication. Update if REST APIs are exposed.",
        "rate_limits": "Not found in SQL export. Define manually if applicable.",
        "error_codes": ["HTTP 400", "HTTP 401", "HTTP 403", "HTTP 404", "HTTP 429", "HTTP 500"]
    },
    "security": {
        "authentication_method": "Oracle APEX authentication scheme, SSO, or custom authentication as extracted/configured.",
        "authorization_roles": [],
        "encryption_details": "Use HTTPS/TLS in transit. Database encryption depends on OCI/DB configuration.",
        "audit_logging": "Review APEX activity logs, custom audit tables, and database auditing.",
        "best_practices": [
            "Never commit credentials to source control.",
            "Use Jenkins credentials binding for secrets.",
            "Validate server-side authorization for all sensitive pages and processes.",
            "Avoid exposing ORA-/ERR- details to end users.",
            "Keep APEX, ORDS, and database patches current."
        ]
    },
    "user_guide": {
        "include_screenshot_placeholders": True,
        "faq": [
            {"question": "How do I access the application?", "answer": "Use the environment-specific APEX URL."},
            {"question": "What should I do if login fails?", "answer": "Check credentials, workspace access, and account status."}
        ],
        "troubleshooting": [
            "Refresh the page and try again.",
            "Confirm required fields are filled.",
            "Contact the application administrator if APEX or ORA errors appear."
        ]
    },
    "sections": {
        "overview": True,
        "system_architecture": True,
        "user_guide": True,
        "api_documentation": True,
        "database_documentation": True,
        "security_documentation": True
    }
}


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

    def deep_merge(default: Dict[str, Any], override: Dict[str, Any]) -> Dict[str, Any]:
        merged = dict(default)
        for key, value in override.items():
            if isinstance(value, dict) and isinstance(merged.get(key), dict):
                merged[key] = deep_merge(merged[key], value)
            else:
                merged[key] = value
        return merged

    return deep_merge(DEFAULT_DOC_CONFIG, user_config)


# =============================================================================
# APEX SQL metadata extraction
# =============================================================================

def extract_page_blocks(sql_text: str, limit: int = 200) -> List[Dict[str, str]]:
    pages: List[Dict[str, str]] = []
    seen = set()
    pattern = re.compile(
        r"wwv_flow_api\.create_page\((?P<body>.*?)\);",
        flags=re.IGNORECASE | re.DOTALL,
    )
    for match in pattern.finditer(sql_text):
        body = match.group("body")
        page_id = regex_find(r"p_id\s*=>\s*(?:wwv_flow_api\.id\()?([0-9]+)", body, 1)
        page_no = regex_find(r"p_page_id\s*=>\s*([0-9]+)", body, 1)
        title = regex_find(r"p_page_title\s*=>\s*'([^']+)'", body, 1)
        alias = regex_find(r"p_alias\s*=>\s*'([^']+)'", body, 1)
        name = regex_find(r"p_name\s*=>\s*'([^']+)'", body, 1)
        key = (page_no[0] if page_no else page_id[0] if page_id else title[0] if title else str(len(pages))).lower()
        if key in seen:
            continue
        seen.add(key)
        pages.append({
            "page_id": page_no[0] if page_no else page_id[0] if page_id else "",
            "title": title[0] if title else name[0] if name else "Untitled page",
            "alias": alias[0] if alias else ""
        })
        if len(pages) >= limit:
            break
    return pages


def extract_page_items(sql_text: str, limit: int = 300) -> List[Dict[str, str]]:
    pattern = re.compile(
        r"wwv_flow_api\.create_page_item\((?P<body>.*?)\);",
        flags=re.IGNORECASE | re.DOTALL,
    )
    items: List[Dict[str, str]] = []
    seen = set()
    for match in pattern.finditer(sql_text):
        body = match.group("body")
        name = regex_find(r"p_name\s*=>\s*'([^']+)'", body, 1)
        if not name:
            continue
        item_name = name[0]
        if item_name.upper() in seen:
            continue
        seen.add(item_name.upper())
        items.append({
            "name": item_name,
            "display_as": (regex_find(r"p_display_as\s*=>\s*'([^']+)'", body, 1) or [""])[0],
            "label": (regex_find(r"p_prompt\s*=>\s*'([^']+)'", body, 1) or [""])[0],
            "required": "Y" if re.search(r"p_is_required\s*=>\s*'Y'", body, flags=re.IGNORECASE) else "N",
            "source": (regex_find(r"p_source\s*=>\s*'([^']+)'", body, 1) or [""])[0],
        })
        if len(items) >= limit:
            break
    return items


def extract_authorization(sql_text: str) -> Dict[str, List[str]]:
    return {
        "authentication_schemes": regex_find(r"p_scheme_name\s*=>\s*'([^']+)'", sql_text, 50),
        "authorization_schemes": regex_find(r"p_authorization_scheme_name\s*=>\s*'([^']+)'", sql_text, 100),
        "build_options": regex_find(r"p_build_option_name\s*=>\s*'([^']+)'", sql_text, 100),
    }


def extract_tables(sql_text: str, limit: int = 250) -> List[str]:
    patterns = [
        r"create\s+table\s+(?:if\s+not\s+exists\s+)?([A-Z0-9_$#\.\"]+)",
        r"insert\s+into\s+([A-Z0-9_$#\.\"]+)",
        r"update\s+([A-Z0-9_$#\.\"]+)\s+set",
        r"delete\s+from\s+([A-Z0-9_$#\.\"]+)",
        r"\bfrom\s+([A-Z0-9_$#\.\"]+)",
        r"\bjoin\s+([A-Z0-9_$#\.\"]+)",
    ]
    values: List[str] = []
    for pattern in patterns:
        values.extend(regex_find(pattern, sql_text, limit=limit))
    blocked = {"SELECT", "DUAL", "TABLE", "WHERE", "APEX_APPLICATION", "WWV_FLOW_API"}
    cleaned = []
    for value in unique(values, limit=limit):
        normalized = value.strip('"').split(".")[-1].upper()
        if normalized in blocked:
            continue
        if normalized.startswith(("WWV_", "APEX_", "SYS.")):
            continue
        cleaned.append(value.strip('"'))
        if len(cleaned) >= limit:
            break
    return cleaned


def extract_columns_from_create_table(sql_text: str) -> Dict[str, List[Dict[str, str]]]:
    result: Dict[str, List[Dict[str, str]]] = {}
    create_table_pattern = re.compile(
        r"create\s+table\s+([A-Z0-9_$#\.\"]+)\s*\((?P<body>.*?)\)\s*;",
        flags=re.IGNORECASE | re.DOTALL,
    )
    for match in create_table_pattern.finditer(sql_text):
        table = match.group(1).strip('"')
        body = match.group("body")
        columns: List[Dict[str, str]] = []
        for raw_line in body.splitlines():
            line = raw_line.strip().rstrip(",")
            if not line or line.startswith("--"):
                continue
            if re.match(r"(?i)constraint\b|primary\s+key\b|foreign\s+key\b|unique\b|check\b", line):
                continue
            col_match = re.match(r"([A-Z0-9_$#\"]+)\s+([A-Z0-9_]+(?:\s*\([^)]*\))?)", line, flags=re.IGNORECASE)
            if not col_match:
                continue
            columns.append({
                "column": col_match.group(1).strip('"'),
                "type": col_match.group(2).strip(),
                "nullable": "N" if re.search(r"not\s+null", line, flags=re.IGNORECASE) else "Y",
                "notes": line,
            })
        result[table] = columns
    return result


def extract_relationships(sql_text: str, limit: int = 100) -> List[Dict[str, str]]:
    relationships: List[Dict[str, str]] = []
    fk_pattern = re.compile(
        r"foreign\s+key\s*\((?P<cols>[^)]+)\)\s*references\s+(?P<table>[A-Z0-9_$#\.\"]+)\s*\((?P<refcols>[^)]+)\)",
        flags=re.IGNORECASE | re.DOTALL,
    )
    for match in fk_pattern.finditer(sql_text):
        relationships.append({
            "from_columns": re.sub(r"\s+", " ", match.group("cols").strip()),
            "to_table": match.group("table").strip('"'),
            "to_columns": re.sub(r"\s+", " ", match.group("refcols").strip()),
        })
        if len(relationships) >= limit:
            break
    return relationships


def extract_indexes(sql_text: str, limit: int = 100) -> List[Dict[str, str]]:
    indexes: List[Dict[str, str]] = []
    pattern = re.compile(
        r"create\s+(?P<unique>unique\s+)?index\s+(?P<name>[A-Z0-9_$#\.\"]+)\s+on\s+(?P<table>[A-Z0-9_$#\.\"]+)\s*\((?P<cols>[^)]+)\)",
        flags=re.IGNORECASE | re.DOTALL,
    )
    for match in pattern.finditer(sql_text):
        indexes.append({
            "name": match.group("name").strip('"'),
            "table": match.group("table").strip('"'),
            "columns": re.sub(r"\s+", " ", match.group("cols").strip()),
            "unique": "Y" if match.group("unique") else "N",
        })
        if len(indexes) >= limit:
            break
    return indexes


def extract_rest_apis(sql_text: str, limit: int = 100) -> List[Dict[str, str]]:
    modules = regex_find(r"ords\.define_module\s*\([^;]*?p_module_name\s*=>\s*'([^']+)'", sql_text, limit)
    patterns = regex_find(r"ords\.define_template\s*\([^;]*?p_pattern\s*=>\s*'([^']+)'", sql_text, limit)
    methods = regex_find(r"ords\.define_handler\s*\([^;]*?p_method\s*=>\s*'([^']+)'", sql_text, limit)
    combined: List[Dict[str, str]] = []
    max_len = max(len(modules), len(patterns), len(methods), 0)
    for i in range(max_len):
        combined.append({
            "module": modules[i] if i < len(modules) else "",
            "endpoint_pattern": patterns[i] if i < len(patterns) else "",
            "method": methods[i] if i < len(methods) else "",
        })
    return combined[:limit]


def extract_metadata(sql_text: str) -> Dict[str, Any]:
    metadata: Dict[str, Any] = {
        "generated_at_utc": now_utc_iso(),
        "source_sql_file": str(APEX_SQL_FILE),
        "application": {
            "ids": regex_find(r"p_application_id\s*=>\s*'?([0-9]+)'?", sql_text, 10),
            "names": regex_find(r"p_name\s*=>\s*'([^']+)'", sql_text, 50),
            "aliases": regex_find(r"p_alias\s*=>\s*'([^']+)'", sql_text, 50),
        },
        "pages": extract_page_blocks(sql_text),
        "components": {
            "regions": regex_find(r"p_region_name\s*=>\s*'([^']+)'", sql_text, 250),
            "items": extract_page_items(sql_text),
            "buttons": regex_find(r"p_button_name\s*=>\s*'([^']+)'", sql_text, 200),
            "processes": regex_find(r"p_process_name\s*=>\s*'([^']+)'", sql_text, 200),
            "validations": regex_find(r"p_validation_name\s*=>\s*'([^']+)'", sql_text, 200),
            "dynamic_actions": regex_find(r"p_name\s*=>\s*'([^']+)'[^;]{0,1500}?create_page_da_event", sql_text, 200),
            "lists": regex_find(r"p_list_name\s*=>\s*'([^']+)'", sql_text, 100),
            "lovs": regex_find(r"p_lov_name\s*=>\s*'([^']+)'", sql_text, 100),
        },
        "security": extract_authorization(sql_text),
        "database": {
            "tables_referenced": extract_tables(sql_text),
            "columns_by_create_table": extract_columns_from_create_table(sql_text),
            "relationships": extract_relationships(sql_text),
            "indexes": extract_indexes(sql_text),
            "stored_program_units": regex_find(r"create\s+(?:or\s+replace\s+)?(?:procedure|function|package(?:\s+body)?)\s+([A-Z0-9_$#\.\"]+)", sql_text, 100),
        },
        "apis": extract_rest_apis(sql_text),
    }
    return metadata


# =============================================================================
# Deterministic fallback documentation
# =============================================================================

def bullet_list(values: Iterable[Any], empty: str = "Not found in SQL export.", limit: int = 40) -> str:
    values_list = list(values)[:limit]
    if not values_list:
        return f"- {empty}"
    return "\n".join(f"- {v}" for v in values_list)


def markdown_table(headers: List[str], rows: List[List[Any]], empty: str = "Not found in SQL export.") -> str:
    if not rows:
        return empty
    header = "| " + " | ".join(headers) + " |"
    sep = "| " + " | ".join(["---"] * len(headers)) + " |"
    body = []
    for row in rows:
        body.append("| " + " | ".join(str(cell).replace("|", "\\|").replace("\n", " ") for cell in row) + " |")
    return "\n".join([header, sep] + body)


def architecture_mermaid(config: Dict[str, Any]) -> str:
    frontend = config["architecture"].get("frontend", "Oracle APEX UI")
    backend = config["architecture"].get("backend", "APEX runtime / PL/SQL")
    database = config["architecture"].get("database", "Oracle Database")
    cloud = config["architecture"].get("cloud_infrastructure", "OCI / ORDS / APEX")
    integrations = config["architecture"].get("third_party_integrations", [])

    lines = [
        "```mermaid",
        "flowchart LR",
        f"  Users[Target Users] --> Frontend[{frontend}]",
        f"  Frontend --> Backend[{backend}]",
        f"  Backend --> Database[( {database} )]",
        f"  Cloud[{cloud}] --> Frontend",
        f"  Cloud --> Backend",
        f"  Cloud --> Database",
    ]
    for idx, integration in enumerate(integrations[:8], start=1):
        lines.append(f"  Backend --> Integration{idx}[{str(integration).replace('[', '(').replace(']', ')')}]")
    lines.append("```")
    return "\n".join(lines)


def er_mermaid(metadata: Dict[str, Any]) -> str:
    tables = metadata["database"].get("tables_referenced", [])[:12]
    relationships = metadata["database"].get("relationships", [])[:20]
    if not tables:
        return "ER diagram could not be generated because no application tables were found in the SQL export."
    lines = ["```mermaid", "erDiagram"]
    for table in tables:
        safe_table = re.sub(r"[^A-Za-z0-9_]", "_", table.split(".")[-1].upper())
        lines.append(f"  {safe_table} {{")
        columns = metadata["database"].get("columns_by_create_table", {}).get(table, [])[:10]
        if columns:
            for col in columns:
                dtype = re.sub(r"[^A-Za-z0-9_]", "_", col.get("type", "VARCHAR2")).upper()
                cname = re.sub(r"[^A-Za-z0-9_]", "_", col.get("column", "COLUMN")).upper()
                lines.append(f"    {dtype} {cname}")
        else:
            lines.append("    VARCHAR2 METADATA_NOT_EXTRACTED")
        lines.append("  }")
    for rel in relationships:
        from_cols = re.sub(r"[^A-Za-z0-9_]", "_", rel.get("from_columns", "FK"))
        to_table = re.sub(r"[^A-Za-z0-9_]", "_", rel.get("to_table", "TABLE").split(".")[-1].upper())
        if tables:
            from_table = re.sub(r"[^A-Za-z0-9_]", "_", tables[0].split(".")[-1].upper())
            lines.append(f"  {to_table} ||--o{{ {from_table} : {from_cols}")
    lines.append("```")
    return "\n".join(lines)


def build_fallback_documentation(config: Dict[str, Any], metadata: Dict[str, Any]) -> str:
    app_cfg = config["application"]
    sec_cfg = config["security"]
    api_cfg = config["api"]
    user_cfg = config["user_guide"]

    app_names = metadata["application"].get("names") or ["Oracle APEX Application"]
    app_ids = metadata["application"].get("ids") or ["Not found"]
    pages = metadata.get("pages", [])
    items = metadata["components"].get("items", [])
    table_names = metadata["database"].get("tables_referenced", [])
    rest_apis = metadata.get("apis", [])

    page_rows = [[p.get("page_id", ""), p.get("title", ""), p.get("alias", "")] for p in pages[:80]]
    item_rows = [[i.get("name", ""), i.get("label", ""), i.get("display_as", ""), i.get("required", "")] for i in items[:120]]
    api_rows = [[a.get("method", ""), a.get("module", ""), a.get("endpoint_pattern", ""), api_cfg.get("authentication", "")] for a in rest_apis[:80]]
    index_rows = [[i.get("name", ""), i.get("table", ""), i.get("columns", ""), i.get("unique", "")] for i in metadata["database"].get("indexes", [])[:100]]
    rel_rows = [[r.get("from_columns", ""), r.get("to_table", ""), r.get("to_columns", "")] for r in metadata["database"].get("relationships", [])[:100]]

    section_parts: List[str] = []
    section_parts.append(f"# Application Documentation\n\nGenerated at UTC: {metadata.get('generated_at_utc')}\nSource SQL: {metadata.get('source_sql_file')}\n")

    if config["sections"].get("overview", True):
        section_parts.append(f"""
## 1. Overview / Introduction

**Application name:** {app_names[0]}  
**Application ID:** {', '.join(app_ids)}

**Purpose:** {app_cfg.get('purpose')}

**Business problem:** {app_cfg.get('business_problem')}

**Target users**
{bullet_list(app_cfg.get('target_users', []))}

**Key features**
{bullet_list(app_cfg.get('key_features', []) or metadata['components'].get('regions', [])[:20], 'Add business-level features in documentation/documentation_config.json.')}

**Scope:** {app_cfg.get('scope')}

**Limitations**
{bullet_list(app_cfg.get('limitations', []))}
""")

    if config["sections"].get("system_architecture", True):
        section_parts.append(f"""
## 2. System Architecture

### High-level architecture diagram

{architecture_mermaid(config)}

### How the system works internally

The application is an Oracle APEX application generated from an APEX SQL export. Users interact with the APEX frontend through browser pages, regions, items, buttons, validations, and navigation menus. APEX runtime submits page state to backend PL/SQL processes and validations. Backend logic reads and writes Oracle Database tables through the APEX parsing schema. ORDS/APEX infrastructure handles HTTP routing, sessions, authentication, and rendering.

### Components / services

**Frontend:** {config['architecture'].get('frontend')}  
**Backend:** {config['architecture'].get('backend')}  
**Database:** {config['architecture'].get('database')}  
**Cloud / infrastructure:** {config['architecture'].get('cloud_infrastructure')}

**APEX pages**
{markdown_table(['Page ID', 'Title', 'Alias'], page_rows)}

**Regions**
{bullet_list(metadata['components'].get('regions', []), limit=80)}

**Processes**
{bullet_list(metadata['components'].get('processes', []), limit=80)}

**Validations**
{bullet_list(metadata['components'].get('validations', []), limit=80)}

### Component communication

1. Browser sends page requests and form submissions to APEX/ORDS.
2. APEX runtime validates session state and authorization.
3. Page processes, validations, dynamic actions, and PL/SQL logic execute in the Oracle Database context.
4. Data is queried from or written to application tables.
5. APEX renders updated HTML/JSON responses back to the browser.

### Third-party integrations
{bullet_list(config['architecture'].get('third_party_integrations', []), 'No third-party integrations were configured. Update documentation_config.json if applicable.')}
""")

    if config["sections"].get("user_guide", True):
        screenshot_text = "Screenshots should be captured from Playwright reports or manually added under documentation/screenshots/." if user_cfg.get("include_screenshot_placeholders", True) else "Screenshot placeholders disabled."
        faq_rows = [[f.get("question", ""), f.get("answer", "")] for f in user_cfg.get("faq", [])]
        section_parts.append(f"""
## 5. User Guide

### Navigation instructions

Use the application URL for the target environment. After login, use the application navigation menu, page links, buttons, and forms exposed by the APEX UI.

**Discovered pages**
{markdown_table(['Page ID', 'Title', 'Alias'], page_rows)}

### Workflow examples

1. Open the APEX application URL.
2. Sign in with an authorized user.
3. Navigate to the required page from the menu.
4. Fill required fields.
5. Use safe action buttons such as Save, Apply, Create, Search, or Submit.
6. Review success or validation messages.

**Discovered buttons**
{bullet_list(metadata['components'].get('buttons', []), limit=80)}

### Screenshots

{screenshot_text}

### FAQs
{markdown_table(['Question', 'Answer'], faq_rows)}

### Troubleshooting tips
{bullet_list(user_cfg.get('troubleshooting', []))}
""")

    if config["sections"].get("api_documentation", True):
        api_note = "REST APIs were detected in the SQL export." if rest_apis else "No ORDS REST API definitions were detected in the SQL export. If APIs exist outside this export, add them manually in documentation_config.json or extend the generator."
        section_parts.append(f"""
## 6. API Documentation

{api_note}

### Endpoints
{markdown_table(['Method', 'Module', 'Endpoint Pattern', 'Authentication'], api_rows)}

### Request / response examples

No concrete request/response payload examples were found in the SQL export. Add examples manually for each public or internal API endpoint.

### Authentication
{api_cfg.get('authentication')}

### Error codes
{bullet_list(api_cfg.get('error_codes', []))}

### Rate limits
{api_cfg.get('rate_limits')}
""")

    if config["sections"].get("database_documentation", True):
        data_dictionary_rows: List[List[Any]] = []
        for table, columns in metadata["database"].get("columns_by_create_table", {}).items():
            for col in columns:
                data_dictionary_rows.append([table, col.get("column", ""), col.get("type", ""), col.get("nullable", ""), col.get("notes", "")])
        if not data_dictionary_rows:
            for table in table_names[:120]:
                data_dictionary_rows.append([table, "Not extracted", "Not extracted", "Not extracted", "Table referenced in SQL export"])

        section_parts.append(f"""
## 7. Database Documentation

### ER diagram

{er_mermaid(metadata)}

### Tables and relationships

**Tables referenced**
{bullet_list(table_names, limit=150)}

**Relationships**
{markdown_table(['From columns', 'Referenced table', 'Referenced columns'], rel_rows)}

### Data dictionary
{markdown_table(['Table', 'Column', 'Data Type', 'Nullable', 'Notes'], data_dictionary_rows[:200])}

### Stored procedures / functions / packages
{bullet_list(metadata['database'].get('stored_program_units', []), limit=100)}

### Indexing strategy

The following indexes were extracted from SQL DDL. Review execution plans and add missing indexes for foreign keys, search columns, and high-volume reporting pages.

{markdown_table(['Index', 'Table', 'Columns', 'Unique'], index_rows)}
""")

    if config["sections"].get("security_documentation", True):
        roles = sec_cfg.get("authorization_roles", []) or metadata["security"].get("authorization_schemes", [])
        section_parts.append(f"""
## 8. Security Documentation

### Authentication method
{sec_cfg.get('authentication_method')}

**Detected authentication schemes**
{bullet_list(metadata['security'].get('authentication_schemes', []), 'No authentication scheme name found in SQL export.')}

### Authorization roles / schemes
{bullet_list(roles, 'No authorization roles/schemes were found. Define roles in documentation_config.json if they are managed externally.')}

### Encryption details
{sec_cfg.get('encryption_details')}

### Audit logging
{sec_cfg.get('audit_logging')}

### Security best practices
{bullet_list(sec_cfg.get('best_practices', []))}

### Security review checklist
- Confirm every sensitive page has authorization checks.
- Confirm server-side validations exist for critical fields.
- Confirm destructive buttons require explicit authorization and confirmation.
- Confirm no credentials, API keys, wallet files, or passwords are committed.
- Confirm Jenkins credentials are masked and bound only for required stages.
- Confirm application errors do not leak ORA-/ERR- details to end users.
""")

    return "\n".join(part.strip() for part in section_parts if part.strip()) + "\n"


# =============================================================================
# OCI GenAI support
# =============================================================================

def oci_ready() -> bool:
    return bool(oci and CONFIG_FILE_PATH and Path(CONFIG_FILE_PATH).exists() and COMPARTMENT_ID and ENDPOINT and CHAT_MODEL_ID)


def create_oci_client():
    if not oci:
        raise RuntimeError("OCI Python SDK is not installed. Run: python -m pip install oci")
    if not Path(CONFIG_FILE_PATH).exists():
        raise FileNotFoundError(f"OCI config file not found: {CONFIG_FILE_PATH}")
    config = oci.config.from_file(CONFIG_FILE_PATH, CONFIG_PROFILE)
    return oci.generative_ai_inference.GenerativeAiInferenceClient(
        config=config,
        service_endpoint=ENDPOINT,
        retry_strategy=oci.retry.NoneRetryStrategy(),
        timeout=(10, 300),
    )


def build_prompt(config: Dict[str, Any], metadata: Dict[str, Any], sql_excerpt: str) -> str:
    return f"""
You are a senior Oracle APEX architect, enterprise documentation lead, database designer, API technical writer, and security reviewer.

Generate complete CI/CD documentation for an Oracle APEX application. Output must be plain Markdown text only. Do not use code fences except Mermaid diagrams. Do not include explanations about your process.

Required sections and exact numbering:
1. Overview / Introduction
2. System Architecture
5. User Guide
6. API Documentation
7. Database Documentation
8. Security Documentation

The documentation must satisfy these requirements:
- Overview: purpose, business problem, target users, key features, scope, limitations.
- System Architecture: high-level architecture diagram, components/services, frontend, backend, database, third-party integrations, cloud/infrastructure details, how system works internally, how components communicate.
- User Guide: screenshot placeholders, navigation instructions, workflow examples, FAQs, troubleshooting tips.
- API Documentation: endpoints, request/response examples, authentication, error codes, rate limits. If APIs are not detected, clearly say that none were detected and where to add them.
- Database Documentation: ER diagram, tables and relationships, data dictionary, stored procedures, indexing strategy.
- Security Documentation: authentication, authorization roles, encryption, audit logging, security best practices.

Use the config as user-editable truth for business/security text. Use the metadata as extracted technical truth. Do not invent secrets, credentials, table columns, endpoints, or cloud resources that are not present. If something is missing, explicitly say it was not found and should be supplied manually.

USER-EDITABLE DOCUMENTATION CONFIG:
{json.dumps(config, indent=2)}

EXTRACTED APEX METADATA:
{json.dumps(metadata, indent=2)}

APEX SQL EXPORT EXCERPT:
{sql_excerpt}
""".strip()


def extract_text_from_response(chat_response: Any) -> str:
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


def call_oci_genai(prompt: str) -> str:
    client = create_oci_client()
    content = oci.generative_ai_inference.models.TextContent()
    content.text = prompt
    message = oci.generative_ai_inference.models.Message()
    message.role = "USER"
    message.content = [content]
    chat_request = oci.generative_ai_inference.models.GenericChatRequest()
    chat_request.api_format = oci.generative_ai_inference.models.BaseChatRequest.API_FORMAT_GENERIC
    chat_request.messages = [message]
    chat_request.max_tokens = 12000
    chat_request.temperature = 0.05
    chat_request.frequency_penalty = 0
    chat_request.presence_penalty = 0
    chat_request.top_p = 0.75
    chat_request.top_k = 1
    chat_detail = oci.generative_ai_inference.models.ChatDetails()
    chat_detail.serving_mode = oci.generative_ai_inference.models.OnDemandServingMode(model_id=CHAT_MODEL_ID)
    chat_detail.chat_request = chat_request
    chat_detail.compartment_id = COMPARTMENT_ID
    response = client.chat(chat_detail)
    return extract_text_from_response(response)


def clean_generated_document(text: str) -> str:
    text = text.strip()
    text = re.sub(r"^```(?:markdown|md)?\s*", "", text, flags=re.IGNORECASE)
    text = re.sub(r"\s*```$", "", text)
    return text.strip() + "\n"


def is_strong_document(text: str) -> bool:
    if len(text.strip()) < 1500:
        return False
    required = [
        "1. Overview / Introduction",
        "2. System Architecture",
        "5. User Guide",
        "6. API Documentation",
        "7. Database Documentation",
        "8. Security Documentation",
    ]
    return all(part.lower() in text.lower() for part in required)


def generate_documentation(config: Dict[str, Any], metadata: Dict[str, Any], sql_text: str) -> str:
    fallback = build_fallback_documentation(config, metadata)
    if not oci_ready():
        print("OCI GenAI configuration is incomplete or OCI SDK is unavailable. Using deterministic fallback documentation.")
        return fallback

    try:
        prompt = build_prompt(config, metadata, clean_for_prompt(sql_text))
        generated = clean_generated_document(call_oci_genai(prompt))
        if is_strong_document(generated):
            return generated
        print("OCI GenAI documentation was incomplete. Using deterministic fallback documentation.")
        return fallback
    except Exception as exc:
        print(f"OCI GenAI documentation generation failed: {exc}")
        print("Using deterministic fallback documentation.")
        return fallback


# =============================================================================
# Output
# =============================================================================

def markdown_to_txt(markdown: str) -> str:
    text = markdown
    text = re.sub(r"```mermaid\n", "[DIAGRAM - Mermaid]\n", text)
    text = text.replace("```", "")
    text = re.sub(r"^#{1,6}\s*", "", text, flags=re.MULTILINE)
    text = re.sub(r"\*\*(.*?)\*\*", r"\1", text)
    return text.strip() + "\n"


def write_outputs(markdown_doc: str, metadata: Dict[str, Any]) -> None:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    DOC_MD_FILE.write_text(markdown_doc, encoding="utf-8")
    DOC_TXT_FILE.write_text(markdown_to_txt(markdown_doc), encoding="utf-8")
    METADATA_JSON_FILE.write_text(json.dumps(metadata, indent=2), encoding="utf-8")

    if DOC_ZIP_FILE.exists():
        DOC_ZIP_FILE.unlink()
    with zipfile.ZipFile(DOC_ZIP_FILE, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for file_path in [DOC_MD_FILE, DOC_TXT_FILE, METADATA_JSON_FILE, DOC_CONFIG_FILE]:
            if file_path.exists():
                zf.write(file_path, arcname=file_path.relative_to(ROOT_DIR))


def main() -> None:
    try:
        print("Oracle APEX Documentation Generator")
        print("CI/CD Jenkins Edition")
        print("-----------------------------------")
        print(f"Root directory: {ROOT_DIR}")
        print(f"APEX SQL file: {APEX_SQL_FILE}")
        print(f"Documentation config: {DOC_CONFIG_FILE}")
        print(f"Output directory: {OUTPUT_DIR}")

        sql_text = read_text_file(APEX_SQL_FILE, required=True)
        config = load_or_create_doc_config()
        metadata = extract_metadata(sql_text)
        markdown_doc = generate_documentation(config, metadata, sql_text)
        write_outputs(markdown_doc, metadata)

        print("\nDocumentation generated successfully.")
        print(f"Markdown: {DOC_MD_FILE}")
        print(f"Text:     {DOC_TXT_FILE}")
        print(f"Metadata: {METADATA_JSON_FILE}")
        print(f"Bundle:   {DOC_ZIP_FILE}")
    except Exception as exc:
        print(f"\nERROR: {exc}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
