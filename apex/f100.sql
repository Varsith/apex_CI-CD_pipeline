prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.15'
,p_default_workspace_id=>8916125031794706
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CHAITHRAINTERNS'
);
end;
/
 
prompt APPLICATION 100 - PAGE_VIEW
--
-- Application Export:
--   Application:     100
--   Name:            PAGE_VIEW
--   Date and Time:   08:02 Monday May 11, 2026
--   Exported By:     INTERNSHIP
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     17
--       Items:                   31
--       Computations:             1
--       Processes:               12
--       Regions:                 45
--       Buttons:                 13
--       Dynamic Actions:          9
--     Shared Components:
--       Logic:
--         Build Options:          1
--         AI Configs:             3
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:             12
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--         LOVs:                   1
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         24.2.15
--   Instance ID:     8915909673146236
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_CHAITHRAINTERNS')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'PAGE_VIEW')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'PAGE-VIEW')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'B2B4932CDAF48316FB378F450F34C0ED67BCE833BCFC56DF14EEDB540B07D3B6'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'24.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(8922435154801302)
,p_application_tab_set=>0
,p_logo_type=>'C'
,p_logo=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="custom-header">',
'    <img src="#APP_FILES#app-100-logo.png" class="logo">',
'',
'    <div class="header-text">',
'        <h3>University FAQ Platform</h3>',
'    </div>',
'</div>'))
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'PAGE_VIEW'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>20
,p_version_scn=>46961340418009
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_ai_remote_server_id=>wwv_flow_imp.id(8949055400057388)
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(100)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>true
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>2526754704087354841
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(10556638079677396)
,p_nav_bar_list_template_id=>2847543055748234966
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --workspace/credentials/credentials_for_fte
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(8948791220057384)
,p_name=>'Credentials for fte'
,p_static_id=>'credentials_for_fte'
,p_authentication_type=>'OCI'
,p_namespace=>'ocid1.tenancy.oc1..aaaaaaaab72ycc65ujcqftrkbfizd4bqddd2o4y6d25kgk46txrjt6phhgyq'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://inference.generativeai.eu-frankfurt-1.oci.oraclecloud.com',
''))
,p_prompt_on_install=>true
);
end;
/
prompt --workspace/remote_servers/fte
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(8949055400057388)
,p_name=>'FTE'
,p_static_id=>'fte'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('fte'),'https://inference.generativeai.eu-frankfurt-1.oci.oraclecloud.com')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('fte'),'')
,p_server_type=>'GENERATIVE_AI'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('fte'),'')
,p_credential_id=>wwv_flow_imp.id(8948791220057384)
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('fte'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('fte'),'')
,p_prompt_on_install=>true
,p_ai_provider_type=>'OCI_GENAI'
,p_ai_is_builder_service=>true
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('fte'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('fte'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('fte'),'{'||wwv_flow.LF||
'  "compartmentId" : "ocid1.compartment.oc1..aaaaaaaatm34bplxwjpdfrxalb7w633njcl3z2ggblblvetwykljhndxooea",'||wwv_flow.LF||
'  "servingMode" :'||wwv_flow.LF||
'  {'||wwv_flow.LF||
'    "modelId" : "cohere.command-a-03-2025",'||wwv_flow.LF||
'    "servingType" : "ON_DEMAND"'||wwv_flow.LF||
'  }'||wwv_flow.LF||
'}')
);
end;
/
prompt --workspace/remote_servers/fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(8955529527823327)
,p_name=>'fbqlo27omnh6zn7v2hpkkqykhi-apigateway-us-ashburn-1-oci-customer-oci-com'
,p_static_id=>'fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'https://fbqlo27omnh6zn7v2hpkkqykhi.apigateway.us-ashburn-1.oci.customer-oci.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_prompt_on_install=>false
,p_ai_is_builder_service=>false
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('fbqlo27omnh6zn7v2hpkkqykhi_apigateway_us_ashburn_1_oci_customer_oci_com'),'')
);
end;
/
prompt --application/shared_components/data_profiles/fte
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(8955721929823330)
,p_name=>'FTE'
,p_format=>'JSON'
,p_row_selector=>'items'
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(8955923216823342)
,p_data_profile_id=>wwv_flow_imp.id(8955721929823330)
,p_name=>'COLUMN_1_ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(8956283167823343)
,p_data_profile_id=>wwv_flow_imp.id(8955721929823330)
,p_name=>'COLUMN_2_NAME'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>2000
,p_has_time_zone=>false
,p_selector=>'name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(8956560940823343)
,p_data_profile_id=>wwv_flow_imp.id(8955721929823330)
,p_name=>'COLUMN_3_HIREDATE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_has_time_zone=>false
,p_selector=>'hire-date'
);
end;
/
prompt --application/shared_components/web_sources/fte
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(8956862306823345)
,p_name=>'FTE'
,p_static_id=>'fte'
,p_web_source_type=>'NATIVE_OCI'
,p_data_profile_id=>wwv_flow_imp.id(8955721929823330)
,p_remote_server_id=>wwv_flow_imp.id(8955529527823327)
,p_url_path_prefix=>'/api'
,p_version_scn=>46523576007312
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(8957082460823350)
,p_web_src_module_id=>wwv_flow_imp.id(8956862306823345)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(8957479759823354)
,p_web_src_module_id=>wwv_flow_imp.id(8956862306823345)
,p_operation=>'POST'
,p_database_operation=>'INSERT'
,p_url_pattern=>'.'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(8957808656823354)
,p_web_src_module_id=>wwv_flow_imp.id(8956862306823345)
,p_operation=>'PUT'
,p_database_operation=>'UPDATE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(8958238436823355)
,p_web_src_module_id=>wwv_flow_imp.id(8956862306823345)
,p_operation=>'DELETE'
,p_database_operation=>'DELETE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/ai_config/demo
begin
wwv_flow_imp_shared.create_ai_config(
 p_id=>wwv_flow_imp.id(16118370933967474)
,p_name=>'Demo'
,p_static_id=>'demo'
,p_remote_server_id=>wwv_flow_imp.id(8949055400057388)
,p_system_prompt=>'just answer the question correctly'
,p_version_scn=>46742966498149
);
end;
/
prompt --application/shared_components/ai_config/generative
begin
wwv_flow_imp_shared.create_ai_config(
 p_id=>wwv_flow_imp.id(33753110725688244)
,p_name=>'Generative'
,p_static_id=>'generative'
,p_remote_server_id=>wwv_flow_imp.id(8949055400057388)
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are an Oracle Certification Program (OCP) Support Assistant.',
'Answer customer issues in ONE response using two knowledge sources:',
'1. RESOLVED CASES: Real Oracle support tickets with proven solutions.',
'2. FAQ DOCUMENTS: Official Oracle Support FAQs and policies.',
'',
'ANSWER RULES:',
'- Give ONE direct answer. No follow-up questions.',
'- ALWAYS check the knowledge base FIRST before applying any rule.',
'- If the knowledge base has a matching solution, USE IT regardless',
'  of the issue type. Knowledge base always takes priority.',
'- Never invent steps not in the knowledge base.',
'- Do not mention "RESOLVED CASE" or "FAQ" to the customer.',
'- Write plain, simple, actionable steps the customer can do.',
'- Do not include steps that require Oracle analyst backend access.',
'',
'EXAM INTERRUPTION RULES:',
'- These rules apply ONLY when NO matching solution exists in the',
'  knowledge base.',
'- If knowledge base has a solution for the exam issue, use it.',
'- Only if NO solution found: inform the customer the attempt',
'  cannot be recovered and direct to Service Request.',
'',
'CERTIFICATE AND ACCOUNT RULES:',
'- Certificate not visible: may take up to 2 weeks after exam.',
'- Account merge: guide customer to profile settings.',
'- Only if NO knowledge base match for backend issues (account',
'  sync, testing ID, reinstatement, subscription): set',
'  confidence_score "0%", direct to Service Request.',
'',
'CONFIDENCE SCORE:',
'- 85-100%: Strong match found in knowledge base.',
'- 60-84%: Partial match, most aspects covered.',
'- 30-59%: Weak match, general guidance only.',
'- 0%: No match found in knowledge base at all.',
'',
'OUTPUT: Return ONLY raw JSON. No markdown. No backticks. No extra',
'text. Response is parsed by JavaScript using JSON.parse().',
'',
'{',
'  "issue_title": "Short issue title (5-8 words)",',
'  "confidence_score": "XX%",',
'  "steps": [',
'    "Step 1",',
'    "Step 2",',
'    "Step 3"',
'  ],',
'  "additional_info": "Extra context or escalation note here."',
'}',
'',
'FIELD RULES:',
'- issue_title: 5-8 words describing the issue.',
'- confidence_score: percentage string e.g. "85%".',
'- steps: array of 2-8 plain text strings, no HTML, no bullets.',
'  If no self-service steps exist use:',
'  ["Please log a Service Request for further assistance."]',
'- additional_info: 1-2 sentences. If unresolved end with:',
'  "Please log a Service Request for further assistance."',
'  If resolved end with:',
'  "If the issue still persists, please log a Service Request."',
'',
'UI DISPLAY:',
'- issue_title: Bold heading in AI solution panel.',
'- confidence_score: Shown as "Confidence Score: XX%".',
'- steps: Shown as numbered list 1. 2. 3.',
'- additional_info: Shown below divider as supplementary note.'))
,p_version_scn=>46622179149084
);
wwv_flow_imp_shared.create_ai_config_rag_source(
 p_id=>wwv_flow_imp.id(33755667618734630)
,p_name=>'demo'
,p_rag_type=>'DATA_SOURCE'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT content FROM (',
'',
'    SELECT',
'        ''RESOLVED CASE - Topic: '' || BUCKET_TOPIC',
'        || '' | Description: '' || BUCKET_DESCRIPTION',
'        || '' | Solution: '' || BUCKET_SOLUTION AS content',
'    FROM WKSP_CHAITHRAINTERNS.UPDATED_MASTER_DOCUMENT',
'    WHERE BUCKET_DESCRIPTION IS NOT NULL',
'      AND BUCKET_SOLUTION IS NOT NULL',
'      AND TRIM(BUCKET_DESCRIPTION) != '' ''',
'      AND TRIM(BUCKET_SOLUTION) != '' ''',
'      AND UPPER(LABEL) = ''GENERIC''',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''FAQ - Category: '' || NVL(SUBTYPE, ''General'')',
'        || '' | Question: '' || QUESTION',
'        || '' | Answer: '' || ANSWER AS content',
'    FROM WKSP_CHAITHRAINTERNS.FAQ_DOCUMENT',
'    WHERE QUESTION IS NOT NULL',
'      AND ANSWER IS NOT NULL',
'      AND TRIM(QUESTION) != '' ''',
'      AND TRIM(ANSWER) != '' ''',
')'))
);
end;
/
prompt --application/shared_components/ai_config/tech_support_conversation
begin
wwv_flow_imp_shared.create_ai_config(
 p_id=>wwv_flow_imp.id(10602244763827263)
,p_name=>'Tech_Support_conversation'
,p_static_id=>'tech_support_conversation'
,p_remote_server_id=>wwv_flow_imp.id(8949055400057388)
,p_system_prompt=>wwv_flow_string.join(wwv_flow_t_varchar2(
'You are an intelligent support assistant that follows a structured conversational diagnostic flow for handling user issues.',
'',
'GENERAL BEHAVIOR:',
'- Handle the conversation in at most two user inputs (excluding the initial greeting).',
'- Use reasoning over known root causes (RAG knowledge).',
'- Do not provide the final solution in the first response unless the root cause is clearly singular and unambiguous.',
'',
'CONVERSATION FLOW:',
'',
'STEP 1:',
'- The user describes their issue.',
'- Analyze the issue and identify possible root causes.',
'',
'DECISION BEFORE RESPONDING:',
'',
'- If ONLY ONE clear and confident root cause is identified:',
unistr('  \2192 Do NOT ask a follow-up question.'),
unistr('  \2192 Directly provide the step-by-step resolution for that root cause.'),
'',
'- If MULTIPLE possible root causes are identified:',
unistr('  \2192 Acknowledge the issue.'),
unistr('  \2192 Ask exactly one follow-up question listing the possible root causes in bullet points.'),
'',
'FORMAT (when multiple causes exist):',
'"This issue may be caused by:',
unistr('\2022 Root cause 1'),
unistr('\2022 Root cause 2'),
unistr('\2022 Root cause 3'),
'',
'Which one best matches your situation?"',
'',
'STEP 2:',
'- The user selects or describes their condition.',
'- Based on the selected root cause:',
unistr('  - If it matches a known root cause \2192 provide clear step-by-step resolution.'),
unistr('  - If multiple interpretations still exist \2192 clarify briefly.'),
unistr('  - If the response is insufficient or ambiguous \2192 do not attempt further resolution.'),
'',
'ESCALATION RULE:',
'- If the issue cannot be resolved confidently after two steps:',
'  - Respond exactly:',
'    "If the issue still persists, log a ticket."',
'',
'SPECIAL DOMAIN RULES (EXAM-RELATED ISSUES):',
'',
'- If the issue is exam-related, possible root causes:',
'  - Network interruption',
'  - System crash',
'  - Platform glitch',
'',
'- If the user selects:',
unistr('  - Network interruption OR system crash \2192 inform the attempt cannot be recovered and say:'),
'    "If the issue still persists, log a ticket."',
unistr('  - Platform glitch \2192 instruct user to log a ticket and say:'),
'    "If the issue still persists, log a ticket."',
unistr('  - Others or unclear \2192 escalate as above.'),
'',
'RESPONSE STYLE:',
'- Ask only one follow-up question at a time.',
'- Be concise and structured.',
'- Do not expose internal reasoning.',
'- Keep responses user-friendly and clear.',
'',
'GREETING:',
'Start the conversation with:',
'"Hi, how can I help you?"'))
,p_welcome_message=>'Hi,How can i Help you?'
,p_temperature=>.8
,p_version_scn=>46569407045681
);
wwv_flow_imp_shared.create_ai_config_rag_source(
 p_id=>wwv_flow_imp.id(10602585812844326)
,p_name=>'Demo_Rag'
,p_rag_type=>'DATA_SOURCE'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ''BUCKET NO : '' || BUCKET_NO AS col1,',
'    ''BUCKET DESCRIPTION : '' || BUCKET_DESCRIPTION || ',
'    '' BUCKET SOLUTION : '' || BUCKET_SOLUTION AS col2',
'FROM BUCKETS',
'',
'UNION ALL',
'',
'SELECT ',
'    ''BUCKET DESCRIPTION : '' || question AS col1,',
'    ''BUCKET SOLUTION : '' || answer AS col2',
'FROM FAQ_DOCUMENT;'))
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8924354769801468)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
,p_version_scn=>46563662181146
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8936385673801563)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8936852083801564)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(8936385673801563)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8937228865801567)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(8936385673801563)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/nav_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(10556638079677396)
,p_name=>'nav menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>46606870785751
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10556857740677399)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'FAQ Review'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10557292590677401)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Problem Management'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10557663091677402)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Published FAQ'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10558078859677402)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(10561077553695870)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sign out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-in'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000003B3494441547801EC96D96F8C5118C69F736669A74C6B2DA589ADADA04809FE057141DC54E246C2850B0409B1A4B595200809372E48DC48F446B810FF82B569D4';
wwv_flow_imp.g_varchar2_table(2) := '52A5B62ED4DA8E9ACEF67DDEE7E89974F3CD34D234919EF4CDF932DFFBFCDEE7BCE7CCE968779487C6288F3103631DC8AE03AE0BD771E0A652D985E44234D99C6F6F0302615127D683D4CF08925D9D123F3244A7C9A586DA4C46863620859D4402F16F5F';
wwv_flow_imp.g_varchar2_table(3) := 'D072F5129A6AF6E1E98E4D68D85A29B12143549A5C6AA82583ACBF19196480AD4ECA6A3FDFB9896752F4D3AD5A44EA1E20DED18E6444BA904530971A6AC9208B4CB2076E4B7F03B272B6FAF3DD5B66E589EF5FE13A29E8501E42B3E662FCA2A5082FAEF0';
wwv_flow_imp.g_varchar2_table(4) := '0CE630578742464B063B4126D9901A7D4DF433C07DEBAA7F84B6EB57E0C463D08120728B67A1A4FA14E69FBC84D2C3675172E88C673087B92555A78C960CB2C8249B35863620CED8A68EDBB5707AA2523C80BCB20528ABB9202B5E86C0C4C9F087F3E11F';
wwv_flow_imp.g_varchar2_table(5) := '1FF60EC9616E78C972A3CD2B5B68586492CD1A7DBBA0D13BD8EAE8DBD7E86E7A0EA5147C029AB3BB1AC1C2E9503E1F863BA8A176CEEE2AC3524A19366BB096E5A50DF0A476D6DD839B8843F9FDC899518C9CA299C68C4D1EEEAC94320CB2C824BBB3EE3E';
wwv_flow_imp.g_varchar2_table(6) := '58CBB2B47D709349C4DA5A614EAACF8F71F3CBA174FAB54D1BF64C06591026D9B1B616B09605FDBD826B5346764E1B50A6EDD272AE3A9544F78B863FDDF8C7FA5C75776303204C76C36E87C5A60DE840000515ABA0E4ABC716C5DA5B106BFD00F9C16473';
wwv_flow_imp.g_varchar2_table(7) := '873D531B6B6F95ADFDD376B20B2A5682B52C4CDB07A57D08CD9E8771A50B4CD164A40BCDE78E20FEA91DAEB8B779D9CEAEFCE38A777CC49BF3C7911216CD90CD1AAC6539690372DCCDF7BB706D2574AEDC62C904A2CD4D68ACDA89AEFA87E08D4653FC1E';
wwv_flow_imp.g_varchar2_table(8) := '7B8614636EE4C963BCACDE855F2F9F99534F26D9BC47586BB001F944E7E4227FE972CCD8B8053A986384B1B60F787DE2201AF76F43D3D13D78756CAF6730A7F1C076BCAAD98F9E9677C2881B1699646BA921A5D27F3AFDC407A5E0939B6EEAEA7528DEBC';
wwv_flow_imp.g_varchar2_table(9) := 'DDDC7E6C97138D22FAFE0D7E3EAD47E4499D673027FAAE194EF417A8E5AD48169964F75D3D64F437201F28ADCD564C5DB31E0B2F5EC3B475950857AC901BB108FE7038AB081616190DB56490C5D6938D01639001F35E29F0A406274D319D28AD3E8D4562';
wwv_flow_imp.g_varchar2_table(10) := 'A6FC722DCA2FDFC810B526971AAE9C0CB206AE1CBD636803BD2F29E29DCE7D63FBFCF905F0E74FC81005661BA9A1960C8B1B6AF6366015D211B68FC0AC420B563456EE354BA6D7EB917F3766E0FFEF40A653F41B0000FFFF74C790C40000000649444154';
wwv_flow_imp.g_varchar2_table(11) := '03007C86CCDF0310447F0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(8925447306801486)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800001000494441547801EC9D7D9055E57DC7BFE7DEBDECB22FB2CBCB82202022609DA49228B5981AB5B593AA23134C8D8D993499DA683269AA62A7190D09108D367F08';
wwv_flow_imp.g_varchar2_table(2) := 'E46DACB6A4C96462464DC4620D719A148D6DA813634CCCA880C83BC22EB00BFBC2EEDEB77EBF87BB1418E03E77CF73CFCBDEE7CC79F6DC97E73CCFF7F779BEE7799E73EED97B53708B23108080335000786E57C019C8B920100167A040F8DCCECE40CE03';
wwv_flow_imp.g_varchar2_table(3) := '8108380305C2E7767606721E084460C4060A54ABDB79D41070061A354D194D20CE40D1701F35B53A038D9AA68C261067A068B88F9A5A9D81464D53461388335034DC474DADE11BA80CBA62B138F79474239FD77A3ACEA40CBED0DF8EDC4034C7D54CCB99';
wwv_flow_imp.g_varchar2_table(4) := '3630154960D329691D9FD77A3ACE448C98C44BE96AB289748DC4400420D30C1B6603092C638A1C06352465152F259F2179CA4CCBA3101FAA8118A86F1C062AD338C31084A555665A46BE5A433552280662543A42343C39E35872CC598A09D548553790CC';
wwv_flow_imp.g_varchar2_table(5) := 'C360758470E3D61009C84855EF8DAA66201A6778B872E609D135A7542513699E54B5E942550C24F33010CBC3154B74EB4808C83C55339175039D609E9104EBF6A91E81AA98C8BA8118BF1BB20821A6ABF5B6B16A20F63E9AB4A9CB8C29BF9A97A579A9DA';
wwv_flow_imp.g_varchar2_table(6) := 'C81A086B062A99C7BAC3AD45EA0A1A26A089B53513593310D539F3104242566B6D65C540A5DE2721EC9C4C11609B59996A58311005597334CBB2BDBAF24E4FC04A9B0536109D6C6D3C3D7D9CEED52A11D0843A702F14D840550ACE151B0E81C0BD900D03';
wwv_flow_imp.g_varchar2_table(7) := '0516110E2B57CB690844DB0371F80A2CE03441B997422410B40D83F640CE4021367695AA0AD486410D54A5985CB12112B82A485D410D34AAE73F41C02668DF687A208E9D731304C9493D0B81206D19B4073A8B2CF7562D107006AA8556AE628C410C34AF';
wwv_flow_imp.g_varchar2_table(8) := '8ABA5CD1092110C4400909D1C9342030E2CEC019C880AECB726602C93750B1089412CF26F8B080624129CF2D533E8274629D05D6EF276A2A2AFDBF5E48F799DB2611EF24DA40BE61D858F9FE3EF4ED78078736BE84FD6B9FC09EEF7E1BBB1F5B89DD8F32';
wwv_flow_imp.g_varchar2_table(9) := '691B652A6990266993466995E622B52B864438E50C229365201EB1C55C0ED9AE83E87F670BBA7FF902B63E7C3F5EBBF53ABC71DB62BCB36209763DB60AFB7EF403EC5FF763EC7F3626895AA449DAA4515AA559DA158362514C8A2D69BD52220CA421297F';
wwv_flow_imp.g_varchar2_table(10) := 'B41FFDDBB6A2E3D9A7B06DD503D8F2E5BBF0F6035F40D77FFD0485C14120D30078296851FE382669F33552AB344BBB62502C8A49B12946C52AFD7EFE98FF39463CC622D5CD1FDDBE157BBEFF28B67FFD01F630AB71F8E5973074A093731F0AF73CFE49E8';
wwv_flow_imp.g_varchar2_table(11) := '2AED9C122916C5B4EBB1D57E8C8A55312BF6B847165B03E908CCF5F660FFBAA7B065F9127470DBB7E90DF6F0245EEA69E20EB7227D8C49F321C5A85815B3621703B1A8A8AC1033C7D040450E490338CA49F1962F7E0EBBFE6535863AF6C39F1F840826CA';
wwv_flow_imp.g_varchar2_table(12) := 'AA14AB6256EC62201685C1014AE2C1C3BF715AE365204E92F3FDFD38B8E1796C7DF05EF46E7A0BE029799C805557CB29A5337631100B31111B76C1A7648AF6697C0C44F314B243D8F7E31F60CFF71EC1C0CEEDD1928951ED6221266223467132513C0C44';
wwv_flow_imp.g_varchar2_table(13) := 'F368ACDFB6EAABD8F7E4F7789A7E08D004136EF1099045B6EB90CF468CC42A2E268ADE4025F3BCFBC477D1F5DF3F47219BF59905FA43E05E3A0DAFAE2E1E895A6C1C1062234662151713456E204D0E3BD6AF45E7FA67500C621E9ECD67264C42F37BE6A3';
wwv_flow_imp.g_varchar2_table(14) := 'ED03D760C2B53760E2751FC6A4EB6F8A344983B44893B465264CE4B131F2C9B018899598891D0B8B748DD440C57C0EDDBFFA253AD63E8E7C5FEF084014916E6EC1B8CB1662DA27EEC0F977DE8759772DE5F65ECCF8CC12CCF8DBBFC7F4DB3E1F69920669';
wwv_flow_imp.g_varchar2_table(15) := '39FFCE7B4BDAEEC3546A1D77E91F23DDD4CC982B3793588999D889210B896C8DCC40BAB691EDEEC6EE35DFE29CA7AB3200A9143C14D072C9025CF4B54730EB9E659872F327D0BAE00A349C3703752DE3901EDB88547D03537DC4A9C1D7224DD2D6BAE003';
wwv_flow_imp.g_varchar2_table(16) := '38F7A37F8D59FFB00CF3A8BDF9BD9732769A88D781F8C078CD76751D6347866269BCA3E58C29CBE59915C7794FBEAF073BBEF92006F6EE34DBA794CBAB4B63ECF4999879CF72CC5DB1128D17CC41A66D3C52993100E73E88FB428DD29A699B80A6D97331';
wwv_flow_imp.g_varchar2_table(17) := 'EFFE5598C95EB361C64C7FBE56897CB113C37C5F0FA29A544762A062218FAE8DBF40CF6BAFC04BA58D997963C6A06DE1D598B5E4CB98C4394EAA419F7F71F2635C42CC327A1E520D63D1FEA145B88031B52DBC0A8A11868BD889A1588AA9E16E56B3A5AC';
wwv_flow_imp.g_varchar2_table(18) := '966652187B9FA1CE0E74FDE267C8EB4350937D043A93C1A41B6EC2F43B96A069EEC548446F03C385F12926C5A618538CD5343E31144B318DA2170ADD40851C27CE2FB3F7F9EDAF8CBB5D75F9936FBA15D33E761BC64C9C0453B848D242132936C5A85815';
wwv_flow_imp.g_varchar2_table(19) := 'B3917C1E903D64D94DA6626BB48FC54CE11A88C1EA0CE2C86F5EE1F59E9C5918A91427CB9762D25F7C1875E78C33DB27C1B914E3245E7E68997F19C0D84D422964731053B10DBB170AD540C56201831DEFA2E7F7BF31E1E2E7A99F722EA67EEC6F503F65';
wwv_flow_imp.g_varchar2_table(20) := 'AAFFBC16FED44F9E5A71CC622AB6621C26A3500D847C1E07FEF339E48F749BC548C3B52FBA058D732EC2A81CB6708685C359E3851761F2E25B019E709C21D7492F8BA9D88AF1496F54F9497806E2F095EDE941F78BEBD935973FF3F23C0FCDEF7D3F26F1';
wwv_flow_imp.g_varchar2_table(21) := '0CC5783E5065586116AF89F4C46BAF47CBFC3FE2B1E395AF9A67B3622BC6950C63E50B3E7B8ED00CA48B5D837B7622D7DB7776457A97E6D1E758533EF2715E04E4A9BA5EABC1A40BA15316FF15BC4C1DE822945B72BDFD1063B12E97D7D6FBE11988C351';
wwv_flow_imp.g_varchar2_table(22) := 'DFDB6FC2F44CA17EDA74345E380F9EE144D216903895A3D83594D54F9D6E244B6CC538CC7950680642BE8023BF7D9507924195345BEBE55722336EBC11B8D19CA9AEB50DADBCC008322917A7E7793E63B12E97D7D6FB06AD69A7AA4276084737FD0E7410';
wwv_flow_imp.g_varchar2_table(23) := 'CA2DE9735AD138E70FA07940B9BCA3FDFD545D06EA85C404E5161A488CC5BA5C565BEF8763204DA0BBBB78EDC7EC5E9F31E327F282613B4CCC86D1BED0143E0F7E7666126A219B4596AC41E626F983E609C74054993DDC6D1C53BAB111758D4DDCCBAD22';
wwv_flow_imp.g_varchar2_table(24) := '50D7D48C7493190FF946ACB55F182924031591EFED81A98374F6E1D53784117F22EA100B3131124B07F9AC5134CA3EE24CA51DC331106329660769A052AD67DBB0CBF6326378EA9A395BAE9A7ACFE387AB626234A457C2DA02C5700C6441A82B229E04C2';
wwv_flow_imp.g_varchar2_table(25) := '31102FA47A997A805B945BD80517878682DD1F5DAE8E84BDAFFBA08B3C8B359A0290B1316B0B1CC231109DA37B97C1E1C944B36E162F0C1C35C95A13798A8303FE7FEB1A054BC63E6BD049463B04CB149281C08B82AD606C466A737D3DC88DE8267BA3E2';
wwv_flow_imp.g_varchar2_table(26) := '139729D7DF877C7FBF916E31CE8C6B35CA6B2353CA462165CB6054195E5135BD30983D7410D9CE0E4EBA39232C5BF828CFC0217DE84007860E1D300A548CC5DAF868352AF5CC99C23110EBD727EA63E7FDA19129F2BD47D0BBE975148678E6C67D6B792D';
wwv_flow_imp.g_varchar2_table(27) := 'F0C260FF9637CD6E81A1D9C458ACC36256B98146AA2C9DC23997BC9FF3C042F912BC94FF1D40FAD62EEE503EFF28CE913D7C08DD2FBF049009CA2C451A488C41D665B25A7B3B34037904D074213FDFAAAB2B2F9E20F4F526FD9BDFA47F6A7718D36D19FD';
wwv_flow_imp.g_varchar2_table(28) := '6F6FC2E09E5DE59931478A6CC558ACF93494353C03A552A89F360375CD8697E47339ECF9E17738791CC97FAC86C2AEEA95E86C54DFC8A1EF0BE29154B6BEBAE6469FB16E03299BD95286D00C04CF43A6A505AD575D0718DCA6A9EEF8E83B9BB1EF992738';
wwv_flow_imp.g_varchar2_table(29) := '171AB2146E728A29F0BA4FE7F3EBD0FBFAABF48E412F4CA6622BC6621D56A4E1194811A5D398F8E737C0E8D604E5E7B077F0F97FC791DFBD4AD319CC9DB4CF68481CC2357475AC7B122003182C622AB6206383ECD6B2846A208F30EADBCF45CB7BDE671C';
wwv_flow_imp.g_varchar2_table(30) := 'C0D0814EEC7BF2DF7074D776E37D929E7170DF5EECFDE11A686B1A8B988AAD189BEE63235FA80682E741DF4871CEFB2E432A63309906171E8DBD6FBC8E8EFFF811747D88AF8CEA3577E4303A7FFA0C7A5EFBB571AF2B96622AB6621C26A0100D742C2C9D';
wwv_flow_imp.g_varchar2_table(31) := '29B45EFE41B45CB200A6C116F37974FE642D767DE75B18DCBB8B60F318750B0F14F5B67BD8F3EC7FFA71680E6414230F4AB11453B135DAC762A6D00D24D38C99D48EB60F5E8B743D3F603509867065A2431B7E8A1D8F3C7C6C4E64708FB049D1B1C8C3F8';
wwv_flow_imp.g_varchar2_table(32) := 'FA36BF815D8FAE44E7734FD33C5970E66C244D0CC5524CC5D668278B99C23710C57BA934DA16B2179A7F192AF9560999E8F0AFFF173BBEF1907F76A6DF9B00E1B3C864AED45E181840E7CF9EC3B6955F41D7C617501C323FE314BB1632144B318D024224';
wwv_flow_imp.g_varchar2_table(33) := '06D291926E6AC1CCCFDF8786A9332A8BBB50C0C0BB7BB0FBB15578F39E4FA36FCB5B9C1B75A2A08F3DD820951516416E6AD4F094ED3A04FD46C6E6654BB0E3E1E53C49D88162AEB2A159ECC4502CC5348268908AA252D5E9A552C8B4B6E2BCDBFE0E99B6';
wwv_flow_imp.g_varchar2_table(34) := '3654B4B011B8E2E8F6B7F1D63F7E065BFFE94B7897171DBB78C95F676BB9C3DDD0EF4DE8425C617010D1A6015F4BAEE7300676EFF4BFD26FDF53DFC7B68757E0AD2F7C16FA668D22D80C3C302A6120663EBBD656786459C9BE36F352B9CDE22A2BCB4BD7';
wwv_flow_imp.g_varchar2_table(35) := 'A175C115685F7CAB7F7656D9DECCCDEB6BBA6FA887D789F63EBE06DBBFFE10B6ADBA9FDB07B1F39195D8F9AFDFC0AE35DF8C3449C3CE7F5E494DD4B6FA016E1FF47FF7E3F02B1B8FDD270E8F8154B6A69B9A7D6662278695ED6D3777A4065228BA59BCFD';
wwv_flow_imp.g_varchar2_table(36) := 'BAC5D0579AE8DE5FBD36A2C46B4CB9AE83E8E3297FD7C61771F0E7CFE1C0FA6778F6F674A4491A0E728ED3F53F1BD0FBFBD7903DD8C909F28822F4771223B11233B1F35F8CF04FE40682E7F1F3B1169C7BCBA7D0F6277F865426732A8ECA9F737CD384BB';
wwv_flow_imp.g_varchar2_table(37) := 'C8CFD362917819C2C6645F6CC448ACEA9A5B2076887889DE40025032D1ACBBBF88291FFD24E744E3799416F58E4B22C00322D336DE67234671318FA4C5C340524213E946287D23C7B44F7E160D33CED7AB2E9180588889D888511C7A1ECAF2D7F8184872';
wwv_flow_imp.g_varchar2_table(38) := '6822FD57EA846B3E84D9F73D84E6791701A9784994CCD012631703B11013B1899379C42186ADE34193C3B1332FC09CAF7E1BD33F7D17C6B44F865767F8D91992BF2856C5ACD8C5402CC404F010B72586063A8648D73634D64F5E7433E62C5F89766E9BE6';
wwv_flow_imp.g_varchar2_table(39) := '5D0CCF23C4D1F431C6B17039E72BF8B12946C5AA9815BB1888C570B6B86D636BA06150FAD59DB1E7CF2EFD16C6524CBFFD2E8CBBFC4AE82B71412FD938BB19AE2BF42D27C78A41B12826C576FE9D4BFD5815B3620F5D538515C6DE408A4747A07EFBA271';
wwv_flow_imp.g_varchar2_table(40) := 'D66CB4DF783366DDBD1473BEB21A172EFD1ADAFEF47A0E79F54076C03F8A87F36B9FB82569837A4F6A4DF1836469570C8A45312936C5A858A5DDCF1FF33F8930D071861CBE343FC8B44DF07F23A3F58AAB31FB9E2F61FEE3EB71F19AB5B860D94AF65077';
wwv_flow_imp.g_varchar2_table(41) := '63CA5F7E1C93177D04936F8C49A216699A7EFBDDBE4669956669570CC77EEF63C2B1791E633C1E6F021E24CB40A700F53C0FEAE6D38D4D68E2A47BFCC22B3179F12D98F6A9CFE1BCDB97E0BC3B98B48D3295344893B449A3B44AB3B47B9E774A54C97A9A';
wwv_flow_imp.g_varchar2_table(42) := '6803F9A8D500A5E4791E3C2F0575FF5E2ACD2D533AE234AC83A7E4BE36CF034E4C48F6924A696CDA880000025249444154B67CA73E6A02410CB4296AF1AEFEE809043150F4EA9D025B0446DC1938039DAE09DC6BC6049C818C51B98CA723306203799EB7';
wwv_flow_imp.g_varchar2_table(43) := 'F97405BAD7924720485B8ED840254C2F94B66E935C022B82480F6AA0178354EEF64D3E81A006723D50F23D10A80D0319886367A0CA93CF3EF911046DC340062AE173262A810012F720D0FC47D1DA3050601112E2523209043650A90B74BD5002DB9F6DB7';
wwv_flow_imp.g_varchar2_table(44) := '3CA8ECC0062A0970BD500944823656DACC8A81E864D70325C83992CA360BDCFBA81C2B0652414C561CCD72DC5A7D02D6DACA9A814A8EB626ACFA0C6BB68615A5B6B202C09A81A4A624CC0D678251590A2BF70BA536B2569F55039554B95EA80422861BEB';
wwv_flow_imp.g_varchar2_table(45) := '6D63DD4074B87AA06B6208AFD6255D536A1BAB1CAC1B48EA4A42652299492FB9141D01B54155CCA390AA6220152C1331C944D6BB4D95EF9211014D98AB661E29A89A8154B8124DA4EB0DCE4482116E9279C4BEAAB556DD40522F1331797CEC8C4408555C';
wwv_flow_imp.g_varchar2_table(46) := '87872BE1AEBA791447280652454A8C6A39D3B0919C990425602AED3E6C9CAA0E57A5BA4EDA846AA0E19A6922194949661A9E2739430D032ABF9561C44B86214E4F5BBD567E4FCB392231D08931789EE75FDCE276D850F3F8FE705AC4C7B59E8659F85B72';
wwv_flow_imp.g_varchar2_table(47) := 'D22AC3885724A6619B1C5F2337D07125A507A4B3F984F42C1FD77A3A9147ECFE132676062AF9C86D1242C01928210D155799CE40716D9984E872064A4843599769A94067204B206BB51867A05A6D794B713B03590259ABC53803D56ACB5B8ADB19C812C8';
wwv_flow_imp.g_varchar2_table(48) := '5A2DC619A8565BDE52DCCE409640D64E312747EA0C74320FF7AC4202CE40150273D94F26F07F000000FFFF98684BCA00000006494441540300E060A4B7B7A4BEB40000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(8925774821801488)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700001000494441547801EC5D09941C55B9FEAA97D9334BF6C4EC138820068931802028AB8281F3141454140E82C84378099B26404CC2AE8407624E04DF03591444F120';
wwv_flow_imp.g_varchar2_table(2) := '8B0202B21908101E6109094926CBBCECC92C999EAD97F2FF2ACB09B3747A72ABBAABBAFF3E5D99EEAABAFFFDFF6FE9AABAB7BA13B2F5A10814300221E84311286004D400054CBE960EA8015405058D801AA0A0E9D7E20BD8004ABE22A0A740AA81024740';
wwv_flow_imp.g_varchar2_table(3) := '8F00052E80422F5F0D50E80A28F0FAD500052E80422F5F0D50880AD09AF720A006D80385BE284404D40085C8BAD6BC070135C01E28F4452122A0062844D6B5E63D08A801F640A12F0A0181AE35AA01BA22A2EF0B0A01354041D1ADC57645400DD015117D';
wwv_flow_imp.g_varchar2_table(4) := '5F5008A8010A8A6E2DB62B026A80AE88E8FB8242A0800C5050BC6AB11922A006C81028DD2D3F115003E427AF5A558608A80132044A77CB4F04D400F9C9AB569521026A800C810AF46E9A7CAF08A8017A8546371402026A804260596BEC15013540AFD0E8';
wwv_flow_imp.g_varchar2_table(5) := '864240400D50082C6B8DBD22A006E8151ADD900F08ECAB0635C0BE10D2ED798D801A20AFE9D5E2F685801A605F08E9F6BC46400D90D7F46A71FB42400DB02F84747B5E2390C706C86BDEB43897105003B804A4860926026A8060F2A659BB84801AC02520';
wwv_flow_imp.g_varchar2_table(6) := '354C30115003049337CDDA2504D4002E01E9AB309A4CC608A80132864A77CC4704D400F9C8AAD69431026A808CA1D21DF3110135403EB2AA35658C801A601754762A85425A76959D777FFA5A50411920D11A43FBA60D88AD5A81E6258BD1F8FA2BD8FEE2';
wwv_flow_imp.g_varchar2_table(7) := '33D8FAECE3D8FAB73F63CB938F16C4C25A59336B2706C48298101B62D457110579FFBC3640A26507762CFB105B9E7902F5FF7327D6DE7513D6DC7923EAE6CDC5AA5B6761E54D33B1E2869F62E5DCABB0EAE699A8FBE5AC8258582B6B766A170C88053121';
wwv_flow_imp.g_varchar2_table(8) := '36C48858113362470C832CF07DE59E770648C53BD1F8D61B5833FF17F8F89A4B5077CB4CACBBFB76AC7FF83E6CFDFB5FD1F4C6AB685BF63EE25B3620D5DE0A2B1245A8BC4A966A84CA2A0B6329975AA566D64E0C8805312136C48858113362470C892531';
wwv_flow_imp.g_varchar2_table(9) := '25B6FB1254D0B6E78D01DAEAD762CD3DBFC292B34EC0AA39D3B0F9AF8FA2E583F7D151BF0E49391258E108ACA21247F00887014B4AE782027F10032E8289251F060E46E1888319B12386C49298125B624CACF305355141704BB11309B47CFC11965EFD9F';
wwv_flow_imp.g_varchar2_table(10) := '8EF0373DB400F1583B929D899D4509A9088500CB823EFA8800312376C4509A1253624B8C6904624EECC9816C0EEC53D411B0DC6D1BF1C606EC78EF2D2C9B351D1F9C771A76BCF51A4215D5B04ACA03564CF0D225C6A18A6A0773624F0EC80539817013B4';
wwv_flow_imp.g_varchar2_table(11) := '8A0265005E90352C7C09ABE5FCFEC30BCF44F3EB2F836458D1A2A0E11EF87C8939B12707E4829C901B7214A4E20261008ECFC7E45467DD3D7760F5BC396878FE6984AA0681240409EC7CCC951C900B72426EC811B9226741A8371006D8F4D45FB0522E6C';
wwv_flow_imp.g_varchar2_table(12) := 'B73EF33812CDCD2A7C1F2A8B462037E4885C91331FA6D92D255F1B20116BC1D2AB2E46FD5D37A063D366495E2E66796126AFF4E943041C6E2C872B7246EEC8A10F33DD93922F0DC0C367F3874BF0DEB953B163F142D8560408C9D0E59EB4F5C52710F0DB';
wwv_flow_imp.g_varchar2_table(13) := '1BE18A9C913B72482EC9A9DFD2643EBE3340B2BD0D5B5FF83B56CD9E867843032C199B66A2BA040F0172470EC9253925B77EABC2570648757662F3137FC2BAF9B7A273DB7611BF8EEEF84D307DCDC78A14395C9253724B8EFB1AC3CBFD7D63003B9940FD';
wwv_flow_imp.g_varchar2_table(14) := 'EF1660FD037723B1432E74F593DF4BDEB31A9B4702724A6EC931B9CE6A02693AF38D01EAE65D8F4D7F7E10293905B2C272CE9F2669DD143C04C829B925C7E4DA2F15F8C20075FF7D23B63DF7049C99446724C12FF0681EAE22406E65B6985C937337629B';
wwv_flow_imp.g_varchar2_table(15) := 'C6C8A901781F49FD03F760DBB38F0396A46259C8DA4388809D12D3C9C24EE5BD057BE77B3B297FF3714961678D52A753734AEAE4B2EB3DD779BD9063E19A9C937B6AC0EB2ED3C517D5A5DBECDDB6543C8EADFF7C165B9E78040E0804C6BBEE76464E2561';
wwv_flow_imp.g_varchar2_table(16) := '27E3B0A251446BFAA364D870948F3F1055871F8D2167FC00C37F380D232FBB16A3AFBC212F17D6C61A592B6B66EDC4205A53032B12819D880382D14EB03CFC57B826E7E49E1AA0163CEC2D6DE8DC18403E6D63CBDEC786071720BE6D0B20E3C669B334D9';
wwv_flow_imp.g_varchar2_table(17) := '287DD9F10E40845F5A3B01038E3D09C3BFFB438CB9620E0EB8E53738E8CEFB71E0EC791875C125187EC67730F494D331F884AFE6E5C2DA58236B65CDAC9D18108B61DF395FB03911A5E30E04129D703013EC4CA04FDB563827F7D400B5002FFB4A93484E';
wwv_flow_imp.g_varchar2_table(18) := '0C9088EDC0BADFDE89F635AB60458BD3A467B04900B53BDA601515A3FFF1A762CC65333066DA751833FD3A0C3FEB3C544F3E1C25438681176706BD04BA296B2706D5938FC0A7C400632E9FE560345AB0EA7FDCD7E01C150443AFC449EEA9016A819AC805';
wwv_flow_imp.g_varchar2_table(19) := '983931C0BA7B17A0E5BD776015977A53B30CA9F253ACE6B85371C0ECDB30FAC75760D0D7CF44C5819F46B84C6F99EE0D74625331E1200C9EFA2D8CBEF82A8CFFF96DA83EF664F0E8E9D5A91135402D5013BDE5E5E5FAAC1BA061D1426C7A683E2CE71666';
wwv_flow_imp.g_varchar2_table(20) := 'CBA0B69E9BA6DA63880E1C8C03E7DD8BDAABE7A0EAB029CEF97ECF7BEBDADE10E03552F5E423317EC68D187FF30244AA6B64883AD6DBEE06EB2D470BD404B5611068BF9A66D500F1A646D45D7F05C2D583F72BD9B48D38A2D3D98221675D88431F780255';
wwv_flow_imp.g_varchar2_table(21) := '874E42A84866922D2B6D33DD980601C18E18D6C829D2E77EFF370C3AE35C391AB403C43A4DB3FDD9444D501BD4C8FEB4DFDF36593300A7C0EBEF9B8F64875C90EE6FB63DB593737D6104A52346A1F6C6DF60CC4597C1D259E49E90325A474CC75D72256A';
wwv_flow_imp.g_varchar2_table(22) := 'E7FEDAC19A98C3C1DE28EC271A531BD408B5F2890D1EBEC99A019ADF7D1B4DAFFDC3DD5248807C4A557DE1688C9B7133FACB70A6BB1D68B4AE081063624DCC21D8BB6D026A845AE9DAAF57EFB36280787313B63DFF14E28D4D80E56297326155F3E59331';
wwv_flow_imp.g_varchar2_table(23) := 'EAA2E928AB95E13B4B4F77E0F5433026D6C49CD8433870AD4BD10635E2684534E35ADC34815C5463EFBDB47CB804CD6FBF2E3BB827D054EB0E541F733246FF681A4A3E35526217D0D307A51273624F0EC8857B29598E56A819F762F61EC97303F04BD28D';
wwv_flow_imp.g_varchar2_table(24) := '6FBC8CF8968D00EF05E93D978CB7D89D1D289F3805E37F76BD8EF0648C9AFB3B72A4881C900B72E24A0FA2116A859AA1765C89992688E70668AF5F83ED2F3E2B63FE2569D2C87C13A7EB4B468DC321BFBA0F5658BF25963972DEEC490EC845C9E85A391B';
wwv_flow_imp.g_varchar2_table(25) := '4AB8D289555CE26886DA7125609A209E1AC04E26D1B8E83524B66F022CF3AE6C99E02A1A3810E3647CDFB900833E7C818065A156E60B8A060E72C704A2156A86DAB145435ED668AECA34D9A5E45465CBD38F21E4C60F56C9884FB8B41443CF3A5F2E7827';
wwv_flow_imp.g_varchar2_table(26) := 'A4E95537E50281D2D1E330F4ECF365A6BD0C6E8C0C5133D40E35E4653D9E1AA069C93BE8ACAF93737FF353153B9544D5178E026F66E3E48C97A068ECBE23404E061C7302AAA61C0D72D5F7085D5A84C28E76A8A1BDB7B8FDDA53036CFCE3FDB04AE413C1';
wwv_flow_imp.g_varchar2_table(27) := '346B99792C1E3C04034FF9865EF49A62E961FB68757F0C3AF50C902BA452C63D513BD49071A034013C3300AFE09B5E784C66658BD2749FD9265B4E7F2A3E3309D59F3F22B306BA57CE10A8FADC64F43B4C78B2CC53E017EAA9216AC93C5ACF113C33C0B6';
wwv_flow_imp.g_varchar2_table(28) := '7FF1773B6B7AEEB52F6B45FC91D2120CFDF6B97D69A5FBE6108121DFFC1EC225C5EE5C0B54D4805AF2AA1CCF0CD0F8F27332F4697EFAC3F1E5CA2F1C83F2DA03BCC240E3BA8C40F9D85A541EF115D89DEDC691ADE23234BEF2BC719CDE02786280646B0C';
wwv_flow_imp.g_varchar2_table(29) := 'AD1F2E76E7F4A7A315C3CE3EAFB7FC75BD4F11182E9CD9C29D697A3C0DA296A829D3583DB5F7C400AD6B57C38DE12B4E7A951D3A056563C703E8297D5DE757044A478D45D96147821C9AE698EA680335651AA7A7F69E1820B66C296CDBFC2A8887D0C1A7';
wwv_flow_imp.g_varchar2_table(30) := '9F0D4BA6C77B4A5ED7F917017236F8B46FBB721A442D51535E54EB89015A577E24CE4F1AE76B77C430E08B5F328EA3017283C0A0634F801D37BF0EB0134950535E54E1BA013875DDB976394C2743EC640215538E47A8D4FC42DA0BE03466060884C3A898';
wwv_flow_imp.g_varchar2_table(31) := 'FC6590CB0CF6EE75176AC9D19407B745B86E00FE0624BFD903189E0225E2E877E82439FD319F45863E72828025B3B9FD264E92A340A761FF96F34D426ACB3050B7E6EE1BA06587383E09CB50FF76A213E572F16BE9F93FD08DB660AC2077E5E36AC15FE8';
wwv_flow_imp.g_varchar2_table(32) := '30C9985AB2E5D3DF8B0931D70D908CC5C4F109A9D7D001E1E8CE2975562FD1F419400484BBE2C14381489161F296A3296ACB3050B7E6A16E6B0C57C49B1B91EC94439E89FE532944AAFA235CAABFE1634847CE9B93437269746F9068899AA2B6DC2EC875';
wwv_flow_imp.g_varchar2_table(33) := '0370FC7FE77F8723591B641BAEAAC1CEDF0E3208A24D738E003924976689C811403E14A92DB338DD5BBB6E003B910092867702DA29842B2AC500D1EE19EB9A40216045A30E97322C6896B768CAD19659946EADDD3740BC536A353480A4192A2E01F40258';
wwv_flow_imp.g_varchar2_table(34) := '9008F8533874B8DCCF327637E359852DDADAFDDEADBFAE1BC0ADC4348E22900D045C3700CFF938FC659A7CAA436610E5BCCF348EB6CF3102C2A1C3A5611AD414B56518A65B73F70D10890061C3B05608C9A606D81C4DEA96B2AE081202763C8E644B3320';
wwv_flow_imp.g_varchar2_table(35) := '9CC2E4219AB2A82D93183DB435546AF788A1A262A99561EDEE1BFBB086A0D9321BDC8726BAAB0F11B0E5BC9D1F6666A9D98EA6A82DB338DD5B53A9DDD71AAC89565623CC5F65B60D82C88553A2691B92B11D0641B4A91F1048B6C59068DA0E08A7FB9D8F';
wwv_flow_imp.g_varchar2_table(36) := '68899AA2B6F63B462F0D5D3740B8BC5C862FE53488FFE15C2F9D66B43A9940DBFA7A57469432EA4F77721F01DB46C7E64D322C1E378C6D3B9AA2B60C03756BEEBA012215FDC05F0B93DABB75D69715BCE069AD5B099806EA4BA7BAAFAB0870E83256B702';
wwv_flow_imp.g_varchar2_table(37) := 'FC569749604A809AA2B64CE2F4D4D67D03F4AB44B8B858FAB265317886A3687AFB75E7C63A8328DA348708F036E61DEF2E068CFFBF06DBD15444B4E5763921B703D2A945A30E841532BB8DD90A47D0F6DEEB483437BA9DA2C6CB1202A9B656B42C7A1EE4';
wwv_flow_imp.g_varchar2_table(38) := 'D2A44B6AC9D154D84C533DE5E0BA01D84959EDA7E5B0679EAC555A812D2F3EC790BA0410816DFF7A055671B971E656240C6ACA38500F013C3140F98483605986A74092AC555C862D7F790805371C2AB507FDC9F3FFCD8FFF015651897129D41235651CA8';
wwv_flow_imp.g_varchar2_table(39) := '87009E18A06CD418B83166CB435F7BDD52347FB0A487D475959F1168958BDFD67717C99980F90D8DA1E25250535ED4EB8901C265E5283B78927C72771AE71CAAA8C18607EF368EA301B28BC0863FDC0B1EC14D7BB5139D8E96A829D3583DB5F7C400ECA8';
wwv_flow_imp.g_varchar2_table(40) := 'FA9813E1CA0F23C9C570ECA325687CE74D86D5250008C4567E8CE6375F8655C4D140B384A9A1EA2F1D6F16244D6BCF0C30E08BC720D5D290A6EBCC37A53AE3D8F4C8FFC24E26326FA47BE60C818D8FDC87445B3BE44210A60F6A885A328DD35B7BCF0CC0';
wwv_flow_imp.g_varchar2_table(41) := '498BAAE3BE011EC27AEB3CF3F5165A577D8C6D2F3F0F5E5C65DE4EF7CC36028D3277D3F2C162D1BEB55F5DEFDD88DAA186A8A5BDD7BBF9DA330330C9A1DFFA3EECF656BE345B2C0BF16D5BB0F5A947D1B171BD592C6DED1902F186EDD8FAF4633B6F7FB0';
wwv_flow_imp.g_varchar2_table(42) := 'CCA545ED50439E252C81CDB39420BD3DAB261E86A211638154B2B75D325E6F458AB04346833868D1AB000009FE49444154B63EF7249232C1927143DD312B08A43A3BB1EDA567D1F4E66BE0E89D71A7A2196A871A328E952680A706E050E8A053BE81547B';
wwv_flow_imp.g_varchar2_table(43) := '2C4D0A196EB2E4909A4C62F3630FA279C9E20C1BE96ED942A075E5326C7CE45EF9706A839CFFC0F441CD503BD49069AC74ED3D35006F8BA89E721422FD87404EDED3E591D9B650D801B86EEEE58837E92D1299819685BD6C1BAB6EB90E9D5BB7C092513B';
wwv_flow_imp.g_varchar2_table(44) := 'E31EED94A3196A871A328E972680A70660BF252346A3FF574E82CDAF387285E922264874C4B1E49CA948B6CBA78D693C6D6F84802D47E5F77F722EDAD7AE7247FC920DB542CD503BF2D6D3A7E706E0157CF5E1C7203A6828D2FF3852E675F25386DF185B';
wwv_flow_imp.g_varchar2_table(45) := '3AFD02B46FA807E41328F3D6BAA75B08F0A277C54DD720B664912B63FE4E5EA994A3156A86DA71D679F88FE70660EE15074F44A5F31FDCD97CEBCAC24996B6154B5177DB1CC4567C041D1E7505D68C83B4FFFF3AACF9CDED687CF91984CAFA65DC6EDF3B';
wwv_flow_imp.g_varchar2_table(46) := 'DA8E56A8997DEF6BBE47560C10ADACC280E34F45B4BA4A3EAD53E659EF8E100AA165C9DB5873C78D685EFC066C9D28DB8D8C777FE568DBBA7239D62E9887867F3E0339EF816B0F39F7A7461CAD88665C8B9B265028CD365737551EFA79541D7582AB3101';
wwv_flow_imp.g_varchar2_table(47) := '1919926B82D8F20FB1FA97D761D3937F813EBC4560FB1BAF62D58D3F95E1CE57E5C3CC062CE100EE3DA8116AC5BD88E92365CD00A1A2228C38F762ECFCB658FAA4FABC554CD0B9BD01F5F36FC2B26BA7A1B3717B9F436883F408D88938562FB8032B67FC';
wwv_flow_imp.g_varchar2_table(48) := '086DF56B656711BECBE2A736A8116A453AC8CA336B066035D1AA6A8CBDE69748366E86EB0F391DB2AD089A16FE134BCE3E115B5F7C16CE0F32C921DBF5BEDC0EE8D778821D27B89ADE5D8C7765D46DD3C377034515800BB3BCE8F2A026A80D6AA4CB264F';
wwv_flow_imp.g_varchar2_table(49) := 'DF66D500ACA466CA9118F2DD8BC1DF8B91632857B9BA5891A85C0B5858357B3A96CDB8140D0B5F92A9F98DD2958BD71EAE66ECCF601CE1697A671156CAF8FEF2E9E721BE75334225E6DFEEEA5EADED68819AA036BA6FF7764DD60DC072469E77112A3E7B';
wwv_flow_imp.g_varchar2_table(50) := '98CC0DB4F1ADFB8B1C0DAC9232EC78771156FCFC72D4CD9B8B8D7F9619E4F7FE0FCE7FB3239F6CEE771AFC88C9D6185A967F842D4F3E8A35F37F818F675D8E86179E0222454038E2498176479BA3056AC2930EF61134B48FED9E6C8E94F7C3C81F5E8A92';
wwv_flow_imp.g_varchar2_table(51) := 'D1E3C4FD1D9EF4C1A0BC7F08A1309ADF7C0D6B7F7D0B56DF3E07AB6FFB39EAEF5F80ED0B5F419B0CE5A53A3AB86B412E1C356BDFB4018D6FBD81F50FDF8BD5F3E6C0C14846D5B6BFF034ECCE0E58C5A570FB4217BB1E76BCC3D100B5404DEC5A9DD53F39';
wwv_flow_imp.g_varchar2_table(52) := '3100012D9F7008867DEF2244070C821B37CBA5438DBF31641597A3A37E0DB6BFFA0236FEF17E193A9D8B15337E8C8F2E3B07CB675E2A63DA7760FD9F7E8F8D4F3F8ECDFFF87B5E2EAC8D35AEBDE72E2C9F351D4B2FFD3E3EBEFA47E008DAFA877EEBDCCC';
wwv_flow_imp.g_varchar2_table(53) := 'D6B672997CDA4761458B419EE0D5239574B8A706A8054FFB4A53436E0C200985A2510CFCF2491834F5DBB0F8A3A7D9382D91A3018F0AB64CDF271A1AD0BE71236275ABD0F4F6426C7EEC01ACFFEDED5877C75CACF9C5CCBC5C581B6BDCF4A7DFA1498633';
wwv_flow_imp.g_varchar2_table(54) := '632B96CB4CFA7AF07CDF8EC76185A3E01153E8F1F6295C9373724F0D500BDE76D87BF49C198029118411E75C8001279D0E99CA95C5E6EAEC2C960558523E17EC7C6DEFFA0B2B2CDBF2710961678D522FE4C1DA9D65D77B59E5F953C44FAEC939B9A7063C';
wwv_flow_imp.g_varchar2_table(55) := 'EF334D07A280345BB3B469EC7FCDC08013A7029610914A411F798A00B9158EC93539F74395BE300081183BFD1A0CF9E6F764A8AD548631135CA54B1E216027130EB7E4985CFBA534DF18C00A4730E2071761F8391782BF01C99947BF80A4799821402E23';
wwv_flow_imp.g_varchar2_table(56) := '95550EB7E4985C9B4574AF75C8BD50E69138053E78EA191879F155281AD01F76C2FC7785CCB3D208260890437239F2C75782DC926393786EB7CDA1017A2E255C528A81C77D15E366DD8E684D8D9820DEF38EBAD6F708D889B8C321B924A7E4D66F49FBCE';
wwv_flow_imp.g_varchar2_table(57) := '0004C89299DCCA8327E2B3F73D817E938E8465CB35818C1B739B2E014040B82267E48E1C924B72EAC7CC7D6980DD4045CA2B70D0ADF331E29299281E325856DB70EB5B65124C9F6E23C0511E19682557E48CDC9143B7BB71339EAF0DB0BBD021A7FE076A';
wwv_flow_imp.g_varchar2_table(58) := 'AFBB1D034F3E1D91CA4AD871BD36D88D8D5FFE921372438EC81539F34B6EE9F208840178F82C3FE0D31879C1651833FD3AD41C7F0A524D5BD408E998CDD2360A9F5C901372438EC81539CB520A46DD04C200BB2BE497A46B8E3C16632EBE1207DFFD282A';
wwv_flow_imp.g_varchar2_table(59) := '8FE0EF8F3606CF08BB0B0AF05F47F82D8D0E07E4829C901B7214A4B2026500075899498C56D7A0DF672763C2EC79F8CCBD7F45BFC947212564D86EFC0097D389FED31B02C498581373624F0EC805397166F27B6BE8D3F5C133C05E405A91082AE4D4E8A0';
wwv_flow_imp.g_varchar2_table(60) := '5B7E8D890FFF0343BE7B11A2E5250817EDBA773D998473D1CCFB4FF66AA72F33408098F1A29618CAEEC494D81263624DCC893D3990CD817D86029B7997C44B478CC2E80B7EE218619C5C300F3EED4C547CE610148F188970453F702ADEEE6C07C7A64152';
wwv_flow_imp.g_varchar2_table(61) := 'ED14C0A54B9C827B4B0CB80826C4C6C1289970302376C4905812530A9F1813EB7CC1296F0CB09B9050B408D5930FC768B94E38E0FABB30F6EA1B30F2C269187ED6B918F8D5D35075F8D1289D7008A28386215452E61822156B422AD688546B73612CAC55';
wwv_flow_imp.g_varchar2_table(62) := '6AA6E08901B12026C48618112B6246EC8821B124A6C47637CEF9F237EF0CB03731BC20EB37E1600C3A792A469C7F29465DF2338CBE7406C64EBF16E3AE9A8DDA9FDD80F1336F46EDB5B762DC4F6FC0D82B6617C4C25A59B353BB60402C8809B12146C48A';
wwv_flow_imp.g_varchar2_table(63) := '98113B62B837A6A6AFFDD63EAF0DD015EC4859394A860C43F9B8F1A89C3809D5477C09FDBF7232069E743A067EED9B18F4F5330B6261ADAC99B5130362414C880D31EA8A5B3EBF2F2803A42392E3D685B4A4C3A290B6A9010A896DADB51B026A806E90E8';
wwv_flow_imp.g_varchar2_table(64) := '8A4242400D50486C6BADDD10C8A201BAF5AD2B14819C23A006C839059A402E115003E4127DED3BE708A801724E8126904B04D400B9445FFBCE39026A806C50A07DF8160135806FA9D1C4B281801A201B286B1FBE45400DE05B6A34B16C20A006C806CADA';
wwv_flow_imp.g_varchar2_table(65) := '876F115003F8969AFC48CCEF55A801FCCE90E6E729026A004FE1D5E07E47400DE07786343F4F115003780AAF06F73B026A00BF33A4F9798A808706F0346F0DAE08B882801AC01518354850115003049539CDDB1504D400AEC0A841828A801A20A8CC69DE';
wwv_flow_imp.g_varchar2_table(66) := 'AE20A0067005C62E41F46D6010500304862A4DD40B04D4005EA0AA310383801A20305469A25E20A006F002558D191804D40081A12A1889062D4B3540D018D37C5D45400DE02A9C1A2C6808A80182C698E6EB2A026A0057E1D4604143400D1034C6345F57';
wwv_flow_imp.g_varchar2_table(67) := '1170D100AEE6A5C11481AC20A006C80ACCDA895F115003F89519CD2B2B08A801B202B376E25704D4007E6546F3CA0A026A003760D6188145400D1058EA347137105003B881A2C6082C026A80C052A789BB81801AC00D1435466011500304963A7F241EF4';
wwv_flow_imp.g_varchar2_table(68) := '2CFE0D0000FFFF1DF97873000000064944415403004B027B629684C0750000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(8926055803801488)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801EC9D099C1C6599C69FAABEE6CACC6432242433994C128822EB8F4B5C71450997EC72F85351105D8889B8C2AEE0CA2EB21E0BA8CBA2EB89822E';
wwv_flow_imp.g_varchar2_table(2) := '982C444014707FCAB18040504450C0C8B2C826E44E26E764EEB3A7BB6BDFA7D2C30EC3C464A6EEAAB7535FBABBA6EBABEFFDBFCFF7D4575FF561426F4A40092496801A406253AF812B01400D4055A004124C400D20C1C9D7D0934D80D1AB019082162590';
wwv_flow_imp.g_varchar2_table(3) := '50026A00094DBC86AD0448400D8014B42881841250034868E235EC6413188D5E0D609484DE2B81041250034860D2356425304A400D609484DE2B81041250034860D235E46413181BBD1AC0581AFA5809248C801A40C212AEE12A81B104D400C6D2D0C74A';
wwv_flow_imp.g_varchar2_table(4) := '206104D4001296700D37D904C647AF06309E883E57020922A00690A0646BA84A603C013580F144F4B912481001358004255B434D368189A2570398888AAE53020921A0069090446B984A6022026A001351D1754A202104D4001292680D33D904F617BD1A';
wwv_flow_imp.g_varchar2_table(5) := 'C0FEC8E87A259000026A000948B286A804F64720B1066059D649E5728DDCAF1A53E4A12E3127309A6FE69EE5A4FD7590B8AF4F8C0188A0D9E147136F49625795CBD5724F018C1679AA4BCC098CE69AB967A12E442216EF6908D7C429FE3F154B6C0DC0DA';
wwv_flow_imp.g_varchar2_table(6) := '7784673299D4D10E3F9AF83FC544FF965C02D4070DE16AD10F176A871AE2FA5852899D0148D6EC23BD648B47782633B6C9931875F19600B5430DD108445A56EC4606B13000C98CDDE9E5DE123DB0E33371F2501725E02A81D191014705B13083481B8074';
wwv_flow_imp.g_varchar2_table(7) := '78BBE34B8AB5D30B045D7C23C05101CD20F446702022913400EDF8074AABFEDD2702AF1A814FFB737D37913300E9FC1C7AE911DF752968850E08703420D2B4A84D07D5F8BF69640C40E88E0EF7E9BAFE93D23D2A810313A01144CA04226100D2F909558F';
wwv_flow_imp.g_varchar2_table(8) := 'FA0716A0BE2278023401916CF0A3818341117A031092ECFC7AD43F986CEA6BC244804640ED86A94DAF6B4BA80D403BFFEBF2A52BA24520F426105A03D0CE1F2DA56B6BF74B20D426104A03D0CEBF5F31E91FA249C0771338584CA13300EDFC079B3A7D5D';
wwv_flow_imp.g_varchar2_table(9) := 'C40884D204426500DAF92326696DEE640984CE04426500425367FB05822EB126401308CD6755426300E5A37FAC33AFC1298132014F0F74E57D1CD45D280CA0DCF94303E5A0C8E98B94C0D409F05DADA1788F40280C40386AE71708BA248A40284E050237';
wwv_flow_imp.g_varchar2_table(10) := '80F2D13F5199D76095409940E007BE400DA0DCF90387504E86DE2901BF09F054C0D509C1C90610A8014CB6B1FA7A25104302811E000333003DFAC750CA1AD25408043A0A08CC00A6424AB75102312510D828204803082CE8988A48C38A2E0157E601A612';
wwv_flow_imp.g_varchar2_table(11) := '7E2006501EFE4FA5BDBA8D12882501E91381984020062019D4A3BF40D045098C2110489FF0DD008272BA31A0F5A1120823814026037D3700211FC85047F6AB8B12083B8129F78DA906168401BC6BAA8DD5ED9440CC09F8DE37823000DF5D2EE6A2D1F0E2';
wwv_flow_imp.g_varchar2_table(12) := '43C0F7BEE1AB01C8F97F283E01151FBD68247123207DC45713F0D500E2962C8D4709784060D257039CB4C16F03F0FD1CC7091CDD5609C49D80DF06E0EBF026EEC9D3F86249C0D73EE29B01F87D6E134B6968508920E0675FF1CD002473BE3A9BEC4F1725';
wwv_flow_imp.g_varchar2_table(13) := '107B024E03F4D3009CB655B757024921E0DBC1D24F03D009C0A4C857E3744AC0B7BEE2A7013885A2DB2B0125E032013F0DC0B7618DCB8CB43A25104A026E34CA4F0370A3BD5A8712480201DF0E966A00499093C6A804F643400D603F6074B51248020135';
wwv_flow_imp.g_varchar2_table(14) := '80246459638C1D01B7025203708BA4D6A3042248400D208249D3262B01B708A801B84552EB51021124A00610C1A46993934DC0CDE8D500DCA4B9BFBA2C0B56A904AB5894528055903232026B248F527E38D1850C2CB22093A2702123610561B63F9CBADE';
wwv_flow_imp.g_varchar2_table(15) := '3D026A00EEB17CB526BBB38BA0D9B90B7DBD18DCBE0DBDFFFB123A9F7D1AED8FFE1776FDECC7D871D70A6CBFED26B4ADB8016DCBBF9DCC22B19301599009D99011599119D991A16D9834855709EB03B708A801B845528E5856A988E2C000FAD7ADC19EC7';
wwv_flow_imp.g_varchar2_table(16) := '1EC2B6E5DFC5A6AF5F8DCDDFFA22B6DCF8156CBDF91BD8BAFC3BD876EB4D68FBE1CD68BBF307D8F1E35BB1E3EE95C92C123B19900599900D19911599911D19922599922D19EBE8C02DD1026A002EB02C0E0DA1FBC5D5D2B96FC4DA2B3F868DD77DC63EA2';
wwv_flow_imp.g_varchar2_table(17) := 'EFBEFF6E743CF9387A563F8781B52F23BF6D0B8ADD9DB0F279219F8291AD8291AB867DCFC7492BE5D861A66C266443466445666447861C219129D96E5D7EA3CD9ACC5D485DE4AA70BBC16A005320CA73F9627F1FFAD7BF826D77ACC0DAAB2EC1A6EB3F8B';
wwv_flow_imp.g_varchar2_table(18) := 'DD3FBF0B3D2FBD88C12D9B30D2B957CEF58B30D259291918A994747AC16D18000BF4F61A0264C2629A202B232DCC849D5528DA2CC9946CC998ACC99CEC9903E68239794D7DFAE4A0089807F52A7D914DA0249355C33BB6A1F3995F61F34D5FC3867FBD0A';
wwv_flow_imp.g_varchar2_table(19) := 'BBEFB90DBD72F41FDAB903A5E161983939AA672B44C469684787F39B61C048A565945461B32563B22673B2670E980BE684B9618E9CEF343935A8011C44AE2D99D0A3B83A9F7A1C5B6EFE16B6DCF02FE858F5100637AD0727AA8C4C166636074386B28075';
wwv_flow_imp.g_varchar2_table(20) := '1035EA4BA646C0B219DBAC8539D93307CC0573C2DC3047CC157336B57D246B2B358003E4BBD0D38DEED5BFC3E6EF7D1D1BFFE54A743DF5840C49BBC021A73DBC97A3D301AAD03F7B44C01E19F034412E1D8E7476D9B9618E982BE68CB9F368D78154EBC5';
wwv_flow_imp.g_varchar2_table(21) := '4ED50026A22A33FAC5E12170E6B9ED472BB0FEDA2B445C8FC34A65013947B58B614CB4A5AE0B82007351CE0B73D4252335E68CB9630E994BBD72307162D400C67391CE3FBC6B07DA1FFC29365CFF7939C75F099E571A999CBC523BBD4008F96280B962CE';
wwv_flow_imp.g_varchar2_table(22) := '76DFB3D2CE2173C99CAA09BC3E756A00E398F4BCF0FCBEEBF42BBF8FA12D1B00330D188A0951BB3167923BE6B04D72C9F71930B7510BC3EBF6AAB2CB840B72596FF703F762CB4D5F9509BE8751EC1F90CE2F97EE0CA3FC0ABD8B1C01E64E266699CB8E55';
wwv_flow_imp.g_varchar2_table(23) := '0FDBB9658E0B92EBA8C5E2557BD50038E4DFBD0B3BEFBD1DDB56DC80FEB57F14D6D2E94D452320E2B1D8B934ECDC32C7CCF5B0E45C4F098064ABBC54C2E0B62DD871D77F60F77FDE89425717CCCA6AC080DEE2464072CADC32C7CC3573CEDC433410B750';
wwv_flow_imp.g_varchar2_table(24) := '27134F720D4012CF7797B5DDFA3DEC7DE4E7723DBFCF9E3CD2A3C264E413B1D7CA688F138485BE3E3BE7CC3D3590641348A6018810FAD7AFC1A6EF5C8FCE5F3FBA6F965FAFE747AC374FBDB97CFF00AF1230F7D400B51066E39F7AA407DE327906C0CEBF';
wwv_flow_imp.g_varchar2_table(25) := '6E0DB6DE7203FAFEE7F74248C6869C2C9247BA2488809D73C3D600B5C0F70B24D104126700031B5E41DBEDB748E257EF53BB2D847D0F7DFF5FCCC81E7E168BB0F865188502ACC248CC8BC428B14262B6632703DFC1977758CE7DDFFFACB635416D94FF92';
wwv_flow_imp.g_varchar2_table(26) := '98BB4419C0D0F6366CBF73057A9E7F1A25E96CE0B5625F522DA30CD98FDDC9F343280DF6A334249719659D595D83744323B23367233BBB09B939CDB12E8C91B13266C62E086C166462091B32E23AF835132B1AA016A8096A831A41826EC9300039CAE43B';
wwv_flow_imp.g_varchar2_table(27) := 'F662C74F6E45D7D3AB501A1E92BEEF43E88674FC5211A5A17E50DCA96975A8683D0CB5C7BC050D279E8CC6779F8359E75E88D91FF938E65C74299A975D8EA6659F8A75618C8C9531337632200B32219B54CD34E13528A51F107620438F3BA4219709A909';
wwv_flow_imp.g_varchar2_table(28) := '6A831AA156C2723AE071E8F0A117781DC281EB2F0EF463EFA3F7A1E3173F43299F8791CE1C782327AF10C3810C73AD9161A46AEB5173E4D168587C06665FB00C2D977D1E0BFFF91B38ECDA6F61FEA7BF80E60F2FC5A167BF1F334F3F138D279D8AC6779D';
wwv_flow_imp.g_varchar2_table(29) := '12EF22313256C6CCD8C9802CC8A4E5B2CF61F6F9CB30E3E4770BB3A340C32443F074814C9DE4E400DB5213D4063542AD503307D824167F8EBD01F063A1FC64D89E9FFF04C5E111E9FC5978E6EE14A91CB50CD3B08FF48DA79E85A68B3E81D62BAEC182CF';
wwv_flow_imp.g_varchar2_table(30) := '7C1973CEFD08EA8F3E16D9861930E4A8130B05B91004599049FDD1C761CE791762C155D7D9CCE65CF837683CF54C54CC9B0FC8600AC2D6CBDC19E9ACAD116A859AA17610F35BEC0D6070F346EC7EE0A7E03BBF78F9477ABF372915715A8561397F9F8B59';
wwv_flow_imp.g_varchar2_table(31) := '1FB8102D975C81B997FE23669D752EAAE72F849915E3F166CFB1AB95ACAAE71F8643CFF9A030BC12733F710566BDEFC33247D22C13A479D846E049D416A8116A859AA1763CD94D882A8DB5018CF4F6A0FDB107D0FBFC6F00434235781881EB379E3FA664';
wwv_flow_imp.g_varchar2_table(32) := '326FF6872EC6827FBC16B3CF5B82DAA38F47A6B60EE03E59A0B74911203329645877EC9F63CE879662C1955F1473BD08666525C8DC93EF5E917D42B442CD503BD4D0A4DAEDE28BFDA84A7A851FBBF17F1F969C37763FF32BB4DF7F37AC9205BB23C2E51B';
wwv_flow_imp.g_varchar2_table(33) := '87FCF97ED41DFF76B4FEFD1770E87917D9E7AE6931030E6B5DDE5B62AB23CBF4B45A4C3BF228DB085A3F7D356A8F7B9B8C068600E6C06D3286016A86DAA186A825B7771196FAE26900220ABEB1A3FD91FB30D2D30D4EF0B80A5CEAB74A25A4ABAB30F3DC';
wwv_flow_imp.g_varchar2_table(34) := '2568FED865A83FE19DC888485DDD8F56F63A0299BA7A4C3FE15D987BF1E5E05504E680B980E4E4752F76B0829AA176A8216AC9EDFA1D34CDD54D636900FCB8272FE9F4BEF03B981595AE02835592FA2C54CC6D958E7F39E69CBF1435871F0133A3E7F802';
wwv_flow_imp.g_varchar2_table(35) := 'C697857304358BDE2413861FB573C05CC8504016E6C6BD26503BD410B5444DB95773786A8A9F01C8916060FD5A74FC7A152CCB10D22C72E7C662C9A98494CAD6C33077D92731E3B4B3906998014F4E2FA0B73F494086E964CF1C3017CC89245C4C4072F4';
wwv_flow_imp.g_varchar2_table(36) := '27379CCC1FE5544034442D515376FD93D9DCC16BFDDA347606501C1C40D7EF7E8D7CDB16F0FBE55D03291D1FA5022A172C429374FEFAB79DA8477DD7E04EBD228EBC980BE684B9618EDCECA8D410B5444D515B536F6938B78C970148271D6ADB8ACE271F';
wwv_flow_imp.g_varchar2_table(37) := '4349260101978EFE522F64E85FB5E848342DF93BD4CB041427A6A0B75010602E9813E6863962AEC09CB9D23AC3D61235456DB957AF2B8D735C49AC0CA0941F96CB7E0F62A47DA7747D973ABF20E6EFD1F16DAA733E7C31EADFF2E7EE8E2CA47E5D9C13E0';
wwv_flow_imp.g_varchar2_table(38) := '919AB9618E2AE4148D39735EEBBE1A0C511335D5FED883A0C6F6AD8DC7FFB131004B1C3FDFBE0B1D8FDD8F52A108982E85269710792D7AD6391F44DD71D2F9D3E978643E865118929B3A199D1DFADE0F21535FEFDE7C8068899AA2B6A8316ACD4B7C7ED6';
wwv_flow_imp.g_varchar2_table(39) := 'ED522FF1B3C913EFAB3434888EA79F44A1B37DE2174C65AD980A50C48C53CFC4F4779C0C335731955A741B1F0998B91CA6BFFD24CC38ED6C31808214F72605A92D6A8C5AF331244F77151B03287477A1E317F701A92C0C33E50234118E9CF7D7BCF95834';
wwv_flow_imp.g_varchar2_table(40) := '9EF15EA4F9AE3E176AD52ABC27909A568BC6D3DF839AA38E170370E7D2A0AD29D1163546AD791F853F7B8885019446F2E8DFF80A86DB36BB474D8EFEA9CA2ACCB9E06254CE6D115389052AF7F884B8264386EC95CD2D92BB8F215555E39A0930646A8C5A';
wwv_flow_imp.g_varchar2_table(41) := 'A3E6F83CEA2516AAE647377B9E7D1AA5A2B8BD6138CF49A904236562C699E7A2E68837BBFF4E42E72DD41A0E4080F301356FFC331C22733786299A28C9BCD001B639E09F0DC3D618B546CD1DF0F5537881DF9BC4C3007ABBD1FFF2EF017ECB8FCCD83A87';
wwv_flow_imp.g_varchar2_table(42) := '68213BAB0933CF381BA94A97DF49E8BC715AC34112485554A2F1B4B3909B3B5FB6101390FF1136893900001000494441549D2D5287688C5A2B8AE69CD5158EAD236F0056B180814D1B51E8E901C4A1E1F426437F2393C18CC567805F5DE54A9D4EDBA4DB';
wwv_flow_imp.g_varchar2_table(43) := '4F8D80E8217BC82C34BCF3749899B49C0AC8BCCED46AFAFFADA44E6A8D9AA3F6FEFF0FD17C147D03A023AFFB5F147AFB00C3857064A85831671EA61D7D3C52399DF547C46FA95C0EB5471D875C732B502AC0F14D3446ADF1034271F8C210177A8C63A48E';
wwv_flow_imp.g_varchar2_table(44) := '2A60128637BD82227FEFCD90219A93DA647BAB388269C7BC0595F316408FFE88FE4D725AD9BA10B5C71E0F7EE3B2E39C4A7DC5813E0C6F7E45EA73C150C6100EE261E40D20BFB71DF98E3DE2EE45E7FC8A45A4A6D5A3E60D47821F3B755EA1D6100602FC';
wwv_flow_imp.g_varchar2_table(45) := '2E81EAC38E40BA6E3AECEF1774DA28D1497EEF6E507B4EAB0A7AFBC81BC0C0964D18E9E90552728EE79066697810D56F3A0A15F31739AC49370F1B818A058B507DE4D1608E1DB74DB446CD517B8EEB0AB882C81BC0D0D64D287475C230538E515AC303A8';
wwv_flow_imp.g_varchar2_table(46) := '5EB010154DCD8EEBD20AC245A072CE5C542F3CDCFE7A76A72DA3D6A8396ACF695D416F1F7903C86F5B8F42F75EC074160ABF5526DD381B952D87E9E45FD0AAF460FF7C8B7045CB02A467CC0273ED6817A2356A8EDA7354CF988D837AE8ACD704D5EAF27E';
wwv_flow_imp.g_varchar2_table(47) := '4B2323287475C092FBF2AAA9DFC9E45FC5C23720D7C26BC653AF46B70C2F815C532B986348AE9DB6929AA3F6A841A77505B97DA40D80DFD9561C1E7667F85F2CA0AA692E72330F0D321FBA6F0F09E466CA086F4E93CCDE8F38DE0B4F03A83D6AD0716501';
wwv_flow_imp.g_varchar2_table(48) := '5610690328F67483BFE6E274F86FF39799DDEC8C469DFDB761C4F3BF4C5D1D728D33E514C0852B46721A40ED518351A6156903E01735963802300CC739303259A4EB1B60A4D38EEBD20AC24980B9658ECD4CCE71030DC3902B0AC3A0069D5616E4F69136';
wwv_flow_imp.g_varchar2_table(49) := '8091EE4E148786E07804605930AB6B919212643274DFDE13608E996B48CE1DED4D4600D41E35E8A89E80378EB4019486F3723E27C339C3691834801A9855D501A74377EF3501E6D8ACAE91DD38FC5C8068CE2A1465149097BAA2BB38ED398146CEB776BA';
wwv_flow_imp.g_varchar2_table(50) := 'F2810C391AF0B3FFA67EF22FD07CFAB173E638555905C72300692CB5470DCAC3C82E913680D2F0102C99BC73FCFE6E491F3F016878FDB3E1B21F5D8225C01C33D78E5B217300D41E35E8A4AEA0B78DB401040D4FF7AF04A24E20D206C02FE93452297786';
wwv_flow_imp.g_varchar2_table(51) := '73F91177DE50147545C4BCFD1CB2F34D3C8EC394D3466A8F1A745C57801544DA00ECE15CCA85CB76329C2B0EF6A134D81F602A74D77E10280D0EC2FE851FC9B9D3FD19A23D23E2A78D913600339795EBF61C01941CE652AEE90E0C88010C3AAC47370F3B';
wwv_flow_imp.g_varchar2_table(52) := '81D2403F4AFCEE0818CE9A6A956CED518353AD280CDB45DA003275D391AAA8004A25672CE56850EAEB41B1AFDB593DBA75E80914FB7BC4007A00C9399CDC4473D41E35E8A49AA0B78DB401A4E57AAE99CBC9151D87D774250B56218FFCDE3D288D44FBBA';
wwv_flow_imp.g_varchar2_table(53) := 'AE84A2CB7E08588542F9C363CE73CC5F07A2F6A8C1FDEC2E12AB236D00A9DA3A98D9ACF3110053954AD90690EFECE0332D312430D2DD25396E0724D78EC3931100B5470D3AAE2BC00A226D00FCCD3E7EE9A31B3F0469A43218DCBA05F95D3B034C87EEDA';
wwv_flow_imp.g_varchar2_table(54) := '4B02C3BB7762A06D2B8C94F389636A8EDAA306A7D2E6B06C1369033033997D1FE0917BC740451483EB5EC6D0E6758EABD20AC2496078CB460CAD5F2323808CE3061AA2B9747D03A841C795055841A40D80DCB2CD0B91AE9BE1F834C0304D947A3B31B865';
wwv_flow_imp.g_varchar2_table(55) := '3D0AFD7A39906CE3548AC34392DB7528B4EF0073ED283619FE5373D49EA37A42B071E40DA0626EAB8C02A6834332A73CCDCA1AF4BFB25684B2C96955BA7DC8080CB56D43FF86F53072558E5B46ADA5EBA783DA735C59C01544DE00AA5A5A91A99D06140B';
wwv_flow_imp.g_varchar2_table(56) := '8E511AD90A0CAC7911439BD60296F32B0B8E1BA415B8466068E35AF4FFF1059839177EEA4DB446CD517B53696098B689BC01F05B7CB20D87002E7C2B30781A303488DE975F44BE43668BC394296DCB940970F6BF6FCD4B28F676C1952B00A914B233664A';
wwv_flow_imp.g_varchar2_table(57) := '6944D46F913700239D46AEF570A4AA6B9C1FB579D44FE7D0FBC27318D828938196C33718455D1D7168BFE47470F306F4AE7E0E464A26FFE4B9A3B064FB54550D72F30E07B5E7A8AE106C1C0B03A83EEC8D484FA30138EFB086616064CF2E74FDEE291407';
wwv_flow_imp.g_varchar2_table(58) := '064290226D8213029CFCEBFDC3B318DABE197063942807056AADFAB037A80138498C5BDB1AA934AA5AE7235D5BEB7C04C0468901588522BA7EF90806B76D86E3EF90679D5A82212047EBFCEE1DD8BBEAA17D9FF494DC3A6E88D449AD5173D4DE64EB0BDB';
wwv_flow_imp.g_varchar2_table(59) := 'EB233F0220D0D4B43A541F712C20A703E2025CE5AC18C0484F1776FEE78F50E8EB7156976E1D1881E2E020763F741FF2BBDAA40D9254F9DFD92213C3A2316A8D9A73565738B636C3D10C67AD485555A3F6F813648427E188433BAB4DB636A49EA28C0256';
wwv_flow_imp.g_varchar2_table(60) := '3D80AE677E8DA87FEB8B4494B8C52A8CA04F2673F73E700FACA29C1ACA04AF6308A22D3365DA5AA3E61CD717820A44E9216885C32698992CAAE71F8E5CD33C87358DD95CCE172DCBC4CE7B56A27FDD1A5805E79719C7D4AE0F3D24C0D336BEAD7BFB9DB7';
wwv_flow_imp.g_varchar2_table(61) := 'A03828F3386E0CFDCBEDA5C6A8356AAEBC2AD277B1300066205D578F86D3CE068A79396F2F7295F322478DA14DEBB1FBBEBBC14F0A3AAF506BF08340A1A71BED0FFF0C7D2FFE1EE0680ECE87FF7CF30FB5458D516B98C22D8C9BC4C600CC8A4A349C7022';
wwv_flow_imp.g_varchar2_table(62) := 'D2D3DDBC362BC2310C743DF518F6FEE27E1407F42DC208F98DA76B9D4F3D8EBD8FDE0F1829299243B873A3B6A8316ACD9D1A83AF253606601806B28DB3D070CA5930D392F8929CF7B9C1578E20C5C121EC9673C98E271E41293FEC46AD5A870704789AD6';
wwv_flow_imp.g_varchar2_table(63) := 'FDFC6FB1EB673F01DFFC03D1842BBB112D5153D416356618EE998A2BED735089E960DBD06D6A6673683CE5AF90693C1496FC73AB81463A837CFB1E6CFFD10A39B2FC979A805B605DAC875FD1DDF5DC6FB1FD8E5B30B4691D0C99C371AB7A6A899AA2B6A8';
wwv_flow_imp.g_varchar2_table(64) := '31B7EA0D433DB132003A7E45D35C4C3FF11498291905B86902A9348677B6A1EDF69BD1FEE883FBAE2B872183DA0699F329A1EBF967D076EB7731B0F62548EF97E2D651DAB2B5444D515BD418A6700BEB26F13200A1CC5F7DA97FEB3B906D6A018F0AB2CA';
wwv_flow_imp.g_varchar2_table(65) := 'B58547957CFB2E6CFFE1CDD8F3F07D32272033CCAED5AE154D8500BFC2ADEB9927D1B6FC3B18DCB01672FE07373B2935442D5153D41662768B9D0130F9550B17A1E11D8BE5A125E962913B3716C3903A4DF08A40DBCA1BB1F3DE95186ADBEABAD1B8D1D4';
wwv_flow_imp.g_varchar2_table(66) := 'D8D721D7E4473AF6DA93B35BD9F965D82FC9815DE0D6CD92EA2C5B4BD4943C71ABE2D0D4133F0310B4FCA2C6FA131663DA516F4569C8E5AFFAA609980646BABAB0F3AEFF40DBCAEFA3E7BF9F47D1EDFD481CBA4C4C8047FDBE575EC6F6BB5660DB0FBE8D';
wwv_flow_imp.g_varchar2_table(67) := 'A1ADFCFE060330DC9533B5430D514BD414627873975858001906F8618DC6D3CF06BFB38DEF0A73B76906783A502A94B0F7F107B1F5DFBF8976B94C38BC6797BBBBD1DA5E4760A4B7075D4FFF4A3AFE0DD87DCFAD28F40F482E44C686F1BAD73A5941CD50';
wwv_flow_imp.g_varchar2_table(68) := '3BD410B5E4E4E8EFA41D5E6F2BE4BCDE4530F5F3679BEADEF64E349EF5011872C4860C195D6F8961C0486564E2E98FD87AE3F5320925A381D5BFB547077C379A27FB743D88F057489685FE3EF4BDF40276FEF8366CFAE697D0FDEC6F806C353CE998A215';
wwv_flow_imp.g_varchar2_table(69) := '6A86DAA186A825C4F4165B0360BE32D36AE5B2E0999876DCDB01AB24C5E26AD78B21971F2DCB40FB433FC5FAEB3E2B570AFE1D9DBFF9A5CC15B4CB6E8B9EEDD7F540C254A125B99232D2D38D9ED5CF62C78F6FC5867FBB1A3B7E740B8A620666AEC29BD6';
wwv_flow_imp.g_varchar2_table(70) := 'CA3E2569B6661A4F3913D490373B0A47ADB1360022AE9C371F33CF7C1F723367C9641DDFCF6F70B5FBC53061647228F4F460CFFDF7C869C137B0F9BBFF8A9D77FF10BD6BFEA8730493205ECAE7D1BF713D7691E34D5FC596EF7F0DBBEE5E89E1ED5B61A4';
wwv_flow_imp.g_varchar2_table(71) := '73808BD7F85FDB2CC3D608B542CD503BAFFD7BFC9E99F10BE9B51119E934EA8E792B0E39E78348E532B00A7978326C44F96618F2C0407ED77674FEEA516CBFE307D8FCCD2F62C3759F41DB1DCBD1F9EC33E0F7D35BFAE122E1B46FE1103F2F33FA5D7FF8';
wwv_flow_imp.g_varchar2_table(72) := '3DB6DF733B367CE5F3D8F4F56BD076DBF7D1FEE80318DAB45E0ECA322260C7B7F9EEDBCED5FFA55E6A831AA156A8196AC7E93EC2BE7DEC0D8009E04737679C7A361A4E7B0FCC6C564C6084ABBD2D2256235729572186D0BFE62574FCF231190DDC862D37';
wwv_flow_imp.g_varchar2_table(73) := '7D05EBBFF40F78E50B9763E3D7AEC1B61FDE829DF7DD8BDD8F3C80F6271E45BBBC2ED6456264AC8C79DB1D2BB0F11B5FC2BAAB3F85F55FFC34B6DCF065ECB873393A563D24E7FB7F40B1A70B1C55219586A7A60DD89AA036A8116A859A91D5B15F126100';
wwv_flow_imp.g_varchar2_table(74) := '144FB66106667F7009784987E78F3CEA789E5D9E4F9A26CC8A6A9895D5E0878986F9FD74FFBD1A9D4F3F813D8FDC875DF7DE8E1DB7DF8CEDB7DD846DCBBF8DB6E5DF8A75618C8C9531EFBA6725DA1FFE393A9E7C5CCEF39F9323FD3A147BBB61642B4066';
wwv_flow_imp.g_varchar2_table(75) := 'F6509F0C3D4E14B5404D501BD408B542CD78BCDB50549F0C0328A3AE98D38439172C45ED7127C0945303195796FFE2F59D0C5F6517BC74C809439A01056E98264A03FD2874B4835F5D95DFD126E7B9DB625D18236365CC2599CC132CD2D9AB4026ECF806';
wwv_flow_imp.g_varchar2_table(76) := '8FF65CE9E2DBB8EDEAF6F79F4C0E530BD404B5418DECEFA5715C9F28036002AB161C8EA68F5C8C9A3F3B864F65ECB7AF73EE7BE2F7FF325F202680540A8608DF105332D219C4BBA4ED58193318BB210CFCC63EBABFF2E8825AA026A88DD13FB9711F853A';
wwv_flow_imp.g_varchar2_table(77) := '1267001CDAF18D1D732FBE4C4CE058C99118405908F24497A410B0736ED91AA016A8096A2329E18FC6993C0360E472D4A95EF806B47EF22A4C7FC7A9E00F3C5A455E22E41FB5C49D00736D663376EEA9016A21899D9F794EA601D8919BA86C6945D3924B';
wwv_flow_imp.g_varchar2_table(78) := '30E3F47390AEA98135328CA40A0149B889F133C7CCF58CD3DF83A68F5E626BC03E154942FC13C4985C03200C534CA0B905B3CFFF2866BEF702A4EBEB511AEC977901FE514BAC08C8991E73CB1C33D7B3CF5F82CAA61678D5F9A3C22ED906C02CC95181EF';
wwv_flow_imp.g_varchar2_table(79) := 'FC3AF4FD1F41F3D2CB50BDE84DB2966A29C9BD2EB12050622E2D3BB7CC31739D3B641674B427FE07BDD904F871CF9967BE1F2D975E8986C5EF46AABA0A28E9FBF86D3851FD8F137D9243E69239656E9963E63AAA21B9DD6E1D018C235A7BD471685E7229';
wwv_flow_imp.g_varchar2_table(80) := '9A2EFC042A5A168809C8E4A05C2B1EF7327D1A7602CC59A960E790B9644E99DBB037DBEFF6A9018C27CE538259B3D1F857EFC382ABBE8C99E75E08FB2A012708FD7A73CAF836E9F34910B0ECC95CE68CB9630E99CB9CE4D4AF21FF241A1BF84BD500264A';
wwv_flow_imp.g_varchar2_table(81) := '8198402A57617FA948D3879662E1D55F47FD5F9C0CA3989711819C4FF29C92C3CB89B6D575FE13602E981329CC1173C59C3177BCBECF5C6AE79F382D6A00137379756DBAB6CEFE34E1BC4BAEC0FCCF7D558CE02464A6D7835F12C14F8FF19AF2AB2FD607';
wwv_flow_imp.g_varchar2_table(82) := 'BE12207BE680B9604EEAFFE2243B47CC153FCDC7DCF9DAA008EE4C0DE0209266A4D3C8CD6EC6741905B47CFC5368B9EC73325178062A5B17225D334D869C79FBB702EC9F8F82711035EA4BA646C00019F3C759AC91BCCD9E3968587C869D13E6863962AE';
wwv_flow_imp.g_varchar2_table(83) := '98B3A9ED23595BA9014C22DF3CAFA4B8A6BFED9D9877E93F60C13F5D2F73041761DA9B8F41C5A1B361E672280DEEF8AEBA000006C2494441540FC0CA0F81472770683A89FAF5A5131010866449A6644BC6644DE633CFBDC8CE0173C19C3037CCD104B5F8';
wwv_flow_imp.g_varchar2_table(84) := 'B62A6A3B52039842C638E44C55D7A07AE1E168FEF0522CBAFE7B68BDEA3ACC3CE77CD41EF966FBDD6599E93360A453E010D52A8CC02ACA25453947B54D41443D85DDC67B13326111466465332BE46D866459D9D26AB32563B22673B2670E980BE624DE80';
wwv_flow_imp.g_varchar2_table(85) := 'BC894E0DC005AEA98A0AD4C92860EEB2BFC5A2AFFE00F33FFB15342DBB1C33CFFA001A4E3C19B5C7BC05558B8E40B6B905A9BAE930B259F03D06565E460BC3FD3262907B3E4E5A29C74E16644236644456644676644896644AB6644CD664EE42EA125F85';
wwv_flow_imp.g_varchar2_table(86) := '1A805B12300C18660AA9AA2AFBEAC121A79C81E6657F87D62BAEC5BC4FFD335AFEF63398FBF14F63EEB24FEE7B9FC15F7F1C4D177C0CB3CF5B82D91FB83099456227832661D1BCE4529B0D19911599911D1992A53D9B2F6CC91886E156D6125F8F997802';
wwv_flow_imp.g_varchar2_table(87) := '1E00304C5386AE6998D9DCBE89AA39CD98F6C62331FDF813D078EA5F62D67BCEC3ECF39762CE4597A269E965E0112E9145622703B22013B22123B2AA14669C6025434EE891A907A972B5CA28566646B1D1916BB31CB128609EA7BEFAC51F990C8C4CD636';
wwv_flow_imp.g_varchar2_table(88) := '098A3CA9850C0CB2902B2D369B540A64A547797F54AE06E00F67DD8B12082501358050A6451BA504FC21A006E00F67DD4BCC0944353C3580A8664EDBAD045C20A006E00244AD42094495801A405433A7ED56022E1050037001A256916C02518EDE4F0378';
wwv_flow_imp.g_varchar2_table(89) := '22CAA0B4ED4A208E04FC348038F2D398948017047C3B58AA0178913EAD53094484809F06F0CB8830D1662A818326E0D10B7DEB2B7E1A806FC31A8F92A2D52A81D811F0D30062074F0352021E11F0ED60E99B011886E15B501E2545AB5502BE10F0B3AFF8';
wwv_flow_imp.g_varchar2_table(90) := '660065726A0265107A177D021E45E06B1FF1DB003C62A6D52A81D810F06D0290C4FC36806BB9532D4A4009848380AF06E0E7B94D38F06A2B94C0E408481FB966725B387BB5AF06506EAAAFE738E57DEA9D127095804795F9DE378230005FCF713C4A9456';
wwv_flow_imp.g_varchar2_table(91) := 'AB04BC20E07BDF08C2007C77392F32A5752A010F08F8DE377C370039C761902C1EF0D32A9540740994FB86AF01F86E00E5E8F46A401984DE458F80472D0EA44F04620041389D4749D36A95802B04A44FF83AFB3FDAE8400CA0BC733D0D2883D0BBC41308';
wwv_flow_imp.g_varchar2_table(92) := 'E4E84FEA411A40604133702D4A4009008119800C79380260D13C2881C810F0A0A1D74A5F0864F8CF58023300EE5C8A8E0204822E4A202802811A80381F47002C41C5AFFB5502411208F4E8CFC003350036408A8E0204822EC9232007C0C086FEA3B40337';
wwv_flow_imp.g_varchar2_table(93) := '0081C011809AC06846F43EB4045C6E5828341FB80110AA98009D9046C0A75A9440DC09043EF41F051C0A03283726148E586E8BDE2901CF08940F789ED53F998A436300028523003581C9644F5F1B4502A1D278680C80991413E0A940A800B15D5A94804B';
wwv_flow_imp.g_varchar2_table(94) := '044233F41F8D275406C046A9099082961812085DE727E3D019001BA526400A5A624420949D9F7C4369006C989A002968890181D0767EB20DAD01B0716A02A4A02568020EF61FEACECFB8426D006CA09A002968892081D0777E320DBD01B091340129863C';
wwv_flow_imp.g_varchar2_table(95) := 'D62B040241975013E0E5ECC5A2575ED10A7543D9B84818001BCA5286AA2640185AC24880477D767E9A4018DBF7BA3645CA00D87A9A80141D0D108616CF091CE40ED8E1D9F12371D41F1B53E40C60B4F1620284CDD100CBE86ABD57027E1218EDF8ECFC7C';
wwv_flow_imp.g_varchar2_table(96) := 'ECE7BE5DD957640D80D1D30458E4314D80451EEAA2043C27C0CECE4ECFC2C79EEFD0AB1D44DA0046A1D004CA454F0D46A1E8BDDB04D8D1D9E1456A06EFF9DCED7DF85E5F2C0C602C35C330AE9162C8BAC552382A8845A224165D7C2620BBA376A8A1C5A2';
wwv_flow_imp.g_varchar2_table(97) := '29163E97D5F159626700A3A991843D218566C0C4D110984896D825713466BD774C80DA60B13523FAE13D35C4758E2B0F6305B13580F1B025994C240B934A43181D218C9A426C933C9E45C29F33CFA385B9A70E6C4D884678CFC2BF270253620C607C3625';
wwv_flow_imp.g_varchar2_table(98) := 'D9A32384515360E265B52E3127C03C8F16E69E3A484C871FDF0F126B00E341E87325309640521EAB012425D31AA7129880801AC00450749512480A013580A4645AE354021310500398008AAE4A36812445AF0690A46C6BAC4A601C0135807140F4A91248';
wwv_flow_imp.g_varchar2_table(99) := '1201358024655B635502E308A8018C03A24F934D2069D1AB01242DE31AAF121843400D600C0C7DA8049246400D206919D77895C018026A006360E8C364134862F46A0049CCBAC6AC04CA04D400CA20F44E092491801A4012B3AE312B81320135803208BD';
wwv_flow_imp.g_varchar2_table(100) := '4B3681A446AF0690D4CC6BDC4A4008A80108045D94405209A8012435F31AB71210026A0002419764134872F46A0049CEBEC69E78026A0089978002483201358024675F634F3C013580C44B20D900921EFDFF010000FFFF63AE7A04000000064944415403';
wwv_flow_imp.g_varchar2_table(101) := '00B0F5F11EEFB779500000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(8926370950801488)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECFD87BB1CC795E609BF9159F67A034F180224684082DE8AA228DB322DB57946EA31FB7D3B33CFEEFE55BBFB8CD9DD99E96EF576ABA59637A4';
wwv_flow_imp.g_varchar2_table(2) := '248ADEC29004401000E181EB4DF9CA3D6F545D1024612FEADE9BE62DDCA82A94C98CF8C539EF391191991544BA898008888008888008648E4000DD444004444004444004324600500290B92E5783454004444004444009806C4004444004444004324780';
wwv_flow_imp.g_varchar2_table(3) := '0DD60C0029A88880088880088840C6082801C85887ABB92220022220025927D069BF12800E07DD8B80088880088840A6082801C85477ABB12220022220025927B0D47E25004B24F428022220022220021922A00420439DADA68A8008888008649DC027ED';
wwv_flow_imp.g_varchar2_table(4) := '5702F0090B3D1301111001111081CC1050029099AE5643454004444004B24EE0F2F62B01B89C869E8B8008888008884046082801C84847AB992220022220025927F0E9F62B01F8340FFD4F04444004444004324140094026BA598D140111100111C83A81';
wwv_flow_imp.g_varchar2_table(5) := 'CFB65F09C06789E8FF222002222002229001024A0032D0C96AA2088880088840D6097CBEFD4A003ECF44AF8880088880088840EA092801487D17AB81222002222002592770A5F62B01B81215BD26022220022220022927A00420E51DACE6898008888008';
wwv_flow_imp.g_varchar2_table(6) := '649DC095DBAF04E0CA5CF4AA08888008888008A49A8012805477AF1A270222200222907502576BBF1280AB91D1EB222002222002229062024A0052DCB96A9A088880088840D6095CBDFD4A00AECE46EF88800888800888406A092801486DD7AA61222002';
wwv_flow_imp.g_varchar2_table(7) := '222002592770ADF62B01B8161DBD27022220022220022925A00420A51DAB66898008888008649DC0B5DBAF04E0DA7CF4AE08888008888008A4928012805476AB1A250222200222907502D76BBF1280EB11D2FB222002222002229042024A0052D8A96A92';
wwv_flow_imp.g_varchar2_table(8) := '088880088840D6095CBFFD4A00AECF489F1001111001111081D411500290BA2E5583444004444004B24EE046DAAF04E04628E933222002222002229032024A0052D6A16A8E088880088840D609DC58FB9500DC18277D4A044440044440045245400940AA';
wwv_flow_imp.g_varchar2_table(9) := 'BA538D110111100111C83A811B6DBF12801B25A5CF89800888800888408A082801485167AA29222002222002592770E3ED570270E3ACF44911100111100111480D012500A9E94A3544044440044420EB046EA6FD4A006E86963E2B022220022220022921';
wwv_flow_imp.g_varchar2_table(10) := 'A00420251DA966888008888008649DC0CDB55F09C0CDF1D2A7454004444004442015049400A4A21BD508111001111081AC13B8D9F62B01B85962FABC08888008888008A4808012801474A29A20022220022290750237DF7E250037CF4CDF100111100111';
wwv_flow_imp.g_varchar2_table(11) := '1081C413500290F82E5403444004444004B24E6039ED5702B01C6AFA8E08888008888008249C8012808477A0AA2F0222200222907502CB6BBF1280E571D3B74440044440044420D104940024BAFB5479111001111081AC13586EFB95002C979CBE270222';
wwv_flow_imp.g_varchar2_table(12) := '20022220020926A00420C19DA7AA8B8008888008649DC0F2DBAF0460F9ECF44D11100111100111482C01250089ED3A555C044440044420EB046EA5FD4A006E859EBE2B022220022220020925A00420A11DA76A8B8008888008649DC0ADB55F09C0ADF1D3';
wwv_flow_imp.g_varchar2_table(13) := 'B745400444400444209104940024B2DB5469111001111081AC13B8D5F62B01B85582FABE08888008888008249080128004769AAA2C0222200222907502B7DE7E2500B7CE505B1001111001111081C411500290B82E5385454004444004B24EA017ED5702';
wwv_flow_imp.g_varchar2_table(14) := 'D00B8ADA8608888008888008248C801280847598AA2B0222200222907502BD69BF1280DE70D45644400444400444205104940024AABB5459111001111081AC13E855FB9500F48AA4B623022220022220020922A00420419DA5AA8A8008888008649D40EF';
wwv_flow_imp.g_varchar2_table(15) := 'DAAF04A0772CB52511100111100111480C01250089E92A5554044440044420EB047AD97E2500BDA4A96D898008888008884042082801484847A99A2220022220025927D0DBF62B01E82D4F6D4D04444004444004124140094022BA4995140111100111C8';
wwv_flow_imp.g_varchar2_table(16) := '3A815EB75F0940AF896A7B222002222002229000024A0012D049AAA2088880088840D609F4BEFD4A007ACF545B1401111001111081D813500210FB2E5205454004444004B24E6025DAAF046025A86A9B222002222002221073024A0062DE41AA9E088880';
wwv_flow_imp.g_varchar2_table(17) := '088840D609AC4CFB9500AC0C576D5504444004444004624D400940ACBB4795130111100111C83A81956ABF12809522ABED8A800888800888408C0928018871E7A86A2220022220025927B072ED5702B0726CB56511100111100111882D012500B1ED1A55';
wwv_flow_imp.g_varchar2_table(18) := '4C044440044420EB0456B2FD4A005692AEB62D022220022220023125A00420A61DA36A898008888008649DC0CAB65F09C0CAF2D5D6454004444004442096049400C4B25B5429111001111081AC1358E9F62B015869C2DABE08888008888008C490801280';
wwv_flow_imp.g_varchar2_table(19) := '18768AAA2402222002229075022BDF7E25002BCF587B1001111001111081D811500210BB2E5185444004444004B24E6035DAAF046035286B1F222002222002221033024A0062D621AA8E088880088840D609AC4EFB9500AC0E67ED450444400444400462';
wwv_flow_imp.g_varchar2_table(20) := '45400940ACBA4395110111100111C83A81D56ABF1280D522ADFD88800888800888408C082801885167A82A2220022220025927B07AED5702B07AACB52711100111100111880D012500B1E90A5544044440044420EB0456B3FD4A005693B6F62502222002';
wwv_flow_imp.g_varchar2_table(21) := '2220023121A00420261DA16A888008888008649DC0EAB65F09C0EAF2D6DE444004444004442016049400C4A21B5409111001111081AC1358EDF62B01586DE2DA9F08888008888008C480801280187482AA200222200222907502ABDF7E2500ABCF5C7B14';
wwv_flow_imp.g_varchar2_table(22) := '011110011110813527A00460CDBB4015100111100111C83A81B568BF1280B5A0AE7D8A800888800888C01A135002B0C61DA0DD8B8008888008649DC0DAB45F09C0DA70D75E45400444400444604D0928015853FCDAB9088880088840D609AC55FB9500AC';
wwv_flow_imp.g_varchar2_table(23) := '1579ED5704444004444004D6908012803584AF5D8B8008888008649DC0DAB55F09C0DAB1D79E4540044440044460CD0828015833F4DAB1088880088840D609AC65FB9500AC257DED5B04444004444004D6888012803502AFDD8A8008888008649DC0DAB6';
wwv_flow_imp.g_varchar2_table(24) := '5F09C0DAF2D7DE7B41208A001531586D1BE885ED6A1B22B086049400AC217CEDBA47049C0354C460B56D00BA89C0AD1158EB6F2B0158EB1EC8E2FEBB23B5A8DD46D46E216AB1341135591A6837ACD4EB68D76B68D758AAF668A55A41BB5B5A9505B4E6E7';
wwv_flow_imp.g_varchar2_table(25) := 'D09C9D46636A02F5890BA85F3CAF22062B6F03666BB439DA1E6D90B6B86497FEB166B6EA8BD92E6D98B66C361D351B1D1B6F999DD3E669FBE603E8FA4316A5406D5E5B024A00D6967F26F76E13F6689920361716509F9A42EDFC39544E9DC4C2B1A3983F';
wwv_flow_imp.g_varchar2_table(26) := '7C087307F761F69D3730FDDA4B987AF90F98FCE3EF30F1FC2F31F1EB9FE2E22F7E840B3FFD075CFC971FDAE3DFE3E24F7F888B3FFB074CFCFC1FED3D958BBF10839566E06DCD6C8EB677E1A76683DE16FFC1ECEF47DE4669ABB459DA2E6D98B64C9BA66D';
wwv_flow_imp.g_varchar2_table(27) := 'D3C669EBB479DA3E7D80BE409FC8A41864BAD16BDF7825006BDF0799AA41DB46414D1BB9376CD45E3B771A958F8F61FE430BFAEF1FC0ECFEB731FDD6AB987AE5454CFCFE37B8F89B9FE3C22FFE1917FEE51F71FE477F8BB3FFF07FE3ECDFFD679CF9EFFF';
wwv_flow_imp.g_varchar2_table(28) := '27CEFCB7FF1D67AD9CF9EFFF87BDF69F70F687FF19E77EF85F55C460C56DE0ACD9DAD9BFFB4FF0B6471B64319BA46DD24669ABB459DA2E6D98B64C9BA66DD3C6E7CCD669F3B47DFA007D813E41DFC89418A8B16B4E4009C09A7741BA2AD0B6E9CEE6FC3C';
wwv_flow_imp.g_varchar2_table(29) := 'EA9313A89E398D458EEA3F3888B977DFC4CCEB2F61E6953F60E6E51730F3CAEF31FBFA8B987DF365CCBDFD2AE6DE791DF3FBDEC4FCFEB7B170F01D2CBCBF1F8B870E58790F0B47DEC3A225098B1F1DC6E2471FA272EC43BFDDC5E31FA17A82E5983DAA54';
wwv_flow_imp.g_varchar2_table(30) := '4F88C1EA32F808B4C145B3F10A6DD26CD3DBA8D9AAB7D94366B766C3B465DA346D9B364E5BA7CDD3F6E903F4858E4FFCC1FB087D65DE7C66D1B64B1FA22FD1A7E85BE9528B6CB7260EAD570210875E48491DDAB686DF9C9B45EDDC192C9818CE1E78D78F';
wwv_flow_imp.g_varchar2_table(31) := 'E62FFEF6E738F7931FDA48FDBFD8A8E9FFC4391B3D9DFFC7FFC74FDB4F3FFF73CCBEFC3CE6DF7C090BFBDF44E5F07ED44E7C88C6F953684E4FA0B5308BA856018F1570611E41A98CA07F08E1E088955104836356EC71806504C1808A18ACB40D98AD0DB2';
wwv_flow_imp.g_varchar2_table(32) := '8C791B0CCD166993B44DDA286D95364BDBA50DD39669D3B46DDA386D9D364FDBE772027D813E71C6CF22FC17EF2BF419CE1AD087E84BF429FA167D2C2572A166C48080128018744292AAC003F73812692ECCA3313DE5D7EFABA73FB651F9112CBCB70FF3';
wwv_flow_imp.g_varchar2_table(33) := '367A9F3BF0B61FC9CFD9887EEEDD3730F7F6EB987DEB35CCBCF58A3DBE6AB3016F60C13EB3F0C101548E1EB2D1FB51D44E9F40DD96049A17CF5BE09FB4C03FE70FF88B1A0D0BFE6D3817C0E57370859225017D08CA0308FA063B85CFCBFDF69A4A200EAB';
wwv_flow_imp.g_varchar2_table(34) := '64079FB1BF529FB74D6FA366ABF413DA2E0F0A6C2DCC799BA66DD3C669EBD51347BDEDD307E80BF493595BFEEAF8C86BDE67F81A7D883307DEA7CCB7E863956347409FE371040DF341FA227D92FB4C929664BBAEF1687D108F6AA8164921C023F61B33D3';
wwv_flow_imp.g_varchar2_table(35) := 'A89C3C81B903FBC0039D2EFCEC9F6C74FF9F71F6EFFF132EFCF86F31F59B1F63E6A5DF62E1DDD74DE43EF081BD65330351B3050439205704F225B85C0108F3F0AF05215C10D8F3D08A3D9A88DA0BF6DCC13F3A7B44B7F0B98A71311EE2101F0E9FB24FB3';
wwv_flow_imp.g_varchar2_table(36) := 'E180FD638FB4E5AE6D7F62E3E60766FBDE07CC17BC4F0439D047E82B4C142A473FF03E445FA24FD1B7E8633CD6803E47DFA30FD217E993F44DE826023741C0ACF3263EAD8F668440E447DD3C6D89A7E1B51617D09C9B014FB5AB9E3C8EC5A3876D8DFE00';
wwv_flow_imp.g_varchar2_table(37) := '666D743FFDDA9F30F987DF60E2B73FC3D4EF7E6E81FF79CCD94866F1FD7D36B23F82C685B3682DCE01510B41A188B07F00E1C0B02F7E045FB6D13CA7F58BE5EE08AA0097CBC385392B21DC5262E04C4C3DFDC8B6A582A553C7F4181F7B80D9256DD46CD5';
wwv_flow_imp.g_varchar2_table(38) := '59C077B4DDD06C98B64C9BCE9B6D7306CB6C3DA0CDD3F66D166BC91FE81BF411FA0A7D86BE533D7104F425FAD4CC4BCF7B1FA3AFD1E7E87BF4C185F70F789FA46FD247E9ABF459FA2E7DB83333D0AD1BEBA7B2E604E25201250071E98958D5C381E7E2D7';
wwv_flow_imp.g_varchar2_table(39) := 'A7A6B078EC2866DE7E03932FFCAA73EADD4FFE0E93BFFD0978D0D2FCBE3750B529FCC685733665BFE04FED6B379A68DB489FA391A8D506789E330BF5C78411974643667A2692803DFA122B00AA8C08AC3081AEDDD307960A7DC339F83C823E63853E445F';
wwv_flow_imp.g_varchar2_table(40) := 'A24FD1B75AB624D65A58B0C4FA9CF73DFA207D913E79C17C93A7C7D25767CC67E9BBF461FA32FCEC047413814F11A0157EEA05FD2783046C14C95142A7B42C98CFA36E419D4738CFF240BE97FF808BBFFE29CEFFF8EF7D1230FDC22F6C94FFB209D0FB68';
wwv_flow_imp.g_varchar2_table(41) := '5C3C0BAE7506B6F69C1B1A433834DA19DD735DBE68A37A8E7A6C04048A1CD1DABE3E357AF56AC7EC806FAA88405608D0E6AD7CCE1FACFDE62BCE7CC699EF04E6433CDEC5CF12986FD1C702F335FA1C7DAF7AF47DEF8BF449067FEFA3E6AB5C1EA0EFD287';
wwv_flow_imp.g_varchar2_table(42) := 'E9CBAD8579F8831399545801F76BBBD2DF5A1088CF3E9500C4A72FD6AC26AD5A15B50BE7B119A57432000010004944415470E403CCBCF6929FD29FFAC3AF6D94FF3CE6DF7E058B1FEC47E5F8517F743F4F496A4C4FA3353F8B56651151BD6E5A62237D9B';
wwv_flow_imp.g_varchar2_table(43) := 'EE848956A784406085A399A5B266ADD38E4520810496FC868FF4A5D0FC69C9BFECFF51D4F6BE471FA42FD227E99B3C5B80BE4A9FA5EFCEBC6CCB06E6CB5C32A06FD3C7E9EBF4F9045251957B4C4009408F81266D739C1EA4702C7C7808D3AFFE09E77FF6';
wwv_flow_imp.g_varchar2_table(44) := '4F38F78FFF0D177EFC77B6DEF853CCBFF30AEAA78EA15D59F06BF44BA73CB952BFFF3F4729CE04C9B79BA38AA5E247F6FE55DD898008DC1281CFCC14D8B6E873DEF70A25D01783FECEA9B1CEFE4F5FA5CFD277A77EF753EFCBF469FA367D9CBE4E9FA7EF';
wwv_flow_imp.g_varchar2_table(45) := 'DBA6F4B7CA04E2B43B250071EA8D55A80BD7131BB333A89E3E8985C3EF61EE9D57C10B92CCBDFB3AE6F6BFE54FE55B38F41E2A1F1D41EDD4099BE23F6FA3FD3944CD269C8D4028302E5FBC74A01E6CBA12CEAD42CDB50B1110814B04E873E67BDE27FD01';
wwv_flow_imp.g_varchar2_table(46) := '86E69316FCF97FFA6A8B57DBBC78DEFB307D993ECD5308E9E3F475EFF3E6FBD4006A013581DA7069FB7A9209024A0032D1CD9F34B255A9F853F8A6DF7A15177EFE239CFDFBFF8A8B3FF93BCCBEF43B548FBC87D6DC0C1C85A568EBF71CE5DB2328301CE5';
wwv_flow_imp.g_varchar2_table(47) := '3B0BF43618F9646B7A260222101B02F44DF351475FA5CF9AEF7276C0F1D17C9ABE4D1FA7AFD3E7E9FBD4006A014F25A436C4A62DA9AD48BC1AA604205EFDD1DBDAD8743CA7F978A190C6E445544F1DB751FF81CEC57ADE790333AFFF0933AFFED166015E';
wwv_flow_imp.g_varchar2_table(48) := '47E5E8613426CE830717B97C01014F535ABAB88989891FE9FBDA516558FC7F74270222100B02F44916AB8C057B673EEB0A25F3E33E2B65D0A7E9DBF471FA3A2F474CDFA706CC9916F0025E0B870F788DA0565033A81D300DB12DEA2FA5049400A4B4637D';
wwv_flow_imp.g_varchar2_table(49) := 'B36C34C0A9BD850F0F63EAA51770FE47FF1D17FEF1FFC1F4EF7F89C50FF659C0BF009E6684200738330567237CFB036FFE39FFC3C217544440049245C07CF7921F5BCDEDBF7EB98EBE6E3E4FDF6F4C5CF05A404DA0365023A815D40C6A87FFBC7D557FBD';
wwv_flow_imp.g_varchar2_table(50) := '2110B7AD98EAC7AD4AAACFB20958B6CE537DDA8DBABF8C2E4FFFE111C17307DFB504E0F798F8D58F31F9DB7FC1FC3BAFA176FA63F008FEA0DCDF3D6DAF1FAE5004387DC80AD8B63AD97F7754C1D7544440041244C07CF7921F5BB5CDB7E9E397FB3C3580';
wwv_flow_imp.g_varchar2_table(51) := '5A404DA0365023A65EFA3DA819D40E6A082F674C4DA1B67434C1B6A5BF54105002908A6EEC342232676FCECEA172E218A65F7D11177FFD134C75CFD9AF7C6453FC535368D52C396834C0E9407E1ECE4C20E816B8CE86742F0222905202E6E34BFE6EBE4F';
wwv_flow_imp.g_varchar2_table(52) := '0DA016B44D13A80D0DD3086AC5DC5B2F7BEDA086504BA829D4167E3EA56056A159F1DB85297FFC2AA51A2D8F40736E169533273177E05D4C3CFF0B5CF8C90F31F9BB9F6161FF5B7EBADFE54B0887D721E81F46502C59EC0F3B3BB2C441997D0785EE4520';
wwv_flow_imp.g_varchar2_table(53) := 'F5042EF3771E30482DA026501BA8115C16A066503BA821D4126A0AB5851A937A3E196AA01280847776DBA6FBEB172F60FEBDFD987DF315CCBEFE27F0D4BEC54307513D7902F50BE7D19A9D4154AFC122BE3F18C8E52E5BF3876E2220029925E06C46C066';
wwv_flow_imp.g_varchar2_table(54) := '02A8093C5010F69C5A41CDA0765043A825D4146A0B35865A43CDA1F66496DB321A1EC7AF28018863AFDC609DDACD269AB3B3FE0A7E132FFC0AFC85B0C9DFFE14F36FBD6223FEF33ED8877D037036DA472E0F3873F6CBB27FE8260222200224B0A40BD408';
wwv_flow_imp.g_varchar2_table(55) := 'D30A6A86D78E7CC16B093585DA428DA1D6F08A82D41E6A10BFAE924C024A0092D66FE6A8AD6A15F58BE7C1B5BAF9036F61EEED5731F7EE1B360BF02E2A470FA17EFE34DAF6195E148407FD383A7460D3FD74EEA4B557F5150111583D02A6115C16F09A51';
wwv_flow_imp.g_varchar2_table(56) := '28821A422DA1A6505BE6DF7BD76B0D3587DA430DA2165193B48C78AD6E8AE77B4A00E2D92F57AD55BBD544EDC239CC1DDC8FC9E77F8E0B3FFE1F987EF1D7A89D3AEE833E18E8734520E434BFBBEA76F486088880085C9780330DA196505382D06B0CB586';
wwv_flow_imp.g_varchar2_table(57) := '9A43EDA106518BA849D4A6EB6E4F1F8815012500B1EA8EAB54C646FDFEF29E8B0B16E84F62E1F00798DBFF26665EFB13665FFB23160F1FB475FE69708A3FE85EFCC3D9A81FBCD977F9A022022220023745A0AB1DD492A0D4076A0B35A6353BED3587DA43';
wwv_flow_imp.g_varchar2_table(58) := '0DA21651936AA74EA2651A45ADD26CC0A749C7F57F4A00E2DA3397D52BB2E79C669B79E3157F74FFF48BBFC1FCBBAFA376F614DA0DFE125F67B46FB93AE8A07607DD44400444A077044C5D6C36C0EEE13526C879EDA106518BA8493C5B801A45ADA26641';
wwv_flow_imp.g_varchar2_table(59) := 'B7D813500210E32EE28F73B4EB35342627B0C8ABF9BDFC074CBEF02B1BF5BF88CA87EFA36DD976B0F42B60799BF6E7F9BDBE3D723F8F41772220023D22D0D514D318675AB3F4ABA0D4206AD1EC6B2F7A6D9A328D5A34ADA26651BBA8613DAA40823713DF';
wwv_flow_imp.g_varchar2_table(60) := 'AA2B018869DFB4EB75D4A72631FFC1015BE3FF0DA65FFA1D163ED8EF47FD4D9B826BD76A88DAE694B62EE7D7FD9DBA32A65DA96A8940BA08506BBABA430DA2165193381B408DA256714680DA450DA396A50B407A5AA3A811C3BE6C371A68CC4CA3F2F131';
wwv_flow_imp.g_varchar2_table(61) := 'F0073B2EFCF41F30F5FB5FA27EEA38D06A82197850ECB3C742A7F67EADCE9281CEFF742F022220022B48C0B4C66B0EBC0675B4C866204D9BA851D42A6A16B58B1A462DA3A621A3B738375B09408C7A276AB7D19C9F47F5F449CCBFBF0F736FBEEC4FB959';
wwv_flow_imp.g_varchar2_table(62) := '3C7A08B5F3673B07D8D8A8DFD9341C429ED6A7EE8B51F7A92A22903D029C0D302DA22645A64D3C08905A45CDE2A9C9D4306A19358DDA1699C6650F527C5BAC0812A3BE69D7AA16FC4F61EEC03B98FEC3AF30F5C24F51397C00512B42501EB06CBB083A9A';
wwv_flow_imp.g_varchar2_table(63) := '3F082746F55655444004324EC039509BFCECA46915358BDA450DA39651D3AAA74F811A972D52F16EAD128018F40F4F9B69CECE803FB8316FEBFC73FBDEC4FC81B75139F2BE3F001036E20F4A65387F095F17831AAB0A22200222F01902CE798DA25651B3';
wwv_flow_imp.g_varchar2_table(64) := '782020358C5AE635CDB48D1A47ADA3E67DE6DBFAEF1A105002B006D03FBBCBC6F41466F7BFE37FB277E6A5E7B1B0EF75F007391016E08A16F89D4DF7FB2F397FAF3B111001118827818E4639D32C6A17358C5A464DA3B6F1A786A975D4BC78D6BFB7B58A';
wwv_flow_imp.g_varchar2_table(65) := 'FBD69400AC550FF1201A2BAD85791BF97F84D977DEC0CC1B2F617EFF9BA89D380A5E7E33280FFAA97F66D3B0CF02D15AD556FB15011110811B20601A45ADE2ACA52D0550C3A865D4346A1B358E5A5739F111A87D5ED7F8F91BD8B23ED27B024A007ACFF4';
wwv_flow_imp.g_varchar2_table(66) := 'C6B668D365D5B3A731F3E6ABE0D5B416DE7B07B593C7D09A9F359F3027B20CDA077EFBDC8D6D509F12011110811811A076592200D3B2C8823CB58D1A47ADA3E651FBA881709D598318D5BC475589FF669400AC511F35E7E7B078E483CEB4FF6B7F42F5A3';
wwv_flow_imp.g_varchar2_table(67) := 'C368CD4C01E62C8165CEFC111FF0668EC3071511100111481481AE7651CBA869D4366A1CB58E09009703A881D4C244B52B45955502B0CA9DC9AB63554F9EC0ECDBAF63F69DD7B170E8206A673E466B610E51BB053FEA0F729DC755AE9B7627022220023D';
wwv_flow_imp.g_varchar2_table(68) := '27C05980AEA651E3A875D43C6A1F35905A484DA436F67CDF6BB8C124EC5A09C02AF7527366DA07FE8BBFF919666DCDBF7EEE24FCA93141E87F6CC3D9A35FEBEF66CFAB5C3DED4E044440047A4BC06B59046A9BFF4121D3386A1EB58F1AE8B5D00643D4C6';
wwv_flow_imp.g_varchar2_table(69) := 'DEEE585BBB1E81E07A1FD0FBBD214083AFF2023FEFEDC3DCBEB7B0608FD5531FA3BD300FD8C89FCE01730CAD87F586B7B6220222103302CE811AE7B5CE348FDA470DA4165213E7A989A691D4CA98D57C19D549C6579400AC523FF19CD899575FC4C4F3BF';
wwv_flow_imp.g_varchar2_table(70) := 'F4C1BF3533E92FEB4B87409887023F74130111C802012602D4BC20F41A482D6412406DA446522BB380210E6D5402B0C2BDC05FC36ACC4C61F1E8613FF53FF7CE1BB6E66FD3FEF51A18F45D98830BCD119C836E22200222907A02A675D43C67DA470DE4DA';
wwv_flow_imp.g_varchar2_table(71) := '7FEDCC49501B794C00B5929A49ED4C2A8BA4D45B09C00AF754EDCC294CBFF4074CBDF4022A3CD27F761A51B3011ABEE3C131E60CD04D04444004B246C0B46F4903A9892DD3466A24B5929A49EDCC1A92D56EAF128015211EF9ADB6E6E7B0F0E1214CBDFC';
wwv_flow_imp.g_varchar2_table(72) := '7BCCBCF10AEAE7CF768EF40F433866BF9C02F39FD45DEF09B00F54E02F1E250EB7CEA1F716AA2D1A01D340AF8561E8B5911A49ADA466523BA9A1F629FBA30DDB4322FE92534925002BD05751AB8DAA8DFC676CBA9FBF88C5ACB63171AE73B4BF7336F877';
wwv_flow_imp.g_varchar2_table(73) := 'B03BE8763D02C609568C195860CF7DB1EFF1C8E2761B51AB098E1EA2461D9D524364CB2B2C3C9848A5EAED4E1C96CF81B6E44BC36C6BC9CE6C168FB607B341D016CD24E16DD36C94B6CAB2F47FE8764D02C6CAB90E37DA29B5929A49EDA486524BA9A9D7';
wwv_flow_imp.g_varchar2_table(74) := 'DC86DE5C16012500CBC276ED2FF12731170EBD87A9179F078D98D7C2860906CCC89D46FED786F7A97799F55BA1C0B25C1ACD763E14F9FFDB73BEE74BBB33D0E3EBFEFFFC2E5F53412406CB63401BB2E26D8AB6468EF67FDA17FFCBD7EDB1F367AFF3FF7C';
wwv_flow_imp.g_varchar2_table(75) := '8F85CF7DE9BCABFB6B10589A09308DA4565233A99DD4506A2935F51ADF8ED55B49AA8C12801EF61647048D99692C1EFFC85FE067E1D001D44E7F8C7675B1B317ADF977385CED9EA2D96A7D32A2AF73D456317E0B6857BAA556811FE9DB675D2E8FA0D487';
wwv_flow_imp.g_varchar2_table(76) := '707018B9D171E4C73720BF6E23F2EB3723BF710B0A9BB7A2B8657BB7ECE83E2EFD5F8F9FB0118B4FB3F8C4566843B4256F53B42DB331DA1A6D8EB6471BE4656E69936DB3CD4B765A357BB5FF4766C37C8FB35430DB86D96DC7FC6DC4DB79A2FB25020CFE';
wwv_flow_imp.g_varchar2_table(77) := 'D448FB3F3593DA490D5D3874D06B2AB5951A6B6FEBAF47049400F4082437D35A5CC4C2D123E0B4150DB771EE14DA8BF3F6960385C239E136189FF973001D1F76B3516AD46E82238088D3ADB52A2213D2C807FF799F08447CCDA6FD791471D83F88FCF846';
wwv_flow_imp.g_varchar2_table(78) := '14B6EC4069C76E9476DD83F2EE3DE8BBFB7EF4EF7918037B1F45FF038F63E0C12754C4E0A66DC0DB0E6DC86C893645DBA28DD1D66873B43DDA206D918189B6D9367B6D57E6419BF5B64B7B355BF6364DDB361B374B07CCECBB77D0ED1302CE34925A0938';
wwv_flow_imp.g_varchar2_table(79) := 'AF9DD4506AA9D754D3566A2C627D4B56E514917AD15F96D573EDAA76FEAC1FF9CFEF7F0BD58FF96B577388DA2DF8235D79294CE7BDBE177B4CF6362882C685A3A2A8D95D57B5A00E73FEA058B611FD10F21CD16FD884E2E66D286DBB1D7DB7DF81FE3BEE';
wwv_flow_imp.g_varchar2_table(80) := '42FFEE7BACDC8BFEBBF6A0FF1E06FABD18D8F30006EE7B1003F73F648F56EE67F0B772FF2318DC6BE5814731F8C0D2239FAB0C7A26E270650E5D5B31DB19301B1AD84B5BB2721F6DCB0A6DCD6CAE7FCFDE8E0DD21677DF6B7669B669364A5BA5CDD276F3';
wwv_flow_imp.g_varchar2_table(81) := '66C3B4E57060C85FE91316D8A266D366B168F756B83468BE604201DD8C80338D34ADA466523B5B0B735E4BA9A99C09A0C6526B619A6B9FD6DF2D125002708B00F9F556A582EA590BFE1F1EC2C2C1B75039F42E1A13E7010B682E5FF48FDDC56964F3664E';
wwv_flow_imp.g_varchar2_table(82) := 'EDAC98F8C1823F05904ECCD991F6FC2CDAF33336D2AF006188706C1D8A3BEE44DF7D0F63E8F16731FAE56F62FC5B7F8DF57FF5EFB0F107FF1E9BFEF57FC0A61FFCFFB1F1AFFE0D367CFBAFB0EEABDFC2F8B35FC5E8535FC4C8E34F63E4D12731FCF0E318';
wwv_flow_imp.g_varchar2_table(83) := '7EF0110CED7D084326D68326D48326D82A0F400C6E94C15E6F3BB421DA126D8AB6451BA3ADD1E6687BB441DA22A32DE64500001000494441546D7293D9266D94B64A9B1DFDF2B7BC0DF7D90C4271FB1D082DA94560235B9B2168CDCDA0BD60C59ED317E8';
wwv_flow_imp.g_varchar2_table(84) := '13F40DD04F58E0B22915BED511709976524BA9A9D4569E1940ADA5E62286B7A45529485A85E3565F4EFD35A626B078D482FF7BFB5039FA01386DD5AE2CC28579B85C0170597566736466EA510BBCDC31F80887205F4058EE436E6000B9A1613FDA2FACDF';
wwv_flow_imp.g_varchar2_table(85) := '88D26DDBD1B7EB6EF4DDF300066CEA7EE8B12F60F8A92F63F4D96F60EC2B16E8BFF6E718FFEA77306649C1D817BF8A9127ECFD871EC3E07DF6F97BF66080B30377DA2CC12E4B2076EC42DFF6DB51DEB6BD5BB6D9A34A799B18DC18838EDDD086FACC96FA';
wwv_flow_imp.g_varchar2_table(86) := 'CDA6FACDB6686303666BB4B961B33DDA206D913649DB1C371BA5ADD266879F7A0EB4E181071E339BDE8BF2CEBB50DCB20DB4F5C2E898B7FD5CFF80F942192E9F07CC37BC9FF81901F319FA4E560F2234CDA4765243A9A5D4546A2BAF18B8685A4BCDA5F6';
wwv_flow_imp.g_varchar2_table(87) := '42B75B22A00460B9F8CC3979F00F33D1EAE913987BEB25CCBFF3321A17CF012E048D17CE02BFFD214B37B699EDED8EF479101447FA2D1BE5B76CB4CF510E0FA22ADD710F061F791AA3CFFD19D67DEBAFB0FEBBDFC7FA6FFD25C6BEF4357094C59157FF5D';
wwv_flow_imp.g_varchar2_table(88) := 'F7FAA9FFE296AD28ACDB68823982A054B6A9D42228985C2B74B91C7C09ED3134EE572A3CC258054E0C6E8EC1956CC9BF66B6B66477B93C688B41A1E86D333734E26D9536DBC7652BB3E1215B4260A230FEDCD7B1FEDB7F8D0DDFFB01C6ED71F4B96F62E0';
wwv_flow_imp.g_varchar2_table(89) := 'E1A750DC7937722363E61A4D783FE1ECC0E23CE83BD1E5070EBA8C89099B6B6DEE6869E8B5951A4BADA5E6527BA9C1302DA6E4AC7D495E0D94002CB3CF6878AD8505704DAAF2E10758D8F71A160FED476B611141790081AD65FB04206BC669819F0EE99B';
wwv_flow_imp.g_varchar2_table(90) := '6DCE4B062E172230C10C8B4513BA519476DC8181BD8F62F80B5FC5D8D7BF87757FFE7D2F8AEBBEF15D9BCA7F16C33675DF7FC76E94B7DC66B3033652EAEB070FB4E27697D95DFA9A08AC0E01337CDA6ACE6C363F3AE66DB8FFCEDD187EE0618C7EE139AC';
wwv_flow_imp.g_varchar2_table(91) := 'FFE65F60C35FFC6BACFFF31F78DBA70FF4DFFF088ADB76213F3C8AB0504090B744D67C86BE039B01A0D678DBA76FAD4E2BE2B117634906D4526A2AB5951A4BADA5E6527BA9C19E4F3C6A9CB85A0489AB715C2A6CD374355EBFFAEDD730B7FF6D4B04CEA1';
wwv_flow_imp.g_varchar2_table(92) := '5DAF776A67232DB074FE978DFB761B3CDD89D3756D9EF6687CE8B885CD5BD17FEF83187EE28B18FDD2376C84FF0D7BFE0C064D10FBEFB9CFA6FCEF4279FBEDE0B4289703720383084D3CC35267A41FD8D42805D50566AA8E43826CE0542B134AC06C94B6';
wwv_flow_imp.g_varchar2_table(93) := '4A9BA5ED726680B64C9BA66DD3C669EBE5ED3BBDED0F980F0C3DF008469E7C0663CF7D03A3362336FCF8B3E8B765B0C2C62D08780C51B3E1CF80A16FD1C7FCC587128A6759D5A696B2D897A9B1B5F3E7BCE6CE99F65283FDB289BDB7D67F49DCBFA96A12';
wwv_flow_imp.g_varchar2_table(94) := 'ABBDF6756E552B7EDD7FEAC5DF79636CD51A08FA87E10AA54EE598BD769EA5FFDEDA1AD9E8246A352C09A801EDA64D8B16901FDF80BEBBF762F899AFD928FF07D8F4837F8F8D7FF937187BE6CB18BAD7D6446FDB66A31E6366D3A8E987A4168AC027049C';
wwv_flow_imp.g_varchar2_table(95) := 'CD88E5878751DEBA1D43F73F80F167BF66BEF16FBC8F70468C3ED3B7FB3EE446D7819F05CF9269D410D9237DCDCF087CB2B9743F337D6103A9ADD4586A2D075DD45E1E0F402DE6FB2A374F4009C04D32A30336666750397ECC2700D5E3476D6DEA3CA276';
wwv_flow_imp.g_varchar2_table(96) := '04972FC185B9EE16A3EE634A1FCC29FD697CBCD049B30E4ED5E5068650BA6D07FAEFBA0F83B6EE39F8E0A336D2B7C2D3F2EE7B08FD16F44BDB76A2B87173676ABFDF964A0A4570C404DD4420430468F39C1DE0418085D17114CD274A362BC091FF80F9CA';
wwv_flow_imp.g_varchar2_table(97) := '200BFDE7C1C7C0D35BFB76DF8BC2966D08FB07415FF3BEC784C0660760BE8854DF3A5A4A6DA5C6526B1B17CF83DACB04805A4C4DA636AF1D8664EE5909C04DF65BBB56B3C07F04336FBE8AC50F0FDBD4DCA20F607468E76C8A9AE526B799A88FB37D2C1C';
wwv_flow_imp.g_varchar2_table(98) := 'F15BF06F571610D9D247902FA060C17FE8A9E7C053A0D6DBBAFEFA3FFB2E78EA54D9A6F8F34336D20F646E89EA6B5576D509B830B059B1119477EC040F865DFFADBFC0FAEFFE0063DFF80B0C3EF60C8A5BB681BE1659D2CDA5365E30CB2700F44998FE20';
wwv_flow_imp.g_varchar2_table(99) := 'C5376BA3730E5E6B83C06B2F35D86BF1D123A036A7B8F52BD23429F24D608D6C9DBB313D6D09C0219BF67F0BD593C7C1F3779D4D61D328E1DC4D6C2D611FE528C3823E5A2D445600079ECA57185F8FA24DE59777EEC680ADF50F3DFC24861E7F06C38F3E';
wwv_flow_imp.g_varchar2_table(100) := '89C1FB1E4479DB0E1446C710148BD04D0444E0FA04E82B85B171946D4660C866D2861F7D0A3C9D90BED57FEF03A0AF15376FB559B47104A5B26D30329F6CDAD21B4F1DECFE5681BD9ACA3FD3586A2D3597DA4B0D9EDBFF96D7646A33357A2DDA9DD47D2A';
wwv_flow_imp.g_varchar2_table(101) := '01B8C19E6B371AE0B5A8AB674EA2F2D121548FBE6753FF67CDF15A70B69E07975294CE921A2B5C77E401481C75B417E760F11F459BCE1F7AFACB18FF331BA57CFBAF30F6EC576CFAFF5E14D76FB4A9CA01FB8C7D17BA8980082C9B80F95E6ED096D6366D';
wwv_flow_imp.g_varchar2_table(102) := 'C1C03DF763EC4B5FC37A9E2EFBB53FC7A025DA9C11A06FB617E640DFA48F82893A1DD4BEBBECFDC6F98BA6B5D45C0E441A17CF7A2DF69A6CDA4C8DA656C7B9FA71AA5B4AA356EF11B72A8BA89E3EE933CDEA890FD1B870060C847E758A47A8A6D5D96CD6';
wwv_flow_imp.g_varchar2_table(103) := '03ED16C019006B274727A1ADDD17D66F024723BC50CFD8737F86D12F7E1543B66659DA7C9BCD0C94293FBDEF046D51043248C039079E41C00306871F7ACCFBDAE8B35F07CF16E8BBEB3E7F060D7DD2150A804D8D47F4555E748BBE9B465EC603A645D45E';
wwv_flow_imp.g_varchar2_table(104) := '6A30B5989ACCE301A8D1D4EAD56D7672F7A604E006FB8E97EE5C78EF5DCCBDF50A6A9608D0C75C9887730E7687D4DDD82E6B244715ADF969A0DD446E640CE53BEFC5E8335FC5F8D7BE6502F405F4DF7937FC74E4F088CD84188F3004A7E852C924759DAC';
wwv_flow_imp.g_varchar2_table(105) := '0625828073A04F39FA962D37E6474651B265B7FEBBF760E4C967CD17BF83912F7C19E53BEE463834EA7DB5B5300BFE3AA14FDC9D4B44336FAA92D626E71C9C69B0C994D7646A33359A5A7D53DBCAF0879500DC40E747AD26EA17CF63E1E0DB987FF77534';
wwv_flow_imp.g_varchar2_table(106) := '262EDA9A761F78710A66A2DEC96E603B89FB08A7125B75B85603615F1F7804FFE0C34F61FC1BDFC3BA6FFEA5BFE67E69E366F0023F896B9B2A2C02492560112F67FE58DEB20D238F3D0D5E5D903E39F0E013286EDDE17DD57106C0740BF65970A89CD4B6';
wwv_flow_imp.g_varchar2_table(107) := '5EADDE6C97CD02508383629FD7646A33359A5A4DCDBEDA577BFD7A92B7A704E03ABDD75C5840E5E3E358FCE888CF329BD353F06B4C667C08C3EB7C3B816F9B63D17938F28F9A8DCEA8DFA619071F7C0C830F3D8EC1FB1F46DF9DF7A064E2931B1C4650E2';
wwv_flow_imp.g_varchar2_table(108) := 'A98F29E490C0AE53953342C071E49BF34B6DBCB0107DB17FF7BD187AE0110C3DFC04061E7C1CE5DD7BCC7747115902DFAE2DDA63133E19481B226AB069313599DACCD9596A35359BDA9DB6E6F6BA3D4A00AE45D446C0F58BE730BBEF6DCC1DDC079E6BEA';
wwv_flow_imp.g_varchar2_table(109) := '6C0A8E97B5BDD6D712FB1E83BFB5193672886A553F8B5FDA712746BEF44D8C7DED7B18FBC27318BC678F3F4D29B16D54C545208504F2B63CC75FBD1C7BE62BB624F05D8C7CF11BFE92DBCEDA4A5FF63E4DDF361FB79752F7474DA63653A3A9D5D46C6A37';
wwv_flow_imp.g_varchar2_table(110) := 'D8E6156D6DB237AE04E01AFDD7AAD6503F77060BEFEFC3E291F7D09A9B0578C47FD8BDD84F5A9C89ED68B7CC57DA364A808DEACB286EDA82FEBBF660F081473168538B033CA5EFF65DC88F8D23E0C146D7E0A6B74440045697007DB230B60E7D3BEF047D';
wwv_flow_imp.g_varchar2_table(111) := '75D0660106F73EE27D98BE1CF074415B0AF0A7C999AF833EBFBA555C99BD2DB5839A6CDA4C8DA65653B3A9DDD4F095D9713AB61AA4A319BD6D059DA4DD6CA2393783DAD993A87E7810F51347D05A9C870B727034B6DEEE728DB6E6FC7E2313044EF7B370';
wwv_flow_imp.g_varchar2_table(112) := 'D89F1FDB80E127BF045E9274D446147D0CFCC3A3E00548FC1774270222104B02FCFD81BCF92A7D96BE4B1FA62FD3A7E9DBF4715FCCE73B0DE86840E77972EFA9C9D4666A34B59A9A4DEDA68653CBA9E92BD1BAA46F5309C0957AB0DD4673661AD5D31FA3';
wwv_flow_imp.g_varchar2_table(113) := 'FAF1319B053889D6CC24FC39B6812163B9D2F792F61AA7C7ACAD7E34606DE2A944BC24292F3B3AF4E81730F2D4973070F7FDE0C57E74A05FD23A57F5CD2A01FA2A7D96BE4B1FA62FD3A7E9DBF47198AF7B9FF7BE6FB37E6900C53659A14653ABEBE76CE0';
wwv_flow_imp.g_varchar2_table(114) := '66DA4D0DA79667EE07946EB04F2D9ADDE02733F4318E886938B3EFBC095E6AB255AD03F9627A46FECEB27E9B3A8B9A754B6AAAD6B311C2FE21946FBF131C35F057C9F82B655C5774F93C780A927D487F2220020921409FA5EFD287E9CBF469FA367D9CBE';
wwv_flow_imp.g_varchar2_table(115) := 'CEB5BEA8510535C02703CE3421216DBB5635391300D36A6A36B59B1A4E2DA7A65FEB7BCB7B2FF9DF0A92DF84DEB7A05DADA07AE218E6F7BD89CA898FCC3F1C82F220902FC0DF2C78FAC7A4DEB1FEBEB4011758F01F4461F336F4EF79D09F4F3CF2E43328';
wwv_flow_imp.g_varchar2_table(116) := '6DD90A9E770CDD444004124B803E4C5FA64FF35A01F471FA7AE87F5428B03CC034C06B4194D836FA8AB30D7C621A4DAD8E22E7B59B1A4E2DA7A6F36D954F13300BF8F40B59FE1FD7895AF53AEA93137EEDBF76EA041A931711B5DA70395BFBB760996C3E';
wwv_flow_imp.g_varchar2_table(117) := '96E5DBB47FC45F116B35E02C53CEAFDB80BEDD7B30FCF8D3187EE87194B7DF0E5EE31F369DC635C364B757B517818C1370E6F3E6CBF469FA367D9CBE4E9FA7EF530322D3026A024C1B00FB3C927B732E00B59A9A4DEDA686F358006A3AB59D1ADFABD6A5';
wwv_flow_imp.g_varchar2_table(118) := '613B411A1AD1AB3644BCDEBF05FFCAE993B6EE7F06ADD90944D545CB925B8019165CB29DC31A02AE85454D0BFE88901B1E45F1F6BB30F8C893E0E943830F3C0C9EDB0FDD444004524780BE4D1FF7BE6E3E4FDFA70638D3026A02B501F63CD10DA74653AB';
wwv_flow_imp.g_varchar2_table(119) := 'A396D76E6A38CF06A0A6374CDBA9F1896E5F8F2BAF04E032A0ED7ACD1FF8B778F87D9B0138854F7E5E92819FE5B20F27EDA965F7BCC00FAF131E148AC88DAE43799705FFBD8F6080BF30B67D2778BD714E1926AD69AAAF0888C0F509D0B7E9E365F375FA';
wwv_flow_imp.g_varchar2_table(120) := '3C4F13A406500BA809D4066A446726E0FADB8BEF27A8D52CF01A5E3B7B0AD4741E0B408DEF4DBDD3B115250097F523D7892AC73EC4FC81B72D01380D5826E98A257B20A6A4AE91751C216A59466C098EB3FF8616FC4B3BEFC2D0434F60F4892F60E08EDD';
wwv_flow_imp.g_varchar2_table(121) := '084A25E8260222907E02F475FA3C7D9F1A50322DA026501B22D3086A4587828945E749C2EE23F883204DBBED89D7726A3AB59D1A9FB0C6AC687519D956740749D938D786F85392B593C751B524A0313589880940AE001A11127B6BA393D19B538421C2A1';
wwv_flow_imp.g_varchar2_table(122) := '119477DCE10FF8EBBFF77EF4DD7E077839513A4C629BA88A8B8008DC3001FA3A7D9EBE4F0DE08181D4046A0367094C30ECCF74032C37BCD9787DB0ABDDD4706A39359DDA4E8DA7D6DF6A65D3F2FD202D0DB99576B479E09F05FCDAF933A85F3883E6F445';
wwv_flow_imp.g_varchar2_table(123) := 'BF7EC4FCD78586C8F1D9ADEC610DBFDB6A8319BD0B428403C328DEB6C346FE8FFB1F11E9DBB10B41B1B88695D3AE454004D68A007D9F1AC01F141A7AE871AF0DD4086A053503A61D6B55B75BDEAF6936B59BCACDE3B8A8E9D476AFF1A6F5D4FC5BDE470A';
wwv_flow_imp.g_varchar2_table(124) := '3610A4A00DB7DC845665D14F13F107241A3CEABFBA6883E65677BB094614458822B62342D837E01DBC9F3FEC73DF8318B87B0FF2235B5A51010000100049444154A3DD36EA410444208B04A801D48241D3046A030708D40A9B02E86887694872B974B49B';
wwv_flow_imp.g_varchar2_table(125) := 'D7006012406DA7C6D7CE9E06357FF9ED4ACF373B84D2D39E65B5A4353F87C5A387FD81229C2E828D965D98833FEA9F29241278A3E35AE1E93070010A1B3661E89127FDE97EA56DB723D0F5FC13D8A9AAB208F49E00B5809AC0D303871E79C26B05E06CE6';
wwv_flow_imp.g_varchar2_table(126) := 'B06D7940D42948E0CD599D9D83D772D3746A3B0F06A4D653F3EDDDCCFF2901301368CC4CA172F410168F7C80E62C7FF0A70057E0D4B84BA6F133F0B76DEA3F6AC3E5F2E0E93F655BEB1F79EC490C3DF0280A63E3D66AFD898008884087003581DA30F2D8';
wwv_flow_imp.g_varchar2_table(127) := '53A056E48646BC7644A6217ECDDC34A5F3C904DDFB3ABB8E96E70A5EDBA9F1D47A6AFE725B92A6EF653E0168552AB6E63F89FA998FC1EB47B72B0BE01A98CF1A9D4B5E5FB3CE66F851BD02341B28AC5B8F019EEA77FFC328DDB61D61B90CF033D04D0444';
wwv_flow_imp.g_varchar2_table(128) := '4004BA044C13A80DA5AD3BE07F01F4A1C750DCB011683511D5ABF6219B09B0CFD89364FD599DA9E5D4746A3B359E5ADF9C9EB46500D3C864B5A6E7B5CD6E02604192E7F933136C4C5E4063F23CDAB3931D6337A3497290F4597BA30E9BF9B76C7E2746BF';
wwv_flow_imp.g_varchar2_table(129) := 'F8150C9A438783C33D37206D500444203D047876C0902D158E7DE91BE8DB752778209DBF4890E965625BE96C206785890C359E5ADFA0E6DBCC2F63006EAA6D89A570C58A67360188ACD39BB6F6CF03426AE7CE806B429165BB36E7DF016506D37992A07B';
wwv_flow_imp.g_varchar2_table(130) := '4EFBD76B70366D971B1E4169DB4EF4DF792FFA77DF035E0F9CE7FF26A835AAAA0888C02A13088A2594366FF59AC15F102C6DDF056A094C5318403B570B5CE54ADDEAEE2E6979046A3CB59E9A4FED670C602CB8D55D24F5FB994D0068C80D9B065AF8E843';
wwv_flow_imp.g_varchar2_table(131) := '544E7E8C76BD01972F01611E70B89407D8B3F8FF750D9CD7F46E2FCE597DDB28EFDC8DA1279F43FF9E87901F194790CBC33936CCDED69F088880085C8D80C9048F1BEABB7BAF69C8B3A625779A1EB6406DF1B301FC5E92B4C4562F606DA2B653E3A9F5D4';
wwv_flow_imp.g_varchar2_table(132) := '7C6A3F630063019B7423256D9FC96C02C0035B1A5313A87C7418D5534C00EAFE60111E34076F2DB41A24E366B319E81617040807063B97F97DF031F0809EB0AF2F19ED502D454004624120289551DEB10B837B4D4376DD8DDCE0105C1876EAD6D59ACE7F';
wwv_flow_imp.g_varchar2_table(133) := '92704F2D77A0B6F3E0EE76BDEE359FDACF18C058908456AC441D339B00A0DD42D31280DAF123A89F3A065E22D285B94F8C7C2568AFD4366DEA9FED71F90272E31B50DC768705FEDD286FDF89C2D83A6FF82BB56B6D570444207D045C2E87FCE8B869C8ED';
wwv_flow_imp.g_varchar2_table(134) := 'E06C6271C76EE4D66DB6415201D41A5F12D66C2630D4786A3D359FDACF1870E36D4958836FA0BAD94B0098BD1A98569547FF4FA071EE249A93E71135EA406019AE4B1E127FA18B5613CCDA8B5B77A26FF77DE6B8BB50185F075EED8BB302D664FD898008';
wwv_flow_imp.g_varchar2_table(135) := '88C00D11A06684C522388028EFB803655B0E286EDFE53586EBE8891C3553DB4DE3A9F5D47CAFFDD313602CF050BAB1C13FCFC85DF2A2DD2D760C0DB7B9308FDA85F3E08521980D7A835EEA7CE76E710FABF8F56E5DA3661351BDE64FF1EBBFEB5E0C3DF8';
wwv_flow_imp.g_varchar2_table(136) := '28783A4F582CAD6265B42B111081B411084B45946EDB86A1BD0FFB0303C3721F1840A939BEAD5D0DF2CFE37ED7AD2B0FFAA3E653FB1903180B1813181BAED58434BE97BD04C046CAF5C949BF06549F9CF04BE72E5700335EDFC15C2EF24F1270E79316AB';
wwv_flow_imp.g_varchar2_table(137) := '301F0387FCC8A8BFC4EFE0FD0F76CEE175094A6612805B551481EC117028AEDF80C13D7B31B0FB1EAF31B051F4250ED49E4BFF89F913934AD6905A4FCD67D51903780C1863029302BE9FA51264A9B16C2B33D7C6C405544E1C43FDE20530EB73B93C102C';
wwv_flow_imp.g_varchar2_table(138) := 'A1E85A093F1CF3E20DD6121A1EE457DCB203A5DBEF4471CB3670EADFD91A1E9400C4BC07553D11883901D310AE9B1746C751326DF1C7036CDD81B0CF66029A7574CE0A488A6676EB695AEF4CF3A9FD8C018C058C098C0D57EF8D74BEB314F5D2D9BA2BB4';
wwv_flow_imp.g_varchar2_table(139) := '8A9D5CBF780E95E31FA27EE11C78AD7C1A035C78854FC7F5250758FA1A356AA003E6C7C6D17FFF239D53FEC6D659A5ED7DBBD79F08888008F4848073C88DAF473FAF2AFAC0A3C88F8ED95280E90FAF12685A94A8C186693D359FDACF18E06381C504C686';
wwv_flow_imp.g_varchar2_table(140) := '9EB04AD046329700B41B753427CEA37EF2187835281A01C23C382D949C7EB34C964ED76E9BDF39E4C7CC31EFDA83BE3BEF01AFE19D9C76A8A62220024921406DE9BBE31EF05703F3EB368047D57320029323FF98908678AD37CDA7F63306301630263036';
wwv_flow_imp.g_varchar2_table(141) := '5CAD09697D3D73094054ABA2397501F5B327D09ABE081E41EF0DC22568D4CCAB72D1EB98C916CBC85B66DE77FB2E94B76E47AE7F20ADB6AA76898008AC21815C5F3FCA5B6E43DFF6DB5158BF0961FF30902F50896C46B2BD8635BBC95D9BD653F3A9FD8C';
wwv_flow_imp.g_varchar2_table(142) := '018C058C098C0D37B9A5C47F3C487C0B6EB0015CEF69D76DF43F3F87E6CC145AB393E08F43F8AB40D99A10909004C046FE51AB650E17213087CC9B2316376D4571E366E48786E1B8F60FDD44400444A0B70438E2CF0D0CFA9F0B2E6EDE8EFCC6DB2C0918';
wwv_flow_imp.g_varchar2_table(143) := 'F2971EF7D3E73630E9ED1E576A6BA6F5D47C9B41650C602C604CE065811923182B3EBDE7F4FE2F3B0940A301FEF04FEDE205341717AC47BB46600FF69F84FC399BB16823B2753717B5BC23F6DFFB00CABB76231C1C4A481B544D1110812413601250DE79';
wwv_flow_imp.g_varchar2_table(144) := '27FAEFB9DF6602368017D2A12675026782049555652260833FC604C606C688C8624592FBE766EA9E990480EB3BF5898BA89D3B8BD66205080B08F245C01902AE617526B210EF9B55D4B26C1EF887C0A1B8F9360CDCF710CAB7DF09FE8847BCEBAEDA8980';
wwv_flow_imp.g_varchar2_table(145) := '08A48100B5A6B4632706F63C80A2CD3C7A096D36009B9DB4BB0434913A6AD5B48AFB1860B1803181B1813182B1C2DEBDF497E627419A1B7779DBDA36FD5F9F9840EDFC1934E7E7E1037F9883730EC9305A56D30C97890A0DB750F2E7E79677EC4271E326';
wwv_flow_imp.g_varchar2_table(146) := '04054B66EC23FA13011110819524C0EBE9176DE9B1BC6D070A3C18B05806020B254C00585672E73DDB76D4D17E8B0170818F098C0D751B243256F46C3731DF90F55ACC6BD8A3EA45F59A3FEABF7EF60C5A3E017070EC7CB81EED618537638EB534C51698';
wwv_flow_imp.g_varchar2_table(147) := 'C3858323C88F6F4469C346E4874710E4F32B5C016D5E04444004802097437E68C80620A63DEB36221C1A4350EA035C6789B233138004DC1C7C0C70CEC704C686C6E4455B62AD5D56F7743FCD4C02C0691D5EECA17EEEB4657BB3D6AB0E0843D06891809B';
wwv_flow_imp.g_varchar2_table(148) := '0FFEAD26FC813863EB51DC7A3B0A1B366BED3F017DA72A8A401A09F05880A22D0194B6EF44DE12016789015A0D78AD4A42839D838F01701613E650B7D96126008C1549A87E2FEA98990420B225009EEB593F77CAB2BD39C0A67D5C98B3478744DCDA2D44';
wwv_flow_imp.g_varchar2_table(149) := 'E65C41A180924DBDF5DF7D3F8A9BB6C0B721110D5025454004D244C059C02F6CDE86FE3D0F9A26ED046721FDF149A6558968A7737001634080D60213001B1C4E5E40D4A85FAA7EDA9F04696FE052FBF8C30FADD929B4A627D0AE2E765EB624A0F324CEF7';
wwv_flow_imp.g_varchar2_table(150) := 'AE53B9EEC17F413E87E296ADFEA23F055B87E38C40E703BA170111108155241086360BB9117D77DC6D9A749B2500397C3A01E86A17627C0B3A21B05DAD586C980463049FC7B8C63DAD5AA7F53DDD64CC36666BE7FCB9C7D6C23C5A8BF368D72CF8DB481A';
wwv_flow_imp.g_varchar2_table(151) := 'FE60BA041868B78A9C56A37331E0F3C739CADB77203FBE0EFC7FCC88AB3A222002192040ED298C8EA1BC751B8AE3EB4D8B029F00443658F1CDEF6A977F1ED73BD7AD64B38E76D56284CD04F858610901A228AEB5EE59BD529F00B41B0D5BDF99B7328B76';
wwv_flow_imp.g_varchar2_table(152) := 'AD0AD83A3A2C2960FCEF19C595DC10EBCACA9AA1BA5C1E615F3F0A63EBC02420D7D707D7CD6057B20ADAB6088880087C9680B319D4B054F67AC4DF0608FB06E06C89D244C93E6AC1D36B973D8DFB1FEBC9A4C506861CFD37E7662D5ED860D16247DCAB7E';
wwv_flow_imp.g_varchar2_table(153) := 'ABF54B790210A1CDB5FFD91934ACB479AE6A10020C9AEE56D1ADD2F7DB6D4B5ADA080A45F0401B5E7D2B37C2A36ECB9D0AB8A434A4535DDD8B8008A48440577B826209D4A4FCA66DA6519B4DAB4A5EB3FC555693D0544AA88F0921386064AC68CECE80B1';
wwv_flow_imp.g_varchar2_table(154) := 'C3CF1427A10DCBAC63BA1380087ED4DF989E4263660651A3058EA25D98335CD6EBF6BE3D89F51FAF571DB59B0898696FDE8EC2D65DE02980CE59FD635D73554E0444200B045CE0100E8DA2B86D170A5B7620289741CD8A927030A08F010E8C09CE6658A3';
wwv_flow_imp.g_varchar2_table(155) := '66CBC70AC60C3F63ECDF476A6FE94E00ACDBDAB51A1AD393BEB47974A79F01B059007B0F9C5AF78F71BD33EBE375FFADF80460D36D28DEB61DB9A161C0A5BEEBA09B08884002089816E50687BD36F1CCA4B0C4198096CD02584982C61271372E304674E2';
wwv_flow_imp.g_varchar2_table(156) := 'C5A40D1ED37F3D80D44791B6ADFB37262D01986287D601172219EBE6CEE7273E8BB61980B0544471D36694B66C45383068EDB0F7A19B08888008AC3101E7BC2631F817366C44502C02A6595EBB6C0C03C45FAB7C4CB0D8D0AED5D1B058C198C1D88194DF';
wwv_flow_imp.g_varchar2_table(157) := '329100346D06A069CB007E4DC78C1596B1C6DE26977CA6D5F447D6FAD3FFD6AD4771C326F0277F9D5BFA40CA2D54CD130111883501E79CD7A4D2C6CDFEE0E4A0504064BA85A52580B84B15EBE763820363046345D362861280589BDD8D542EB20EADA139';
wwv_flow_imp.g_varchar2_table(158) := '3B8DE6CC947F0E33565FC05EBF916DACED67E84851A30A67EB6CF9115B67B324202CF7AD6DA5B47711100111582260521AF6F7FBC149617C1D78A9E0A859EF24014B9F89F5A335C0754ABB6EF1C2620563069F23F64B18B70636DD330036FD14D9124073';
wwv_flow_imp.g_varchar2_table(159) := '66D2270091752ED8D141029A6D75F7C6677575F9823FFD2F3F38045E7E93E7DFFA76DC5ADFEBDB22200222D00302CEE4C866010606901F1AF15AE5F84BAB5C57E7D6799A1D1FE35C4C67AD11608C68CE4C59BC98046347CAE33F1210096FC16A2CD8B7EB';
wwv_flow_imp.g_varchar2_table(160) := '55B4A62F5AB960330036927681F573700B1B5DA5AF463C800608FA06905BB705B9F14DFEB90FFEAB5405ED46044440046E86000F56CE8D6D30CD32BD2AF7DB576D24C373ECED599CFF5C372E74E2C5058B17177DBC80C59038D7FB56EB968048B8FC26FA';
wwv_flow_imp.g_varchar2_table(161) := 'ABE7D90C406B6E1AADF919705ACA77A875F6F2B7BA0ADFB48C396AB56D022042D83F84C2E6EDC8AFBF0D017F716B1576AF5D88800888C07208B842C907FFC2C6ADA65D835EC396B46C39DB5BB5EF302658B0678C60AC60CCE00C0063C8AAD5610D7694CE';
wwv_flow_imp.g_varchar2_table(162) := '04C0022859F2208E96250051A3067F05C0B665A3D6C9707C37E6A5DD4264ED08FAFA2DF86F427E7CBD2500E598575AD5130111C832019E01901F5BEF358BDA450DBB7430609CC1302630363046B49A60CC60EC600CF1D5362DF68F29BB4B6702609D14B5';
wwv_flow_imp.g_varchar2_table(163) := '5A685616C10EF446C8CE6549C4A24E84CE29346DF080BFC2BA0DC88FAD4350285ACBF42702222002F124408DA25651B3A85D2664F6C7E5CC289E15FE54ADAC8ECE32018B138C198C1D8C218C259FFA588AFE93CA04C0775EB3015ED7B95DAFFB69280401';
wwv_flow_imp.g_varchar2_table(164) := '9CB3CE054BCC7BD0EC9059B3B3AC332C952CF88F233732DAB9CE76CCABAEEA898008649780B3410AB52A3F360E6A9745FFCEEC2B352DF6DAEBE09C0363054C7B193B7C0CB158C29892C65E0DD2D828B6296A342D01A8829D18450E8E47A43AC7B7625EBA';
wwv_flow_imp.g_varchar2_table(165) := '75E46F00D86C45C004607814B9C12104B97CCCEBAEEA898008649900358A672BE587476CC6B2000E64FC6CA6695912B8580600C60AC60CC68E76B56ACBF5594499000010004944415401CD44547D39954C670210D914BA656D2DEBBCF6D22F3A396B2ACB';
wwv_flow_imp.g_varchar2_table(166) := '7228ADFA77ACFE4C00A29639511EB9A1214B0006E1F2B955AF89762802222002374AC0E5F30807074DB386BD768167009896992403DDB10DE27C638C60B13A3276308644164BE01B602FA6ECCFA262CA5AE49B13A1DDB419001E00D85D0270813575C900';
wwv_flow_imp.g_varchar2_table(167) := 'FD7494FF60FCEEAC8E9C6E8A7829CD5613412E079EFBCFABFF059A01885F7FA946222002970804D4ABFE01AF59812503E0C1CC5610F719001F13AC19A6BF3E5658C08F2C76F03800C692D8D7DFAABE9C3F8B8ACBF95ACCBF639D19F904A0D65D02B0179C';
wwv_flow_imp.g_varchar2_table(168) := 'F56C2252D02E5BCB9AF98C4E94EBEB070FA8D13500484445044420AE04A851D42A6A56502858354D772D98DA9384FC597D2D567010E697006A353096C43D7F592EDC742600D65B918D9E7D075E9ABE7170CE2D97D3EA7E8FF50C42B8300F1E54C3E30098';
wwv_flow_imp.g_varchar2_table(169) := '08580356B71EDA9B08888008DC0C01E740ADA266F19A00FC895D98962541BB6037E71823AC58D2D2B6D8C118C258A219008393943FEB3BCBDA5A36FAB7ECADD140C4733B7DC726A005567907FB67D3FD74A0A050B6B5B462022AAE2A8A80088840874050';
wwv_flow_imp.g_varchar2_table(170) := '289A6E956C0063855A669A06D3B6CEBB31BFB758C1981159EC68D72D86345B89A9FACD924DED0C40BB5147AB5241CBA670C00351AC53C1E209D992807F8CE15DD749782DEDA0DC0F5734070AC31856545512011110812B13E05200B5CB6B58BE3B80E96A';
wwv_flow_imp.g_varchar2_table(171) := 'DB95BFB1D6AF76630263048BC50CC60EC610C612CD00AC75FFDCCCFEAD2F239F002CA05DAB58FCB7171C731D77335B59FDCF9A8344B6F61FD912869FFAEF1B40502C03BEEED04D044440049241C0348BDAC5DF32A19651D3A86D308D8B77032C4658DD23';
wwv_flow_imp.g_varchar2_table(172) := '9B3566EC685516C05862921CEF6A2FB3768C8ACBFC6A9CBF66E6B67410A04DE3F0800E1F449D756E9CABCDBA998338E76C1DAD80803300852210A4B49BA09B0888402A09986631F053C3827CC1265F9D0DA26D2016D3C65EAA96692F5C60794A84B6C58E';
wwv_flow_imp.g_varchar2_table(173) := 'B6CD20FB8300539A01A433B2989D451C495B12E07F88C27AD73933407B8CF79F559C86667575E63441A90CAEA599F7C4BBDAAA9D088880085C4EC0348CDA450DA3967534ACAB6F977F2E86CF9DEBC40AC60E067FC612CA720CAB7ACB554A67026058225B';
wwv_flow_imp.g_varchar2_table(174) := 'C3895A2DF03CD44E77DA8BDD8EB567F1FCA37FF89A39D069969CC75946EA5FD69D0888800824800035EB720D031CFCED92C6F9FFC5E4EEB26A746384AF6DBB05C610C692CB3E91AAA7294D00CCCA6C0D87C11FADB69FCEC1920122E6379BB9600D5D3E8F';
wwv_flow_imp.g_varchar2_table(175) := '800700160A40E0F8928A08888008248380699633EDF21A665AE62BDDD536FF3CD677AE13332C76F818C25892D22980942600665D7E06C0823F8DCEF2017B25017F56511E03603575B95CE70C003A4F372BB597F52702222002F127609AC5418CE320865A';
wwv_flow_imp.g_varchar2_table(176) := 'C61A9BB62186819455FB5CA1145BECE032002C967CEEFD94BC90E204C07AD0A6703A9D67CF936278ACA70DF85D2E6F330045F0D169092025EEA6668840360850B3A85D41B1A361304D4B4CF0A706B330F0FB18C2F891CE7E4B670260FDC5759BC83AAF73';
wwv_flow_imp.g_varchar2_table(177) := '0087BDD0B1C064F422B3E73007AEA1394B0460FF4F46C5554B111001113002A659D42EAF61610EF1D5305CE166D98ACD563076F818C2448021E40A9F4CFA4BE94C0098BDD9FA0D7FC5296A353B7D64060958C722C6B74B46E6E0029600CEB91857585513';
wwv_flow_imp.g_varchar2_table(178) := '011110812B1370CEC1F17440D332C0C1DF2E699CFF5F0CEFAC9ECE8AD58CB1833184C7912567F6C22A7E137FC14D7C36311FA58D45AD16A24603FE340EBE4023EC766C621AA28A8A8008888008AC1881CF6D9831C262854D00746207630863C9E73E988E';
wwv_flow_imp.g_varchar2_table(179) := '17529900A4A36BD40A11100111100111583902A94C003881E3AF459DCFC3F10854BEC0533998D6AD1C4B6D590444400444203104AE5051C6088B159C08F0B18331240C971630AEF08564BF94CA0400ECAE30B0E06F09409883BFB163796C80FF4F4CEF98';
wwv_flow_imp.g_varchar2_table(180) := 'A8F8AA4588CC08239E86E2EBED5FD49D0888800824864064DAE535CCB4ECD21AFA258D8B6B336CBDD8EACDDA398B1D8E07615B2C01630AD2770BD2D7246B91199973015C60995B1000CE5E887BF0C7653733C0A8D5BC740C03ECFF97BDABA72220022210';
wwv_flow_imp.g_varchar2_table(181) := '6F02A6593C802E6AD4412D8BA3865D1DA0250116339CC50EC71862B1040C2157FF4262DFB1E898D8BA5FBBE2D681B0CE836313D97B2CD7FE4A3CDEB57A9AFDD179DAB52AA2A639104F438947E5540B11100111B82E81C8342B6A36D0F63FA6D3E84E0098';
wwv_flow_imp.g_varchar2_table(182) := 'B65DF79B71F800EB6985B1C3C7107B1E876AAD401D181D5760B331D8A4759EB3A91B67595C72B2373334E76CAEC29600EA75B42B8B88CC81E0A7D062C0545510011110811B21C019001E41EF0731369BC9EF98B62136628C6BDF28C5163B184360B1E4DA';
wwv_flow_imp.g_varchar2_table(183) := '1F4EEEBB294D00ACF70296106012E09CF5900DABED3ED67FACA6191DCC493875E613807ACDB2E736741301111081C410B0414BC4410C13004B047CBDBDB6F96731BF8BE09C89B1C50E700680B104F6FF98D77A39D54B6902003817C0859600580746E8DE';
wwv_flow_imp.g_varchar2_table(184) := '2C2BED3E8BF783D53332A7896A15B4B98666FF8F7785553B11100111F884805F0230ED6A572B88ECD146319D376312473B95B9C27D576B7DCCB0D8C118C25872854FA6E2A52015ADF86C23CCC838F5EF780A20B3387B3FEA76AC3D8DF19F551C56ACAE7E';
wwv_flow_imp.g_varchar2_table(185) := 'FDCC32E8C81201B4350310E34E53D54440043E4BC034AC6DB397971200FB3FA86DBE20D6B7A558E12C76F818C2990B93E558577A99954B67026046C68EE30F51043C8FD359EF451644BD112E93D46A7DCDEA1A21B2917F03EDEA62277B4E42BD578B8FF6';
wwv_flow_imp.g_varchar2_table(186) := '230222107F02366889980054164CCBEAF041D5B42D1E15BF462DA8B5162B9C7360EC600C612C81C514A4F096CE04C0E23D7F84222CF7232896E1B886639D7A691A2AAE1DE91CFCCC85195B54AFA2BD308FB62D03C0D73DAE9556BD44400444E033044CB3';
wwv_flow_imp.g_varchar2_table(187) := 'A85DEDC57944960898B2796D83739FF960DCFE6B93FF5677C60CC60EC610C612C4BDDACBC498CE04C07A2BC8171096CB088B45C059337D66679D0BDE62DC9BAE53B7C8D6CDDAD505F8E3009ADD1F3462D5554440044420E604225E3FBF6683189B01881A';
wwv_flow_imp.g_varchar2_table(188) := 'B54E6DBBDAD6F9CFDADD5F79CF1DDDC5529CB098C1D8C118C258028B2948E1CD2263FA5A453B73B91041A108C72580C03A971D9B84A65AE5235B02885AB60450AFA065CB006D1E489394FA2781B1EA280222B0A204FCFABFE9576433993C9E899A06D3B6';
wwv_flow_imp.g_varchar2_table(189) := '15DD69AF366E5AEB2C663076F81862B1242955BF5904C1CD7E21199F777061CE128002025ECAD139ABB699A075AC3D89FF1FEB69D350F017D2A8A2B9B88016AF09605975FC2BAF1A8A80086496806957BB6183976AD54FFD73208376CB565F97665FD79A';
wwv_flow_imp.g_varchar2_table(190) := 'CCB5F7EF8F55B001189315C68EA050006309C01882D4DDD29900585FB99C250036FDEF3BD0D90B6698668589E940E7ACCE56A27A1DAD8579B41617C169B5C4344015150111C81C016A14072B4D1BB43011F000822485194B542C5638E73A03488B218C25';
wwv_flow_imp.g_varchar2_table(191) := '298DFF4852CFE0C66F0E814F004A7096C1C13A933F4AC1C40EBC596CE5432C8BD99F7356C1300717E4D06E36D19C9B43D39280B6CD08C4B2CEAA940888800818016A14B5AA393FE7B58BA367EA9873A669A66DF69135FDBBEACEAD7AFE3DABA38F15565F';
wwv_flow_imp.g_varchar2_table(192) := 'C68EA058F2B10458FA0052754B6702C0CEB3A9FFB0649D97CF773A8C53EA2C9DFFC5FCDEC1059D8B18318B6ECCCD820E1535743060CC3B4ED513814C13A046F901CBEC2CDAF506E042B88061C6211137C60816AB2C4F03640C71164BE012527FABF7CDFC';
wwv_flow_imp.g_varchar2_table(193) := 'B1676EE6F389F9ACCBE7103001B01900E72244895987B21494945D80C88CAE5DABA339338D9625013C98866FA988800888401C09F81900D3AAC6CC14DAD5AA55D102A74F00EC29BADAC6A76B526E60A736FDCF58C198C1E563C610C6921BF866223F92CA';
wwv_flow_imp.g_varchar2_table(194) := '04C03987C0B2B6A054063BD1676FBC3085756E228E03309F41C0AE7168552A684C5E4463DA1CAADE3D9D06BA8980088840FC08F098A5A669556372022D4B003888016733A969F1ABEE676A640345C6088B158C198C1D3E86582C712E110DF84C7BAEFF5F';
wwv_flow_imp.g_varchar2_table(195) := '4699EB7F2A819F7061885CB90F5CC371CE01EC5816D8F3D8B7C781F5870BFC0180B5B3A7D1B8700EED1A33EAD8575E15140111C82881B60D521A3660A95F3C6F83974550C31C138018E82EAE7B7397E28473CEC70EC610AFC548E72D9D0980751EBB8BC1';
wwv_flow_imp.g_varchar2_table(196) := '3F2C96E0F24520CC0181EB7630DF8D790942C0DAD15A9843FDDC69D42F9C05AF0700DD4440044420A604A8518D890B366031BD5A5C300933CDA596C5B4BE97AAC5D5090E1019232C56306630763086F8CF9816FBC794DDA53301E87692B3697467094038';
wwv_flow_imp.g_varchar2_table(197) := '38827060182E57E82600EDEE2762FA60C6E6CC691C1CDA9505342F9E4173F29C7F8EEE012A31ADB9AA250222906102EDEAA205FF53A89F3961B397B300B52CB430638F58D3DB75764E5DB504803182B1823183B1C3590CB9CE3713FDB6F54CA2EB7FEDCA';
wwv_flow_imp.g_varchar2_table(198) := '5B87068512C2917556D683CF23EB68966B7F3106EFDAF43F9CE52BB50ADA3317D19AB6B2308F56AD1E83CAA90A22200222F06902BC0600AFFDDF9C386B8396D3E073FF0967B399FE497CEF1813581823C291F5162FD6F978018B21F1ADF5ADD72CDD0980';
wwv_flow_imp.g_varchar2_table(199) := '05506671B9E131E48647E10AB614C00EE5411EB7CE6E65B7607587CF00227F01A076B582C6CCB43F23A05DB72480ED806E22200222B0C6044C8B18FC79AA324F596ED9D43F7FCBA4F333E62664F6B7C635C475F7CF9860ED608C60AC60CC60ECA0045FF7';
wwv_flow_imp.g_varchar2_table(200) := 'BB09FE40BA1300EBBDC0827E6E68C427007CEE333AEB681B5B27A2DB1C8F40CD17D16EB6519FBC88EA8573E0853622DF8644344195140111483981566511B58B17C0B395A27604972FC185B984B43AB270D0298C113E01B098C1E7B0188214DF529E0000';
wwv_flow_imp.g_varchar2_table(201) := '41B184DC88CD008C8C22285C760C80F577ACFB75A97EE6442E5F002F08543B7F0EB533A7D09A9F8B75D55539111081EC10E060848392DAF9B33E0968379A70367041D84D0096B46CCD905C67C7AC9F2D0D7370C81891B358C198C1D8719D6F26FEED4C24';
wwv_flow_imp.g_varchar2_table(202) := '00F9B131E447C710149900B41071BA27F65D6756E91C7C161DE6D1AAD6503B7D0AD58F8FA33937DBC95863DF065550044420F5046C36928392EAE993A89D3DE3B50A410E2EB0B57FC7D69B96F121C6C5C784A8E563046305638612801877D88D562D2816';
wwv_flow_imp.g_varchar2_table(203) := '91B7190016FFBBCEBC22208BDF80B74EFF2CB6777422CBA4790D80FAB95396049C407376DA1F1710DB3AAB62222002D92160A3E7E6EC0C6AA74EA07EF654E774E5D0823F4B0CA6D0AFDD11DD18C09860853182B18285B1E3DADF4DFEBBE99E01B0BE6516';
wwv_flow_imp.g_varchar2_table(204) := '97B7299DFCF0305C3E042FA71BB59AD6739695DAFBF624D67F2E082C930EBC5335CE9FEE9C5E3333E5DB11EB8AAB722220029920C02580D6DC34EA278F7A7DE201CB6E690620EE047C0CE081D64DAFA92E1782B1823183B123F6F9CB2DF20D6EF1FB31FF';
wwv_flow_imp.g_varchar2_table(205) := 'BA835FD3191A46DE4AC07529CBF2FCD1A916FF91849B3F1D30008FAA6DCD4CA239710E8DE90934E7E711B5DA5A0A48421FAA8E2290460236F5CF6631E037A727D1B019CAC6C573E0D500115A68B1C10BDF5FDB72037B672CE0B2309700F2791F2B728C17';
wwv_flow_imp.g_varchar2_table(206) := '3C662CE51980F5D20D004AF04702EBD0DCC000720343F0199D4DA7C339C0FE9084DB65F58C6CAACD2F054C5C40D5A6DA785A60D46A25A115AAA3088840CA0870DDBCB9B888BD1F623F0000100049444154DA85F3FE0CA5164FFF6B36BA8312132EEA6C12';
wwv_flow_imp.g_varchar2_table(207) := 'DACC7A72A015E61194CAC80D0E813183B12309D5BF953AA63E0180756E689D1AF60F20EC1BB024A00FB08E065CD75011EF1BB353ABA1B3C4C515CA7EF2A276EE1C168F7E88BA65DB915FCEB00FE84F0444400456914064838FC6C445544E1CF74900FFEF';
wwv_flow_imp.g_varchar2_table(208) := '6C9695CB96BE1A5DEDF2CFD7E8EEBABBEDCE622057B0E03F80B07FD08A3D5ACC80C58EEB7E3FE11F487F02D0ED206676E1D028C29171EBE8BECEAB36A2EE3C89F37DD78BC2103C40854EC6A36D178FBC87FAF9B3B60CA0198038F79EEA26026925402DE2';
wwv_flow_imp.g_varchar2_table(209) := '6F942C1E791FB5D32771E9F43F8EA67DA3BBDAE59FC7F48E53FF56351F1F46C6C018C1E7F65226FE824CB4D21AE96C3D2737BE01858DB7211C18B4D17FDB8267D31E1360A4AC7F1082D703881A0DD44F1DC7E2A1FDE059019166008C8EFE444004569B00';
wwv_flow_imp.g_varchar2_table(210) := 'B5A776F634163ED8EF4F4FE6154A1D67574DAB56BB2E57DEDF755EB5D17FD4660C68DBA87F10850D5B901B5BEF75F63ADF4CCDDB994900387ACE8FAF4761A375F2C090756004D81416CC08EC3FF1FFE3749439965F779B9944FDEC493F03D0B9F2960E06';
wwv_flow_imp.g_varchar2_table(211) := '8C7F07AA8622902E02ADB959D3A033A89D3C86E6E4051B50D96C6498C3A52580B83797DACF1880C8D6FC0751D8B019F9B1757EA635EE55EF55FD329300B842D13AD712804D9B6D0660C08FFC99C1DA935EB15CF9ED381EB760BBB1A58BA856B375B77358';
wwv_flow_imp.g_varchar2_table(212) := '3CF611AAE7CEC21F796B6FE94F04444004569200AF4ACA0390ABE7CFA131710E3C05B05DABD82E23F8E0EF4CA7EC7F6BFD77FDFD774EFFE320301C1840C162031300C68AEB7F371D9FC84C02C0D3010BE3E3285A96C7233C614114367D1E310B44420C96';
wwv_flow_imp.g_varchar2_table(213) := '75B5AA729A8DF5AE5F388FF9C3EFD9F4DB31B42A74C07418A55A210222105F021C6CD46CD051397ED40621E76DF051B57194CD4252471313FC1DA8A18C01B058C098C0D85018B719005B2E8E2FFDDED62C3B0940BE00766E71E326847D65A05547BB51EB';
wwv_flow_imp.g_varchar2_table(214) := '18AE0555D07811FF9B7341778DCAD932C0292C1C780B958F0EA35D598C7FE55543111081C413E0A9C8956347307FE06DF0B749C01FFFC9E501D326BB433C6ED7AA8509BEFD31F0FB1860B1803181B1813182CBC5D7FA769ADE0BD2D4986BB5C5E5F3C80F';
wwv_flow_imp.g_varchar2_table(215) := '8FA2B86E3D727DFDF6D108E011A0F660FF49CE5F10741200E76CFAED3C2A870FA27AFC089AB353882C934D4E4354531110812412E0DA7FE5E8612CBCF72EFC99482E842B94E0A7FF6D3D3D316DA2F63306589D1913181B1823182B12D3865BAC68708BDF';
wwv_flow_imp.g_varchar2_table(216) := '4FCCD7699C5C06C80D0CFA9F060E87C610942D11B080EA13013382C43486758603A7E25AB3D3DE092B273F06A7E55A359B8E4B4C435451111081A410889A4D3478CDFF7367503B7B128D0B67D15E5C009C830B43FF8898DCAE5D0D8BFC0CFCA6A38C018C';
wwv_flow_imp.g_varchar2_table(217) := '05391B1C3236304630565CFBFBE979373309C05297B96209B9511E0CB81DE1C83AB8EE91F5367C5EFA48FC1FCD7E59C925A7E39900F387DFC7C28787D19C99E15B2A22200222D05302CD8579544E9EC0E2B1A336FB7801110FFC8B5AB0F00F135224E616';
wwv_flow_imp.g_varchar2_table(218) := '45E0D954D47EC680C2A6ED3E26303624A60D3DAA68E61200AEEFE4783D80ADB7FBB3025C68085A0D6F103D62BA0A9BE964002EB475374B601AD393583C74000B87F6A3C1D3712C535F854A68172220021922D0B4D9465EF467E1D0C18ECE5820858DA2E1';
wwv_flow_imp.g_varchar2_table(219) := '9C5160B18758FC5DBB120CFE30CDA7F6E7C76C3068B1803181B1E1DADF4CDFBB16FDD2D7A86BB5C8E57228ACDB88F28E3B5058BF113402FE42202C93BDD6F762F79E7370B93C98C536A72750F9E01D54DE7B1BF573A7D1AA2C22A273B2C4AEE2AA900888';
wwv_flow_imp.g_varchar2_table(220) := '40F2084416F42F62E1E0DB58D8FFA63D9FE8E84FBE884E02D01994200937D37A6A3EB59F31C0C7028B09CE624312AADFCB3A663201C88FAF4779FBED28AC5B6F0134008DA1731C00D13ADE25A384B6EE66330051B582C6795B973B790C951347C14B05B7';
wwv_flow_imp.g_varchar2_table(221) := 'E6E63A4940325AA25A8A8008C491800D22B8F65F9FB888DAE98F513D76C41E8FA3B5B8088439382B71ABF6D5EBE33A6FB5DB5EF39DCD5E3006301630263825001D3E69BEA7C116C6C650BA6D1B0A63E33E798D9A75F8692136BC6B237C9A88E2ACC23613';
wwv_flow_imp.g_varchar2_table(222) := '00CBC49BF30B983FB81FB36FBD86DAD953B07712D1045552044420A6042C01A89D3F87B9FDEF60FE8383684C4F016D1BED5377A830FE31A675FF6CB5BA8248ADA7E6B3EA8C019D583006C686CF7E25EDFFCFDE0C80657DB9FE0114D76F407E740C41A9EC';
wwv_flow_imp.g_varchar2_table(223) := '3BDEB925EB30E34E4AAF9B73B2AA2E5F42D03768CB5A4D2C7C7808B3EFBC613301C7D0E411BAFC808A088880082C8300CF2AAA9E3CEE3565E1D07B68552AE095F22E8D96BB1AB48C4DAFD057AEB1D96E5D9D7360B0A7F63306301630267046E01ADF4EE5';
wwv_flow_imp.g_varchar2_table(224) := '5B994B00E09CEFC8D0027F6E641CF98D5B911BDB00FED00EDA2DD854807F3F4977345C1A34A7EA784DEEDAA96358B4A9BAC5E31F8197EC8CFCF5AE93D422D5550444602D097094DCAAD5C0A97F2E2B2E1E3E80DAC98FD0B6E5466A8D0B6CF9712D2BB89C';
wwv_flow_imp.g_varchar2_table(225) := '7DF33A29A6F1D47A6ABED77E8B018C057E73DDD8E09F67E42E7B09C052C79A01E746C751DC71270AB7DDEE6702225E1A3889C19286EBAC2B2DC38DEA55B47850E0478731F7DE3E544E7E0C5EB96BA9D97A1401111081EB11889A0D34262FDA4CE247A81C';
wwv_flow_imp.g_varchar2_table(226) := '3B8CDAC71FA239711E51A30E9876C26652AFB78DB578FF5AFB8C4CDB23D3788EFCA9F9D47EC600B03DD7FA628ADFB3A891E2D65DA369CE0C386F094079E76E7F3C002F0011D56BFEE0109B06B06F3A2B09FBF3898043ABBA88EAF10FFDD1BA958F0EF98B';
wwv_flow_imp.g_varchar2_table(227) := '7730A34F586B545D1110813522D05A5CB4C0FF21E6DEB5E5C4A387D19A9FB3C9519B21ED6ACCD24CEA1A55EF26774B2D8FBCB653E3A9F55CF7A7F633063016DCE40653F3F1CC26006002303286FE9D77A0BC751B8242DEB2DB2A6C211DFEA280B4998475';
wwv_flow_imp.g_varchar2_table(228) := 'B3B34C3628947CFD6B674E5802F006FCD4DDB93368CECDA1ADEB0324AC47555D11585D023C7DB8CDD1FFF42416DE7F17B3AFFEC1128123800BFD71462ECCC3DF6CB6D13FC6EAEE2A95A196F3D0AE56C36B3CB59E9A4FEDCF5B0C602CB8CA3753FF7290FA';
wwv_flow_imp.g_varchar2_table(229) := '165EA581CE39F0D28FC54D5B50DCB819E1C0205C98B34FD35AEC2149066ED5F57FCEEA9EB34406CE5FA2B371E10C2A473FC0C2C17750B1190166F1FE73BA13011110812B106857ABFE34E285C3EFD9E0E13D543FFE08CD9969C005E0F5FE61032724ED76';
wwv_flow_imp.g_varchar2_table(230) := '49CB1DA8F1D47A6A3EB59F31C03997B416F5ACBE41CFB694B40D59A707C5A2FF81A0FCD87AE4C73620181AEB18390D8625696DEAD6D79993BA621F10E46D29E0234CFDFE97987DED8F68700D2FC1EDEA364F0F2220022B44A0353783B9B75FC7D41F7F87';
wwv_flow_imp.g_varchar2_table(231) := 'C5634711B5DA7036A880E9E50AEDB2679BBDEA86A8795698C050E3F3A6F55EF38747C11890E8B65DB5D137F6467613802E9FB05C46CEA6810A9BB7A1B0712B8272BF5FEBE2C12230A3E97E2C390FACB30B1094FA7C32D398B2A9BC836F63DED6F2166D2D';
wwv_flow_imp.g_varchar2_table(232) := 'AF7EE11CDAB59A2D13704E2C39CD524D454004569080E9064FF1AB9E3A81F9FD6F617EDF9BA85F380F8439AF23804BA66658BBA8E551BB056A3B359E5A4FCD0F4DFB91F15BE61300F63F7F02B2BCEB2EF4DD7937724343002F0C54B720C98301929AF9B2';
wwv_flow_imp.g_varchar2_table(233) := 'DE9608C04ABBD9F2D37A33AFFC1133AFBE88DAF933803387866E2220022200D42727306B8384E9D75F41E5D88768DA4C00CF0470A61F9C5144ECF5E20ABDE8EB1C8107FE51D3A9EDD4786A3D35FF0ADFC8DC4B4A00ACCBB926D4B76B37FA76DFE32F0E04';
wwv_flow_imp.g_varchar2_table(234) := 'CB169935FA1980A40E942DF3B5A6C1154B96F90EF8330166DE7A15D32FBD808ACD0434E767F97632B3FA4ECD752F0222D00302ED7ADDD6FA8F61E6B59730FBE62BA89F3F6BBA6053FFA185070651961EEC67D53741ED361DF45A6E9A9E1F1DF31A4FADA7';
wwv_flow_imp.g_varchar2_table(235) := 'E6AF7A7D62B843EBE118D66A95AB1496FBC00342CADB76203FB60E8ED3E741D8AD45BBFB98CC0767ED60891A0D34795EAF65F7B36FBF668EFEAACD0A7C0C9D1E98CC7E55AD45A017041AD353FE12BF7307DEC1C2A103A89DE275FEE76DD3CE06FDA68109';
wwv_flow_imp.g_varchar2_table(236) := '09FE56E12BFC75B49BFA474DA7B653E3A9F5D4FC2B7C21732F2901B02EE779A105CB0E8B1B36A3B07E3372239D24C027902D3322CB22ED63C9FCA303B35822601E8DC6F40466DE780513CFFF0A0BEF1F406B91CE9ECCA6A9D6222002CB27C06381168F1F';
wwv_flow_imp.g_varchar2_table(237) := 'C5F4EB36F2B741810FFEF333362868C18516FC3903B0FCCDAFED374DB3790023359CC19F9A4E6DF71A6F5A4FCD5FDB0AC663EF4A00BAFDE08200F9E11114B7EE40E9F63BFC52808BDA889A753F1D8624DF9C65F3810313009EE6533B73128B96EDCFED7F';
wwv_flow_imp.g_varchar2_table(238) := '1BF307F7A176EE34DABCC21774130111483B01CEFA356767B068B3810BEFEDFFE434E1D96944AD96359F5AC1D0C062FF8DFDDF152AD8D56E678F9CFAA7A653DBA9F1D4FA2B7C23932F25B8877BDF5F41A98CB205FF81FB1EF24B02960A23AA55EDC16601';
wwv_flow_imp.g_varchar2_table(239) := '604ED1FB5DAEDE1679304F98032CD141AB89C6D404E6DE791D13BFF999FFA18FD6DCECEAD5457B1201115833021C04CC7F781853AFFE09B36FDB52E04787D09ABA081B34C3FFD00F47FFBE761C3FFB2709BB73609243EDB6275ECBA9E9D4766A7CC21AB3';
wwv_flow_imp.g_varchar2_table(240) := 'A2D555027019DEA0504469CB367FA04871D36DF0E788FAF7E9082CFE3FC9BCB35900067F9FFDDA733A47F5E431CCED7B1373EFBE8985231FA07EF13CDA96F0804A90CC56AAD62220025721C0D17D737ECE5FDF7FFEBD7741DFAF1C3D84A605FF76BD06E7';
wwv_flow_imp.g_varchar2_table(241) := '1C1C07092E5961E1F3CDA556B3C06B38B59C077853DBA9F19FFF7C765F497A4FF7B4E75C3E8FFCD838CA5BB6A2C0AB030E8DFB0302CD2B3ACB00A9088CCE9A13228265C93C30707AC24F014EFCF667987EE9F7A89D3F6BEFF514AB36260222100302CDB9';
wwv_flow_imp.g_varchar2_table(242) := '19CCBDFB16265FFC1DE6DE7C05B56316FC67A6CCDF4D1378B11FCE0E9A2EC4A0AACBAF0235DAA6FD4DE4BC7687A6E1D4726A3AB59D1ABFFC8DA7EF9B4A002EEB538E8EC34201054B028A9BB6A278DB764B08D6992D05E04FED4634ACCB3E9FC8A7CE0141';
wwv_flow_imp.g_varchar2_table(243) := '087F908F397C646BFFD58F8F83D708987EF58F583CFCBE3F0D881705619B351B90C85E56A545A0438001B1DD46ABB26823FF639879FB357FBADFE2E18368D88C5FD4B0917F9887CB1701C770102159B74FD7961A4DDD7261E0B59B1A4E2DA7A653DBA9F1';
wwv_flow_imp.g_varchar2_table(244) := 'D0ED1201F6F8A5FFE8498700D7894ADB6FC7C0DE4750DEBE13CE456857E6000B96FE13CEF98744DF591BE80C111CDACD3A9AB3D3A87CF801A6FEF86B4CBDF04B2C984070BA906B69896EA72A2F021926C069FFEAE993987EE5454CFFE9793FDB573FF331';
wwv_flow_imp.g_varchar2_table(245) := '5A0BA6671CD030E89B168025C99C96EA6F1A4DADA66653BBA9E1D4726A7A929BB7527557027005B2CE46C85C2F1A7AF011F4DDB11B61A960C1BF86A8D5BCC2A713FC92B5936B7E2E6FEDB3D9005E2678E6A51730F1EB9F60CE460AD5D31FFB0B08B56DA9';
wwv_flow_imp.g_varchar2_table(246) := '20C1AD54D54520730498B847E6B78DE949CCBF7F00932FFC0A5336F55F3976C482FFACF17036EA2FC1E5CCF7193C395360AF26EDEFB3F5F51A6DB31AD46C6A37359C5A4E4DFFEC67F57F4009C095ACC082616E78C41F1058DA763B78FDE870780C3E50DA';
wwv_flow_imp.g_varchar2_table(247) := '741A58AEF4BD24BE66CEEFBAA380B665CF0D5B13AC7C7CCCD60A5FB765813FC01F2864FF6FCCF2FC609E0D91C446AACE22901D02AD5A0DF5890B98FF603FA65FFE3D66DFF8932DEDBD87DAB9331D1CBFE7000010004944415416FCE7E1F5CBFC1EA67370';
wwv_flow_imp.g_varchar2_table(248) := '290901D4642BD4686A35359BDACDE04F2D07DB9A1D13B8E196A6A4F76FB8BD37F44167C612E472C80D0E83EB47A53BF6A0B0FD4E847D0388DACDF4CD043807E7027F0A50D03708AEA12D1C7C0793BFF9B1FF25415E2FA07AEA24DAD5CA0DF1D387444004';
wwv_flow_imp.g_varchar2_table(249) := 'D686C05212BF78ECA81FF15FFC971F5A22FF7B3426CF0336CA77395BEF67B1D9BF4E0DA3CE4322EF3FA93447FED4666A34B59A9A4DEDA68653CBA9E99F7C5ACF9608044B4FF4F8790261A968A3FFCDE8BF672FFAEEBC17E1E010D0B46580A5A5000B9C9F';
wwv_flow_imp.g_varchar2_table(250) := 'FF56425FB1B6B820E767394C27C0EB0454FC8542F6D92CC05B983BF036160ED928E2EC69B4161710B579C19084B655D516819411E0F5FC1B9313A858E09F3FF00EE6DE791573EFBE613E7B1035F3599FBC3BC00742067F67FF410A6E4BEDA0269B3653A3';
wwv_flow_imp.g_varchar2_table(251) := 'A9D5D46C1EFD4F0D4F412B57AC094A00AE85D646C585751B31B4F7210CEED98BFCD0B08D8E1B689BA15DEB6BC97DAF331A702610AED40FD8FA6063F222160EBC89E93FFE06177FFB334CBDFA222A9C0DA8D793DB4CD55C045246A031338DB9F70F62F24F';
wwv_flow_imp.g_varchar2_table(252) := '2FF899BBE9DFFF02D5E347C064DE154B4068C9BDE9199602660ADA7F7913A8C951B3E1359A5A4DCDA676836DBEFC837AFE2902C1A7FEA7FF7C8E40AEBF1FFC0189BE9D77A2B8652B7223A308F2798023607FD9CCCF7D25D92F5031820041B1EC0B2F0C54';
wwv_flow_imp.g_varchar2_table(253) := '3F7D028B1FECF33F2034FBE6AB987FEF1D2C7E74C45F33C09F29608EE79526D92D57ED4520310422D31E5ED18FE7F6F360DDC523EF636EFF5B987BFB35F00A9F954307D09C9E84B3E9FE803F6E16E690CAE06F1CA8C5D4646A33359A5A4DCDA67643B76B';
wwv_flow_imp.g_varchar2_table(254) := '125002704D3C9D3779A47C61DD06F4EF7908030F3C86FCF83AB46B8B685778408D4D853BD7F9609AEED92666CF2EB45605E01463736A028B870F60EAF99FE3E2CFFE01533CADE8C3C3A84F4F2395E202DD44209E0478A05FF5DC19CCBCF51A2EFEE24798';
wwv_flow_imp.g_varchar2_table(255) := 'F8D58F31F7D6CBA87EFC912DD12D220A6D90121600FA30527873A6B93608A306538BA9C9D4666A34B59A9A9DC256F7BC494A006E106938388CFE7B1FC0E0C34FFA990067F617B51A36F0B569738E9A6F703B89F958B74DCE663B9CCD06385B0E889A75D4';
wwv_flow_imp.g_varchar2_table(256) := 'CF9EC2DC1B7FC2D4EF78E5C0E76DD4F1362AC73FF2471DF3B4231E40C8D18981494C53555111883501F3457F5A9F8D76239B6DE3747FEDCC497FF9EE99D7FE8489DFFC1C532FFE169523EFF9513F821CC2811170E4EF1373FB7EACDBB79CCA599B2216D3';
wwv_flow_imp.g_varchar2_table(257) := '606A3147FED4666A34B57A399BCCE2779400DC60AFF3F7A34BB604D0B7EB2E94B6DF81FCFACDE011F39607749603CC186F705309FB98B5901E66B58EDA1118DC39FAA008558E7D68D38DAF62EA0FBF3211FA29A65E7E010B470F83EFB54DACEC2BFA1301';
wwv_flow_imp.g_varchar2_table(258) := '11B8450236C440AB5241F5CC29CCBEF306A6FEF85B4CBEF04BCCBCFC3C16DE7B17F50B67FDE97DED5AADA345F4D7C066EE8294CA7B1481D3FEA64C5E83A9C5D464AFCDA6D1D4EA5B449E99AFA7D4427ADF7F5C63CA0F8FA0B4792BCA3B2D09D8752FF2EB';
wwv_flow_imp.g_varchar2_table(259) := '36C1852138EA05AFAAD5FBDDC6678BCEC199A0048512C2C151B8629F1F6D2C1E78DB2F099CFFD1DFDA54E48FBD40553E3E8EE68C2D0BA49D497C7A4735492B011B58B416E651BB700E3C0B67F20FBFC3859FFD13267EF9CF987DE979D46CCA1F96217030';
wwv_flow_imp.g_varchar2_table(260) := 'C2113FCF83779CF6B7EF81258D5C4C57A8B9D45E6A70C9B4D86BB26933359A5A9DC666AF449B9400DC045506C0FCC80898690EDEFF304A5B77C0E5729600D85240BB8DD43ADC1223E7001B59B85C1ECEA61939E5CF4B08D7CF9FB1B5C763E0E583E7F6BD';
wwv_flow_imp.g_varchar2_table(261) := '81D9375FC2CC6B2F62E6CD576D9AF27D54CF9E863F58908C96B6A5471110812B12E048BE3E3589CAC7C73077E01DCCBCF10A66CD9F66DF7AC51F805BF9E8306AA73EF6CB6EADCAA26D230283216C30026792EE9CBD96D23F4B6AA276DB6BAE33EDA50653';
wwv_flow_imp.g_varchar2_table(262) := '8BA9C9D4666A744A5BBE22CD326B5991EDA676A341B16809C09D187EE409F05293CCBA230B6CBE9871A63E09E07023B2EE3591714C048A255B6BEC07471EADD9592C1E7CBB3323F0CF7F8B73FFF4B79878FED7987B6F3FAAE7CEA25DABDA17F527022270';
wwv_flow_imp.g_varchar2_table(263) := '35025C62E3121A8FAB997EFD155CF8E54F70E15F7E88899FFF23666D89AD7EEA3878B11F572820289BDFD98C1C18F4B3A03DD646BFEEDFD5DBA0D4E735D86BF1AE3B416DBE1A57BD7E6502C1955FD6AB5723E0C29C3FD7B4BCE37630EB2CEDD8654B011B';
wwv_flow_imp.g_varchar2_table(264) := 'CC071DA24615112F48E1BF9CE22C9C4900DBE867030A7026424C00DA8DBA5F8FAC1C3D84F983EFDA72C0EBBEF072C2F3FBDFC2BC2D172C7E683302A74EA07EF13C9A73B33E298874BC0069AA648800070CED7A0D4D9BDE6FD8689F97E9E511FC0BEFEFF3';
wwv_flow_imp.g_varchar2_table(265) := '7EE24FE97BF70DCCD99AFFDCBEB7B070E800AA16FC9BF3B37EA6D1E5BA7E6749385C9AB58646D1695F64DA1A35AA7081F39A4BEDA506974D8B798D166A333FAD72E3049400DC38AB4F7D322C957D0230FACC573078FF43088B79B4176610D5BBA3DCD43B';
wwv_flow_imp.g_varchar2_table(266) := 'E565383AFE693A14C0857980C539F0EA631CB1CCBFF532267FF5239CFBE17FC1B97FF8BF71F1D73FC5B44D6B2E1C3D82DAE4047850E1655BD35311483D81CED1FC33A8D854FEEC7BFB30F9E2F338F7A3BFC3D9BFFFAFF097EF7DF137FEDA1B8D89F3882C';
wwv_flow_imp.g_varchar2_table(267) := 'B1469083CB1741FF722E009C43666EDDB6525BDBA6B1D45A6A2EB5970900B538332C7ADC50B3A41E6F312B9B0B4214376FC5E0438FFB04A0B86123029B96036FED1678942A9F66A2D8D49C6F6718FAD980C0A6E6782121E71C5AB3D3A81E3B82B9B75FC5';
wwv_flow_imp.g_varchar2_table(268) := 'D41F7E8DC9E77F81A9975EF0C707709660F1C807A81CFFD0463727C0AB0E366767FC11CDAD4A055C32689BF8F1801F7FE961EE87C5EF4C7722104302669F1CDD4736ABD56E34C0517EAB5A012F9FDD9C9F03EDBB7EE11C2A278E61D166CA16DE3F80B977';
wwv_flow_imp.g_varchar2_table(269) := 'DFC2CCAB2F62F2F7BFC2949599D7FE8885F7DFF5A7DCB66B15C0B4C6FB54B9CF928082FD3F63B27D999E068502A8B54C00A8BDD460F289A12524A24A19B3A4DEF589730E617FBF19E32694EFB81BFD7B1F47DF5DF7DB6B7DFE0241DE714D0C3295A963E9';
wwv_flow_imp.g_varchar2_table(270) := 'E6B0D4EE4FD6EC22B49B6D9BF25C40FDCC292C1EDA8F5913BAA9DFFD14177FFA439CFFE7FF810B3FFB474CFEF1B7987EEB35CC7F70108B278EA376E1021A7373960CD4C16D2D6D17BA89401C09982E30F8371717C0A9FDCAE95358F8F03066F6BD8DA997';
wwv_flow_imp.g_varchar2_table(271) := 'FF808BBFFA09CEFFF8EFFD287FF2D73FC6CC9F7E8BF97D6FA06A4970737ACACF86752E6B6B8308EA8715DB24BCDDBB8CC9351B6EEDA796F2823F61BFADF99BC6526BA9B9C50D9B4C6FFB0D8DE90D745B0E818C59D472105DE53B669CCE3984E5324A5BB6';
wwv_flow_imp.g_varchar2_table(272) := '63F0E1A731F0E053B636B511885A889A757B8CAC208337B6DB8AF171B646C9D10B2F4C921B1E036706DA9505D44F9DC0C2FE37306D539D13BFF8112EFCE4EF7D0230F1BB5F9A50FE11336FBF8EB9F7F7DB28E9B0CD0E582270FE0CFC0C018F1BA8566D5A';
wwv_flow_imp.g_varchar2_table(273) := 'B4618C599AF66885EB8336EAA2F87EAED8088233082A669762811BB683ABD9136DAD6936E78BD96077A4CF25AFA6CD78D52F9E43EDF4492C1EFBD0D6EEDFC3AC05FFE9D75EB211FE6F70E1E7B4F51FE2E2CFFF09532FFC12736FBE84EA87EF8357D98405';
wwv_flow_imp.g_varchar2_table(274) := 'F8706008E1C03082BE013F9BE67239F075F066C1900F99292621B03677B4B4E5B5951A4BADA5E6527B9DB3E0CF921928BD6DA812805BE4E9C21CF2A3E3FE7880FE7BF7A2BCEB6EE437DE86C0A6EBFC95029712815BDC4F62BF4EE7742110B274C4CC4F91';
wwv_flow_imp.g_varchar2_table(275) := 'D66B362DBAE8A7441B36F2A94F5CF4BF5AC6E580C54307317FE02DCCBDF50A665EF93DF84344532FFC0293BFFDA92F13BFFB39266D398123AA99375FC1ECFEB731FFBE7DE7F0FB583872080B478F60F1F8519B413886CAC727BAE5637B54A97C2C0637C6';
wwv_flow_imp.g_varchar2_table(276) := 'A063378B9CAA375BA24DD1B6E6CDC6686B7307DEF549EAF4AB7FF2B35693B6B43561F639F19B7FC1A4D9272F8EC50BF5CCBEFE27CCBFFB1A166D4A7FF1E80796CC9E0097001A5313DEF69BF3F3685516D1B6A52E3F5A70E62736E50F3E3A676ECF620F59';
wwv_flow_imp.g_varchar2_table(277) := 'FBEB067E6A28B5949A4A6DA5C672DD9F9AEB4C7BB386A5D7ED5502D003A2216701366D42FF1D77A17FCFC328DFF500F2E31BCC9FDB3652ADF94720A38E0CDE2263D02D266A745C5728C295FB11F40F831716E2A8C799F0B5E6676D89C0C4F7D001F0E0C1';
wwv_flow_imp.g_varchar2_table(278) := '99177F8D895FFD332EFCF86FFD018467FFFEBFC097FFF7BFE1FCBFFCBFFE80C2C9DFFF16932FFF111C654DBFF10A787DF49977DEF423AFD903EF60EEE03E2BEFAA1C1483B91B66B00FB41D8EDE694BB429DA166D6CCA6C6DE20FBFC5C5DFFE1CE77FF64F';
wwv_flow_imp.g_varchar2_table(279) := '38F74FFFC36CF2FFC2D9BFFDCF3867F679E19FFE9B3F6D6FCA9282D9D7FE80454B666BC78FA0357911B05905572A23E028DF46FB1CE907C512DCA5917ED74F96CEB4A1FB64AE9856F2623F8D8E76524BA9A9FD7B1EF61A5B32ADA5E6660ECB0A34580940';
wwv_flow_imp.g_varchar2_table(280) := '2FA05A50A313734DAAFFAE3D18E04582B6EDB4F5A94130A871C46B0BE09D20D88BFD257D1BCE1CDC82BD4F04FCE94C960CD8236C0A94473CB717E6D19C9942E3E2793F2B503B79DCD6488F821740E141830B360A5BF8E020166C8960FEBD7D983FF88ECD';
wwv_flow_imp.g_varchar2_table(281) := '18BC8DF9FD560E58E12987FBDEB2FFBF89B97D56783AD5BB4B8F6F60CEFF5F8FE270351BE8DA8AD9CEFCFE3731EF6DC9ECC9DB96D99725953C8075C1124BDAE082CD582D1C7E0FDE2E3F3C84459BFAAF7E7C0CB5331FA371FE2C38DA6F71E98A07F45960';
wwv_flow_imp.g_varchar2_table(282) := 'F3769F2F58D0A7DDE701F305DA7ED2DDBA27F5B7913FB5929A49ED0CFB0751322DA5A6525BA9B1D45A38D793DD657D234A007A6801615F1FFA77DD89E1071F45FF5DF77596026C2DCF22BFAD53DB5AA1397F0F7797924D71C4D36D8AF9B473669261CEC4';
wwv_flow_imp.g_varchar2_table(283) := '316F6BA0457FCC802BDB7A68D992293E96FAE04C3CC9B46D53A7CDA98BA89F3D098EB0AA47DF47E5F0412C7EB01F0B074DB0F7BD81059B7E9D7FE755A888C1CDDA80B71DDA90D9126D8AB6451BAB1E3F8CFAE9E3684C9C436B610E3CE6C407751BC907A5';
wwv_flow_imp.g_varchar2_table(284) := '7E5BFEA3BDF6C3D97357B4D17DBE08E4CC9E831C40FB86DD18E8323DCA370657F88B4C23A366C3DE89C0D9114EFD534BA9A9D4566AACBDA9BF1E11087AB41D6DC6085004F2C323E8DBB1D312803D56EE4371CB360416B4EC6DA0DD060F6AF1CF75771901';
wwv_flow_imp.g_varchar2_table(285) := '4B02FCFF2C030802F0B2A68E8269C2E98A65CF2FE072018BB10C0A457074C083B978AA606B6EC61F44C573A61B17CFA171E10C1AE74EA37EC61283D32750F3E578F771E9FF7AEC701187CF73F8C4566843B4256F53B4AD89F3DED66873EDEA2218AC9C73';
wwv_flow_imp.g_varchar2_table(286) := '3E290D8A66ABB451160BFEFCBFEB5E248BF68CD0D6F7EDB3DED475F779024C8AA891F60E3593DAC9E0DF6FB3AAD4546AAB0B2D89B2F7F5D71B02416F36A3AD5C4E20ECEBB7E07F2F469FF932061F7814F9F1F580053406FFA8D504DAADCB3FAEE7D724E0';
wwv_flow_imp.g_varchar2_table(287) := '008AE65281FD1F76B3FFBBCB9EC3FEDF29F61E1C70E9FF813D5701479E2ACBB085AE2D818F4087239F5B01ECD5CE23FC8DCFADB86EB177E10B74BB1E01D344AF8D4C024C2BA999D44E6A68FF5DF722ECEBBFDE16F4FE320898322EE35BFACA3509B83040';
wwv_flow_imp.g_varchar2_table(288) := '69F36D7E2980465CDEB9DB92808D088A25F8248046CE72CDADE8CD0E019B1D20ABA572F9B4A99F2DC8C199607059C0E56D6680A5608F5602E3AD52F276270ECBE7E00F582D984DD1B6F2053816DA5C9803CC06C180665C7AFF0000100049444154EF8DD5';
wwv_flow_imp.g_varchar2_table(289) := '6C95F6F9295BE56BFE4DDD5D8D80F18AAC501B03F3D9FCF8465033A99D9CFAA7965253AFF675BDBE7C024A0096CFEE1ADF74FEBD7060103C3360F4A92F61F8D12751D8B0099CBAE691C03EDBB5ACD77F50772B40807DA00288416F1840B79520601AE8B5';
wwv_flow_imp.g_varchar2_table(290) := '90674704A1D7486A253593DA490D0500783B866E3D26A004A0C7403FBBB9A2CD048C3CFD2C469F7ECE67B5E1D0089C8D1E98EDF248573E7EF63BFABF08888008A49E808DFA9734909A486DE4C89F5A39629A49ED4C3D83356EA0128015EE001786C80F8F';
wwv_flow_imp.g_varchar2_table(291) := 'A26FD76E0C3DF818061F7CD4FF86000F6463F067F61B59F6CBE72B5C156D5E04444004D69E0003BF695EC4E3A1EC39B5B0C8DF55316D1C328DA4565233A99D9DCAEA7EA50828015829B29FD96E7E6C1CC34F3C83F12FFF197835AB70780C086D0DD1A6C0';
wwv_flow_imp.g_varchar2_table(292) := 'D06AF863033EF315FD5704444004D247C082BED73C6A9F6920B5909A486DA446522BD3D7E878B64809C02AF50B0F6E296DD98A817BF76270EFC33E0928DDB60D41FF001084E0296DFEEC003AC72AD549BB11011110815523406DB3A0EFB52E08BCF65103';
wwv_flow_imp.g_varchar2_table(293) := '19FCA989D4466A24B5F2F23AE9F9CA115002B0726CAFB8E5DCF0885F0A58F7B56F63E8D1A751D8B8D51FA5CDE0DFAE573B89000F7871EE8ADFD78B222002229028025ECB9CD7366A1CB52E2896BDF65103BD16DAD43FB53151ED4A41659500AC722772BD';
wwv_flow_imp.g_varchar2_table(294) := 'ABB4753B861E7ACC2702BCC84571F3B64B970DF6170B6AF35A01ED55AE997627022220022B408017F7A1A6456D705D9F47F6772EF2B3C76B20B5909A486DFCFCDEF5CA4A125002B09274AFB1EDDCC020FAEEBC1BA34F7F09C38F7F01A59DBB110E8F0251';
wwv_flow_imp.g_varchar2_table(295) := '0BEDCA3CA27AADF36DA799800E08DD8B8008248A4057BBA865D4340E6EB8DE5FDA799769DE335EFBA881D4C244B52B45955502B0569D69EB61A54D5B30FCC813E60C5F40FFBD0FA2B8F57684034370CE82BE25027418D8E7D6AA8ADAAF088880082C9B00';
wwv_flow_imp.g_varchar2_table(296) := 'B58BA37FD332E71CC2C12114B7ED44FF7D0F79CDA3F65103AFA571D06D450928015851BCD7D8B83984457A9BFA1F4079FB4E9B0A7B14C38F3E8D81FB1F4171FB2E04A592CD04CC5999874F04F8795862708D4DEA2D11100111585B02A651D42A0BFC1CF5';
wwv_flow_imp.g_varchar2_table(297) := 'B72B73FE18276ADAC0FD0F7B8D1B7AE051D33C1BECF000687E96656D2B9DD9BD2B018841D7E747463174FF837E4A6CF8E92FA37FEF63E0B5B0D1AA23AA552C415EFAED005D563406DDA52A8880085C954047A3221BF553BBA861F975EBBDA60D3FF5658C';
wwv_flow_imp.g_varchar2_table(298) := '3EF52C86F6ECF5D746B9EA262EBDA1272B4D4009C04A13BE81EDBB5C0EB9A1619F150FDC7D3F06F73E82019B262BDF790FFC39B1CCA6AB9608349BB06CE006B6A88F88800888C02A13B029FFC834AA6D5AC5594B6A17358C5AE635EDEEFB50DEBAC36B1D';
wwv_flow_imp.g_varchar2_table(299) := '356F956BA7DD5D818012802B4059AB97826209A52DB761F0BE0731F2EC3730FADC7750DE7D1F5CE8FC5240D4A861E9D2996B5547ED57044440043E4780C1DF062AD4284EFD53B3A85DD4306A1935CD9FE36F4B9B9FFBEE555ED0CB2B4F4009C0CA33BEE1';
wwv_flow_imp.g_varchar2_table(300) := '3DB820406E60C09280AD18B8672F061F790AFC45ACBE5D77A1B86113C2BE7EB8C0759280962D0B446DE826022220026B46801A645AC48109B5891A45ADA26651BBA861D4B2D296AD5EDBA8716B5657EDF8730494007C0EC9DABF10E4F3B6463682F2B6DB';
wwv_flow_imp.g_varchar2_table(301) := '31FCC417B1FE3BFF0AA35FFA33146EDB018439F82CBBB6688FF54E659DB347167BD09F08888008AC2801D31AAF39B622D9A8A3EDB5A8066A13358A5A45CDA27651C3F2C323A0A6DD5C95F4E9D520A0046035282F631F41A180C2E818066CDD6CE499AF61';
wwv_flow_imp.g_varchar2_table(302) := 'E4E9AFA0FFEEFB51DC749BADA19943158B60C6CDAB6AF9C24C7C19FBD15744400444E0A608506BDA360369851A149816E58646BC3651A3A855D42C6A17358C5A7653DBD787578D80128055437DF33BE255B38242D11F08D877C76E7F04EDD873DFC0D0E3';
wwv_flow_imp.g_varchar2_table(303) := 'CFA07CC73D086C49A0BD308BD6DCB4CD0658066E6B709DBDB8CE83EE45400444A02704BA9A621AC319486A0EB5871A442DA226519B78943FB58A070052BBA861CBD9BDBEB33A049400AC0EE75BDA0B5DAFB06E03861F7D12E35FFE267C76FDC0633EE30E';
wwv_flow_imp.g_varchar2_table(304) := 'F2D685FE329B11FC093811EF596E6997FAB2088880085C46C034C5B4C5EE6DDEDFEE4D73A83D9C911C302DA226519BA851D42A6AD6655FD6D39812B0E811D39AA95A9F10700E2E97F30701166FDB8AFEDD7763F0FE47FCD5B4861EFF22FA76EF41685370';
wwv_flow_imp.g_varchar2_table(305) := '3007E58F6DB4AB8B889A8DCEF7EDBB9D27BA17011110819B20D0D50E6A093585DA428DA1D65073A83DBC8C39B5889A446D0A6D56925A85EE776F626F977D544F578B801280D522DDA3FD04610EC5F51B31B8E77E8C7DF95B58FFBD7F6333025F47F1B61D';
wwv_flow_imp.g_varchar2_table(306) := 'FEEA81FE7880A62D07B474CD801E21D7664420BB046C50016A0935C5D6FC7985526ACDC8335FF7DA430DA2165193A84DD90595CC962B01485ABF59661D964AE0345B79E76E0CDCF730061F7AC29F2E3870EF0328EFBA0B850D5B7C321099E3F2873898C1';
wwv_flow_imp.g_varchar2_table(307) := '47E6BCCCDE93D65CD557044460150958C0A75678CDA8D7400D61D0A7A6505BA831FEF43ED31C6A0F35885A444DEAD5A87F155B9BF95D290148B00904B62C901B1A42FF9D7763FCB96F60FDB7FF0A635FFD0E061E7E12F9F10D881A75B416E711D5AA0097';
wwv_flow_imp.g_varchar2_table(308) := '04CCB9BD935A1291E066ABEA222002BD26404D60A14698565033BC769886504BA829D4166A0CB5869A43EDA106F5BA2ADADEEA115002B07AAC57644F41BE60B301EB3170EFFD187AE4490C3DF6050C3EF804FAEEDA83D2D6ED28ACDF80706818AE5004A2';
wwv_flow_imp.g_varchar2_table(309) := 'B64F0A78B94E3E079D7D456AA58D8A80082482003580BAD06C7A6D803DA7565033A81DD4106A093585DA428DA1D614D6AD07B5A7F76DD4165793801280D5A4BDC2FBCA0D0EA1BC792B06EF7BC09F2DB0FEBBDFC7D857BE8DFEFB1FB61981F5E6E055B466';
wwv_flow_imp.g_varchar2_table(310) := '2EA2BD3083B6CD0A70AACF5789993F8BFF8FEE444004524D80BECE628DA406500BA809D486A851F55A41CDA0765043C6BFFC4DAF29D4166A8C7D4D7F2921A00420251DC96638E7901B1AF43F2A34F2C43358F7F5EF62F43973DE879F02D7EAF2A3A3088B';
wwv_flow_imp.g_varchar2_table(311) := '05CBDCF370792BF67966FCFCE10E5F3A271272532A222002A924C053F8DAF0FECED1BE6900B58057EAA3365023A81583A619D40E6A08B5A4BCFD76AF2DCEB915A5A28DAF2E012500ABCB7B65F766CEE982D002BC05F952D9A6FF37A2BC631706F73C80D1';
wwv_flow_imp.g_varchar2_table(312) := 'A7BF84F16F7C0F635FFD730C3CF8388A5BB6D9B24001EDCA025AF33623608F3C60D09F45C05ADAB6FCF10290C313878A08248F80F9EE253FB6DAB75BA08F5FEEF3AE50F05A404DA0365023A815D40C6A4761FD4604A6259CEEA7B680DBB34DE92F1D0482';
wwv_flow_imp.g_varchar2_table(313) := '743443ADB822015BDFCB0F0DA39F57117CFA396CF8CB7F8BF57FFD3F61E44B7F86BEBBF7FAA93E179A09B479CAA08D0AECF3972601FC731B2D5C7AE18A7BD08B222002B12560FE7BC98FAD92F65FF8FF9BAF9BCFD3F7F3E3EBBD165013A80DD48851D30A';
wwv_flow_imp.g_varchar2_table(314) := '6A06B5C37FDEBEBA3A7FDACB6A1330F55FED5D6A7FAB46C0B2754EEDE5FA07901F5B87D26D3BD0BFFB3E0CEC7910830F3E8AE1C7BE00FE60C7E0838FA1BC6B3778B42FA70379F640BB5A419B1714AA57C15382FC94A1AFB88D2AC0E2FFA33B1110815810';
wwv_flow_imp.g_varchar2_table(315) := 'A04FB2586578B95E1EC96FBE4B1F6E9B2FD3A7E9DBF471FA3A7D9EBE4F0DA0165013A80DD4086A053583DA01D310DBA2FE524A4009404A3BF66ACD0ACB6594B76EC7C8C34F60FDB7FE129B7EF03F63DD77FF06434F7F05A53BEF4538380CFEB46754AB20';
wwv_flow_imp.g_varchar2_table(316) := 'AA2E808F3C8590070B81A387AEC65C6DFB7A5D0444608D08D037CD47BDAF3201B8CC87E9D3F46DFA387D9D3E4FDFA706500BA809D48635AAB9DFADEE569F801280D567BEA67B7461084EED95B6F092C2F7DA4CC013187AE4290C3EF01806EF7F18FDF7EE';
wwv_flow_imp.g_varchar2_table(317) := '45FF5DF7A2BCF34E146FDB8EFCBA0D080706E17239F0A220918D2AA2460D9C15E0FFFDCC8089CE9A364A3B1781AC11A0CF71A4CF8B7D31D8D327E99BF67FFA2A7D96BE4B1FA62FD3A7E9DBF471FABAF7F9079FB019C17B412DA026501BB28631EBED5502';
wwv_flow_imp.g_varchar2_table(318) := '90710BE0345F616C1CFD77DC859127BE800DDFFE2B6CFCEB7F87F5DFFB1B8C7EE53B1878F049146EBB1D41B91F0CFE4BBF02E6670728388D3AFC88831C395DB854E0F88A8A0888C02D13305F5AF22B3EDAF6E8739CD6A74FD217F9CB7CF44DFE9FBE4A9F';
wwv_flow_imp.g_varchar2_table(319) := 'A5EFD287E9CBF469FAF688F9387D9D3E4FDFB74DC5E44FD5580B024A00D6827ACCF619164B28AEDF005EDD6BF8F1A731F6ECD730FAECD731FCD49731F0D093E8BBFB7E7F364171E3665038F22323362B3084B0DCE7CF2470CECCA8DD82BF66B88D40D0B2';
wwv_flow_imp.g_varchar2_table(320) := 'E7FC3F47294B25666D56754420D60496FC868FF425FA94F7AD2678A60E7D8E47F0D307C38121D027E99BF4511EBD4F9FA5EFD287E9CB63E6D3F46DFA387D9D3E1FEBF6AB72AB42C0947B55F6A39DC499808D2A5C10A0534284FD03FE14C2BE1D3B3174DF';
wwv_flow_imp.g_varchar2_table(321) := '03187DEA59ACFBFA77B0E17B3FC0BA3FFF3E46BAD71628EDBAC7960836810717F1D4A2E6EC245AB353DDD30AE7D1E61A246708285C365DE911B8CF8E66ECFF60F1EFEA4E04324280366FE573FE60CD375FE1F21A47F8F4A17665DEFB147D8B3ED6AE2C78';
wwv_flow_imp.g_varchar2_table(322) := '9FCBAFDB04FA20CFD9A74FD237BD8F9AAFD267E9BBF4619ECA479F764108D7F57338DBB7ED2A2E7FAAC7DA1008D666B7DA6BBC0944E0F4606174147DB7EFC2F0438F62ECB96FF8E0BFFEBB7F83B1AF7ED766079EC3C0DE474D80EE427EFD464B1AFA11E6';
wwv_flow_imp.g_varchar2_table(323) := 'F3F6BD1C829C094DC862E615740BF586A399A86D2398CB0AECB92FF126A2DA89406F0974EDDE82BD3F8E868FF40DFA087DA5EB372E0CE0CC97E853413EE77D2CECEFF73E57DA7597F7C1E1A79EF33E49DF6412405F1D369FA5EFD28703F34BE874DEDE76';
wwv_flow_imp.g_varchar2_table(324) := '5F4AB616A4A41D6A464F0938F89142CE027AB188B0AF1FB9C16114C6D7A3B47507FA76ED46FF3DF761E8814731F2F817FC92C1F857BF8DD1AF7C0BC34F7F19830F3F81BE7BF6A2B4FD4E13AA4DF6FD41C08568D76B682D744733BCF8D0E21CDA9545B4AB';
wwv_flow_imp.g_varchar2_table(325) := '1570A4C3F54B8E7A960E308C6CDAD3AF757A71E449CCB09B831FBD383D8A43CC6C00561FD8CD82388FBAF7B64B1BB619306FD39C0DAB57BDAD7B9BA7ED9B0FF0425CBE986FD04760BE12F60D7ADFA10FD197E853F42DFA187D8D53FAF43DFA207D913E49';
wwv_flow_imp.g_varchar2_table(326) := 'DFA48FD257E9B381F9AE331FA62F63A96E88E34D755A2B024A00D68A7C42F7CBD1487E78C49F4A3878DF5EBF3CC05F08DBF437FF019B7EF01FB1FE7BFF1AA35FFB9E25025F45FF038FA1BCEB6E14366E4138380467330368DB1A66B30634AA889A75A0D5';
wwv_flow_imp.g_varchar2_table(327) := '807FCDD639299AB0473F22F2A3211B25B52DF0FBE7F6E84731F668020B158841CC6CE153F679B9EDF2394B0B9FD8B8F981D9BEF701F305D027CC37E823F415FA0C7D873E34FCF457BD4FD1B7E863F435FADCA82DCDD107790A1F7D92BE99505951B5D788';
wwv_flow_imp.g_varchar2_table(328) := '80128035029FD4DD723411140AE08542F223A3286ED888D2966D28DF7E27789A112F283278DF4318B8FF210CEE7D0483364B30F8D063187AF8710C3FFCA43D3EE15FEBB7CFF4DF7D9F250877A1B47D178A5BB6FB4421B76E0372236308FB07C14B90F2F8';
wwv_flow_imp.g_varchar2_table(329) := '02EE33B224206A34FD9908EDAACD1AD8BA68DB464FBEF0B9AD8B726D5465C166555456DE0EE6E16D8F3648FB339BECCC60998D9AADD26669BBB461DA326D9AB65DB06498B64E9B2FDB143E7D80BE403F19B299B38E8F3C0EFA0C5FA30F9A8EF6C500000B';
wwv_flow_imp.g_varchar2_table(330) := 'D949444154795F327FA16FD1C7E86BF439FA5EDE7C90BE489FE43E93A82BAAF3DA115002B076EC53B7E72097B3A5822114376E46FFCE3B3A07103EF90CD67DF55BD8F8DDEF63D3DFFC7B6CFEB7FF0B36FECD7FC486BFFE9F30FEADBFC6C897BF85219E6D';
wwv_flow_imp.g_varchar2_table(331) := 'F0C8D3E8BFFF119477DF8FE2F63B90DF709B2502E39608D8CC41B10C1784886CC4D4E672C1C22C78CA536B6E0AEDB9492BF638CF328DF6BC8A18ACB40D98AD756D8F36485B6C9B4DD23669A3B45567361BF60F791BA62DD3A669DBB4F101B375DA3C6D9F';
wwv_flow_imp.g_varchar2_table(332) := '3E405FA04FD037E823F415FACCA8F90E0FE4A32FD1A772368B461F4B9D70A8416B464009C09AA14FE78E3912C90D0C80A72495366FF107110EDCBDC746FD8F60F8B1A731FCE4B3E0414BC34F7E09438F3D037F4192876C56E0C1C7306033061CEDF4EF79';
wwv_flow_imp.g_varchar2_table(333) := '10FDF7DC8FBEBBEEB3722FFAEFBC177D77DC85BE9DBBADDC61B30D77A0EFF65DE8DBB1D3660F586EB74795D27631585D063BBD0DD216CBB79B4D5AD2EB6DD46CD5DBEC5D66B766C3B465DA346D9B363E68B63E68364FDBA70FD0173A3E61BE613E32F8C0';
wwv_flow_imp.g_varchar2_table(334) := '23A0CF70BBF421FA127D8ABE953ED5508BD692801280B5A49FC17D07B93C720383C88F8EA368D3A1E56DB763C00473900715DEFF107859528E7CC6BFF435ACFBDAB7B0FE9B7F81F57FFED7D8F097FF1A9BFED5FFCF6611FE839F45D8FCEFFE376CB2B2F9';
wwv_flow_imp.g_varchar2_table(335) := 'DFFEAFF6DA7FC4A6EFFF076CFCFEFFAC22062B6E03B4B54D368BE56D8F36C862335B9B781C8CD9286D95364BDBA50DD39669D3B4ED21B371DA3A6D9EB64F1FA02FD027E81B19940435790D0928015843F859DD358F95E62983B9FE7EF03425AE65966FDB';
wwv_flow_imp.g_varchar2_table(336) := '8A7E1BD50FECBE0B837BF662E8419E61F0B43FC870EC8B5FC1F897FF0CE35FFF0ED67DF32FB1FE3BFFAA734AE2777E8075DFF93ED67DFB5FF9E58475DFFC6B7B5F451C56D606386D4F9BA3EDADA70DFEF9F73B3669B6491BA5ADD266479F7A16238F3FED';
wwv_flow_imp.g_varchar2_table(337) := '6D99364DDBEE371BA7ADD3E669FBF401FA027D228B7AA036AF2D0125006BCB3F9B7B772677565C10C0D9DA3E8F5E76610E2EC79207CF5BE67467502882A73205C5923D5A2995FD8181FEC0AA723F78BDF3DCD0889F4DE0E94F85751BA022062B6E03E3EB';
wwv_flow_imp.g_varchar2_table(338) := 'BDCDD1F66883A1D9226DF25259B2D7A2D96F81A5E06DDAD9EC97A38D8739789BA7ED0701E03AFE00DD4460950998F5ADF21EB53B11E835019D12A85302D7C2067A6DC799DB9E1ABCD6049400AC750F68FFB74E606904A5475C1A4D8AC5CAB3806E22906C';
wwv_flow_imp.g_varchar2_table(339) := '024A0092DD7FAABD088880082492802ABDF6049400AC7D1FA80622200222200222B0EA049400AC3A72ED5004444004B24E40ED8F0301250071E805D5410444400444400456998012805506AEDD8980088840D609A8FDF120A004201EFDA05A8880088880';
wwv_flow_imp.g_varchar2_table(340) := '0888C0AA125002B0AAB8B53311100111C83A01B53F2E049400C4A527540F111001111001115845024A005611B67625022220025927A0F6C787801280F8F4856A2202222002222002AB464009C0AAA1D68E4440044420EB04D4FE3811500210A7DE505D44';
wwv_flow_imp.g_varchar2_table(341) := '40044440044460950828015825D0DA8D08888008649D80DA1F2F024A00E2D51FAA8D08888008888008AC0A012500AB82593B1101111081AC1350FBE346400940DC7A44F511011110011110815520A0046015206B17222002229075026A7FFC082801885F';
wwv_flow_imp.g_varchar2_table(342) := '9FA84622200222200222B0E2049400AC3862ED4004444004B24E40ED8F2301250071EC15D5490444400444400456988012801506ACCD8B80088840D609A8FDF124A004209EFDA25A89800888800888C08A125002B0A278B57111100111C83A01B53FAE04';
wwv_flow_imp.g_varchar2_table(343) := '9400C4B567542F111001111001115841024A005610AE362D022220025927A0F6C797801280F8F68D6A26022220022220022B464009C08AA1D5864540044420EB04D4FE3813500210E7DE51DD4440044440044460850828015821B0DAAC08888008649D80';
wwv_flow_imp.g_varchar2_table(344) := 'DA1F6F024A00E2DD3FAA9D08888008888008AC080125002B82551B1501111081AC1350FBE34E400940DC7B48F513011110011110811520A0046005A06A93222002229075026A7FFC092801887F1FA98622200222200222D073024A007A8E541B14011110';
wwv_flow_imp.g_varchar2_table(345) := '81AC1350FB9340400940127A497514011110011110811E135002D063A0DA9C08888008649D80DA9F0C024A0092D14FAAA508888008888008F4948012809EE2D4C64440044420EB04D4FEA410500290949E523D45400444400444A087049400F410A63625';
wwv_flow_imp.g_varchar2_table(346) := '022220025927A0F62787801280E4F4956A2A022220022220023D23A004A06728B52111100111C83A01B53F4904940024A9B7545711100111100111E8110125003D02A9CD8880088840D609A8FDC922A0042059FDA5DA8A800888800888404F082801E809';
wwv_flow_imp.g_varchar2_table(347) := '466D4404444004B24E40ED4F1A01250049EB31D557044440044440047A404009400F206A13222002229075026A7FF2082801485E9FA9C62220022220022270CB049400DC32426D4004444004B24E40ED4F2201250049EC35D559044440044440046E9180';
wwv_flow_imp.g_varchar2_table(348) := '12805B04A8AF8B80088840D609A8FDC924A0042099FDA65A8B800888800888C02D115002704BF8F46511100111C83A01B53FA904940024B5E7546F11100111100111B805024A006E019EBE2A022220025927A0F62797801280E4F69D6A2E022220022220';
wwv_flow_imp.g_varchar2_table(349) := '02CB26A00460D9E8F44511100111C83A01B53FC904940024B9F75477111001111001115826012500CB04A7AF8980088840D609A8FDC926A00420D9FDA7DA8B800888800888C0B20828015816367D4904444004B24E40ED4F3A01250049EF41D55F044440';
wwv_flow_imp.g_varchar2_table(350) := '0444400496414009C032A0E92B222002229075026A7FF2092801487E1FAA052220022220022270D3049400DC34327D4104444004B24E40ED4F0301250069E845B541044440044440046E928012809B04A68F8B80088840D609A8FDE920A004201DFDA856';
wwv_flow_imp.g_varchar2_table(351) := '88800888800888C04D1150027053B8F46111100111C83A01B53F2D049400A4A527D50E11100111100111B809024A006E02963E2A022220025927A0F6A787801280F4F4A55A2202222002222002374C4009C00DA3D2074540044420EB04D4FE3411500290';
wwv_flow_imp.g_varchar2_table(352) := 'A6DE545B44400444400444E006092801B84150FA9808888008649D80DA9F2E024A00D2D59F6A8D08888008888008DC100125003784491F1201111081AC1350FBD346400940DA7A54ED11011110011110811B20A004E00620E923222002229075026A7FFA';
wwv_flow_imp.g_varchar2_table(353) := '082801485F9FAA4522200222200222705D024A00AE8B481F1001111081AC1350FBD3484009401A7B556D1201111001111081EB105002701D407A5B04444004B24E40ED4F27012500E9EC57B54A04444004444004AE494009C035F1E84D11100111C83A01';
wwv_flow_imp.g_varchar2_table(354) := 'B53FAD049400A4B567D52E11100111100111B806012500D780A3B74440044420EB04D4FEF412500290DEBE55CB44400444400444E0AA0494005C158DDE1001111081AC1350FBD34C4009409A7B576D1301111001111081AB1050027015307A5904444004';
wwv_flow_imp.g_varchar2_table(355) := 'B24E40ED4F37012500E9EE5FB54E04444004444004AE484009C015B1E84511100111C83A01B53FED049400A4BD87D53E11100111100111B8020125005780A2974440044420EB04D4FEF413500290FE3E560B45400444400444E0730494007C0E895E1001';
wwv_flow_imp.g_varchar2_table(356) := '111081AC1350FBB340400940167A596D1401111001111081CF105002F01920FAAF08888008649D80DA9F0D024A00B2D1CF6AA5088880088880087C8A8012804FE1D07F4440044420EB04D4FEAC10500290959E563B45400444400444E032024A002E83A1';
wwv_flow_imp.g_varchar2_table(357) := 'A7222002229075026A7F76082801C84E5FABA52220022220022270898012804B28F44404444004B24E40EDCF1201250059EA6DB55504444004444004BA0494007441E84104444004B24E40EDCF16012500D9EA6FB556044440044440043C0125001E83EE';
wwv_flow_imp.g_varchar2_table(358) := '4440044420EB04D4FEAC11500290B51E577B45400444400444C00828013008FA1301111081AC1350FBB347400940F6FA5C2D1601111001111001280190118880088840E609084016092801C862AFABCD2220022220029927A00420F32620002220025927';
wwv_flow_imp.g_varchar2_table(359) := 'A0F667938012806CF6BB5A2D02222002229071024A00326E006ABE088840D609A8FD5925A00420AB3DAF768B8008888008649A8012804C77BF1A2F02229075026A7F76092801C86EDFABE52220022220021926A00420C39DAFA68B8008649D80DA9F6502';
wwv_flow_imp.g_varchar2_table(360) := '4A00B2DCFB6ABB08888008884066092801C86CD7ABE12220025927A0F6679BC0FF070000FFFF248B80A800000006494441540300D6B21F1A43BF50B10000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(8926604059801494)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_100_logo_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000E1000000E10803000000096D224800000081504C5445C74634FFFFFFC43720ECCAC7C53A25E4B0AAC53E2AC53C27C64330C6412EC74432C33117C3331AC53C28E2AAA4C4371FE0A5A0F6E5E3FCF5F4D16D';
wwv_flow_imp.g_varchar2_table(2) := '61E7B9B4C32F13DB9189D8877EF0D2CFFAEFEECB5545DC968EEAC3BFDE9B94CB5748D27266CE6457D57D73C94E3EF4DDDBE6B6B1CF6659D78379DA8D84F0D1CDCD5E50C94B3A0D886B61000004CB49444154789CEDDC8B62A238140660A434401204B578';
wwv_flow_imp.g_varchar2_table(3) := 'C1BB8EE3E8FB3FE0C8CC74A73D895DAD3909DBFDBF07301EC83D2744110000000000000000000000000000000000000000000000000000000000004017C85C8834B9572A442643FFF51BC82256F9663BAFFACFF7E957E3ED26537191850EE12379A29BF9';
wwv_flow_imp.g_varchar2_table(4) := '62D0FBBCC1627ED6491E3A103B29D4E9DBEC81E8FE89F2F9A444F7EAAB4CCBE3232F8F0439D169C762147A3974165F6BB6542274506F48BD75513D498C13D5994E27394F9DC7D7DA3749E8D07E916ACC125F6BA93AD01AF3F2892DC05E6F1A071F39C4CE';
wwv_flow_imp.g_varchar2_table(5) := '7D0B7C6BB60ADCE1A407B75DA8C52868634C46DCF15DAC038658F808F012621A2A40B1F11260AF7708D416F3E6833638D84F9FEE31DD7FF063C35D90B15FEA6BF3D0E9F290285D96F1EDCA52D7E966796DE630D021C645FD62FD33B3B9D045FE993F24F3';
wwv_flow_imp.g_varchar2_table(6) := 'A24CC7F6C7F6A29DFFFF7F25B6D6F8BEABE291C72D0BB5B5C6B8F6DE14656E6B3755FDF81F11B56D1638F4BE9AD20B4B6B696227BF9DECF6967A5A3AF9ED9BE5968162A15CCD21B3DAF2FC4E7E67A8CA7CCACFB5BB7A24EB67E3F7A7CAD9CFDF205F5B02';
wwv_flow_imp.g_varchar2_table(7) := '745A42DD374A58FB7C89B5F10A9FDC067829C2A8A8538F23467EA2A50F62D75D9D6542D1F89BD9C4C6F35DB9AF41D99916F2E2A6ABBE8114B4EC2547D9C99294324C7C8D896242EBA8EB46F85B4DEBE9D6D7C4C6D899612AD998182E7C5553455F21D748';
wwv_flow_imp.g_varchar2_table(8) := 'A5C84B1CF2D415434E57F6E382A9A482CE504F7E7AD3B422E53A1F295EC9949434F7D310CB1FEF8B7DE29B13976458F2D41035D9219DF03D5871242DDECBB44646A4EA306EA2643BD2D578592566ABF7A5CE389F6B49D6D9671F11D275C50FCEA5A9267B';
wwv_flow_imp.g_varchar2_table(9) := '531B1F9DA9205DF80BE796349D017B59411564BA5871EE48276499C8D8ABFD45235C728DF7DE0B7B4507FC3967A162EEB1C2BCFAFAEF9016DAE7EC69922A40847475C83A938AC9D181979E868E87AC1B4425190FBD8C1692CE693847FC92CC81573EE634';
wwv_flow_imp.g_varchar2_table(10) := '327B5F68AFE12B95CE4B7B9F3AD4BA1B5D5B1C19D71664FEC43A07FE2B26DB349CEB435294A7F5A1B1C6675BD2C88294E465B0B874A607522EDBACA620339ADEC6D3D1454DCAE5DB6B232DDED75E9BB9A9FF9D69BF94EE3C7BDB2F354A9EB1A410CA9AA6';
wwv_flow_imp.g_varchar2_table(11) := 'CC313D494BD1293DC3AF381E6E4C8F10FD9D5B18B34596B327F308CFDFD993B11975E96C4AE7E7878991D6E9F1FCD0728CEFFA0C58D6467E94D7837CCB39FE3787890A6D8066C6D5C86B32863233D0164E7331CC7413BFB918966EA0FD0BAE1EB2482C29';
wwv_flow_imp.g_varchar2_table(12) := '7C2BCFF989A5256F6F7672D2D9C9D2965AED3B272A92E24A5EDBA3555516CACC160A91D7762D37F118278FD4269994636B2AADB723FC37AEE4970EABF67ADDE7F24B539D55F654E110F9A597E6722D4778DF5F9FEBBB738455B4AEBA95231C65D147A9D9';
wwv_flow_imp.g_varchar2_table(13) := '4EF3BCA34097838465C860C130EBBD51614E6D388CFCEC5D5879B933730876A1A4956ED8EF3D6D02BEC1966878EFAE0D43DF5D63BF7F9806BF7FD8DE21A57B7EEECCBB7087F422692CB7071C98EEBA710FF822D393AF7D973BFAFAF7F1A3DFDF54705757';
wwv_flow_imp.g_varchar2_table(14) := 'F713FDD0F5291E52A855DFC587233AFA5D8C5FB244EF1EFAB6C970BF1837FAA11526BBF6FB34C96A7DACDEEA5BD1EFD34C464DACE3AEBEBD7764968BF48F7BBE3194FF27BE31040000000000000000000000000000000000000000000000000000000000';
wwv_flow_imp.g_varchar2_table(15) := '00FF073F01CC4B480D7DC82BE80000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(10384179477956362)
,p_file_name=>'app-100-logo.png'
,p_mime_type=>'image/png'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/istockphoto_1160720443_612x612_jpg
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'FFD8FFE000104A46494600010101012C012C0000FFE100F845786966000049492A000800000003000E010200AE000000320000001A01050001000000E00000001B01050001000000E80000000000000041627374726163742073696D706C652067656F6D';
wwv_flow_imp.g_varchar2_table(2) := '657472696320766563746F72207365616D6C657373207061747465726E207769746820676F6C64206C696E652074657874757265206F6E207768697465206261636B67726F756E642E204C69676874206D6F6465726E2073696D706C652077616C6C7061';
wwv_flow_imp.g_varchar2_table(3) := '7065722C206272696768742074696C65206261636B64726F702C206D6F6E6F6368726F6D65206772617068696320656C656D656E742E2C010000010000002C01000001000000FFE1061E687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E';
wwv_flow_imp.g_varchar2_table(4) := '302F003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F223E0A093C7264663A';
wwv_flow_imp.g_varchar2_table(5) := '52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E0A09093C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A70';
wwv_flow_imp.g_varchar2_table(6) := '686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220786D6C6E733A4970746334786D70436F72653D22687474703A2F2F697074632E6F72672F7374642F4970746334786D70436F72652F31';
wwv_flow_imp.g_varchar2_table(7) := '2E302F786D6C6E732F22202020786D6C6E733A4765747479496D61676573474946543D22687474703A2F2F786D702E6765747479696D616765732E636F6D2F676966742F312E302F2220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F';
wwv_flow_imp.g_varchar2_table(8) := '64632F656C656D656E74732F312E312F2220786D6C6E733A706C75733D22687474703A2F2F6E732E757365706C75732E6F72672F6C64662F786D702F312E302F222020786D6C6E733A697074634578743D22687474703A2F2F697074632E6F72672F7374';
wwv_flow_imp.g_varchar2_table(9) := '642F4970746334786D704578742F323030382D30322D32392F2220786D6C6E733A786D705269676874733D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F7269676874732F222070686F746F73686F703A4372656469743D2247';
wwv_flow_imp.g_varchar2_table(10) := '6574747920496D6167657322204765747479496D61676573474946543A417373657449443D22313136303732303434332220786D705269676874733A57656253746174656D656E743D2268747470733A2F2F7777772E6973746F636B70686F746F2E636F';
wwv_flow_imp.g_varchar2_table(11) := '6D2F6C6567616C2F6C6963656E73652D61677265656D656E743F75746D5F6D656469756D3D6F7267616E696326616D703B75746D5F736F757263653D676F6F676C6526616D703B75746D5F63616D706169676E3D6970746375726C2220706C75733A4461';
wwv_flow_imp.g_varchar2_table(12) := '74614D696E696E673D22687474703A2F2F6E732E757365706C75732E6F72672F6C64662F766F6361622F444D492D50524F484942495445442D455843455054534541524348454E47494E45494E444558494E4722203E0A3C64633A63726561746F723E3C';
wwv_flow_imp.g_varchar2_table(13) := '7264663A5365713E3C7264663A6C693E4E616469696E6B6F3C2F7264663A6C693E3C2F7264663A5365713E3C2F64633A63726561746F723E3C64633A6465736372697074696F6E3E3C7264663A416C743E3C7264663A6C6920786D6C3A6C616E673D2278';
wwv_flow_imp.g_varchar2_table(14) := '2D64656661756C74223E41627374726163742073696D706C652067656F6D657472696320766563746F72207365616D6C657373207061747465726E207769746820676F6C64206C696E652074657874757265206F6E207768697465206261636B67726F75';
wwv_flow_imp.g_varchar2_table(15) := '6E642E204C69676874206D6F6465726E2073696D706C652077616C6C70617065722C206272696768742074696C65206261636B64726F702C206D6F6E6F6368726F6D65206772617068696320656C656D656E742E3C2F7264663A6C693E3C2F7264663A41';
wwv_flow_imp.g_varchar2_table(16) := '6C743E3C2F64633A6465736372697074696F6E3E0A3C706C75733A4C6963656E736F723E3C7264663A5365713E3C7264663A6C69207264663A7061727365547970653D275265736F75726365273E3C706C75733A4C6963656E736F7255524C3E68747470';
wwv_flow_imp.g_varchar2_table(17) := '733A2F2F7777772E6973746F636B70686F746F2E636F6D2F70686F746F2F6C6963656E73652D676D313136303732303434332D3F75746D5F6D656469756D3D6F7267616E696326616D703B75746D5F736F757263653D676F6F676C6526616D703B75746D';
wwv_flow_imp.g_varchar2_table(18) := '5F63616D706169676E3D6970746375726C3C2F706C75733A4C6963656E736F7255524C3E3C2F7264663A6C693E3C2F7264663A5365713E3C2F706C75733A4C6963656E736F723E0A09093C2F7264663A4465736372697074696F6E3E0A093C2F7264663A';
wwv_flow_imp.g_varchar2_table(19) := '5244463E0A3C2F783A786D706D6574613E0A3C3F787061636B657420656E643D2277223F3E0AFFED00EE50686F746F73686F7020332E30003842494D04040000000000D11C025000084E616469696E6B6F1C027800AE41627374726163742073696D706C';
wwv_flow_imp.g_varchar2_table(20) := '652067656F6D657472696320766563746F72207365616D6C657373207061747465726E207769746820676F6C64206C696E652074657874757265206F6E207768697465206261636B67726F756E642E204C69676874206D6F6465726E2073696D706C6520';
wwv_flow_imp.g_varchar2_table(21) := '77616C6C70617065722C206272696768742074696C65206261636B64726F702C206D6F6E6F6368726F6D65206772617068696320656C656D656E742E1C026E000C476574747920496D6167657300FFDB0043000A07070807060A0808080B0A0A0B0E1810';
wwv_flow_imp.g_varchar2_table(22) := '0E0D0D0E1D15161118231F2524221F2221262B372F26293429212230413134393B3E3E3E252E4449433C48373D3E3BFFDB0043010A0B0B0E0D0E1C10101C3B2822283B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B';
wwv_flow_imp.g_varchar2_table(23) := '3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFC20011080161026403011100021101031101FFC4001A000101010101010100000000000000000002000103040506FFC4001801010101010100000000000000000000000001020304FFDA000C03010002100310';
wwv_flow_imp.g_varchar2_table(24) := '000001FD3F3D21D981970EFB911111904C8D1540832F6DC888A042A26468AA38E6F6D4110A91E5C5EDA9065C369A2A110A904E79BDB72223204468AA04474D496222353966C2A4138E6F7D48110A9582588888308550221523CF9BD7522220C2A6602215';
wwv_flow_imp.g_varchar2_table(25) := '7397AD90604BD750C61B4CC30E72F5B3406468AB966F4D488E39BDF53406468AA394AEC888884418C36B8E6F5B215209844444197AD980885482182A936A22321D08875A00C690EB9C68A90430E8945591A2A81025E965425E9618854806468A846D4444';
wwv_flow_imp.g_varchar2_table(26) := '6861D470CDF5EF3CA5410C3A2444450A8443AD0191A2A8E19BD75222239E6F6D4826468AB9C3AE39BDB5104311D3504B10337B6A60221523CF9BD6CE72F4B154088548218DA88888869CE532F5D4E70AB23474088888A30750630D154088542154446444';
wwv_flow_imp.g_varchar2_table(27) := '6D3301065562A831A2A811B511065D475A032204BDF50191A2A8110A90431B5111190EB9C68EB966D490AC42482B91DB520C61B5190568856618AEC8888E59BDF5159CB3623AEA7979E9D45490A88EDA91111C737D5BC894C42A767979EBAEA74D4C9444';
wwv_flow_imp.g_varchar2_table(28) := '68AA0C60A91C736A84986288654D2A88A150885480197515209C737BEA122222222228C2369843055A5511143AE39AF52220CBA8EA09911CE5F46A03234551C735D8EA0C09558EB406462F5B39C6D44444197A590221508EB443057AD862A88888888819';
wwv_flow_imp.g_varchar2_table(29) := 'BD7520C61B48E39BD35222219CE234AA066F6D4C0443AD3CF9BD7539E6F4B1540885586442A30E8C61B48E52A4E9A825888888C887506308875CE5D475A08AA22222321518875A03966F5D48888D3215472CD7A94461B4881025E9A9025E96188548271C';
wwv_flow_imp.g_varchar2_table(30) := 'DF46A104230DA661E7CDF46A40855822222308310EA38E6F6D4F3E6FA7530111D750CB1111180854CC0446D643A8888D30110AB032F4B3406468AB94BD2C88E39BDF53406468AB8E6F4D430E904311B591A2A88DB2222239E6AA305745672CDEBA991A2A';
wwv_flow_imp.g_varchar2_table(31) := '811D3522222066ED08C5D4759017B6B31111A72CD875A039E6F5D4310A90012F6D6628970111A2A8111C737D1B86316159CF37AEA208623B6A7971AD1D9025C34EDA9111111A0323455E7C57A242B911DB52222223CD8D76D644B1A2B3966FA3720991A2';
wwv_flow_imp.g_varchar2_table(32) := 'A8110A904E59BDB5222239C69B4CC0443A88888E71A42A4138E6F7D483186D097AD8236A22210215209C737D1A84310EB41154444195D825E964088DAA30DA660412F4B104310EB8E6F4D488E39BE8D4831868AB9C2A888832F5B38E6F5D43186D72CDE9';
wwv_flow_imp.g_varchar2_table(33) := '642A4738DAC8D2A888887673CD85591843A831B5844446474A208D21D418E72F7D4218744C8DAC8D1540812F4D4832BB0C43AD002576444451B4630D1D470CDF56F3CE5410C1576330E7088888C1D470CDEB62A83183A3111111B463454215188751C735';
wwv_flow_imp.g_varchar2_table(34) := 'D9D28111CF37B6A4088548E19BD3539E6F4D46602215084444461A2A8E72EA197AEA08DAC8D3074630D1518AA2222066F5D48110A91CE36A2223234550204BD351843110E846D44418D15201918197B6A13234551C737A6A4444643A8111A6D08D1573CD';
wwv_flow_imp.g_varchar2_table(35) := 'A921548EB40644684963520CB111B647397A548824B91DB530110A91C6548A9D9CB360ABB222238E6FAB791298854ECF273DF4B1598B910443B092C49D28442A413CF8BD2A1D954450A8442A4728461B4CC39C2A8888C874223455020AA47504C8E72F7D';
wwv_flow_imp.g_varchar2_table(36) := '48110A91C735EA44419751D418C2236A22219C335D8EA0C6057A58806462F5B39C6D44444197A590230D15208634AA22221D9CF344BDF508621D738E94630DA8A04AAC5482188D2A819BDB508621D69E7CDEBA91110810AB0C887502223455CA549D3504';
wwv_flow_imp.g_varchar2_table(37) := 'B111110610AB966F6D4218874236A2221021523CF9BDB510431182A6728551CB37BEA13234551CB35EA45186D3301025E96551111A209C737D1A84310EB966F6D4C3CF9BE8D4810E88888888C04AEC310EA39C74A888888D0191A610A904E79BD350474A';
wwv_flow_imp.g_varchar2_table(38) := '888E39BD2C5502215408E950630D15738E951110AC1298875C737A6A33011111B591A2A88DB25888904A6548AA04475D4C588889066E1A2A8E19BDB50C61A3AF3E6FAB79C58883106215209CB37A584875A08C5EBA91111A9CB37455022230D1D61C3351';
wwv_flow_imp.g_varchar2_table(39) := 'D7510431A74D4F2E35A3B204B0EBA590221523C7CF5E8DE44B843A31D35198088EBA82588888E39BDB5222322308750608EA22223862BA242AD4E39D7AB798110A958658888812EA42A4138E6F7D483186D3B066E10A9043110A900C8854621D68088888';
wwv_flow_imp.g_varchar2_table(40) := '32EA60AA23966F6D4410C43A11B5111025EB67397AD84310EB9C68A90088888832F4B394BD6C110AB8E6F4B215209915197AD80C8D154738D215209C737BEA418AA22220C75A271CDEBA91CF37B6A18C3699872CD7A9111190E8C15D45482182BDAC0643';
wwv_flow_imp.g_varchar2_table(41) := 'A24444468630D1D470CDF56F3CE5410C2AC22066BD444088D2A408855A738D1D1888AA23431A2AE59AEC12AB1D418C34C348AA2232152394230DA6138E6F5D460888AA228C1D4739750CBD75042A310E8911065E9608875A039E6BB1D418C317AD9CE36A';
wwv_flow_imp.g_varchar2_table(42) := '22228855020CB877D4218875A70CDE9A9111190A9043065EBA90630DA8D0C6D4444643A81110A8468AB966E8ACE72F5D48888E59BD6CE9A9CE5C88542348EBA82530255522092E1DACC0442A4719522A7672CD82BA6A4612C75B0191A2A8E19A85615C88';
wwv_flow_imp.g_varchar2_table(43) := '274A48496351D088548271CD443B2A8A368C6D44646D6468AA0C73970EDA882188742234550231751D680C8E72F7D48110A91C73558A904318A9154088DA8888869E7CEBAD8AA04462BB10431B5111110EC32F395D91025E96208621D72CD564468AA040';
wwv_flow_imp.g_varchar2_table(44) := '97BEA0323455CE5E9618C36A2066AB15208630E94221523943A310AB22A8888408DA8C88751CE11868A846D44468ACE79BA2A11B590E8442A4138E6F5D48E59BDF520442A479F37B6A208623054CE50AA3966F7D4C0C68AA3CF9BE8D48110AB9CBD6CD39';
wwv_flow_imp.g_varchar2_table(45) := '4AACD22222104E39BE8D4218875CB37AEA47295D9A4442B066AA8111D2B9C43A831843ADA8A394BA8A90431A610A904E79BD350475D496238E2BB154088542347506088C3A6A52C4446D825310EB8E6F5D4410C44474D4A58888268221523C98D7AF7921';
wwv_flow_imp.g_varchar2_table(46) := '88751CE3AEA4440CD544C8D15471CDEDA8223691C337D5BC92220CBA088548273CDE9A8621D479F17D5D338B1111273CDD15418C34C3699870CDF46A5511114728D1D413234550221523CF9BDB522239CBD2C310A904E72BB2222234888831110EA0C115';
wwv_flow_imp.g_varchar2_table(47) := '44444640970846D71CDF56F302215208621D682394B110E8C70CDF46E75B0C61B4EC19B842A410C156954473CDE962A8111B4CE50AA222222223966F6D4410C43A8E72AB222228DA410C68AB9C68A904C066F5D483186D239CBD2C110ABA5825E19BD751';
wwv_flow_imp.g_varchar2_table(48) := '9808DA12F6B0191A2A8E19BD75239E6F7D4218875022156111111110337AEA08854821887462A8888D0C2A410C15ED60321D128C215208631751D4082AD2AD0C2AC22066BB154088542104D15208621D418C36A22228AA066AB1D418C3698431B5111114';
wwv_flow_imp.g_varchar2_table(49) := '3AE710A904E39BD6C7408819BDB508621D47295243ADB0CA60CBD750911065E96088548272CD8EDA906305482188750236A22228E72F7D42188750630DA660236A222321D418C36A8DA31B511033558EA0C610AA0C6D18832E8F5222239E6F4B3A6A094C';
wwv_flow_imp.g_varchar2_table(50) := '42AC3221D418C3699808874230884104BA2AD412C2B3A5680C8D1D72888D34262A4E9A992888C15444472CDF4EF3CB3623A6A64BE5C6BB6A6A7297B6A4444444646D6468AA0442A410C43AE59AF53236911CE5D48548271CDF46F22588888A3054801975';
wwv_flow_imp.g_varchar2_table(51) := '345502239CBE8D42188751CB35EA4440CDE9A88218875062A88A2222A8812F4B104310EA0C61B4C271CDEBA863AD032230E95A032215187448A2230742215097A59022156447395D8EA0C61B5455063A518C3698411A74D412C6911111190A8442A410C4';
wwv_flow_imp.g_varchar2_table(52) := '3A831846D690257623866F6D431868AB8E6F4D46122222204BD2C8E59BD750442A4728751CE5EB60885482095D90621D418C3475808E944564444452F2842A8110A904310EA394BDB52224E79B1A61B4CC38E6F6D43186D74B3088888E79BA610EB40647';
wwv_flow_imp.g_varchar2_table(53) := '4D4888E38D74D4410C43AC0C74A218875A08C369182B296222238CBDAC21887502236998088E951111871CDEBA88218888750431D6A222236CF3635DF520C61B5D2CC962230C0C43A831CE55669B488110EB406468ABE671E9911111846984469F5BD1CB';
wwv_flow_imp.g_varchar2_table(54) := '966C475D432FCEE5B19B1110F53DFD31DB73862C43AC0C469DB53866F9B1AF3E3511111F57D1CA979C4477DCF8DE6EBA44447A379F4EF3D750CA2223E771E98446987B7AE3AD9A76DCE18B1E8DCFFFC40025100002020203010101010003010100000001';
wwv_flow_imp.g_varchar2_table(55) := '0200031222111321322333311020414304FFDA000801010001050208A8EE816356ACAA119515412AAAF824C126093049824C1275A4ACCF8B1FC2C335539AA6A5942D9824C126093049824641C021D2B33E2C7F230CD10E4B975C418AA6C4EEF619E5698F';
wwv_flow_imp.g_varchar2_table(56) := '11AB52AA11D51579C556C7402608CA8D92A6ACDA3B8E4796256662AB66093049824C12628256B3EECB0F3090888B8AA6CCDBBE0B3049824C126093049C0589B13BBD86795A20E01CDCB0CD54E6A9A93A3D8278EBD493A927524EA49D493A920FCDECF230';
wwv_flow_imp.g_varchar2_table(57) := 'CD10E4A9AB1D1EC1E796222219D493A927524EA49D4938EB7B04203A2364A9AB368F62F20B7646382A8C153D2FCD8CA7354F0FC5960878B110F23A92102A2E39038B12B33E2C7F0BAF6222232F524EA49D490D6A5DDB1000AD2B13EEC7F631C1117150A2';
wwv_flow_imp.g_varchar2_table(58) := 'C3D493A927524EA49D493A9239C55460A9ECFBB2C333EA89AB1D1EC1E7962567CEA13AC4EB13AC4EB13AC42A52101D11B254D59B4771C8F2C4ACC1A3DAB3AC4EA13A84EA13A84350210F217466D19C72071625667C583777D99DB15AF52747B04F2C443C';
wwv_flow_imp.g_varchar2_table(59) := '85D1CD609EA13A84ACF13E2CB3C8C3344392A6ACEBC3F509D4232055AD7155DD9B7773C0F2B4AC41BD8FE963828AFCEB13AC4EB13AC4EB1056017D99DB1500220243711C723CB12B3068EC9C9C1A60D3069834C1A60D11B90BA3368CE39038B12B33E2C7';
wwv_flow_imp.g_varchar2_table(60) := 'F0B0CD50E4A1486C1A60D3033033030835975C9410E959E27C59679180B11582D4838196F60F3CB12B3068EFA965CC6066066063215840B111B20BA3368EE391E588A1A60628CACB0F3090888B8AA6CCDBBD8781E569588377624B60D3069834C1A60D30';
wwv_flow_imp.g_varchar2_table(61) := '68AB8C5DDEDE5A79622D800ACCF8B1FC8C335E2C9C5938B27164E2C9C590160CFAB3AE4A0874ACF13E2CB3C8C33446C953566D1EC1C85CD87164E2C9C5938B262E657E4F8B2C10816223641746B1787B49E1716AEB3068EFA9619AA9CD42389C5938B271';
wwv_flow_imp.g_varchar2_table(62) := '64E2C89CA16D19C72011625667C59602231700015A5627DD8FEC6382A0C55362777B0CF2B4AC79CB39E2C9C5938B27164E2C855C824569541A3B56AC4AD9930B187EB1458A32B322D6084D80036901AC686C652E325539AA793E2CB04720D43B7851628C';
wwv_flow_imp.g_varchar2_table(63) := '6CC996C687B081DA02AD8B3F59FACFD67EB3F58D9E767182F38D53FF00B5BFE3718A0B205B14E3664C2C61FAC5162839A37EB3F59FACFD67EB2CCF83F3573827F47FE96F180F9AB8CED8DCE15F1857F47FADBF0CD8A28C15362777B0CF2B457B1A65664C';
wwv_flow_imp.g_varchar2_table(64) := 'D62CE6D8AD6300D613BBB63664C2C61FACC9E64F327993C45C553666DDEC3C0F2B445F2A68747B04F2C443C855E5D9B8393CC9E64F327993CC9E64F327993CC9E64F2BDA7DD961878AD10701776B096393CC9E64F327993CC9E79622BBCC9E64F327993C';
wwv_flow_imp.g_varchar2_table(65) := '4DD9F6676C54008958E67DD96931B3E071625660D2C7D4B0CD54E6AA38B1F62E7155182A7B090D6B68CEBC804589599F165BE11C5699B9993CC9E764EC9D93B2125E31C15062A9B13BBD863AE29E58959F068F672A400895FB3B3DEC9D93B2764EC9D93B';
wwv_flow_imp.g_varchar2_table(66) := '2764EC85BB0B9C5546095FB3EECB0C242223623B2764EC9D93B22BE506963EA7B2764EC8CE5A1E2B441C05DD9B7673C01C568AC676456E2C7F230CD10E4A9A93A3D83CABE57777D9AC6C13AFF3539A57E4F8B2C1C4601D2BE5A36EECD8CEC9D93B5676AC';
wwv_flow_imp.g_varchar2_table(67) := 'ED59DAB3B560DDDF62C7055182A7A7EEC1A58FA97192A72E5B7676E0002B4ED59DAB3B5676ACED59DAB3B5676AC372C41C05DDDF6676C400112B10B83676ACED59DAB3B5676AC16A92FE4619A21C943759ED59DAB2BF67DD961E61211117154D9AC605BB';
wwv_flow_imp.g_varchar2_table(68) := '5676AC67565ADB354D59B4771C8F2C4ACC6E549E2B441C05FD193C3F165821E2C443C8E082C704418AA6CC6C507B567624EC49D893B127624ED4958F06EEFB1738AA8C130CC21CD7D1090888B885D99B772C167624EC49D893B127624EC49DA93FA3D861';
wwv_flow_imp.g_varchar2_table(69) := 'E2B445E02EECDBB58D8AAB56ABD893B127624EC49D891807546C953566D1DC7205A9C13D85DB1000AD2B13EEC7F63115A2322AF6A4ED49DA90BA8771C81C589599F163F85866AA4D8D619C75B582796221E42E8EFA35627DD8FE96382A8C17B126B359AC';
wwv_flow_imp.g_varchar2_table(70) := 'D66B35963F9CAA227000219DC86677017CA8D6399F7659EC638222E2A9B9D66B359ACD66B1D8055C515083390F658DCC2CA889C285219B59ACD66B359A98BA3368CE39038B12B30FE4C8B885DD9B7773C01C569589C86B3959CACE527293432B33E2C7F2';
wwv_flow_imp.g_varchar2_table(71) := '30CD10E4A9AB37E6FF00E8E55D11FC5211DC8567E1979ED8E781E5695883777D8F020455774558D529555465445E4AAA3A2299D693AD275A4EB49D693AD239E00E2B4AC4FBB1FD2C705C0233D638C1195154808A1DD154F5A4EB49D693AD275A4EB49D69';
wwv_flow_imp.g_varchar2_table(72) := '38548B52854456982B58EAB0A22281D71D725043A56789F1659E4601D11B254D58E8F60F3CB12B3E62AB675A4EB49D693AD2608254B3EECB0C245688BC05DD9B77EB49D693AD275A4EB49D693F9BA6C4EEF619E56958F0F639619AA9CD53C274B2C118F6';
wwv_flow_imp.g_varchar2_table(73) := '4738A8A578EA49D493A927524EA482B552DBBB9E0795A562372E7CB110F217477D59D725043A7524EA49D493A927524EA49C75358BC82DD918E0AA3054D89DDEC32BF27C5960840B111B21D2938EA671C8F2C4ACC1A3BEA5D73444465EA49D493A921AD4';
wwv_flow_imp.g_varchar2_table(74) := 'BB9C54008958E67DD967B090882A1C7524EA49D493A92752435E23CB103E28A3054D89DECB0C167544D49D1EC13CB103F095AE2ABBBB72CDD73AE75CEB9D73AE2A8409B13BBD8657FE0D1DF52E325539A2793AFDEB9D73AE75CEB85081E58959806160DD';
wwv_flow_imp.g_varchar2_table(75) := 'DF62E7155182A7B1B92FE5888790BA39AC13D73AA5667C58FE4619AA1C95352EBC3F5CEB8CA156B5C557776DD9DB8038AD2B138EC7EB9D73AE75CEB9D710C1A3D83867DCB9C55460809CF80658391E589598347E03DB61848AD11780327983CC1E60F307';
wwv_flow_imp.g_varchar2_table(76) := '983CC18C6382A8C154FE8FA9619AA9CD535274B197298BCC1E60F307983CC5E2133E2C7F230CD1180AAB1E2EEEFB33B62A0044ACF05F5665C860D306983465658407446C953566D1EC1C8F2C450E660D002D65861211117109B336EEE7802B60307983CC';
wwv_flow_imp.g_varchar2_table(77) := '1E60F317809577D4B0CD54E6B58C19777B4933CB116CE05660D2C7D4DBEA00112B1CCFBB2C3CC24227EB38B27164E2C9C5938B2056CAD6840744392A6A4E8F609E589C5938B27164E2C9C5938B272CAD60E2101D11B254D59D787B0CF2B441C05DDDB76B';
wwv_flow_imp.g_varchar2_table(78) := '7E54E6A15C0E2C9C5938B271644E50B68EE39038B12B3069659C88C5C0002256399F7659EC638220C5464EDC5938B27164E2C9C5909B1430CD10E4A9A93A3DABCAE4AB555068ED5AB122CC9858C3F495D6416DD9DB8000AD2B13EECB2CC27364577619BE';
wwv_flow_imp.g_varchar2_table(79) := '45DC42D6001AC200B0451628E2CC985861EC603B4019A366F933BA8E6C8AF630CDCB358EB0F162237217466D19C720716256367FE96F380F9ABE47F66E51B9B27364E6C9CD939B2599F07E6AE704FE8FFD2DE301F281B961634FD785EC50058091616B0D';
wwv_flow_imp.g_varchar2_table(80) := '9816755E6C81AC601DC92EE0967508D984D59B4771C8F2C4ACCE0E7C59930B187364CDA66D33699BC45C42EECDBBB9E0795A57B04F0FC5960878B110F2064933699B4CDA66D3369D8C230CD6AF67DD8FE96382A0C55362842D8FAB3AE4A0874ACCD9198B';
wwv_flow_imp.g_varchar2_table(81) := '72C3344392A6A4E8F60F3CB115DA64F327993CC9E27E8CFB339C5546095FB3EECB4981980CDA66D33699B4CDA290EAA3F47D8B1C15460A9B13BD8E70B1C72071625667C596F8400899B199B4CDA764EC9D93B2162F18E088B8AA6CCC73B0E8F609E58887';
wwv_flow_imp.g_varchar2_table(82) := '90BA3B6ADD93B2764EC9D93B22B0709AB59CA1F2B4AC41BBBEC58E0A538AD48B113C9F16389D93B256782DA3B8E479625660D1DF53DB3B276467CA795A20E02EEEDBB3B620015A2B7BD93B2764EC9D903824E8F6095FF83777D8B9C554608A3295B4F8B2';
wwv_flow_imp.g_varchar2_table(83) := 'CF2300E95F2E5B76660B3B2764ED49DC93B927724EE483F477F4B36098709E58959F068EFAB38C945CBC7724EE49DC93B9276A4162B16D1DC723CB1072C6C3E795A563C1BBBECDFCECB043C5882D0076A4ED48EEA4022C4ACCF8B1FC2C335439A86EB9DA';
wwv_flow_imp.g_varchar2_table(84) := '93B9227B3EECB0C245688BC05DDAC6197724EE49DC93B9276A4ED4960F3CB12B3E1E54F95A20E02EEEFB33B62A5705203A23643D04908883154D98D8A0F6A4EC49D893B127624EC49D892B138ED6ACC1A3BEA5866AA73556C27624EC49D893B127624EC4';
wwv_flow_imp.g_varchar2_table(85) := '8EBC81C589599F163F85362777B0CF2B441C0E3B4A1E403D6DD893B127624EC48194596791866887254D58E8F60F05A9C31EC2ED8A80112BF67DD967B188AD10AA8EC49D893B127624EC49E3AD660D1DF52C33507B4D861E2B445E02EECDBB2E8EFA3562';
wwv_flow_imp.g_varchar2_table(86) := '7DD8FEC6382A0C57B1270B3859C2CE1670B3858EDE01D6CFE4619AA1C95352747D4CE1670B3859C2CE1662A656789F1659E4601D11B25CBAA2F08A9E9FBB2C684844F89A99ACD66B358CAA42364ABA3368EE391E58959878ADAB1885D9D8E4CEDC28C512';
wwv_flow_imp.g_varchar2_table(87) := 'B9E3BF0B3859C2CE1670B3859F0EFE4619AA1C95352DF9BA7B3EECB0F30B0444D47F49976C73C0F2B4AC41BBBEC71582B55774552D529554AD951179C156C6409080E88D92A6ACDA3D83CF2C4E142F5A2AA56A404567745E5911554751B04205888DC85D';
wwv_flow_imp.g_varchar2_table(88) := '19B472A1A7524EA49D493A927524EA48A8B975A4EB49D693AD214AD454B881BBBEC5DB15518257EC3FA3F524EA49D493A927524EA498A23254BC04567645C9D515454A140E2101D11B254D59B47B072070EBD493A927524EA49D493A927F274D98EEF61F';
wwv_flow_imp.g_varchar2_table(89) := '3CAD2B1E136317192A9CD13C9F1658278EBD4B13466D1DC723CB12B306965838277673C0F2B4AC41BD966D10F217476D19D7200874EA59D4B3A96752CEA59D4B3F9B5AB928AD18752CEA59D4B3006CB0CF2B441C05DDDF6676C5452BC752CEA59D4B3A96';
wwv_flow_imp.g_varchar2_table(90) := '752C2BD71D73536729E5695883777D8B9C56BD0B68EE39038B12B33A96752CEA59D4B3A96752C64C41E2C40FC5683054D89DDEC30582A89A93A3D82796221E4754EB8D5C04589599F163F91866887254D193666DDEC3E795A56265BB8C954E695F93AFDE';
wwv_flow_imp.g_varchar2_table(91) := 'B33ACCEB33ACCEB30A301E5895998F1675CEB8EB885182A7A7EECB0C3C5688381C7637599D667599D667599D6629CD535246169DDEC33CAD2B1C05DDECE59811625667C58C9C9EB33ACCEB33ACCEB33ACC43C85D1EC1C33EC58E0AA30552732A0CB04F2C';
wwv_flow_imp.g_varchar2_table(92) := '4ACF834729B62F31798BC1CD6F60E2101D11B254D59B47B5725CC0AD062A9B13BBD861E12BA8913E2C65E66364C6C98D931798BCC5E2319F163F85866AB9B0C5E202CCFB339C5546095FB3EECB0F3023818D931B262F31798BC52723A3D82796255E2A6C';
wwv_flow_imp.g_varchar2_table(93) := '4EF65861E2B441C056E1EC1C4203A6364C6C98D931798BCC5E02CAEFA97192A9CD6B18B0DDED24CE03A2BF95983477D4B0CD7F59FACFD67EB196C608790BA3368CE39038B12B331C6D7D8B1C15460A9E9FBB2DF0F9627EB3F59FACFD67EB3F5993067F23';
wwv_flow_imp.g_varchar2_table(94) := '0CD10E4A9A97E5198D93CAD107017776D99DB10004451613FACFD67EB3F59FACC9D638E479625660D1ED58CD8AA8C113D9F765863802AADB95C5D67EB3F59FACFD67EB09B1630CD54E6A9A93A3DABCAE4AB55517476A9589ECC9B361CD9C29759CD939B2';
wwv_flow_imp.g_varchar2_table(95) := '7364E6C9CD9396EEB7E7FD5ABE17FABFDD9C6157A3FDBADFF1BC5AF8C13D7F6B7CDF92EEA32B2077619BE4D632C203A2364A9AB368EE391E58958D9BFA5BCE03C5ABE47B75DCC2EE21770035840773337C8BBA81C589599F163F85866AA735C1D59BB187';
wwv_flow_imp.g_varchar2_table(96) := '3670B9AA8EC0C7B0B317562EEA32B2077619B925DC12EEA11B354D58E8F60F3CB12B3E1460DFA66DD8C39B2666666764B0782C2466D33699B436102B106F63EC58E0AA3054D8B9C9F221DC723CB12B3068EFA9619AD5ECFBB1FD8C704418AA6C50E2EDA3';
wwv_flow_imp.g_varchar2_table(97) := '38E40E2C4ACCF51998E4C3354392A6A4E8F609E5895F259B7773C0F2B4AC41BBF212DB3C8C3344392A6AC7957CCCCCCCCCCCCCCCCCC043AA839BFA58E0AA3054D89DDD8E1638E479625660D1D810D999999999999DA27689E589599CF537689DA27689CF';
wwv_flow_imp.g_varchar2_table(98) := '6B587CF2B4AC41BBBEC5DB05460AA5C1153723E2C7F230CD50E4A9A97E508E2B4AC4FBB1FD2C705EBE2B522C4ACF13E2C713B44EC12A6F4E8F60F3CB12B3068F66B1062A9B13BBD87CF2B409CA56D92AE8CDA3B8E47689DA27689DA27689DA22B863F165';
wwv_flow_imp.g_varchar2_table(99) := '8257FE0DDDF62E7155182A8CE5667C58FE4619A8B7CED13B44ED13B44ED481D5A7C58FE4619A8B578ED486E5E1062A9B13BBD86795A56381D8A6CED49DA91EC5E586688D92A6ACDA3D83CF2C41CB173C0F2B4AC41BBBEC7F9BD82102C4168E3B5276A477';
wwv_flow_imp.g_varchar2_table(100) := '423CB12B306963EA5866AA735F631C15460A9B13BBD8611D45C72011622B849DA93B5276A4ED49DA93B52582796221E41E50F95A563C1BBBECCE7152BD6A407446C9430ACF6A4ED49DA93B5276A4C9638E2101D11B254D59B47CD20DDDF62C7055182A7A';
wwv_flow_imp.g_varchar2_table(101) := '7EECB5B801900CD666B334884066D1DC723CB12B3068EFA94D89DDEC33CAD2B1E71DA50F207E6D9ACCD666B3358182D8FE4619AA1C95352747B045FD19F62E7155182A7B0FE8F5F93F9BE6B3249924C926493249C075ACC1A3BEA5C64A0F69B0CF2B441C';
wwv_flow_imp.g_varchar2_table(102) := '05DDDB765D19B47CD66493249924C926490D6A421E42E8CDA3B8E40E2C4FFCF2B4AC783777D8B9C55460883298ACC5662B3158C83804589599F163F9186688725CBAE28C1536277B2C33915A705278662B31598ACC56322908D92A6ACDA3D8391E589599';
wwv_flow_imp.g_varchar2_table(103) := 'CF53563C5DDDF6676C554044F678C31498A4C52629314982C1A3BEA5866AA7354D49FCDD3D9F76586122B445E0706C8A43AE2931498A4C5262931489F996D19D72008B12B33E2CB071186688D92A6A4E8F60F3CB11110CEA49D493A92752474AD56B5C11';
wwv_flow_imp.g_varchar2_table(104) := '3663BBD87CF2B4AC79C0B5BA927524EA49D493A927524EA49D493A927524EA486BAC0A971037B1F62ED8AA8C113D27F47EA49D493A927524EA49D490D7580952902B5676AD7974AD5452A140E230CD10E4A9A93A3D827962567C1A3BEACE325539A57E46';
wwv_flow_imp.g_varchar2_table(105) := '4516256AD3AD4D8E88075D6AA952F05322FCBB29CD2BF27C5960E2101D7A844D19B4771C8F2C4ACC1A3DAB3AD67509D427508AA0D8FE96382A8C15362777B0CF2B409C8EA13A84EA13A84EA13A84EA13A84EA13A84C01B2C3E795A563C1BBBECCED8AA8C';
wwv_flow_imp.g_varchar2_table(106) := '102E73A84EA13A84EA13A84EA11CF03CAD2B106EEFB1738AD7CA16D1DC723CB12B33A842BD71C64AA7354F0FC5960840B103F15A0C55362777B0F80621171556E1AC10F16221E475F13031AB3071625667C58FE1619AA9CD429CB033031C113CAD2B106E';
wwv_flow_imp.g_varchar2_table(107) := 'EFB1738AA8C153D277B1C99834C1A60D3069834C1A606606606382AAA3054D89DDEC33CAD107017777D99DB15C1A60D3069834C1A60D02704EEF61F3CAD2B1E0DDECE4B0E2C4ACCF8B19393819D6626A4E8F609E5888790BA3B8E19F62C7055182A6C5ED';
wwv_flow_imp.g_varchar2_table(108) := 'E19FD36702BACF217472872C6C98D931B20E6B77F230CD10E4A9AB1D1EC07819B0E1E57C98777B0CF2B4AC78BBBBECCE715518227B39666E2C9C5938B27164E2C9C5931B263644E599F62E7155182A7B3EECB0C3C5688380BBB124B7164E2C9C5938B271';
wwv_flow_imp.g_varchar2_table(109) := '64E2C8AB82A6C4EEF619E5688380ADC3D9E4203AE364C6C98D9195E7962567C1A3BEACE325539A563161BBBEC5CE2A8B8AD620DDDCE3632E4BFACFD67EB3F58CB63046C826ACDA3B8E479625666C8E7362C7055182A6C4EF6586795A56380BBBBECCED8A';
wwv_flow_imp.g_varchar2_table(110) := '801101B08FD67EB3F59FACFD67EB18D93CAD2B1E2EEEFB33B62A0044AC733EECB0C242222E2A19DA7EB3F59FACFD67EB08B1A31C15460A9E9FBB2C31C0152364A15D67EB3F59FACFD62F28CFA9619AA9CD53C3F165ABE02AB5D6380BBBB5AAA49B0819A8';
wwv_flow_imp.g_varchar2_table(111) := '1988BD8A327993CC9E64F3279CB775BF3FEAD47945F2C7F1ECE30AC1E06EEFB1738AA8C153D9F765861E2B441C05DD9B7677C066E60B18CEC6C8D8CB32782C6214B92D9B1636100B80B9ACDF339BC76C400112B13EEC7F63108A2C661D8DC9B1812EE064';
wwv_flow_imp.g_varchar2_table(112) := 'F058CD072D6DB1BC4AC0089EB37B6BE8727993CC9E64F3279616C07AB57F9FE5D6F91802B59253839B1B0A82E00569D867619D867619D867619D867619D9C4AC4FBB1FD8C705418AA6C4EEF619E56958F17777D99DB1556C5501E7EECB0F3090888B8AA6';
wwv_flow_imp.g_varchar2_table(113) := 'ECBA3368EE391E58959846ECC107619D867619D867619D862F2CCDBBB9E00E2B4AC4073B7E2C7F230CD50E4A9A93CA3BB133CB12B3C85D1DF5675C9410E8AE567619D867619D8673D8D619E5688380BBBBECCED8AA8C13B27619D8676ACED59DAB3B5676';
wwv_flow_imp.g_varchar2_table(114) := 'ACED59DAB3B5673DACE781E5695883777D8B1C15460A9B13BD961878AD10703306CED586CF0015A5627DD961E4B7E65D79008B12B33E2CB35958E02EEE6C553DAB3B5676ACED59DAB3B4445C553666DDEC6E032E0080E887254D59B47B0723B5676AC460';
wwv_flow_imp.g_varchar2_table(115) := '1DF52E325539AA793E2CB04ED59DAB3B561B470A3054F4FDD961878AD107017777D99982CED59DAB3B5276A4ED49DA93B5276A4ED486D5E1062A9B31DDEC3E795A563C1BBBEC5CE2AA3044F67DD96B70059581DA93B5213D8CE781E5698165521D2BF27C';
wwv_flow_imp.g_varchar2_table(116) := '5960E2101D07361B0C3C5688381DA93B5276A4ED49DA93B52336718E0A83150BD911B90BA3368EE39038B115C2CED49DA91DD1951B344D49D1EC13CB110F201EB6ED49DA917777D8B9C5546089ECFBB2C30F15A20E02EEC5D41ED49CACE5672B3959CACE';
wwv_flow_imp.g_varchar2_table(117) := '5672906F63FA58E0AA3054D89DDEC33CAD107017777D99DB15002221067293949CA4C9626CCDBBA787E2CB043C5888791CF5C518227B3EECB0CE028E5672B3959CACE5664B06EEFB15D1DB4675C8021D2B33F9BE4B3959CACE567216CB04F2C4ACF83477';
wwv_flow_imp.g_varchar2_table(118) := 'D59D72557521C833CAD107017777D99DB15002256399F7658798484445E17959824C126093049824C123AA81E5695883777D8B9C55460A9E9FBB2C30F15A20E02EECDBB6093049824C1260918E0A01ACD82796221E42E8EFAB2EEEFB33B62A0044AC733F';
wwv_flow_imp.g_varchar2_table(119) := 'A3E093049824C1260930487845F563AE4AA734AFC9F1658389E30C126093049824EB495983477D4B8C954E6A9E160AAF52CFBB2C30F15A20E02EECDBB3B620015A5627DD8FECEB487FDFFAFF00E9FF00813FF7FE17E6AFF3FF00BDB1BE6BFE6FFD3FEA9F';
wwv_flow_imp.g_varchar2_table(120) := 'D2EFE529FE63FB59F567F3ABF9A7F46FEB77F294FC5DFD3FECFF0015FF003AFF00D3FDEEF8FF00BD1FD2D8DF15FF003AFE9BFB5FFCBFE3FF007FE7FF00CF1BFB5DFCA53FCC7F69FFC4001F11010100030100020301000000000000000001101131212041';
wwv_flow_imp.g_varchar2_table(121) := '30516102FFDA0008010301013F01DA378B8DB6DB6DB6DABA99B8DB6DB6DB6E2BA8E2BAAB88EBF8DE2E256D5711C57D36DB6DBD5711D55C6DB6DB6DBC5711D57933711C6EB75BADD6EB75D4715711C5ADD6EB75BADD751C5CC7335CC5751C56EBA8E2BA8E';
wwv_flow_imp.g_varchar2_table(122) := '2DADD6EB75B4755C4755C6EB75BADD6EB75315C46B6B88E2B6DB6DB6DE38B98E2E236DB6DB6DAE638AECC445C47171B6DB5751C5546DB6D731D57131B6DB6DB6DB447731C5C6DB6DB6DB6D731C5753171B6DB6DB751C5751C7DAE238B898DB6DE38B98E6';
wwv_flow_imp.g_varchar2_table(123) := '3788EAAE23AB9DB6DB6DB798E34AEA38F1E3C78F1E62238AEA38AB88F1E3C78F1E2BA8E2E223ED5D4CEDE3C78F17DC4715D478EAB898ABFAC47571E3C78F1E3C7571B78F1E3C78F1E3C78D238AEA275E3C78F1E3C78F1E3C78F1E262BE93174F1E3C78F1';
wwv_flow_imp.g_varchar2_table(124) := 'E3C78F1E3C4D62AA262A62ABE9335C475E3C78F1E3C78F1E3C78F1E3C55C4755711C5CF8F1E3C78F1E3C78F1E2B88EAE23C78F1E3C78E63C78F1E2F888EAB898E2BA99FA44C57D6238AEA3AD3C78D34D34E62AE2238B88EAB4D34D34D34D34D388EAB88E';
wwv_flow_imp.g_varchar2_table(125) := 'AB4D34D34D3A9FA69A69A75731DC6B11C55C45C446DC5C4C5CE9A69A69A69C4CD731317CC475A69A69A69A69A5CC755AF1A69A69A691C575A695C475551A69A55C47171D5715D4715FD7555A69AAD56AB55AAD2E223AE2BFAEAFC355AAD56AB55AAD5711';
wwv_flow_imp.g_varchar2_table(126) := 'D5CC7AD56AB55AAD571731A711D5711D56AB55AAD238AEA6388EA38B88B899D5F9C7571123AAE23ABF8262E262FE28E2BAB98EAFCBD5751C5575FC716622388EAE263695B7AB716B6DB6DB6DA3AAE263695BAADA56DB6DB6DB6DD6D6B68DD751C5751C55';
wwv_flow_imp.g_varchar2_table(127) := 'C47171B6DB6DBAAE23AB9DB6DB6DB6EAE23AAF335D4711B6DB6DB6DBC47571C5C4471B6DB6DB6DD47335C45751C56EBA8E2E2278B6B75BADD6D1D5711D6DB6DB6DB6DC6B15C46B6B88E34B9DB6DB6DB78B88B888E2B6DB6DB6DB6E2BB3113171C5C6DB6D';
wwv_flow_imp.g_varchar2_table(128) := '5D4C5546DB6D731D571B6DB6DB6D713F488EE638B8FA4755CF96FE1337F0D751C7DAE223AA98DB6DE38AB88E63788EAE637F399B88E34AEA23AAE23AF1E3C78F1E6262AE238F1E3C78F1E6238AA88EAE663C78F1E3C5C471711E3AAE23AB8F1E3C78F1E3';
wwv_flow_imp.g_varchar2_table(129) := '8AB88FB5C6DE3C78B711D57123C6A351A8F1E3C78F1E3C78F1A8D478F1A8D38B98E2BE9315F4EBC78F1E3C4D62AA262BC78F1E3C4D63C78D46A3C55C47171E3C78D34D34B98EAABA8E2BAD34D34D358AE262AAE238B9E2AE238D7C7888EAB898D34D34D3';
wwv_flow_imp.g_varchar2_table(130) := '9899AE3A8E2E23AD34D34D34D63AAAFAC47173A69A69A6B151D5C4C6FD715D469A5C471711A69A69D5CC771A69A69A6B117111DC5753173A69AAD56AB55AAE23ADB8B888D355AAD56AB55AC47311D5C4751C69AAD548E2E267AD56AAB88EAE2355AAD56A';
wwv_flow_imp.g_varchar2_table(131) := 'B55AA8E2E3AB98EB8AFEBAAAD355A69A69A695C5C4CF5A69A69A691C5751711D5715D69A69A7D238AB88D388EAB88EAB4D34D358AEA6388EAFC22B898AD7CE3A98ABF86BA8E2BB8B88EFE0B98E2BAB98EAB9F3EA62ABAB898AE388EAE263695B6EAD6F1C';
wwv_flow_imp.g_varchar2_table(132) := '55C4731BAB5B4AF5D4717E1BADD6EB75BADD6DBADD6EB75BAB888EAB8DD6EB75BADD6EE2D6DB4DB6FE38AB88E375BADD6EB75BAEAE23AAF1315D471B5C471713F4E23AB89FB5CC71B6DB6DB6DD46EB6DB6DF88EAE2236DB6DB6DBA8D3AB888B88E2B6DB6';
wwv_flow_imp.g_varchar2_table(133) := 'DB6DB6E358B88D6D5D4715B6DB715D4C55F5711D57F11C56DB6DB6DB6DC5C6DB4C5C4755C6DB6DB6DBC57D623AB88E2BADB6DB6DB6DAE27E93E31C5C6DE3C78EA38AB88D7AAB898AEE3C78F1E3C78AEA63C78A88EAB88DC78F1E3C7998E2AB88EAE238F1';
wwv_flow_imp.g_varchar2_table(134) := 'E3C78F1E6266E238D2E263C78F1E3C5CC715F499AE238F1E3C78F1E6238AA8F1D5CC75E3C78F1E3C788E2E263AAE22755E3C78F1E3C799B88FB5C6DE3C78F1E3C78F1E3E9315F488AFA4C5575A69E351A69C5CC715F498AFA469E3C69A69C5C4CEDE3C78';
wwv_flow_imp.g_varchar2_table(135) := 'F1E3C69E351A69A8AB88E2B6F1E3C69A691A69A69A571335311C575315C475557F788E2BBF0B88E2E23AB8FA471571A69A69A69CC4CDC76238AEE34D34D34D38AEB4D34E23AB888AD2BA98AA8EAB898DB8AEA34D2E238B89FA55C475B5CC69A69A69A6B1';
wwv_flow_imp.g_varchar2_table(136) := '1713E15D4C69A69A69AAD3A98D355A55711D56BC6AB55238AB88E623AB88EA38D355AA91C5C4CFF73711D471A6AB55AAD56AB551C5C757111D715D6AB55AAD56AE238AB8D3899B88F5A69A5C4715D45C4755C575A69A6B11C55C4711315C577F05C44711';
wwv_flow_imp.g_varchar2_table(137) := 'D5F8EBE5B5CC71FD757111D5F8EDC575315DC5C475FCF96D5711C5757111D7F3E7B75335D5711D573F05F711C5751C55C4716B75BADD6EB755711D571BADD6EB75BADD6EB75BADD6EB75711315C6EB75BADD6EB75BAB5B6DBADBF8E2AE238B888E2B6B5B';
wwv_flow_imp.g_varchar2_table(138) := '4ADD5ADA38AEA38DAE238AEA36DB6DE266E23ADB6DB6DB6DB6DB6DB68EAE223AE36DB6DB6DA3AAE222E238ADBB9AEA38D2AE262E238ADB6DB8AEA7C36DA3AB899BFAC46DB6DB6DB6DB6D31711D5C446DB6DB6DB6F11D5C4715D6DB6D7F788E2E27E93352';
wwv_flow_imp.g_varchar2_table(139) := '222E36F1E3C751C55C478F1711D5C447571E3C78F1E3C78F151315C47573E3C78F1E3CC5C475711C78F1E3C717111C5C44C5C4E63C78F1E3C5CC7171E66E23AB98EBC78F1E3C78F1E3AB888EAB88EABC78F1E3C78F337113AAF1E3C78F31335D47DAE34F';
wwv_flow_imp.g_varchar2_table(140) := '31E3C78F1E3C78FA4C57D222E2262B88EAE64DB51A69A78D63C798F1E388EAB88EB4D34D3C69F498AAFA478F1E3C7898AFA4C5C799D34D34D34D34D2B898AB88EAE2262B88EAAF998E2E74D34D34D663AAE475315711C5C44731A69A69C4757111D69A69';
wwv_flow_imp.g_varchar2_table(141) := 'A69A69A69A69C4755C4CD711D569A69D5711D4715D4FD2E34D34D34D34AB898E2AE234D2A262BA8D34D358AE23ABF0D34D56AB55AAD56AB55A55C4757111D5711AAD56AB88EB6E2BA8E388EAB55AAD56AB55AAE62B8B98E34D56AA4ABE2BA8E2BAD56AB8';
wwv_flow_imp.g_varchar2_table(142) := '88EAB88EAE34D5FC333711D5C44757E35C5751C575D5713F071331C577E51C5C44C475731D5711D5C6DB6DB6DB4755C4CD711D5CEDB6DB6F1D4717E111D571B6DB6DB6F1FC4715D4C6DB6DB6D7133715C475731D5C46FF003D7D262A7CAA7715F488BD57';
wwv_flow_imp.g_varchar2_table(143) := 'D277153E7155F49F83FD262ABE93BF3FF4FA4EE2F5F58FFFC4002411000202030101000301010101010000000001112112315102223241611042622030FFDA0008010201013F018498D7EC7E540A1892D1093211088442211088479E1A63E8ED0AC55435';
wwv_flow_imp.g_varchar2_table(144) := '6422110884421AE1B42E1A63E8ED09C938D0940AECDB1F0D223F6C7E50A1892D10931AFD90989C8AA874E468DA170886422110884423CAFD9B63E1A42502BB1DB821108844221108D0BA6D9EB8690916F43B42B1551A63E9B4628C518A314628C51A63E8';
wwv_flow_imp.g_varchar2_table(145) := 'ED09C8AA874E466D092314628C518A314698FA6D09C8AA874E46899A1B8152174762B42E1A67AE9B4266288C468DA170D31F46A50926628C518A214C0D9A42E9B63E0E90941136628C518A314628C50DC0A90BA6D9EB84E342AA1D3919B4231313131313';
wwv_flow_imp.g_varchar2_table(146) := '11A8B3684C5543A72346D1E78699E97ECC4C4C4C4C4C44C54E074E468DA170D336E477437079AA34C7D3684C54E083131170D31F47684E4554356626235079502B723B7036690BA6D8F83A4626262626262623BA1B815216E7FC68DA3CF0D31A21F487D2';
wwv_flow_imp.g_varchar2_table(147) := '1F487D21F487D1315381D391A368F3C34C7D1DA13912B821F487D23FA47F48FE9AB1A915A170D31F47684E8489B919B4234C75635247F48FE91FD1A8B3684C5543A72346D0A48FE8958F83A42502BB1DB83D33485D36C7C21F487D21F487D21F487D1281';
wwv_flow_imp.g_varchar2_table(148) := '5B93D70DA17AE9E78698FA3B45965965965CD8EAC6A4DA170D31F47684E45543A727A4296596596433CF0D33D74DA131550D5C9EB82868F3C34C7D1DA15A2196596431550E9C8D1B42E1A67AE8E4D2174DB1F07484A05766D8CD2116F4596596590CD23C';
wwv_flow_imp.g_varchar2_table(149) := '9A63F2991E872CFA1648964B2CFA2599343522B42E1A67AE8F47D097A447A91AF459F425E8FA3E8FA3E8FA1CC9EB42D1E4FF00A3D0C4991E88F434D9F42C9168FA3E8FA3E8FA3D4FF9E742D8F67AD7F9E767A1E8F3A3C8F67AD0DC2152174DB3D70D2136';
wwv_flow_imp.g_varchar2_table(150) := 'C9636D1F426D92CB647A91A6CFA25F097C25F097C12815D8EDC0CD2123CBFD1A67AE9B426256364BE12F84BE12F84BE12F84BE12F84BE12F84B3CF4DB1F0D21215B93D5D12F84BE12F84BE12F84BE1B426F44BE12F84BE12F82BB1DD0DC1A42E9B67AE0E';
wwv_flow_imp.g_varchar2_table(151) := '786D0B8698FA3B42B42563BA1B8152174DB1D58D1B42E1A67A34897C25F097C323232321DD0E90940AECDB1F06A11B4215383D50A90BA646464646464646464644CD0DC0A90BA6D8F86909C191919191909C9A63E9919190DCD1A4242B723B7036690999';
wwv_flow_imp.g_varchar2_table(152) := '09D8FA3B42722AA34C679E8ADC8EE8F4E11142B42E1A63E8ED1E6EC76E06E0C8C8C9192324648C91B63BA1D2152174DB34C7563B42BB1DB81B348C9192324648C9192324648C9090ADC8EE86CD21749B324648C91923246487D1DA1392628C9192174DB1';
wwv_flow_imp.g_varchar2_table(153) := 'F0D212815D9E9DC1923243699E5CA1550E9C8D1B42E0EA8D212158B8698FA6D099FC1D212815D992324648C9192324648C908DB1DD0DC0A911362727FE4D21215D8EDC130648C9192324648C919236C7C3484856E476E0F4E04D2324648C91923243B427';
wwv_flow_imp.g_varchar2_table(154) := '22AA1D391A3246E86CD2174DB1F06E109A4648C9192254C8D1B479E1A63E8ED0ACF5C34C7D3684C54E075679E9B63E0E909419228A28A28A1B2524236E4774367E22E9B63E0E90940AECA28A28A286C5090BA6D8DFE89490A85765145145142A703A7234';
wwv_flow_imp.g_varchar2_table(155) := '6D0B87E22502B723B7036691E7A6D94514514797FA34C7D1DA1391550E9C9FD29A131531F4764E4334846D8EEBFC8498D2563F28493125A212625FB314628C518A3146286CD23CF4DB1F074888D8FC909A12442981A4ACC518A314628C518A3145217942';
wwv_flow_imp.g_varchar2_table(156) := '49D909B1A44248D58D49B42E1A63E8ED09C8AA874E466D08852628C518A314423CAFD9B67AE1A4242B723B70628C518A314628C51F8B15D9B6334845BD0EC5685C34C7D1DD0DC18A314628C518A3146290EDC0D9A42E8EECDA10A9C0EAC6A4568C518A31';
wwv_flow_imp.g_varchar2_table(157) := '4628C518A3F13D21B9A1D2150AECDB3D705C34C7D3684CC51F88D1B479E1A63AB1A9424998A314628C54C0DC0A90BA6D8F83A463D314628C518A3143F31A3689A152174DB1F09C68554698CDA26ACF2A056E476E0C4C4C4C4C4C44A05766D8CF3C34C756';
wwv_flow_imp.g_varchar2_table(158) := '3522B42E189898989898906D0B8699B63BA1B81521747BA3684C54E083131170D31F47684E4554356626235079502B723B7036690BA7E4CC4C4C4C4C4C44698FA3BA1B815216E7FC66D08D336C7C34848B643E90FA43E90FA43E90FA3A42A427723E8ED0';
wwv_flow_imp.g_varchar2_table(159) := 'AD0B8698D10FA43E90FA43E90FA43E89FE8D31F47684E842B723BA1B81523C8EAC6A487D21F487D1A6AC7684E45543A7233685243E9B63E1A4242BB1DB81B31643E90FA43E90FA43E9A763E8ED0AD1E6A856E4F5C3685EBA79E1A63E9EB42A42E9B63E0E';
wwv_flow_imp.g_varchar2_table(160) := '91F47D1F47D1F47D11D3D3FD0D4A1391551A63368FA3E8FA3E8FA3E896B63E8ED09C8AA86AE47C3484856E476E0F42B4433E8FA3E8B1550E9C8D1B42E1A67AE8E4D2174DB1F07484A0B767D1F47D1F47D1687684E4554699E91347934C7E532C72CFA3CA';
wwv_flow_imp.g_varchar2_table(161) := 'E8EDC0D9A42E9B67AF50589B64B2592C962914A2E47259F45A258DB4589B64B1B68DA1315381D391A368F23D9EB5FE793FE874CFA3E8FA3E8FA3D4FF009E742D8F67AD7F8A472CFA14A2CB3D4C12D1626D92C9636D09C8AA874E468DA1708BA2E6472CFA';
wwv_flow_imp.g_varchar2_table(162) := '25F097C25F097C12815D8EDC0D9A479B170D31F4DA132D12F84BE12F84BE12F84B1DA3CF4DB1F07484A05762A703AB1A3685C2D0E763B42722AA34C66D09B25F097C25F097C15D8EE86E05485D36CF5C25F097C25F097C25F097C158B63BA1D2152174DB';
wwv_flow_imp.g_varchar2_table(163) := '1D31A3685C34CF46912F84BE12F86464646437343A42502BB1DB834C7D3684C54E07566464646464642722AA3D51A479E9B63BA1B82284E50B8698FA6464797FA1D391A3685C34C75664646437FA3484856E4774366909FECC8C8C8C8C84CD31F4F3D36C';
wwv_flow_imp.g_varchar2_table(164) := '7743702A42536797FA34C7D1DA3CDD8EDC0DC1919192324648C919236C7C1B84451B4234C756352648C9192324648C919263A72346D1BA19A4215B91DD1A67AE9B465D3246486D1B42E1A63E8ED09C9314CC9192174DB1F0D21215B93D3FD192324648C9';
wwv_flow_imp.g_varchar2_table(165) := '192324336846A8D21215B91DD0DC1106D099FF0091D212815D9923244A25128944A3242E9F90B8698EAC6A45684E29928944A2512894346D0B8698FA2BB36C7C34848FC84CD192324648C91363E8ED09C8AA874E466487743702A42E9B63E0E909A25128';
wwv_flow_imp.g_varchar2_table(166) := '944A251B3CF0D31D58D49F90F869090ADC8EDC0A9C0EAC5D36C7C1D2128251451451450D8BE58FA3B42722AA34CA28A28A28842E1A63E8ED09C938D0A90BA6D8DFE89846ACA28A28A1A42722AA1D391A368F3C347915B91DD0D9A42E9B6514514514698F';
wwv_flow_imp.g_varchar2_table(167) := 'A3B42722AA1D39174DB1BFD1308546EC9C86CD23CF4DB1DD108849C0D2563F28493125A2126351687684E45543A723368AD18A42F2884D8D2D0D242F91F4DA1315381D39224C518A314628C518A125A314628C518A1A47946DC8EE86E05485D36CC518A3';
wwv_flow_imp.g_varchar2_table(168) := '14628C518A21262F2426C6968692179447EC7684E45543A723368C518A314628C518A3F162BB1DB819A422DE86A45685C34C7D366285543A72346D1E78698FA3BA1B3485D36CF574262A703AB1A368C518A314628C518A347A4248C518A314458F869085';
wwv_flow_imp.g_varchar2_table(169) := '6E4774370628C518A314628C5111635289A34846D8EE8742AA1D391A368F3C314628C518A3146286A346D1342502BB36C7C271A170D31F4DA1331311F9368F3C34C7D1DA1391550AEC76E0669089B91A915A170C4C4C4C4C4C4866D0B84598988D40A90B';
wwv_flow_imp.g_varchar2_table(170) := 'A6D8F869091BB3131313131204E50B869C9B6334842B727AFE1B42E1A634626262626262262A703E8EE86E05485B92066D0854E06887D21F487D34C7D3684E45543A727A524D0940AECDB1F0D23CF0D31A21F487D21F487D21F487D1334C7D1DA14B21F4';
wwv_flow_imp.g_varchar2_table(171) := '563BA1B8152174DB3D7087D21F487D21F487D21F45C6698CDA3C8BA6D8F8690909D8FA6D10FA43E90FA43E90FA43E969D8EAC6A4568F3542B727AE1B427D170D31D58D49F47D1F47D0D36262A703A72346D1E784431DD0E90A90BA6D9E8DA3E8FA3E8FA3';
wwv_flow_imp.g_varchar2_table(172) := 'E8FA25FEC7D1DA1391550E873A3484856E477436690A767D1F47D1F47D12D6C68DA170D33D2FD8DD0A90BA6D8F83D0990D68FA3E8FA3E8FA2D0ED0AD0AA8D33D225247915381F94CB991CB2C52A8B2CB2CB2F23D6BFCF3A16C7B3D68F27FD1E87A3CE85B';
wwv_flow_imp.g_varchar2_table(173) := '34C9636D12C4DB258FD346D09C8AA874E468DA3C8F67AD7F9E4FFA3D12C964B2592C6DA3685C34C7D1DA1590D0E59F429459639564B2589B64B2592C4E45543A7233684432E6472C964FF09FE190CC897C25F097C32174DB1F07485485D1EC9B91A3685C';
wwv_flow_imp.g_varchar2_table(174) := '34C7563B3CF4DB1F07484A05762A703A72346D1E78686FF63B42722AA34C7D368F3BB1DB81B3485D36CD31F47684E455469C93FC27F84FF09FE13FC27F86C5B81F07484A05766D8E98D1B42E1A63E93FC27F84FF0009FE19191B479E1F8B3232323F219A';
wwv_flow_imp.g_varchar2_table(175) := '4236C77437084E093CB34C7D1DA1391550E8D23CF4DB1F07488A15A170D31F4C8C8F2FF43A7233684699EAAC5485766D8CD2228F2E45543A7234646464646464272699EBA79E9B63BA1B815215D9E5FE8D31F4768C8C8C8C8C8C909A6698FA3B4648C919';
wwv_flow_imp.g_varchar2_table(176) := '212815D9B67A34844A93246487E96C7684E45543A723368DD0D9A479E9B63BA34C7D3685EBA648C90DA3685C34C7563B42B47FE47484A05766D9EB87E2346D09C53324648C919232464866D08D51A4215B91DD0DC11163B42724E34648C9192324648943';
wwv_flow_imp.g_varchar2_table(177) := 'E8ED09C8AA874E4946D8EE87485485D36CF4C944A251284FF43A72346D1E78698FA2BB36C66908FC84CD5128944A25130C7D1DA1391551A6315B91DD0DC0A90BA6D8B869928944A25128946C4698EAC6A4FC8F5C3484856E476E054E074E4944A2512894';
wwv_flow_imp.g_varchar2_table(178) := '4A314262A703A72346D1FC34846D8EE86E0548576C8442211086B86D1E78698FA3B42724C50A90BA6D8F8691ABFF002110884421A42722AA1D3919B423F110ADC8EE86E0548FFD1B21108844221108D31F47685685C34C5D36C7C34848DD89C908844221';
wwv_flow_imp.g_varchar2_table(179) := '108842AA1D58D1B42E1A63E8ED09C8AA874E4F46D092314628C518A1A484A10AECDB3D1A4793F26628C518A314628C518A314628C518A3147946D8EE86E05485D36CC518A314628C518A3142F2884D8D2D0D242F28FE8ED09C8AA8D319B4791531D58D48';
wwv_flow_imp.g_varchar2_table(180) := 'AD1E7834A45E532148D231485E50D70762B42E1A63E9B311550E9C8CDA170D33D2FD98A31313112B1F0748542BB36CF5C3488E98989898989898989898916334842B723BA1B8152129B3131313131311B348F3D36C7743A479AA1D391A3685C31222C6A4';
wwv_flow_imp.g_varchar2_table(181) := '5685C34CF5D3689A12815D9B631509409DC9EBA6D099891FD1F9368F3C34C7D1DA15897E88FE91FD19A42E9B63BA1B8152174DB191FD23FA47F48FE91FD23FA47F48FE91FD1D094215D9B67AE1A4242B723BA1B821F48FE91FD23FA47F48FE890EDC0CD2';
wwv_flow_imp.g_varchar2_table(182) := '11B67AFE1B42E1A63447F4C4554698FA6D098A9C0F723BA1D215215D8FD0F87AD1E58A9C0D10C86431531F47684E45543A727A429659E7A6D8CD210ADC8EE86E05485D2DE8B2CB2CB2190C862B63BA1B8152174DB3D70D21215B91BB845965965962502B';
wwv_flow_imp.g_varchar2_table(183) := 'B36C7C348484EC7D1DA2190C8634CDA11A703AB1A915A3CD1B63BA1B8128174DB1B863527D1F47D1F434D898AA874E468DA170B4CBD0E90A90BA6D9EB869090ADC8EE86E0D23E8FA3E8FA3E8FA3E872690856E47743702A479E9B63E1A42504B7A3E8FA3';
wwv_flow_imp.g_varchar2_table(184) := 'E8FA3E8B63702A42E9B67AE0F42724347D1F47D1F42A63AB1A915A170D33D229210ADC8FD243914AFD0A452897C25F097C25F097C2F23D7F9E742D8F67AD1E4DB1DD0DC0A90BA6D9EB869090ADC8EDC0DC12F864F864F864F84BE19314EC72C725F0528B';
wwv_flow_imp.g_varchar2_table(185) := '992D8D9A42E9B63E0E912CC9F0C9F097C25F0C9F0DBB3D0F479D087B1D592F84BE12F84BE12F87A98168F27FD1E87A3CE8FD8E4BE10F8646464644924926479E9B63E0E90940AECDB19A4215B91DD0DC09C0BA6D8F83A42502B722AA1D391A3685C22E06';
wwv_flow_imp.g_varchar2_table(186) := 'E0C8C8C8C8C8C856E476E06CD2174DB34C7D1DA1391551A6366D0854E07563522B427144924927E4C7C3484856E47743702A4646464648C9192324648C8C8C8FC86CD2174DB1DD0DC2152174DB3D70D21226CC91970D23CF4DB3D70756346D0B8699EAAC';
wwv_flow_imp.g_varchar2_table(187) := '42B724A324648C9192324642502BB1DB83D31A81DA1391550E9C8CC919213B1D58D48AD0B8698FA648C8C8C85485D36CF5C3484856E4774370648C9192324648C9192324648C90940AEC76E066908DB1DD0DC0A90BA6D9E9FE894648C91F90D9A444D8AD';
wwv_flow_imp.g_varchar2_table(188) := '0B8698FA3B42B3D70D212324648C91923246486E690E90941195898A9C0E9C8D1B42714CC91921B4C4E50B8699EBA6D099F89923242B723BA1B8152174DB3D70D21215B92519228A28A28A251B63E0E90940AECDB3D70D210ADC8EE86E0D2174A28A250A';
wwv_flow_imp.g_varchar2_table(189) := 'EC76E05C34CF5D3684CD50A90BA6D8F85228A28A28946D8EE854E0756346D0B869928A28A34C66D0854E07563522687FC3484856E4774370691E7A6D8F83A424510884422110884348D2174DB1DD0DC0A90BA6D9EB869090ADC8EDC1088442211086E11F';
wwv_flow_imp.g_varchar2_table(190) := '88FA6D098A9C0EAC56E4774370690BA6D9088442211088468D58D48AD0B8698FA6C844221108C50B8698EAC6A45685C1A499E57ECDB3D70D21215B91DB81B3485D36C7C315FF00EC8F27FD1E87A3CE87BFFE96CF5AFF003C68FF00A3D7E8F5A3CE85B63D';
wwv_flow_imp.g_varchar2_table(191) := 'A3D6BFCF1A3DEFFF00B7A168F3FB3FE8F5AFFF000F1B3D0F479D1E76C7F91EF5FF00DF81FE48F5AFF3C68FFAFF003FFFC40031100002000503030500020202020301000000010211123141213291336171104281A1B12251136203527292203082B2FFDA';
wwv_flow_imp.g_varchar2_table(192) := '0008010100063F02A5A9A761454AEE6891B50E069165266D46D46D46D46D46D46D452EE896222B58B9F86BF250FE09B5A336A36A36A36A36A3F8A49FA50EE8ED115AC7A6B7C8E1FF00D4D7E4AF825886E52AECF02FF922D7FB3448DA87034A68B294454A';
wwv_flow_imp.g_varchar2_table(193) := '15A1A246B75728E0AB0EE4D5D1E4A5DD12694A2B1B51B51B51B516457294CED0942CFA6B7772BE0A70AE6D46D46D46D46D46D47F456FE09621295767826EEC9C2E48FC35F9287F04F115CA95D1D99B4DA6D369B4DA4BDB115AC7A6B7C94705587726AE8E';
wwv_flow_imp.g_varchar2_table(194) := 'CC935AA369B4DA6D369FEB115ABAF4D6EAE51C1561DC9ABA142B3734F83F4ADE6C497B7F4FD2878B13C4454AE8F249DD5CDA54AD926AEAC79297744B1115AC5FD36EB9369B4DA2852F2697763C15BBB3B4250B27E1ADF25515B06D369B4DA6D369A7C1FA';
wwv_flow_imp.g_varchar2_table(195) := '56F363B4250AECA1A28E0AB0EE4D5D1D994BBA2ED7C9BA2E4DD1726E8B93745C9BA2E4A936E5E9ADD5CA382AC3B9357479297744B1158AB991BA2E4DD1726E8B92F1725E2E4BBE493BAB94630578C9357563C94BBA3B445585628E4D2F8287E49E22B952';
wwv_flow_imp.g_varchar2_table(196) := 'BA3C927745387627A978B92F17250F07688AD63D35BE4A382AD64EE5E2E4BC5C939C5C9ADF2578C14615C92BBB1E0A9DD93C4250B373F0D628A7E4DD1726E8B93745C9BA2E4DD1724F57E4A3934BE3D2B768BEBD26AE8F252EE89622269C99D467519D46';
wwv_flow_imp.g_varchar2_table(197) := '7519D4675192775728C60AF1934BAB1E4A1DD1DA22B58B9F86BF2515B5FD1D467519D467519D465739FF006697C7A50F07688AD63D3FF126EECAFDB626AE8ECCA5DD14E1D8AF9F4EA33A8CEA32BA9B91E4D6EAE51C1561DC9ABA3C8D38DCD1D466E6D425';
wwv_flow_imp.g_varchar2_table(198) := '0B3E9ADF257C14E15C92BB3C153BB27886C2821F93A8CEA33A8CEA33A8CEA33FB2BC2B14AC6ACECC946F5450EE8ED115AC5FD37AE0DEB837AE0DEB837AE0DEB8298B362BE4D2F8F4A1E0ED115AC7A6B7C94705587726AE89D6B837AE0DEB837AE0DEB837';
wwv_flow_imp.g_varchar2_table(199) := '2E0A1E0ED115ABA3C9ADD5CA381478C94C3764B052EE896222B5F27E1FA4947A7837AE0DEB837AE0DEB8287F0578C9A5D58F250EE8ED115C374294739DB43C15BBB3B4250B373F0D7E4AF829C2B94ABB3B226EEC74B9237AE0DEB837AE0DEB837AE0957F';
wwv_flow_imp.g_varchar2_table(200) := '5E8D3DD92588AC4DA145FC497F13DA4BF894CA11690EA4DD24E508E4A1D0D52F834F83F4A1E2C7688AD5D132D092FE255FC45B7424D424BF88F6EA7B4F69ED3DA7B486D3EC398A771CB6CF434FEB517F73D0732AD3E47B752AFE24BF89ED25FC4ABF8EA7';
wwv_flow_imp.g_varchar2_table(201) := 'B4F69ED3DA7B453A6FA48D4532295886571CCD4FFF009219ED9EA395C52229EE14ED83B64D3E0D7E4ADFC12C4252AECF05A1299426AA12D093548D4A1D0F6FF12AFE24BF89ED3A7F674FECE9FD9D3FB35BE4AF829C2B92576781B8AF10E0FEAC4F11152B';
wwv_flow_imp.g_varchar2_table(202) := 'A3C92775725ED8589253674FECE9FD9D3FB3A7F674FECE9FD9D3FB3A7F674FECE9FD9B3ECADE6C4B1094ABB3C1377772BC60A529FF00674FECE9FD9D3FB3A7F674FECE9FD9D994D336BB9D3FB3A7F674FECE9FD95BC58A3934BBB7A56EECED0944376294';
wwv_flow_imp.g_varchar2_table(203) := '129773C94BBA25888AD62E7E1FA52FDB628E4D3E0FD2B79B0A1C22BE4D2EAC792877476884E1DD63C1D3FB3A7F674FECD91706C8B83645C1B22E0A542D7F67E1AFC95F0538572957626BDA76649DD14E1D8514377A7A56F2690B7E0D91706C8B83645C1B';
wwv_flow_imp.g_varchar2_table(204) := '22E0D91706C88D911B2236445126BFB34BE3D2B793B4250AEFD358229BBE86C8B83645C1B22E0D91706C8B832BC92C4456B1736446C88D911424D367826EEEE578C14632495DD8F0389C114D9B222CD28BFB2B583F0D6F928E0AB0EE54AE8AB31156158A';
wwv_flow_imp.g_varchar2_table(205) := '39F492BDE7E943C1DA22B58F4AE2F829C2BFA6C8B83645C19E0CF067833C19E0AB0AC50BE4D3E0FD2B79B12C425388AC57C9F856FE0A31934BBB1E0CF067833C19E0CF067833C19E0CF04DDD956158A3934BBB7A56EECD6D099E0CF067833C19E0915AC1';
wwv_flow_imp.g_varchar2_table(206) := 'F86B7C943F833C19E0ADE4ED0942BBF4D6EEE57C14E3267833C12D783BE4A382AC3B93574792977452AD11E09BBBB8E2C59143C589E222A5747935BAB9FE25667E1ADF257C1233C1B91B91B91B91B91B8A9DD956158A3934BE0FD1C4EEEC6BF27F8BEFB7';
wwv_flow_imp.g_varchar2_table(207) := 'A6B7772BE0A70AE6AE46E46E46E46E46E46E46E3FD61285767835BBB95E30518C9DD92A91B91B91B91B91B97A6B75728E0AB0EE4D5D172956C9A5DD8F056EECED0942CFA6E53C9B8DC6E2A4EF726AEAC79297744B1115AC5CFC35F6FE942BB3FD5952BA3';
wwv_flow_imp.g_varchar2_table(208) := 'C92774538762BE4A9DD93C4250B373F0D7E4DC8C183060C18249EACBD89B6A6CAA7A2B0A09E9934B89CF4C95BBB3B4250B3E9ADF256FE0C183060C183494CBA2B6F565F484A53B9A1AB53771C6FE0C183060C1828C60AF1926AEAC79297743D3466B7772';
wwv_flow_imp.g_varchar2_table(209) := 'BC60A30AE495DD8F054EECD5E9098305D17460A6763B4456B1E9ADF251C1561DCFF24FF917B926F54533D1D8AD3F25D4F02585724AECF054EEC9E158A392C52D4E761454E9934489D28703854D1AA54B2A70DEC6D46D46D46D46D46D4495DD8F054EEC9E';
wwv_flow_imp.g_varchar2_table(210) := '212859B9F82AB59DC9A86C6896A6B0A9AB94B4B5B0A2A74C9B51B51B51B51B51B51B50D3867FD1AA438A9D30492525724A15366A96828FFBBA34BAB7A50F07688AD63D35BE4A382AC3B9357476652EE8934A4EC6D46D46D46D46D438E5299DA128576783';
wwv_flow_imp.g_varchar2_table(211) := '5BBB95F05185736A36A36A36A36A36A3FD595F053857295767826EEC9C0F434F83F4A1E2C4F11152BA142AD76697C1ADCB7D96FB2DF65BECB7D9348A70AE495D9E0A9DD952F6DBB9E493BA29C3B15F2697C7A5BECB7D96FB2DF65BECB7D935B5DC9ABA14';
wwv_flow_imp.g_varchar2_table(212) := '2B373F0D7E4ADFC12C437295788A1E0ED115ABA3C9ADD5CB1356C9357563C94BBA25888AD7CFA58B162C2852F2697C7A56F27684A167D3F95CB7D96FB2DF65BECB7D9541747664BDCB43F4ADE6C4B1094ABB287828E0AB0EE54AE8F23AAF09DD956158A1';
wwv_flow_imp.g_varchar2_table(213) := '3F26F8B937C5C9BE2E4DF1726F8B937C5CFA57C14E15CA55D94E6129C3B15F269F07E943C589CDAF06F8B937C5C9BE2E4DF1726F8B926A28A7E4F252EE8ED113C43628E4D3E0FD2B79B1387D87924EEAE518762736BC1BE2E4DD17250EE8ED115AC5CFC3';
wwv_flow_imp.g_varchar2_table(214) := '5F928E09CDA4EF237C5C9BE2E49D71726B7772BC2B14632697763C15BBB2FA426F8B937C5C9BE2E4DF1726F8B937C5C94BBA29C3B0BFE4FEAE2817C9A5F07E95BB44589ABA3C94BBA29C3B13FF00A942BB3C1ADDDC9A8A4B0753E8EA7D1D4FA3A9F4753E';
wwv_flow_imp.g_varchar2_table(215) := '8938CFC35F92A7EEB15AC5CFC3F4A1E2C4F1109CE4D1D4FA3A9F4753E8EA7D1D4FA3A9F43862BA3B4456B17F4F04DDD956158A3934BE3D24F4516A8AF9F4EA3E0EA3E0EA3E0AEA9CBD35BE4A382AC3B93574766355EA8EA3E0D629A84A15DFA6B7772BE0';
wwv_flow_imp.g_varchar2_table(216) := 'A70AE495D9251FD1D4FA3A9F4753E8EA7D1D4FA25139CCAD62E7E1FA384AB0AC52BCB3B32513D514BBA25888AD62E7776F4ADE4ED0942CFA5E12F09784BC25E12F09389D8A7934F835BE4A382AC3B952BA3C9B91784BC25E12F09784554A4CAD63D35BE4';
wwv_flow_imp.g_varchar2_table(217) := 'A381458C94ABB3C1377772BC2B146322FEF07E9251291B9706E5C1B9705E1E0A1FC15E1DC9ABAB1E4A5DD12C445709B96B6F4ADDD9DA12859F4D6F92B52ED32F09784BC25E12F0937267E1ADF251C1561DC9ABA26AC39EEC94E1D89B145244A4B936A271';
wwv_flow_imp.g_varchar2_table(218) := '62C518C9A5DD8F056EECED09A299B5724D428A695314E15A93A51392E47A2D49497255242D16849C2B925244A4BF914D2A64DC28DAB926A144A95A1AC28F26B75728C60AF1926AEAC791CEE886761C8D0EF91CFF00AD09AF71684B425A12D09684534AFA';
wwv_flow_imp.g_varchar2_table(219) := '1A8A6452B10CAE399A938754AD325245912A5723725A89C9686A948DA8DAB9274A1AA568254AD49B4B9F4A382AC3B9357479297743A75499549165C9B57274DF274DF274DF274FECD6EEE57C14E15C92BB3C0E2792878B1DA22A5747935BAB9250CD60E9';
wwv_flow_imp.g_varchar2_table(220) := 'BE4E9BE4E9BE4E9BE4E9BE4D6067E0E2773B4250B373F0D7E4AF81C1C15F269756F4A1DD0E9534C51D1291F86B7C9470558772A574766534CDA3A7F674FECE9FD9D3FB2A765628E4D2F8F4ADE4ED094ABB25FE3FB3A6F93A6F93A6F93A6F93A6F9F4A5FB';
wwv_flow_imp.g_varchar2_table(221) := '6C50BE4D3E0FD2B79B12C4227FDDC9ABAB1E4A5DD12C44270EEB7A74D9D37C9D37C9B62E0DB1706D8B836C5C14A4D4FD35BE4AF828FEB564F115CA95D1E493BA29C3B15A5E4DB1706D8B836C5C1B62E0DB1706D8B8F4A38270FB8F054EEC9E21B142F934';
wwv_flow_imp.g_varchar2_table(222) := 'F83BAD67E943C1DA2144AE8D91706C8B829935FD4CAB0EE4D5D1E4A5DD12C4562B5F26C8B83645C1B22E0A5269BFECF04DDD956158A3934BBB1E07138629BEC6D8B836C5C1B62E0DB1706D8B82526BC93C4572A57455988AB0AC51C9A5F07E8E28BDC383';
wwv_flow_imp.g_varchar2_table(223) := 'FEA7688AD63D2B8BE0A319F4DB1706D8B82E5CB972E4FDA8A166FE935B96A76652EE8A70EC57C9A5F06BA32E5CB972E4932AC3B9357479288BDB7EE52AECEC8A9DD956158A393B4454AE8F24A2BA2FF45FE8D1EAADA1E4A5DD12C4456B173F0D7E4A22F8';
wwv_flow_imp.g_varchar2_table(224) := '2FF45FE8ADE6C7684A15D9E0D6EEE578C0A176C972E5CB972E4D5D1D994BBA285EEB1E09BBB2AC2B147269776144AF0FA6B7573FC4B3E9ADF257C126CB9B91B91B91B91B91B9153BB1FF00D514BBA25888AD7C9A7C1FA5113B58DC8DC8DC8DC8DC8DC8D2';
wwv_flow_imp.g_varchar2_table(225) := 'EAC79287747688AD62E56FE09621B94ABB3C1377636ED6449DD127676372372372372347A4456B1E9ADF251C1561DC9ABA3714AB64D2F8F4ADE4ED0942CFA6B129BB9B91B91B91B91B91FDA297744B1115AF934F814ED0DFC94ABB3C1ADDDCAF1828C64A';
wwv_flow_imp.g_varchar2_table(226) := '30EC578C95BBB3B4250B373F0D7E4DC8B23060C1830530DD92C32B58B9F86BF251C1561DCC183060C182C8A1E0ED115AC7A6B7C8E1FF00D4BF92B79B1DA1294F56781473D7DC60C1830609686B75728E0AF0EE4D5D1E4A5DD0E6B466B765585628C64D2E';
wwv_flow_imp.g_varchar2_table(227) := 'EC5EC56EECED0983060C182C896222B58B9F86BF251C1561DCADE4ED094277F4D5EAEE38E7FF00889632495DD8F054EEC9E21285F25914C4A73B0A296993F8AD49D2385AD51AAD19542ADE9ADF251C1561DC9ABA3B329A7F9D8D5589B86E5B442852D593';
wwv_flow_imp.g_varchar2_table(228) := 'A45FD4456AE8F26B75728C60AF0EE6AA66D369B4DA6D368E06BC1B51B51B51B513A513FECAB0AC51C9A5F1E95BC92F6C26D369B4DA6D368EA5A609B86E3D3F8A14291B4D51FE5857C76F4D6F928E0AB0EE4D5D1D99B4DA6D369B4DA7FAB2BE0A70AE495D';
wwv_flow_imp.g_varchar2_table(229) := '9E0A9DD9FC2C69F07E943C58ED115ABA3B19E4A3182BC3B9357563C94BBA258885FF0027F5729C5D9257763C153BB27884A112775728C3B15F2697563C99E4CF267933C99E4CF22FFAB27944D4F933C99E4CF249595CA55D9E09BBB2AC2B14726977633C';
wwv_flow_imp.g_varchar2_table(230) := '99E4CF267933C99E4A94E593F052DCF43C153BB2AC2B147269F050FE0AF0EE4D5D58F252EEBD33C99E4CF267933C954339A3C9FECB435F92BE09621B94ABB288B050FE09E222A5747924EEAE691448DF1724D44E6AD33C943BA3B4456B07E1ADF2387E4A';
wwv_flow_imp.g_varchar2_table(231) := 'F829C2B92576782A7767F916DB1A5F1E943C1A44D1BE237C46F88DF11BE226A36CF252EE8954D27691BE2E4DF1726F8A7E4FD2B79B12C4252AECF04DDDDCAA6D2C1BE237C46F88DF11BE2348E235F9287F055FD94E15CA55D9E09BBB2AC2B094375A9E4A';
wwv_flow_imp.g_varchar2_table(232) := '1DD1DA227369F637C46F88DF11BE237C46F8893BA29C3B0BFE4FEAE28166E69F07E95BB45635454AE8ECC93BA29C3B152726753E8EA7D1D4FA35735115AC7A6B75728E0AB0EE7744D7C1AFC95F04B10DCA55D9D8A22B93C44269C9A3A9F4753E8EA7D1D4';
wwv_flow_imp.g_varchar2_table(233) := 'FA3A9F4753E870C5744B1115AC5CFC37FD1D4FA2A6E6958A3934BE3D2B793B4250AEC957F4753E8EA7D1D4FA3A9F4753E8A62F82AC3B952BA3B31A77572B79B12C4252AECF04DDDDC9FB62656AEBD3A9F4753E8EA7D1D4FA3A9F4753E8944E73B15F269F';
wwv_flow_imp.g_varchar2_table(234) := '07E8E1C956158A57967664A27AA297744B1158AD7C9F87B4F69ED3DA49D249DD5CA3182BC649ABAB1E4A5DD0BFA76F250BE4D3E0FD2B79B12C42432DC792F09ED3DA7B4F69ED128E5AFF00456B07E1ADF251C15439B94CD6A7826EECAB0AC51C9A5DDBD2';
wwv_flow_imp.g_varchar2_table(235) := 'BD35FECF69ED3DA7B4F69FCA52EC4D5D1E4A5DD12C4562AE4D3E0FD2B793B4250AEC91ADD5C94329773DA7B4F69ED3DA4DCA47E1AFC943F82788AE4D5D13561CF764A70EC4D8A2A7EC951F66C5C9453F66C5C9B1726C5C9B1726C5C8B494EE4F3835F489';
wwv_flow_imp.g_varchar2_table(236) := '2B10B571CC6DEEC9AE1682586F51C852226EE5294D3B12A35F24DC1F66C5C93507D92A3ECD60FBF4D6EAE51C1561DC9ABA3C8EADC8853B7A684F391CF16215898BF85FB93702E4D9F66907D94D1AF93583ECF252EE896222B58B9F86BF25A6958953F66C';
wwv_flow_imp.g_varchar2_table(237) := '5C92A3EC6E9BF713A6DDCAE9F3A93A1726C5C93507D92A2DDC4A8BF726E05CFA51C1561DC9ABA3B32977469AC3791553F66DFB362E4E9B3A6CD61689ABA26A0674D9D3674D937032A7764F10942CDCFC3F4ADE6C4929A84AA9693B9357479297744B1158';
wwv_flow_imp.g_varchar2_table(238) := 'AD7C9A7C0E2773B4250B3E9ADF257C0E0E0AF1934BAB1E4A5DD0E4A698A3A1A95CFC35F928E09E22B952BA3C8EABC3A14E15C92BB3C153BB27886C4BFEC56B1E9ADF251C152539DCE9B3A6CE9B3A6CE9B3A6FD298BDB62859B9F86BF256FE09621B89FF7';
wwv_flow_imp.g_varchar2_table(239) := '726AE8F252EE896221470FC9D3674D9D3674D968B82D17076652EE8ECCDB1706D8B836C5C12C2B92576782A7765585628E4FC2528B8254C5C14BBA3B4456B173F0D7E4A38270FB8F054EEC9E212859B9F87FB5E67928783B4428D5D1B62E0DB17053C4CA';
wwv_flow_imp.g_varchar2_table(240) := 'B0EE4D5D1E4A5DD14E1D8AD7C9F6CAF829C2B94ABB3B21D5788EF928E0AF0EE4D5D58B45C168B82D1705A2E0B45C168B8244F11152BA2ACC44F10D8A3934F83F4714591C2EF09DA22B58B9F86A9CFC168B82D1705A2E0B45C1B8D19DA22B58B9F87F2726';
wwv_flow_imp.g_varchar2_table(241) := '6E347366BF257C12C437295767826EEC9B76B1B8DC28A17AAF4D6F928E0AB0EE4D5D1D9943F6DC92BB3C153BB27886C51C9DA22B57479251393371B89A8B5563C94BBA25888AD7C9A7C1FA7F8BEFB1F86BF256FE09621295762895ACCD2EAC79298DD8DC';
wwv_flow_imp.g_varchar2_table(242) := '6E371B8DC6E2A5747924EE8A17BAC7644DDD956158A3934BE0512BABFA6B7C94C56C1B8DC6E371B8BA2B58F4D6F928E0AB0EE6E44F10D8A17C9A7C1FA56F3625884A6772552372372372289E982BC3B9357563C94BBA25888AD62E57C14E15CA55D9D913';
wwv_flow_imp.g_varchar2_table(243) := '776378C1277572976C1B91B91B91B9124F488AD62E7E1AFC9470558772A5745585628E4D3E0FD2B79B12F6C250F07FAC46E46E46E46E46E46E47629774538762BE4D3E05FD2B94ABB3C1377772BC2B1472518C15E1DCDC8DC8DC8DC8DC8DC8B235BAB946';
wwv_flow_imp.g_varchar2_table(244) := '305787726AEAC792892AAC76454EECAB0AC51C9A5F07E95C592C8B22C8B23F8C93479287747688AD62E7E1AFC8E1FF00D4FD2B79B12C4252AECF056FFF00D186591645916459235BE4A382AC3B9357479297743FE9D89BBB2AC2B1472697C7A7F973FD76';
wwv_flow_imp.g_varchar2_table(245) := '3B1B51B51B51B51B51B512C4456B173F0FD287F0558772B79B1DA1285767835BBB8E358DBE9B51B51B51B51B51B5143F82BE4D2EAC79287747688AD63D3BE4A382AC3B9357476649C3AA369B4DA6D274FA38F829C437295767644DDD937B558DA6D369B4';
wwv_flow_imp.g_varchar2_table(246) := 'DA6D369B4DA6D36937093FECAB10D8A393F3D1C6F3625ED84DA6D369B4DA6D27226D5CB7F142852D49D27F247F921B7F5D8FC35BE4A382AC3B952BA3B32977453876147C9A7C7A50F04DAD221C52D305295AE4943AB35562712B9FC21D0A61F6EBE943C1';
wwv_flow_imp.g_varchar2_table(247) := 'DA22B574762F17251C1561DC9ABA3C94BBA2588AC55C977C977C977C977C93C22859B9F86BF256FE09621B94ABB3C1389B9BEE5E2E4BC5C978B92F1725E2E4BC5C977C977C977C977C92D64AE52AECEC89BBB2AC2B1472697C1FA54DBD6C5E2E4BC5C978';
wwv_flow_imp.g_varchar2_table(248) := 'B92F1725E2E4BBE492BB3C153BB27884A17C9F850FE0AB0EE4D5D1E4A5DD19E4AD4FB9A7C1FA50F1627888A95D1E4EEB491ADF257C14E15CA55D9235BE4ABDB1152BA3C927757348DA3A8C9D4DB479297744B1115AC5CFC35F91C15B5FD1D488EA444946';
wwv_flow_imp.g_varchar2_table(249) := 'E6CF054EEC9E21B147269F07E95BCD89621142AECEA33A8CEA33A8CEA33A8CEA33A911D488DF11AFC95BF825884A55D9E09BBB2AC2B1472697C1D467519D467519D46751936E65385724AECEC8A9DD9561584A1BAD4F252EE89622273933A8CDECA1FC13';
wwv_flow_imp.g_varchar2_table(250) := 'C4572A5747924EE8A70EC28F9140B373F0D7E4ADFC124A650B3725C12774538762A85C8DFF0046FF00A37FD1ABD222B58F4D6F928E0AB0EE4D5D13AFE8DFF45717C14E15CA55D9E09BBB2AC2B1472697C1FA56F2350B9246F5C1BD706F5C1BD706F5C1BD';
wwv_flow_imp.g_varchar2_table(251) := '706FFA37FD136E6958A3934F83F4ADE6C7684A15D9E09BBBB95E30530FC9BD706F5C1BD706F5C1BD706F5C1FA56FE09621B94ABB3C137763FF00AC4CAD63D37FD1BFE8DFF45554DAEC76652EE8A70EC57C9A5F1E914392AC2B147269F048A9DD93C43613';
wwv_flow_imp.g_varchar2_table(252) := '5F269F07B4F69ED3DA4BF89ADD5CA382AC3B9357479297744A194A2FECA1CB5BC8FC3F4ADE6C4B1094ABB3C137765585628E4D2EEDE939427B4F69ED3DA7B4F694FF001D4F04DDD956158A3934BE3D2B793B4250AEFD35BBB938529773DA7B4F69ED3DA4';
wwv_flow_imp.g_varchar2_table(253) := '9CA5D8D3E0FD2B79B12C4252AEC91ADD5C94329773DA7B4F69ED2517B8AD7C9A7C1FA50F1627888A95D135626EECAB0AC4992504BE492FF8FEC738273EE4A8FB3A7F674FECE9FD9D3FB3A7F62FE329DF52795635F4892B10B571CCA9DD956158A3934F83';
wwv_flow_imp.g_varchar2_table(254) := 'F4ADE6C7684A55D9E09BBBB95E30518CFA74FECD20FB2546BE4D60FB3A7F64E8D3C95D17B6A2FE1A2EE4A897C925FF001FD8FF0084DBEE5547D9270C967534BBB7A56EECED0942CFA4D41F64A8B7712A2FDC9BFF008FECE9FD9A41F67F25292D10961BD4';
wwv_flow_imp.g_varchar2_table(255) := '7214889BB893B15AF93A7F674FECE9FD9D3FB3A7F66B04BE4D46B09E86995A89ABCF41CC53250A9C2992A25F2497FC7F66BFF1CDF936446C88D911B2236446C88D911B22364456EECED0942CDCFC35F92BE0A70AE52AECEC89BBB2AC2B1472697C12A221';
wwv_flow_imp.g_varchar2_table(256) := 'C4EECED0942CFA6B7C8E2F8451C15E1DC9ABAB1E4A5DD142B3D5FA6C88D911B2236446C88D9115352FE8A31924AEEC782A7767FE27688AD62E7E1AFC94705494D3B89A8229A3C92774538762BE4D2F8F4A24DC8D911B2236446C8894A495CA55D9E09BBB';
wwv_flow_imp.g_varchar2_table(257) := '2AC2B1472697C7A6C88D911B2233C19E0CF067833C19E0CF067829565724AECF054EEC9E21285F27E1FA56F3625884A55D9E09BBBB9539E9633C1FC6733C15BBB3B42283FB144AD66697563C943BA3B4456B04DDD956158919E0CF067833C19E0D13E0D6';
wwv_flow_imp.g_varchar2_table(258) := 'F92BE0A70AE495D89C3EDF4D6F928E0AB0EE4D5D19E0CF04B0EC57C9A7C1FA50F163B4456AE8CF067833C1A4E67E95BCD89621295767826EEEE5785628E4D4CF0678371B8DC6E371B8DC68E6CD6F92BE0A70AE495D9D9153BB2AC2B1472697C1FA56F276';
wwv_flow_imp.g_varchar2_table(259) := '84A672992A91B8DC52AD924AEEC782AF73D57A50F07688AD63D14FDB7295767826EEEE6E371B8DC6E371442EF73F0D7E4713CD8D6EAE518C15E1DC9ABAB1E4A637AA371B8DDE943F827888A95D1E493BAB94BB60DC6E2AC2B1472697C7A56F27684A15D9';
wwv_flow_imp.g_varchar2_table(260) := 'E09BBBB95E3049B371745D1745D1745D1744F10942CDCFC35F92B7F04B10DCA55D9E09BBB2AC2B147269776F4AA26A6CBA2E8BA2E8AF829C2B943C58ED115ABA3C9ADD5C70FF00EA7E95BC9DA128577E9745D1745D1745D13C436285F2518762BE4D2EAD';
wwv_flow_imp.g_varchar2_table(261) := 'E943BA3FD622E8BA2E8BA269A93B952BA3B324EE8A70EC57C9A5F06114C329B3C137765585628E4D2EEDE95BC9DA12859F4D6F92E8DA8DA8DA8DA8DA8DA892854D9E0A9DD93C43628E4D3E0FD2B79B12C4252AECF04DDDDCAF1828C64DA8DA8DA8DA8DA8';
wwv_flow_imp.g_varchar2_table(262) := 'FC14FDD72A5747924EE8A70EC57C956158A3934BBB7A56EECFF584DA8DA8DA8DA8DA8DA8EC8FF23CDCD2F8F4A1E0ED115ABA3FB46D46D46D46D46D452EE89622B15F269F07E943C589B5A31C7294EC4B1094ABB3C1377772BC60A31934BBB1E0ADDD9DA1';
wwv_flow_imp.g_varchar2_table(263) := '2859B9B57FF721F93FFC90FF00E43F04245FFCA1F23F58BC107922F0223201FF00F53F043E08FC8BC7FF004BF043FF0090FC1091F9211FFF00388807EB178F4FFFC4002810000201030304020301010100000000000001211131615171D14191F0F181A1';
wwv_flow_imp.g_varchar2_table(264) := '1020E1B1C130FFDA0008010100013F21A405C9AEA3A4D05653A1018EE9A457549D9AA598C266A536AE84B6ED76B33D09E84F427A13D09E846C54FA064F3A85F52C315AB9842E17962DA9B20F57A53B04451C6EAACCF427A13D09E84F424FA0CA68C49C34';
wwv_flow_imp.g_varchar2_table(265) := '3157039474BF9B15B2BD7E50989DE532CC8421759FF45DD37616ABF58D8777B26368B47D87B141C62A6E2FA22379DD348AE696B1614635874BA1AAADAAD662E5AA552E87062AA1A4446804A7B5CC0C4E63D1AFA16C506D1E8FB95065254ACCF427A13D09';
wwv_flow_imp.g_varchar2_table(266) := 'E846936E9AC0A9A1D15A23CBBB1945CBF08892B4244C6A1894F6B18599C4F4A7A13D09E84F427A1124E89275A0B53AD1B0EEF3CB1945A6EC86F0507B357655BA65645C2F2C5B53641EAF4A761D9EC18DA2D5F734F50F333CCCF333CCCF333CCC4549830C';
wwv_flow_imp.g_varchar2_table(267) := '46CAF5F942627794CB321084A7B5F691F0F90D69AFA3E282C7D3EE4F333CCCF333CCCC6122928FA18C54C8E511270E532234084A7B5CC0C4E6315A9A29735822DA9B20B95E5856EE2108C3E8BA82E55841DBB9843FB9618C54E75098090C7E3618C24A68';
wwv_flow_imp.g_varchar2_table(268) := 'F0BFF47E760D8092862AF3A85F52C315AB9842286B299563449099318C6318A54E92C44E805E1092C63AF02857BFB31DBABD76109895A10C912C392AB62E0F333CCCF333CCCF333CCCB326C826779615BBBDD843B5BD9631D38542BC9D2CF04A7B5F6917';
wwv_flow_imp.g_varchar2_table(269) := '0F90D69AFA3E2835B68ECD1C25FB25294A4B35713774449C394C88D0212DED73031398F46AE84F050651E9FB9DDEC19616AA9D4E8272AAFD400042519DF0FC6C26B5D3C48A974731F9C836024A18ABCEA124F8E526E1F2212DAFB4C910856EBF63D4ECF6';
wwv_flow_imp.g_varchar2_table(270) := '0C6D16AFB8F6283D9A7B24667126E47874FC11BD5181955CB728F2ECC46CAF5F942227794CC31084A7B5F68A4549150E9F9211D989972589AD64732264711EBD1C25808328F8D47D25963B571085C2B0842CE53F64A5294906A62B555212DAFB480B9084';
wwv_flow_imp.g_varchar2_table(271) := 'C9DA5B1574DFF81A3BA4C7A357427828328F9D47779619276952ABF4999F527A93D40E7E8C26F52789152E8E63EBEA836024A18ABCAA15ADAC315AB9842E17962CE9B20EB4053B3F699DDD94AB6AF4262C4B1325786865572DCA3CBB311B2BD7E514456F';
wwv_flow_imp.g_varchar2_table(272) := '2993854706B23D9ABB2A6ACA2E87FF0046B4D7D1F141AD3D1DE49F97B886BB6D1089A754D7E9BBB0467A5E85E11632274026B5AE6062731E8D5D09E020F34BFF001FC6B595D4DA8CA2E5F844495A123204B129ED6DA40CDE0351A7A12C141B47ABEC767B';
wwv_flow_imp.g_varchar2_table(273) := '26380A3BB688F527A93D4FE9332BAE5B396D9330398CCA75F023E2840A45B8C55E550AD6D618ADD5EEE2131BCA7FBC21084215DA9D124884B6B6D242C4B1325786865572DCA3CBB311B2B97E50889DE5330042129ED7DA41C5E4372FA28AB41FEA842106';
wwv_flow_imp.g_varchar2_table(274) := 'B34E932CEB7CD8F543BDFCD8C54E5517842432274026B59C9432EAFE19D50FF311345254A0CA3E751DDE5862D0E94648B6B9BB0B954D90434145ABFAA108466DAA72C454BA398FAFAA18024A18ABCAA15ADAC33A417362840C4C01258C75E150AF6D658E';
wwv_flow_imp.g_varchar2_table(275) := 'DD5EEC2131AC21774DD85AEFD63691F2F70D4968EB07C506A6D7D89A109745557FDA108420D8C947A0B421591D369554777B065CC066811ACB92AB2EE659469FE594F2A5D2589CE95129B8F51B1B512551B914ACB12282BAD4EB80A564474EABBD08BB25';
wwv_flow_imp.g_varchar2_table(276) := '4B099D61076EEF7710EF6F618C54E550ECCE1AAA1A8D6C75A947215897024BA2929556326A236AA7562BF417962A3253AD58CA8835695706CFB9B3EE6CFB9B3EE6CFB977BDD860B436AA7F0879BD8E80B82D245951555475507425435695636AD08D45DC';
wwv_flow_imp.g_varchar2_table(277) := '95796EAB82CA34FF002CA3D52E956CB21145E86CFB9B3EE6CFB9B3EE6CFB96455A8AD4A2AE9A49FE1363FD3EE7FA7D8FF09B9551D74932694BB4FC01B45060B43E493B743E3DDC57F27608ADB10BEA6EC2D4EB46C3BBCF2C65171A86F050A8510D3A34EA';
wwv_flow_imp.g_varchar2_table(278) := '52AD51AAAB896B415CC0D0AB53E58828A5E5944A3D5534F437C546D5A11A8BB92BE24EA9D5C1B3BD9E653CCA7994F3299025894F6B6D2066F01A8D3D1F05088B536115A95EA6A8ECF3C31945CEA1AC041ECD1C5455D6B2992782E953CCA7994F329E653C';
wwv_flow_imp.g_varchar2_table(279) := 'CA7997F555556A5571451B35D1D8D10FEE5963238D4360240FCEC26B591CC41A62999E653CCA7994F329E652987C5042BD3ADC3F55555AA914504212DAE6234084C9DA5B19560708F2EEC6150ADCD846915AC36020CA3E751DD25862D0C4C90B85CDD8BE';
wwv_flow_imp.g_varchar2_table(280) := 'A9B20FAAD5218ABD6769664B84133BCB0ADDDEEC21ACE56454B382EAFAA18024A18ABCAA15AFE4C46CD46EE130125890AA831E653CCA546A8D51AA32FA0DDCD74131AC21774DD89AFD6369DFBC98DA2D1F6111176E4F8A0D6DA7B26E5F0369035264ED2D';
wwv_flow_imp.g_varchar2_table(281) := '88EAB96E10D6A5438AA151AA3546A8D51AAFE655FCCABF9957F3189A25EBD0B325082667696C46CEF5B847977631D32384449428486485956151AA3546A8D5190CD518BA0EE92C315A368D509DAAAED157F32AFE6650ABD06C04843F3B09AD647322A593';
wwv_flow_imp.g_varchar2_table(282) := 'C47E36098092C51B068AE855FCCAD27F760ADD5EBB284C4EF2C59908425BF49DA47C3DC35A6AEB2256ABAC8C918BC884B6BED2595EC8703610C844CAF0D0CD9DEB728F2ECC65172FCA2E2872995B828206671134C36DD922A3546F331E663CCC7998F331';
wwv_flow_imp.g_varchar2_table(283) := 'D31EBBAB1E875A7616D4D905CAE6EC2B7626087DE4F2C6F9860C5A2BD236167737622FA51513FD22A593C4753D10BC22E67998F331E663CCC7998F337E62105507B357648C4E6435B5CC4E810BCA14B631D703845EAC4AECF331E663CCC7998F33089539';
wwv_flow_imp.g_varchar2_table(284) := 'D50ADD5EBB284C4EF2C59908410EAB4BC7A7E229823677ADC23CBBB19464708892B4244C6A1894F6B1497AD1342FA3C0C781876F8245D6C8129ED73031398F46BE85B141B47A3EE23F7D87A6A360240FCEC28612900EDDCC21FDCB0C62A73A84C04863E9';
wwv_flow_imp.g_varchar2_table(285) := 'E8836BA8574426256842EC94B129ED6DA3533755A23CCDFB666663426E863536AEC9F87B886B6BED2CC9420999DA584D1AEC4B2A6C874BD6C16942B22675027BDAC6066712D57EECCCCCCC22A9549937631D38543602421D5F5426B591CC8A964F12DCE9';
wwv_flow_imp.g_varchar2_table(286) := '0212960FDB33332834EF6644681094F6B98189CC7A35F4348DAAC0B5BEB7B913A017845CC63AF028EB7F763B757AEC22B8D212271592D9308C23084F4DA827FD1F9D8360248C9E750BEA5862B573085C2F2C215145720C74E05142DA885E18DA2D5F71AC';
wwv_flow_imp.g_varchar2_table(287) := '141ECD1D9233389016D62C9E350BB49658ED59982170A9B217D4DDBF195D66BACD759AEB35D66BACA285ACD6B62DC944D4AC5DB723DB25897D9450EA6A92AAAA10A90ADA27D7519560708F2EEC66CAF5F8422256848C912C25544597046E6BACD759AEB3';
wwv_flow_imp.g_varchar2_table(288) := '5D66BACDDC342206D4B91C34BA0AB643984DEBB1342B5BDD6C894142855332890CC552C8CAEB35D66BACD759AEB2958A89AD74F122A5D1CC7E760D8092862AF3A874C3AA75B933A8135AC8E644C8E23F1B84C041947C6A25916955DD994E5FCC45B534DC';
wwv_flow_imp.g_varchar2_table(289) := 'F25F7A9DAF54797662B657AFCA1113BCA6599084253DAFB46F830B942554ABD341CF2513514E9D66F71A285E958404344AF42C9492D5157C86FD07A34F47C141B47ABBC1DBFC99157ACED313B14D24B8F51E252884A113CEE99164FAAA58418961D2E8AF';
wwv_flow_imp.g_varchar2_table(290) := '764D995D529629647A23D11E88F447A23D10FC6C13012464F1A85F52CB1DAB8842E15842B054B167D18AD1AB2A52E4FA544348A5ECA80E6C949DAFA2831D294FB3D11E88F447A23D11E88F4443E6531B933CEED8F1A95425068154B0FA174AD9A8B152B5';
wwv_flow_imp.g_varchar2_table(291) := '4683D2CF64898D431325786865572DCA3CBB311B2BD7E51027794CC11084A7B5F69170C35A6BE8F820D6DA3B138652B35F47A23D11E88F44349B7456047C0568876B7F2C63A70A8C01210EAFA8135ACA0C4C8E27A23D11E88F447A23D10D2ACA217862D5';
wwv_flow_imp.g_varchar2_table(292) := '7EB1B4EFDE4C6A4B47583E0A0D4DAFB1D8A058DCBEA6EC2E553641DBB33247649E18C8E750879CDD82CC94214093EA7566677199DC6677199DC667717A0DC8199C47A34F42D8A0DA3D5F62AB6ED7D87B141ECD3D9233389096D63316258992BC34667719';
wwv_flow_imp.g_varchar2_table(293) := '9DC6677199DC6677199DC3446812B0C46B68A4775E085C2B085F537616A75A361DDEC98C69691F033777ACCA1DEFE4C62A7228BC2121913A01E36C6A88DE390F46AE13C041947CEA3BBCB0C5A1D28D82292DD32AE8BB355773CED9E76CF3B65A8D2D5212';
wwv_flow_imp.g_varchar2_table(294) := 'E421327696C65572DC23CBBB19D172FC2224AD090FD553796EA6677199DC6677199DC66770AA03B97B8F6A0D6B2D16BA0B95CDD856CC4C11DD2796328B8D42128B7D0D683D57E93B4EDDE0C6D16AEB27C1436E079279AA48C9189CC745A54965FBD55555';
wwv_flow_imp.g_varchar2_table(295) := '3051BD5B64B7EB1B48F97B86A4B47581E8EF101DFBC19057A46D2EC952C26657841DBBBDDC4356C95D7ABF6AAAAAAF19268EE13C041947CEA10F54D1793B7D931E8AF59D859D364133BCB0ADDDEEC21E9ACB381AC041EFD1C4CC8E24CE1DEAA7E2DA3546';
wwv_flow_imp.g_varchar2_table(296) := 'F418ABCAA15ADAC315BABDDC42637962CC95083D57E93B4A55A3A949FCDDB53C25F5354CC9981CC8A964F11D4F441301258C75E150EAA4AD35AFEF555554F69E8EF277EF0622915FF01AA8872D82CC9420999DA585917D058D07788C6A35F47C141B47A3';
wwv_flow_imp.g_varchar2_table(297) := 'BC9DFBC196945D9631D3854600908757D5067B99D217327B0C9EC327B0C9EC327B06A54B4EF02E153642FA9BB0F7430942B4313245B5CDD8BEA9B20F5333247649E195C8D40CCEC327B0C9EC327B0C9EC333B0AA6336A856B6B0C56EAF7710BA49DE532A';
wwv_flow_imp.g_varchar2_table(298) := 'A6A96B591A9B5F648C5E4425B5F6990210993B4B63E900612DADB452A68D4A68F483D20F481AAACF72A74224EF2998021094F6BED2062F21A8D7D1F142B0BA86943D20A619AED463A7028B4A14244CEA1896F6B18199C47A347456452193D864F6193D86';
wwv_flow_imp.g_varchar2_table(299) := '4F619BD82352AD74EA2D0C4C916D73762FAA6C8299DEE9EA89189CC81EB40A6282205131947CEA3BA4B0C568C4C90C9149628EA4C9DA5B1955CB708F2EEC65172FC2224AD09095163E0F4C7A63D31E98F4C34AB3E8491D226FAD3A14C6E62CC84212DFA4';
wwv_flow_imp.g_varchar2_table(300) := 'ED23E1EE1AD2D5D64F8A825AA55F83D31E98F4C7A63D314C3B4155A8CA2E5F94449DE53202C42129ED72A637BFE065171A86F0107BF571330399152C9E25A2EBEF172AC210E05AABF55294CCCF22260731F9D836020CA3E751DD25862EACA1EC2634DB28';
wwv_flow_imp.g_varchar2_table(301) := '44C9DA5B19560708F2EEC66CAF5F8422256848BB252C25668AD43A1E98F4C7A63D31E98AC252BA484C4EF2C59908425BF49DA47C3DC37680482D1423A6B4A84FCBDC51448C28B6B372B32F47D0569A36FC9F041D08A964F11D4F4430049631D78542BDB5';
wwv_flow_imp.g_varchar2_table(302) := '9640551778447517D9044D682C8ED24A971C9A1D188094D8AE9BDB4BA94B1EAB1A048749D4AA8C5A9B6AA752B3416292CFA75A8D699AA95469492C9F64123A8A003B89A2D5BA4A0DC744C4C04863A9E884D6BA78917A91CC7E760D8092524BD62F824BDB';
wwv_flow_imp.g_varchar2_table(303) := 'DC64EF361124E9A4179BBDF712EA50C5EA9075D4F6C7B63DB1ED8F6C35622D587250DBA69233769B104EFEE41B7EFB1B12DB9534A6692434AA95614A6A75955B8DB324BF9113584562EF2188D32A950A2EAA3129C36546535562594A0F222BAA92483648';
wwv_flow_imp.g_varchar2_table(304) := 'FB4342EAA8D4344A7B5CC0C4E63D1AFA16C506D1E8FB95E9555A8ED51D0A2DD28E6E5254E929F47E15E907A41E906476133A8626B5AC6066711E8D1D0960A0AA78DE8D6981DBB9843BDBD8631539D42602431F4F442A5B97E563D20F483D20F483D20685';
wwv_flow_imp.g_varchar2_table(305) := '524AF22E1796321BA3C0AF6D658ED5C42130AC21774DD85AAFD636154717C30435B58CC6A18992870D0C55C0E5146576D2B662759EA4F41313BCB166421096F6BED23E1EE1AD35747C504EBD1ADD4CCEC333B0CCEC333B06746A408425B5F699621044CE';
wwv_flow_imp.g_varchar2_table(306) := 'D2D88D9DEB708F2EECA2A75D0D04047A2C0F483D20F483D20F482CAC34C7AA9AA4AE63D0EB4EC2DA9B20B95CDD856CC4C11DD279626BBA53FE8FCEC1B012464F3A85F52C32AB99DC4C9C296C4A5550793D20F48293D27A4F49D4EAE36A9022256848B925';
wwv_flow_imp.g_varchar2_table(307) := '2C4A7B5B6884551F20ECF60C6D16AFB8D60A0F668EC9199C456969F444527A4F49E93D27A4EC144F469929ED7DA552D41E1EA25828368F5FD8ECF64C7A1D69D85B53643AAFFB0571AC343B677ADCA3ADFCD8E4D3AF4755F9A2AEBA17A440C4E63D1AFA13';
wwv_flow_imp.g_varchar2_table(308) := 'C141B47A3EE777B0644E9426A892AAFCAAA6ECF21BC041ECD5D9231399156CA4C4E805E117329B1B43A0A4F49E93D27A4F3B0BC28767B06368B5FDC5AD79909F87B886BBED2CC9420999DA58A74B425A22F0EAE1BA3CBB311B2BD7E51027794CC00A9C88';
wwv_flow_imp.g_varchar2_table(309) := 'A964F128B54DD6C9149E93F9D33C699E34CF1A678D31FB172C76AE210AACB6486EA91D2D4F8A0D6DA3B27E5EE212DADB4BB212C50ABD4543C699E34CF1A678D33CE99340F62062731E8D5D09E0214FB52FF01A934747C506A6D5D9370F91096D7DA3A21D';
wwv_flow_imp.g_varchar2_table(310) := 'A2D98C8E75098090560B5138333B8CCEE2BE65E90C012462AF3A85F52C315AB9842E17962CA9B20B76C745760CCEE32BB856EEF7610ED6F658C74E151802421D5F5426B591CC7DD512781E34CF1A678D33C699E74CF3A1AD35F47C506B6D1D95EB37B4D4';
wwv_flow_imp.g_varchar2_table(311) := '6F0507B35F648C4E6425B5CC46810DF899D4BCA1D9913A00D396249E88892B4244A5C96253DADB4BB8AC1E74CF647B23D91EC8F643526EA7C8DA3D5F62861E82CB1947A6EE8EEF2C316874A3617D4DD85CAB0829DD0751F547B23D91EC8F647B23D90EAF';
wwv_flow_imp.g_varchar2_table(312) := 'AE0D8092862AF2A856B6B0C56AE610B53AD1B0EEF64C65169FB0DE0A0F66AECA6C2FB47B34F621EEA4CDA60F647B23D91EC8A6D2F43A311B2BD7E50889DE5330C42129ED7DA45C3E435A6BE8611D0B151287D6E74405C84264ED2D88EAB96E11E5DD8CE8';
wwv_flow_imp.g_varchar2_table(313) := 'B97E1154744A11AF5123D91EC8F647B23D90EB1553341947A6EE8EEF2C316874A3617D4DD8751296018E9C6A1B01210EAFAE135AC8E645E84F1266471202DD058EBC2A15EDACB1DBABDD842635842EC972C7B2FC2E1384E1384E13119D358297B7DC56EA';
wwv_flow_imp.g_varchar2_table(314) := 'F771098DE58B3A6C83D57E93B0EDDE0C7D4AB7309C2709C2709A6A7D432AB96E51E5D988D95CBF28813BCA6608842AEA42C94D58A5CE9B1A21B542AAF6ECA89673A221D4A24228EB6A6B06D12D8A6934D269A4D34967832888D009AD6726060731E8D5D0';
wwv_flow_imp.g_varchar2_table(315) := '9E0A0CA3D377445073A8EA22AB2B8C64E77D0E629756AE2473AB022A8A2492AB57F8A2B2DAFF006661384E1384E135EDD817D6B0C56EAF771098DE58B3A6C83D57E93B06F81E0C99B156DC22AAE2FF006642917BD1116A42842A84B8C35028684A9B2788';
wwv_flow_imp.g_varchar2_table(316) := 'F468E12C041947C6A3B3CB2C7A1D69D87AA2900926651869841E28AB90A5416B828CEFA9AA1ACA36D61940A67725D51127794CC01084A7B5F69031790D69AFA3E2854191A3A3392754E896531BA92D10DB45B7BB1B575237A222CB7D16A3D06F530C62A7';
wwv_flow_imp.g_varchar2_table(317) := '2A8C01218EA7A2135AE9E244C0E65AA1846118461184610BA1B6A5B55FAE66638BD044A951CE9A1370F711D77DA648841349BB4B623677ADC211554DCCB308C2308C2308C21AB26A96FF008394EACA9A0FE4B67763E8E9B96F4455D4B764B22BD26D5D8D';
wwv_flow_imp.g_varchar2_table(318) := '4740AA1127794CC01084A7B5F69031790D46BE865DD2BD0308C2308C2308C228A08FA5929ED6DA45CBE035269E8F8A83536AEF03DB78C6E5D92A584CCB083B777BB8877B7B0C62A72A86A7CB1E66243DD26260731EBD5C27808328F9D47749619431700F';
wwv_flow_imp.g_varchar2_table(319) := '496541EBD1C25808328F8D476496592AEB4B7A21EDD1C48C8E2454B382EABA81325172FC47818F031E063C0C7818A5626EC3ABB3211A9B8A301E47998F331E6614E995D46D168FB0F6283D9AFB246273212DAE62340821275751E063C0C7818F031E062B';
wwv_flow_imp.g_varchar2_table(320) := '53E858DD6055357B86298AD0F8A8368F57783B77931E8AF59DA59D2E10AAB758AB1130398FCEE1B010651F3A86D6DCAAE8CF031E063C0C7818F0312CDC52B713050AB26B45AB2EA9BB0B55FAC6C3BBD931B45A3EC28A0F453AA1EA74A7247679E18CA2E7';
wwv_flow_imp.g_varchar2_table(321) := '50D6020F6E8E28564D132A33695392A168424A18ABC8A15AFE6C56EAF5D9426277962CC8420A9DC743D5129ED6DA40CDE035269E8F8283527ABBC0DAB44259C98625844CAF0D0CD9DEB728723A9CD133D99ECCF667B33D9959294D1F53E0A0DA3D1DE47A';
wwv_flow_imp.g_varchar2_table(322) := 'EBEA752A35466574D684BA98B95E5856EE210FEE5963238D43602421F9D8277531149ECCF667B33D99ECC745CAE9565B53641EA74A76084531178677EF26368B47583E0A0D66BEC9189C8DE12D0B422E431579142B5FCD885501151ECCF667B33D99ECCF';
wwv_flow_imp.g_varchar2_table(323) := '643D9A7B2466F0134EA83565A9B05B5364172BCB1454F43019550C6B4B5747C506B6D3D9372F80E763A8E2B53CCA7994F328B700BD2946328B97E51127794C88D02129ED7303139967C0505784C9774DD85AAFD6361DDEC98DA2D1F62A89A82EE20B08AA';
wwv_flow_imp.g_varchar2_table(324) := 'B61FDCB0C7BEA129FB888AAAB0F910BEA5862B5626485C2F2C4FC5A86A983CCA38D9D81096D7DA658841133B4B623677ADC23CBBB19470A84048AFDA22AAABB3EAEEDA91F0F70D696AE8F8A0CA24DF615B313047749E58C8E350D80903F3B0ACD14A44F2';
wwv_flow_imp.g_varchar2_table(325) := '328C8E51794394FF00791155540A65CA505A2BD2361774DD85CAB0829D649EA89B87C88CEB4EC8E8EAC40B8A5131B47A3EE777B062D1E946C2D8E6EC53576B29ABB594D5DACA6AED630B29F91F8D84D6BA789152E8E63F3B06C049193CEA28AAD6C03D0E';
wwv_flow_imp.g_varchar2_table(326) := 'B4EC2DA9B20B95E5856EE210FEE5963542D527E06B05049152AF7377DCDDF7377DCDDF7377DC50C163D42B657AECA1313BCB166421096F6BED2744946A2A149D286F0507B357648C4E6475B5CC4E810BCA15D8C094FD48DDF7377DCDDF7377DCDDF71B29';
wwv_flow_imp.g_varchar2_table(327) := 'CF746FA07A35F42D8A0DA3D1F73BBD832D4A96A7AA359B708266769615BBBD6611D2FEEC63A6470876650940CA5A64156B678D06EFB9BBEE6EFB9BBEE6EFB8926A5E95170BCB16D4D907ABD29D8767B0632C64905A281EB15C2466F02932446515350F51';
wwv_flow_imp.g_varchar2_table(328) := '6F1754FA0A94376A1F40DA955E8FDA108420A41592C7D0A711F70D2A1D6A466D6B6E8F54472278646F974A6A856ACA5253C9AC47F03A24DC22918AA8B2940A9595ACB793492E94D115A4526A74A0D4B4AA14C0A08034E0A04E654AAB8A3D09D0449C394C';
wwv_flow_imp.g_varchar2_table(329) := '88D02129ED73031398F46AE84F05072AAAC1F04F39596323D3E5E8844856D209B755F7190A446B0AB4A46A8D2AD4419A808A434B22BB421D074842A2B84681B01250C55E750BEA5862B573085C2F2C5B5364121A2759761612956750E1240A7226FD62B0';
wwv_flow_imp.g_varchar2_table(330) := 'AB7D842B42D3A35150552A5350AE1404150D3828C272A95B834095B03850104D46A8ECD129ED7DA47C3E435A6BE8F8A0D6DA3B21B487455491AA08A9D28F50B454A69D53E8FD31BB5AA532B7635A6BE8AA896E7B13D89EC46444964651F1A8EC92CB1DA3';
wwv_flow_imp.g_varchar2_table(331) := '33042E153642FAE6EC2D4C4C10D4337D4D493C52A1E8D5D09E0A0CA3D3F73BBD83168F4A3617D4DD8CAEE8F0797763B657AFC21312B4245D929612BBDADB44D562FC08A974731F5F541B01250C55E7514AF73A8BA311FF008002E17962CE9B20F55FA4EC';
wwv_flow_imp.g_varchar2_table(332) := '3B3D831B45ABEE3D8A08C9FA45FF0048199C47A34F425828368F57D8ECF64CB8E25B311B2BD7E50889DE5330C42129ED7DA2D524B0BF7DDDDDDB6E1C34C9D2A97E43B571085C2B085F537616AF5A361DDEC98AAEC453FE8F46AE84F050651E9BB9DDE586';
wwv_flow_imp.g_varchar2_table(333) := '280AB509AAFDF77758CDE0328F4DDD12551B9D53A3FD00004454D4D521A934F47C541A93D5DE0EDDE4C82BD676969536412AA9F57D4C6E6A0C5E0CBD50AD6D618ADD73085C2F2C59D3641EABF49D8576D41E1EA260248C9E350BEA5963B571085C2B083E';
wwv_flow_imp.g_varchar2_table(334) := 'A21DC2A9E892865572DCA3CBB31C9A35B8B55F90468352D2BD2E845C3E435A6BE8F8A835A7A3BC93F2F7153D3B2A26A4EB72E425BEDB48F97B86A4D1D1F142ACD56DA177B204D6B393030398F46AE1509FDA318C6328C553CAA0FB49E18C8E750B567D43';
wwv_flow_imp.g_varchar2_table(335) := 'B3D931E8AF59D859D364172BCB119694B445F5583742B5B5862B757BB884C2F2C40CF7EA6318CC61CD2B5056B6B0C56EAF771098DE58E98374799152C422EE9BB0B55FAC6C3BFD931B45A3EC3D8A0D66BEC4D29D4791E64799124BD0D50889DE53300421';
wwv_flow_imp.g_varchar2_table(336) := '29ED7DA40C5E435A6BE8F8A146E7341E8D3D0B628368F57D8EDF64C8ABD676109E9F5318A9CAA3004862B04C33CC8F3216BAAE027828328F9D47759618B43A51B0BEA6EC2E55364295E905C2A6C85F537616A75A361DDE796328B4DD90AF012E3EBEA860';
wwv_flow_imp.g_varchar2_table(337) := '09284911D8F546318C6318C6309AE940DA2D5F73E0A0F669ECAE59BBA6A7C506A6D7D9370F91096D7DA650842E83BAD4893BCA6600841C9D4B9CC6318C6318C62BBA2EF8EA1337E51127794CC01084A7B5F69031B91EE4EDF64C7A1D69D85B5364172B9B';
wwv_flow_imp.g_varchar2_table(338) := 'B0ADD89821F793CB280889C6BA211928AC9ED4F6A7B11ED11DD43FA2060731E9D5C27808328F9D47769618B4313244B7EB1B48F97B86A4B47583E283536BECA5E5B1C87B7470E9ACA3CB3FF0F6A7B53DA9ED4A54BD27662B757BB884C6F2C5992A109AFD';
wwv_flow_imp.g_varchar2_table(339) := '27691F0F06368B57591FC799157ACEC2CC9B2099DE5856EEF76109272658CEAB96E50EEB8FA19ED4F727B93DC9EE4F72368A1B6835A7A3BC9DFBC19057A46D2EC952C32A95254C8CA2E350DE020F6EAE24607322A59499AD74F12260733DA9EE4F727B93';
wwv_flow_imp.g_varchar2_table(340) := 'DC9EE4774959487D3D109AD74F12260731EBD58360210BAF6874E9A9F141A9B5764DC3DC435DF69664A104CCED2C26B427D09F447AF3D79EBCF5E395A492A18824A18ABCAA15AFE4C56EAF7710989E58B32542152DD7F6152B9BB13313047749E58DA27F';
wwv_flow_imp.g_varchar2_table(341) := 'FC50F0882A1755BB06972B70F5E7AF3D79EBC6D498E8D231442129ED7DA40C5E4351AFA3E0A0DA3D1DE4A507ADBB42836BEC918BC86A4B6BED320421227696CA3AC950AAEE1B6A7A93D49EA4F527A93D29F4F618AD18992170B9BB17D53641EA74A7243F';
wwv_flow_imp.g_varchar2_table(342) := 'A598ADDDEEC21DAFECC63A70A8C01210EAFAA0EA050125EB74CF527A93D49EA4F527A915D5AA9CB1152CE0CCEA05A117218ABC8A3A5FCD9509537E509A49DE532E564213DF7DA45C10D69ACA3E082C6B5B66318C6318C3150AF45A90CF76487AC6C22E46';
wwv_flow_imp.g_varchar2_table(343) := 'E1A934347C106A6D7D89CA2B0647999E667999E6679998C6318C6318C630E685115DA28E74D0EC164C8ABD676162BD905D06ED2D8AFF00920555F932CF333CCCF333CCCF33FC66A65A2331E4B443AD3A5DD8ED2ED2DE886A91D92D58A941BEAC9EAA5409';
wwv_flow_imp.g_varchar2_table(344) := '89DE58B321084B7DF691F0F70D696AEB27C506B6D0D937277109B5B61972909ADAC3434EF5B944857D4C678341A6A3526FF82C256D0EB56171EBCCA9A15DA54C148B97322265786866CEF5B9479766328C8E51A9DA7F0890F6B98189CC7A35F42D8A0DA3';
wwv_flow_imp.g_varchar2_table(345) := 'D1F73BBD8324538E8D04E555FA25294F08DB8D55D6AC76AE210B85610BEA6EC2D5EB46C3BBD931B45A3EC7C141FD6328ACFF00CC84210845294A80B696A635268E8F8A0D4DAFB26E1F2212DAFB4C910826676961D5ADE82748FD8842109AADC30F468E84';
wwv_flow_imp.g_varchar2_table(346) := 'B010651F1A8ECF2CB1E875A76098D4D9090FA5588189CC7A35F42D8A0DA3D1F725746B5D05726B53A9D60BBA6EC2E55841DBB9843FB9618C54E75140F4482BD55FEE1764A5896FB6D23E5EE1A934742D2B64648961D0A8FA2191CEA1301207E3609E0AB4';
wwv_flow_imp.g_varchar2_table(347) := '5F8DA3A660AA360248C9E750BEA5862B573085C2F2C5B53641488A68D3F3994766CA242D8A0DA3D5F63B3D931E8AF59D859D364172BCB0ADDC423BA4F2C9C7FE6BFF002999999DCCAAAB3B25AB2FA9BB0B53AD1B0EEF3CB1945A6EC86F0107B357648C4E';
wwv_flow_imp.g_varchar2_table(348) := '6425B5CC05C84229FD9999999DAF4A2AF422E5F01A934F47C506A6D5D9370F714A7AED06C04943279D42FA96194357A54AAFC6B62A33AD8EB4B6A8ECF60C6D16AFB8D60A0F668EC9199C45D3E17863D45A9B02E153642FA9BB0B53AD1B06BA1AEC76AE21';
wwv_flow_imp.g_varchar2_table(349) := '150A308370BB2466711C91D28E2B5304E09C12B415BA94A518AD95EBF28444EF2998621094F6BED22E1F21ACFD14D55A334D5692AD6CABB43A11F2F263525A3AC1F0506A6D7D9271F91096D7DA5992841333B4B0ADDDEB3086A4AE1B559FDE1084210C13';
wwv_flow_imp.g_varchar2_table(350) := '8251FB630EA3D15EB3B0B3A6C826779615BBBDD843B5BD9631D3854360240FCEC26B591CCAF74A8AAD4FDE1084210548EAEEC2D5EB46C3BBD931B45A3EC378283D9AFB2B24A911E446CAF5F945F7794CC1382704C3A12521F141ADB4764DCB1096D6DA5D';
wwv_flow_imp.g_varchar2_table(351) := '90961332BC3429C6C7AA3B77931E8AF59D859D36428573EAF2368F57D8ECF64C5E9AED2F4952C78C9E3278C9E32546FF00644E81096F6B98189CC7A357427828328F4DDC79505A18EAEB5805C2A6C85F5CDD85A989823BA4F2C65171A86F0506B357648C';
wwv_flow_imp.g_varchar2_table(352) := '4E6425B5CC46810993852D947109DAB5367DCD9F7367DCD9F7367DCF1921DC8C54F8A83536BEC918BC884B6BED320421327696C633BD6E11E5DD8C74C8E111250A1226350C54E471A8D9F7367DCD9F7367DCD9F712C76BC8B6A6C82E579615BB8843FB96';
wwv_flow_imp.g_varchar2_table(353) := '58C74E350ED624A0884E82153A9AE341E3278C9E3278C96DA9254B545A1D28D85F5376172AC20EDDCC21FDCB0C63B5FF00212EC50D66BEC918BC8EB307DA83EA5D1888AC55AF2F73256FDAAAAAAB4010914AE9B034A92DD48C4D7A427AA3E6A3C33532E9';
wwv_flow_imp.g_varchar2_table(354) := '4D50ACE6A5253C8964EC9F87B88ABD6769674B84133BCB0ADDDEEC21DADECB18E9C6A1B01210FCE426B591CC8A964F1155E957D10904D419A9F45D19D96A9555A28B5AA8D0BDE2C3351B08944CAD3AC67493A953828CE3AC55B33A95D142E9128CEF52A4';
wwv_flow_imp.g_varchar2_table(355) := '4E810BCA14B631D7038475BFBB1DBABD761155D2D0913428A6BA4EE2C84EC2F50114F5542AAB65D0BDC4B812AF1303B7165282A12B59AEA66ED29A23438AAB2CAE9D5E89FB6AAAAB6D6135E92B5D32D4A1A04D230AC6B134306FC828ADA0C2BC9532A95A';
wwv_flow_imp.g_varchar2_table(356) := '48CC927528705192D6E756D8F447A23D11E8BF522226E95684863AF0A857B6B2C76EAF7610985610BBA6EC2D57EB1B0EFDE4C6A4B47583E283536BEC918BC884B6BED2D49420E56E9D2E388E961688F2EEC65172FC2224AD091317258757FA404D6B3930';
wwv_flow_imp.g_varchar2_table(357) := '30398F46AE13C041947CEA1B5BBEB0418C248F447A23D11E88F447A21197A884644E84F11F8D8260248CA3E350874C5AB562B5B5862B757BB884C2F2C59D3641EABF49D82D42B12D4A121BA1F0506B34F648CDE0425B5B69216258992BC3431A9DB1AD3F';
wwv_flow_imp.g_varchar2_table(358) := '52222A97525A3EAC6D168FB0F6283D9AFB246273212DAFB4CD10826937696C4ED5552D8F447A2301622C4588B01602C05809AA2A5EABFC1E8D1D0960A0CA3D77647679658F43AD3B0B6A9B20B95CDD856CC4C11DD2796328B8D436020FCEE13C810A57D9';
wwv_flow_imp.g_varchar2_table(359) := '80ABD0B561418824B18EBC2A15EFECCA02E8EFD84A2B403ABEA860092862AF2A856B6B0C915E83CA1ACD7D9231791582B5C2301602C4588B113A6EA5F4121725894F6B6D2066F0286CE9A28BA6ECA224EF29909621094F6BED2062F21A8D7D0A958B113C';
wwv_flow_imp.g_varchar2_table(360) := 'AD6FD4BA9157A46D2EC952C2675841DBBBDDC43BDBD863153954272AA4580B015B152D542E579615BB13043FB9658C8E350D80903F3B09CDA1CC84B6B946B55A8602C058461184611846118426D43A08CB12C4A7B5B69172F80D49A7A3E283536AEC9F87';
wwv_flow_imp.g_varchar2_table(361) := 'B886BD6769664A104CCED2C2B777ACC21DAFEEC4A2475E88424A08C2308429B5596FF83D3A384B0104C5E3E20912BC34336772DCA3CBB31945CBF28893BCA63A65A2EE31945C6A1B0107E7618461184611846109A6ABA8BA2131AC21764B962871188EA7';
wwv_flow_imp.g_varchar2_table(362) := 'A2135AE9E244C0E63D7AB86C0412C087746118450D4A774F222B7C343D4E94EC3B3CF0C65173A86B0107B747087368F2DFF0C2308ECBE5921ADAFB4B325082667696C56CEF5B8474BFBB18E9C2A1B01210FCE426B591CCA38A6611EF4F7A7BD3DE9EF4F7';
wwv_flow_imp.g_varchar2_table(363) := 'A7B928A0C5963B571085C2B085F537616AF5A361DDEC98DA2D1F61EC507B35F648C4E6425B5CC46810993B4B656BA429BB23DC9EE4F7251E7253DADB4EEB711DBB9843BDBD8631539542602431F4F441BD2AAD4266769615BBBD6611D2FEEC63A7028A22';
wwv_flow_imp.g_varchar2_table(364) := '8496A7BD3DE9EF4F7A7BD28F39D9EC98F43AD3B09D91C48A96B199D40B4A1DD0C55E451AB1F433DB9EF4F7A7BD1AEB43431AD2D5D1F141ADB4F64DCFE0425B5B698A258476DB3AA6244D6863A0DE0A0F66AEC9189CC84B6B988D0213270A5B1955EB708F';
wwv_flow_imp.g_varchar2_table(365) := '2EEC65172FC2224AD0912D36963DE9EACF567AB3D59EACF5628597502DAA0DA3D5F63B3D931E8AF59D859D364172BCB0ADDC421FDCB2C6471A86C0481F9D84D6B2399152C9E27AB3D59EACF567AB17552C20E66AAFB06D16BFB8D60A0F668EC9199C484B';
wwv_flow_imp.g_varchar2_table(366) := '6B19189CC84B6B988D021327696C65581C228A59FB19EACF567AB3D59EACF5633AE94D012A77ACE88B9212C2265786866CEF5B9479766328C8E511E13264F567AB3D59EAC6C4D50F81B47A3EE777B062D15E91B0BBA6EC2E55841DBB9845179DFAAB3115';
wwv_flow_imp.g_varchar2_table(367) := 'A0E83443FB9658C74E350D809087E72135AC8E6454B2788EA3A018824B18EBC2A15EFECC76EAF7611E88B9BFEDD059F8B3F07D0763E81F7E797C96EC1F7C7D63EF7FE10158FF00467D67E643E99F751FEEFC15647FAB2E6DFB2BADCFBE3E83F1BF647FAA';
wwv_flow_imp.g_varchar2_table(368) := '1D98ADFBC7F88FBA3EA7E1FE9BFC056175FC1FE158FF00447D067F80562D6ECFACFC7FFFDA000C0301000200030000001089F580000D5BDBE0004F56F25BB0BFEB46BF8820004DFCBB20002F6143B762DB6DB5E5D856DB65A97F26CD66E242255B480052';
wwv_flow_imp.g_varchar2_table(369) := 'BDE52DB6DD9BB7B085B6DA12FE20E736D63F4AD7D5614EABBDE5F7B07F146F3B6DB3AC5441A9212D7E956F6B2DB72D5BD61883E6DA92FE2AD3CBB083A4D923EB5ADAB6DB5F59B797E2D927EEA5D781BD9C928E956D2ADEDD851DB6DFAB4A7923736CDDAE';
wwv_flow_imp.g_varchar2_table(370) := '24EC249251EFD694F2D249B4362BF776D66C252732A8EDAD7F150C2975B6DB6DAFB8B79EDB5A56DA3AD5BAA37B0FB3DD2AC2F6DB68DBB05473396DB6C912CDDCADB6A7DC892FD2B13DBB05F0F3674E6D24D8FECD9F8749926C25CFD2B212487922DBB97D';
wwv_flow_imp.g_varchar2_table(371) := '649FC40A85B895CBC2924807D6DAA5FD4924A5A97F1A4924BF94255BD24952ADED4853B8DECADB6DF3C10D6F276DB6B1650E5B6DBFA574FE292D6B76F2E7CE05D107D9CDABB6DB64A379CF12DB6DB0792ED6ADE5FC436DB2AEA5DEDB6C7B0A1D9B913B6D';
wwv_flow_imp.g_varchar2_table(372) := 'ABC42A9FA4EDB68036EEB752B220FAD6DAB36F5B6DA16CDC3D84E776DB6DFC37F662DB6940BFB34A757D6F6FAD03F4ACB6DBC3AF63E20E54AB6DBFB47B37BB6DB0DE71F59756DD977122AA5FCADB6FBD8759C6DE7DE72492ADBB0BC924EF2FA29FFCEDA4';
wwv_flow_imp.g_varchar2_table(373) := 'F8A3BB56F252491EDDB15C53CE957D901F492B682C8497F1462F72490DA1B152E12A9D02EFE20D276D6BF8AB752B6DB7E2DEDE75ABB97612B6D1D66DFB6DA87D9B914617B6DB465EB0A776DB6DF907F5CDCAD7883EED4A7E91B6DA98AFECFB7A7B6D249A';
wwv_flow_imp.g_varchar2_table(374) := 'F641F4C9366F11087F62B6CD1BDB52DD4BE649902054FD24AE5D4DB6C800FED76DB64AB7D8514BB6D9E5FC8566DE3B6D887F6897FDD6F6D6492C0F6EEC924ADBCA477AB64904FE201DA1712490B7B72EF42E88376C2651977167AD0AA5FD924926DB36FE';
wwv_flow_imp.g_varchar2_table(375) := 'CEC9248D5B2CCBB9649241DC42ECDDBDF883E628DCFD236DB47B6D214FD3B6DB1041F47C525B6D1A6EC5EC28E855BD8F7102B3B6DB6A16DD9B892B6DBF30C28E2AF5B6D339FB561072DBAE5FBBBB0AB4DBB6C6F2EBACDB6DDB630AB714B536EDAFEC3ADC';
wwv_flow_imp.g_varchar2_table(376) := '3F8DB42FD29BECD85EDB6B797C94FD256DB5C41A59BB63B6DA76EF8AC65CDB6D8FC6E57CC7857444BF8A317F81F2028DEC579B50E8077610A93B5876DF1BD9EB107F36F2E3A55DDBB0978830F2FEDB6D71EDD8883B6DB2112DB220FA4DB7B7CA37866ED2';
wwv_flow_imp.g_varchar2_table(377) := '9C43D5D8567F1C924CE17F6ADBCE49056F3AF7614369CBF88C41FB55B6E0DED76EC44840000142A3E9652000579769FD9BE8043C41BEC28A5A004F6EC5FB3ACD492443FB053FFEA4928BF8A21FAD6DB5EADEC9777176DA17710C1B5B900005BD996E2550';
wwv_flow_imp.g_varchar2_table(378) := '00047AD5BDBF0A80049D8425B6D80001F7F666DB6DE89426DD841F49D268D666ED6FC41C76D4F6EE2B2492DB69087EB09248E20DA3E2156CDDC3761A312E628DEC64483FB762DB6DB22DD851F4EDB6E710F1468BEC29C7DB8747124CF2FC565851BD9F92';
wwv_flow_imp.g_varchar2_table(379) := '49E45F66EADEC924EBB0A46AC890FD68FE21AD6DA17F10CB66C29FACC9B6FCA7EB375264DB4ECDD71DB6AFB37E4F2D4ADB68743723FB3752FD7B6B2707B54AB6ADADD9EA6EDB6D87BF540EDB6D927ADEDD853F4A3390FE206DB6DAFE5037B7F14FD65248';
wwv_flow_imp.g_varchar2_table(380) := '828FACEDADBF6D9107F66E286D55FA947E356B6FAFC0CBB8DAFB375DB73716BEDB249246BB083FB366C822D9B7945A49241B25FC4648BB0A091F59B69752DB6D55EDD853F5A002F6DC4866E9B6DB5B7D2AEDB7053F40A9FA4DDD2A4925107F6EE25FA492';
wwv_flow_imp.g_varchar2_table(381) := 'D829FBEB5A924912B376A4920FECF5770ED2ADE9B6DA6DF555B655DB6D58FF00E0DB4CEDB6C57FC6DB6DD94DB5B65AB63B1FFFC4002211000301000301010101010003000000000001112131415171611020308191A1FFDA0008010301013F106CD519BC';
wwv_flow_imp.g_varchar2_table(382) := '1327A36D3E467CA136D145145145142768E06B04E31A8CD689B6A1451451426BA3547A470F86B04E848C9C86ACC282C544ED9AC5B81327A36D3E467CA2B68670CA4F448CD2A2D506E99AC2768AD8A28A28A1BA387D3D312A1ABC30A0B152BD28A28A28D6';
wwv_flow_imp.g_varchar2_table(383) := '63058A276CD61AF02E062718D466B45AA0DD335BFDD553C1AC13A12334A8B541BA66B0CE57FAAAB87E9E189D091E0F5516A834C625C9895637598C144AC6A335A70F8374C55848F3F927118D1E8EB09DA381AC13A107CFF8A93255895E8EB0DD2387D31A';
wwv_flow_imp.g_varchar2_table(384) := '25435637C17FBAAA4AC6EB31870FA276CEC469516A8374CD613B45FF00AFA77189D091E0F5516A834C66B09DA1EAA3F4579FDECB13891E0F5516A8347A3AC2768FFE03C50C2A2566B50B541BA66B09DA1EAA26585962768E1F0D609D0919A546AA165899';
wwv_flow_imp.g_varchar2_table(385) := 'B83563C5058A895E9AC3748E06344AB1F85FEBED9A861512B1BA1A522EBF8D393584ED0F55142847847847847847847824E07AA8B541A3D1D613B470F86B04E31231B52C23C23C23C23C23C13883463547A470F86B04E86A86B88993B1BA66B09DA1EAA6';
wwv_flow_imp.g_varchar2_table(386) := '94138478478478269E09B6123C1EAA2D5069C9AC36B9847837118D6254356614162A276CD61BA43C50494AC8F08F08F08F08F08F06E8F14256B35875A84ED1C3E1AC13A2F82F82F82F82F82F81A4D546941A3D1AA3D2387C3C09D0919A545AA0DD31C390';
wwv_flow_imp.g_varchar2_table(387) := 'BE0BE0BE0BE0BE0D6A387C1BA62AC24783D546AA0BDB1D413B43C53582718D46347CA2F82F82F82F830A85AA0D1E8EB09DA387C1AE312F03AC3748E1F4C6895635661058A89DB3586E9112E4BE0BE0BE0BE0BE0A9D0951F9E07AA89970588268FF0086D8';
wwv_flow_imp.g_varchar2_table(388) := '91449849869069048D60D18D51AD387C1BA6520F436C588268281D0DB7FA02C32AE0E5CFE7F5FCAE706E036C588269FC36CE8A94FF0060173873382A7074E63E70E27714BA55D38217287312AF46EB3182C513B66B0D21228937F0D2383514C2FA588269';
wwv_flow_imp.g_varchar2_table(389) := 'FC4F44F44F44F4356614162A276CD61BA42F62D506E99AC24E06F2F625749E89E89E89E89E89E89E89E89E89E89E8C623809DB1561ABC1E2861564F44F44F44F44F44F46B0D2E693D13D13D13D184461512BD1BA3C2387D1572C53D3584ED1C29AC138C6';
wwv_flow_imp.g_varchar2_table(390) := 'A31BE48C2A25637598C12942D5068F47584ED1C3E1E58EB11E93D13D1F47D1F47D092D0956356614162A276C6AE3ECD613B43D54D28C6E8F1FC7D1F47D1F47D1F47D1F47D097212B1BA31870FA7A625425ECFA3E8FA3E8FA1C1C0D0FA3E8FA122D1561AB';
wwv_flow_imp.g_varchar2_table(391) := 'C1E282C544AF475869714FA1AA8D609D0919A545AA0DD33941E2861512B3968D51AD395F0F0C4E32162162A254FA3E8B2CB2CB1E218D12AC6EB318701EAA694138CE842C544AF46DB16596596596596374878A0B1512B1BA1BA42642CB2CB2CA35827424';
wwv_flow_imp.g_varchar2_table(392) := '635C916598C387D3D312A1ABC30A0994B2C4C98919A545AA0DD33584ED0A355F46B0D5E0F10D69C3E0DD3156123C3204A86ACC2826659F81F81F81F81F816374878A18544AC6E8B5048CC09361ABC1E282C5449BE0FC0FC0FC0FC0FC0FC0FC8E1FA276C5';
wwv_flow_imp.g_varchar2_table(393) := '586AF078A0B1512B1A6761F81F81F81F81F809D091E0F5516A8374CB128AC4AF46E86E91C3E98D12A11B7C1F91F91F9099A8C68F47584ED1C0D609C6350276CE0374CD613B43D54D283748E118D12AC6EB3F034D34D34D13B646C78434D282454A3D3478';
wwv_flow_imp.g_varchar2_table(394) := '470FA6358950D58F1434D34D34D11B63AD89D223484ED8936CA6C75288D34D34D347AA8B541A3D1D613B42C0D58F14162A257A6B0DD223488C8C8C8FF84ECE1F0D6313A12334A8B10E3F046C7621A6D511B50A4C813B66B0DD21E286152B1B3550C78274';
wwv_flow_imp.g_varchar2_table(395) := 'F46D1F2339426DAFD18B0AF4AF4AF4AF4AF4AF44AF47586E91C0C689566960CE1907A335C31B3550C6A15E95E95E95E95E95E95E95E90DDBC18B0A4A8CF962631BE0347A3547A470F86B04E848CD2A2D506E99AC2768ADAA8AF4AF4AF4AF7F83F470FA27';
wwv_flow_imp.g_varchar2_table(396) := '6C5586AF078A0B152BD2BD2BD2BD2BD2BD387E985058A89DB3586E90A39138C6A335A701BA625C98958DCB2CB2CB1B3162A276CD61BA428947D9AC27687AA9A5068C6A8B2CB2CB2CB034C12E4C4AB1BACC60B14F46B51C3E0DD3136C2479FCAC4634C66B';
wwv_flow_imp.g_varchar2_table(397) := '09DA1EAA6B06A107FE2A4D2B12B1BA3C2387D31A25437E8B2CB2CB156335874EF437598C38513B676234A8B541BA66B0E9E0D58F14162ACF83E0F83E0F83E06DB30A0B1513B672A3D54D283463546B7F8F83E0F83E0F8123E51AC27687FF00A078A18544';
wwv_flow_imp.g_varchar2_table(398) := 'AC6EB31828947D9AC24E07AA8A143E0F913B470F86B04E312334A8D543E0F8153906AC78A0B1512BD1D61BA4583E0F83E0F83E0F813B43D546A86344AC6E86948BA2B1BA66B09DA1EAA5813B62AC357839868ABC2AF0ABC2AF0ABC217084AB1BAC6B2235';
wwv_flow_imp.g_varchar2_table(399) := '82718D466B45AA09C2AF0ABC2AF0ABC2AF0ABC11728E1F0D609D0D361BA43C50C2A2563742534A09C23C23C23C134F04E848CD2A2D506E99AC39CC23C1B4909DB126C35783C5058A89758D1F455E157855E157855E0D26AA3582718D4635498F14166B35';
wwv_flow_imp.g_varchar2_table(400) := '87D909DA385358731BA3C2387D3D312AFF006036A442F62718919A545AA0DD3358BFE8089AC3C09D091E1A546AA09DB3586AF078A0B15398D4636DACA28A28D2A85AA0D1E9AC2768E510F18930DD1E11C3E98D12A1AB1C4A3FF4055827424669516A83C7';
wwv_flow_imp.g_varchar2_table(401) := 'A46E0FCF03D544CB82C41347FC21F02C544AF47586E91C3E94206830A260937634836C36C58826828768E874A98513081A4ECC2891F62AC24783D545AA0D1E9AC3660B94398F9D399F81448FFD805CE1CCE0A9C1D398F9C1970C4D3F874E8DB28268A094';
wwv_flow_imp.g_varchar2_table(402) := '249B20691CA6144CD1267048CD2A2D506E99AC2768AA696209A1047A47A47A47A35783C5058A89759AC61C35A70F8374C55848F073548F48F48F48F48F487D89C66711C3E98D12AC6ACC2825545AA0D1E8D509DA31AD1252513A12334A8B541BA66B0D39';
wwv_flow_imp.g_varchar2_table(403) := 'A45E917A45E917A3C430A8958DD18C387D17B6349F647A47A47A47A47A3543795766344AB1BACC61C04A20D1E8EB09DA3946F18DD11E91E91E9F47D1F47D0925AC4A86ACC282CA16A8374CD6126A1EAA2D519F47D1F47D1F47D0D3469521E33586E90F14';
wwv_flow_imp.g_varchar2_table(404) := '31A255FF0006A8D69C3E0DD33E8FA13B16A8374CD613B43D54D61F67D1F428D66B0D710F14162A257A36D86BA4CFA3E8FA3E8FA1C68B541BA67283C50C2A256374373109D9C3E1AC138C858858A8953E8FAFF5553C431A25469CE8D613B43D54D2834637';
wwv_flow_imp.g_varchar2_table(405) := 'EBFD554D90B541A63358712ABB13B66B0DD21E28615380DD335877C7F698B91D613B472BE1AC138C6A31AE4BFB58C387D13B62AC35783C50472FFBAAA6E99AC276851EBE8D61BA43C5058A895E89D462742478630950D598504CFF009578578578578578';
wwv_flow_imp.g_varchar2_table(406) := '50DD22C09DA1EAA6B04E31A8C6B922BC2BC2BC2BC2BC2BC1A3D1D613B470F86B0C60B1513B66B0D7117809DA1E295E15E15E15E0D37A35827424669516A8374CA12E4C4AC6E8F08E1F4F4C49B08DBE0AF0AF0AF0AF0AF0D4C4ED0F14D609C6350276C558';
wwv_flow_imp.g_varchar2_table(407) := '6AF078A0B151EAA6941BA470FA6344AB1AB2BC2B2B2B2B2B2B13B63C53582718919A545AA1A5656565656567A387C3582742464E43AD98C47084ED893639C351A69A689B4C48C7AA8B541A633584ED0AA0D58F14162A257A3AC784702B2B2B2B2B2B381A';
wwv_flow_imp.g_varchar2_table(408) := 'C138C48CD2A2C43C2385F44ED8936CD33C13909759AC374878A18D2B1B3550C7827BA343E46728A684EE313A12334A8B541BA66B15DBD147833843648672C4D9F2361BA62AC24783D545AA09B5C1FB1FB1FB1FB1FB1FB0DA547E87E87E87E826383D63C5';
wwv_flow_imp.g_varchar2_table(409) := '0C2A256374630583F63F63F63F63F63F62B6B065886C909A56333E46EDE0DDD09D0919A545AA0DD3358FD8FD8FD8FD8FD8FD8E1FA614162A276CD61BA4248B468C6A335A70F8374CD62CD2A2D5069C9AC27687AA8D5058A25E4D61BA470A1809381EAA2D';
wwv_flow_imp.g_varchar2_table(410) := '5068F469B1659659659C078C6870B2CB2904ED9AC374878A18544AF46E596596589F0634661EF06B0DD21E2861512B35A85AA0D393584ED1659659658AB19AC3A6375985058A89DB1F2235A2C41BA66B09351F27C0BF03D09DA387C35827189198530A0B';
wwv_flow_imp.g_varchar2_table(411) := '1513B66B0DD226068C6A8D6FF1F07C1F07C1F0247CA3584ED16AA7C1F0357C0DD6630E109DB1561ABC2C43E0F83E0F83E08F06A335A276058A89DB3586E90F14212AC7A13B470F828C3E0F83E0F83E0F813B43D546A86344AB1BAC6B222B4374CD613B43';
wwv_flow_imp.g_varchar2_table(412) := 'D54588CBE0BE0BE07133A3C313A12334A8B541E32B0C6ACC282C544ED8AB62AE51C3E09CC65F05F05F05F05F05F02768E06B04E31C3E0BE06494461512B1BA3188E1F4F4C6CE8BE0BE0BE0BE0BE0694A85AA0DD3358DBA630E144ED9AC3578359FA78626';
wwv_flow_imp.g_varchar2_table(413) := 'D8BE0BE0BE0BE0BE0BE0693551A504E31A8C6A931E282F6CD61F813B43D54D609C7FE41347448F07AA8B541A3D1D613B45A31A2558DD6630E077A6B7FB0226B0D609D0919A5486A31763586B8878A0B1512BD1B6C37C3FD02370374CD613B43D547E84AB';
wwv_flow_imp.g_varchar2_table(414) := 'D1BA31870FA7A653091E15B9FF004049B109C63519AD16A83C7191B83F3C0F5513A384A287C93D0D3693D13D13D13D13D18399DE1CC7C29C1D391E4FC7F2B5E9C8E0A1895912D123EC9E868EC896891F0C4E848F07AA8B541BA66B1C305CA1CC7CE9CCFC';
wwv_flow_imp.g_varchar2_table(415) := '13A247D8937635E868BB225A247D8EB09DA3946B04E31A8C86851D93D0E9DA3C4A285C89329448FB27A1A3B225A247D8999448CD2A2D506E99AC276849379384A28EC9E88F48F4FC31BA6345D91E91E91E891F637487886344AB1BACC609112A94698CD6';
wwv_flow_imp.g_varchar2_table(416) := '13B43C535827199C470FA6344A86ACC2825416A8347A3AC2768C4D12525138C6A334A8B541BA66B10960B1513B66B0DD21E284B46B04E848CD2A28D4647A47A47A47A47A47A34D86F2AECC6895637598C162A2580D319AC276878A279191E91E91E91E96';
wwv_flow_imp.g_varchar2_table(417) := '59AC276891FE3C8A276CD61BA43C50C2A256236C4CBB17B387C3582718919A5486A31D61BA47031A2559C869B1E91C3E0DD3FE685EC5AA0DD33584ED0F5535A1AB30A0B1513B66B0E1E0918F5516A834C65965965963647286E99E078A18D12AC6EB1B98';
wwv_flow_imp.g_varchar2_table(418) := '84ECE1F0D609C63F0596597FC9B2E4E1F0D609C637EBF927EC6ACC282C513B66B0DD22B0BFB4CE189D0919A545AA0DD3358716A13B66B0DD21E28615380DD31561BF5FDA62E4D613B43D54D609C63519812AC6EB3182C544ED89F06347A3AC3AD5FEEAA9';
wwv_flow_imp.g_varchar2_table(419) := 'BA66B09DA147ACD61BA43C50C2A25627504E848C6B92FF005554635C627424669516A85783C431A2558DD6630E109D8D374578578578236A8B541A726B09DA1E29AC30A0B1513B66B0DD22849C0F14AF0AF0AF0AF069B46B04E848CD2A2D506E98F10C2A';
wwv_flow_imp.g_varchar2_table(420) := '25637598C1629AD3811919191919195A627687AA9A5068C6A04ED9AC35E078A0B151EAA2D50AF08C8C8C8C8C4C9891E0F5516A8347A6B1DF83586E90F1430A8958DD0D311595959589AE8EB09DA387C3582718919390DD663058A89DB358C63515959595';
wwv_flow_imp.g_varchar2_table(421) := '899312334A8B541BA66B09DA240DD21E2861512BD1D6306A6565656565650F14D609C63519AD16218C387D13B62AC35785581A6995959595959598516A8347A3542768E1F0D609D0919A545AA0DD3358672BFCD5263E46ACC282C544ED9AC3748B117FD2';
wwv_flow_imp.g_varchar2_table(422) := 'AAAAA4C707AC78A18D12B1BACC60B17FDD55260DB10D92134AC4C7C8DDBC1BBA13A12334A8B541BA66B09DA1EAA6941A31AA35A266B062C292AC63E4A3C1B7050B5909563546B51C3E1E195B1669516A8374CD613B43C51FA28B2CB1BC31A2558DD66305';
wwv_flow_imp.g_varchar2_table(423) := '8A89DB3587188A28A28A2CB2CB2CC2A276CD61BA43C50C2A25637437C114514514589793586E90F10C68959AD42D506E99AC2768B13E0C4E31A8CD69C3E0DD31561D31AB30A0B1513B6375D1AB1AC9DA1BA62AC24787E911E093883AC2768E06B04E31A8';
wwv_flow_imp.g_varchar2_table(424) := 'C6D4B08F08F064FA3586E90F1430A8956375981C213B6478478478478478478478478478326F81BACC60B1513B66B0D710F1430A89591E11E11E11E11E11E0E94162A276CD61BA43C50C2AC7584ED1C050A11E11E1A0B541BA66B09350F551AA18D12AC6';
wwv_flow_imp.g_varchar2_table(425) := 'EB3185556634AA27687AA892465F05F05F03899D1AC627424669516A8374C70E42F82162162A276CD61BA43C50C2A256374630892D2F82F82F82F82F82F82F82F821288C2A25637598C387D13B62AC35783C50494ACBE0BE0BE0BE0BE0BE06EB3182C544';
wwv_flow_imp.g_varchar2_table(426) := 'ED9AC37486B3F4D609D17C17C17C09F03584ED0F5534A0D18D50D5263C50C2A2563758DD21E28258138FFC8268E891E0F5516A834C66B09DA31AAC50AA12AC6EB3182C544ED9AC35C43C5058A895E8DD0D27FB012E46B0DD21E2861512B1BA3188E1F44E';
wwv_flow_imp.g_varchar2_table(427) := 'D8950D59139FF404D35095637598C385F44ED8CD848F06DB9FF20E3551AC138C6A335A701F631A6C374878A09DE8923E471BB47FA1D3B49E89E89E89E89E88BB1CE1C3C398F83349D390DD21E2861512B1BACC61C3E89DB1561ABC1E282C54A0FD068BB2';
wwv_flow_imp.g_varchar2_table(428) := '25A247D93D109CA34929451D8923E4693EC75D9C2514D26257A3743748E1F4C68950D176473487D891F64F4345D8F307A16BD391C121633469464F44F44F44F44F422B8C78F3F9E74791369E0893C2A95F2248F91A4FB1B5D33E8FA3E8FA23D23D23D23D';
wwv_flow_imp.g_varchar2_table(429) := '3E86E91C3E98D12AC6ACC282C544ED9AC374878A18544AC6ABE46E91C3E9E98950D59841EAA2D5069C9AC27684F2B12ACFA3E8FA3E8FA3E878A2162A257A6B0DD21AFF00C870F86B04E312334A8A35188B8A6B09DA1EAA6941A3D1AA1A4F48F48F48F48F';
wwv_flow_imp.g_varchar2_table(430) := '490276CD61BA43C50C2A2563747D1F47D16596596596592289DB3586E90F10C6895637598C16289DB3586BC152162F43AC3748E1F449A2C41A3D1D613B470F868374878A0999659659658D5985058A89744EB8C4E848CD2A2D506E996588E534A0D18D46';
wwv_flow_imp.g_varchar2_table(431) := '6B4E1F06E99659627EC6EB3187013B62AC35783C5058A89365967E47E47E47E47E47E47E427EC6ACC282C544ED9AC374878A18544AC6E8C61C3E8BD8D87E47E425158979358C39D0D51AD387C3C313A1C4CEC4ED9AC35E0FC8FC8FC8FC8FC8FC84B9312A';
wwv_flow_imp.g_varchar2_table(432) := 'C6AC6F8091E0F5516A834E4D61D6A3F23F2107C0946B4588374CD6127035151F91F90F10C2A256374630E1F44ED8AB0D5E0F141333F2232323232323231E286344AB1BACC60B1513B66B0DD21E2861512B1BA29622323232330A0B14D69C3E0DD3156123';
wwv_flow_imp.g_varchar2_table(433) := 'C2721BA31870FA276CAD9191919191918F10C68F5516A8347A3542768E04646464646D41BA66B09DA1EAA6941A31A6989DB3586E90F14162A257A37478470FA7A625435784657A57A57A57A57A57A33E5B3586E90F10C2A2558DD6630E0276C5586AF078';
wwv_flow_imp.g_varchar2_table(434) := 'A0B152BD2BD2BD2BD2BD12AC6E06E99AC24D43D545AA0F1430A895E8DD0DD23815E95E95E95E95E95E9AD98C3463546B4E1F06E99A995E95E95E95E9427687AA9A504E31A8CD689B6A21FA387D13B62AC35783C5058A895E8F43748E17D31A57A2E3FEAF';
wwv_flow_imp.g_varchar2_table(435) := '93AFF3DC5C9C99C17FAE0FFB731F0383392398E085CBFB7338FF00BE48E4CEA2E473FF008703B8B9393382172FF85D05CBFC53E1FCFFC400261100030002020201050101010100000000000111213141615171108191A1C1F020B130D1FFDA0008010201';
wwv_flow_imp.g_varchar2_table(436) := '013F10521AD8B5A0C608446851B643A130CEA3A8EA3A8EA3A86EE067B702D5C316381340D193350854D619D4751D4751D4267909A2799707DA62CC38111499367D84993358F570877A6D98271F986161088B051D21E830C5AC1686A6093266FC0F405955';
wwv_flow_imp.g_varchar2_table(437) := 'B4609DEDB4445AD9D0741D0740D3987DC1F690F70E46D1499337E07A43A8EA3A8EA3A8EA125A19BA1EAE10CF4DB1C292AF6C77BA09A068C99AC7BB862BD368C1759D6759D6759D6258B862CC381114993351E818ADAAB68C13D86B28EB3ACEB3ACEB12D5';
wwv_flow_imp.g_varchar2_table(438) := 'A62CC381A45267666FC0F405955B43C2841813619BA15BC5C0DB078E87BB8623D381A45651ECEB1A355A2CAAD89A27E5C0B570C58E0512ED1D6759D637411258D89225B9727DA43DC064526448F4759D6759D6759D64981096E43D5C21B872730CC3D031';
wwv_flow_imp.g_varchar2_table(439) := '5B556D1827723DA23823CB23CB23CB23CB23CB19818D22B2CECCDF81E80B2AB685099EDB42D5C3F891E591E591E591E591E58D5AD9651ECFD01FB02CAAD89A277B7025F5C5E8233093064A1EEE18AF4DA304E6A3DA3D00D5BA47964F91E65C1F698B30E0';
wwv_flow_imp.g_varchar2_table(440) := '445264CC14AB823CB23CB1296B20C9FA0F80928B6C4912BDB6C5BB843D7036816196C8F2C8F2C8F2C8F2C8F2C489D33093022266A9C9132CAADA14267B6D0B570CABA9CFF724925947BF80FD816556C4D1372E05AB862C702049918B27CC962C5869BE44';
wwv_flow_imp.g_varchar2_table(441) := '981913CCB83ED31661C08890BD492AF6CCBC02B6AADA304EE47B42D5C33340842C58B0DD960D22B2CECCDF87C05955B42848D537A2C31E4EA43DC39191499330F40862516D98257B6D8B770866DC7FE324920066F030484A6C33DB816AE18B301114F327';
wwv_flow_imp.g_varchar2_table(442) := '993CC9E64F327989A40CC24C09A2799707DA62CC38111499330F40C63556D1154C9E64F327993CC6DC519ACB83ED31261C0D22B2CECC9F80A49C067236CC0F033DB685AB8662E44D036C12B0993CC9E64F33B4B7A3F605955B1344FCB838B8623580CAB0';
wwv_flow_imp.g_varchar2_table(443) := 'F6248979722DDC21EE036A24C99AC7A3843B916D98256957B626CF027993CC9E64F32798DAA51B45CD3D8B570C6158D8EE045470FA0444C1966069F036AAB826CAC426EA0D88C9303227991F6989C381D3B161C082286C60626869D4704914C08590FA0F';
wwv_flow_imp.g_varchar2_table(444) := 'A0FA0FA0FA0C222A9514E53474FA9AAF244C8AE4486E41D2E045307D02226076BE4FA0FA0FA0FA0FA0C2AC1C992B637CD1AE6C8D856648FD0E1745542221B3BB34DF891804D866EC7AB8433D36C70BC319660C9385E822AA09ADAC19FD0F23022983E8FF';
wwv_flow_imp.g_varchar2_table(445) := '002925264CC3D021E28B6CC162AF93707BB8623D36870ACA3DA291C220E259FF00692497F267F267F267F2634F1F929E63D5C21F872368A4ABD9FA019B47FB4924B05C268FE4CFE4CFE4CFE4CB7A330931B1244B72E4FB4867A08C94D04D13BDB685AB86';
wwv_flow_imp.g_varchar2_table(446) := '62E44D036C212F8D19A0930212DC86D47C193F22CAAD89A27E5C1F69949A6B624893F3F24BD19E8CF467A319E2506293266A1EAE10EF4DB1486B8304EDA8F68F40CA64D6C444B72E4DA247A33D19E8CF467A33D195E195E195E18D9F024C08896E5C9F69';
wwv_flow_imp.g_varchar2_table(447) := '0F70E46D139329D3D19E8CF467A33D189C05AB8662E4CB86578657863702D8DA292AF67E80FD812516C491332DA792BC321A44C598088A4C99A87BB862B956D098EC7A0466FCBE038D6C644F32E0FB4C59870222AC9F0081E8CF47FEAAA5BB846681B409';
wwv_flow_imp.g_varchar2_table(448) := 'B0CDD8F57085AFC99A45D05BD1FB024A2D892FFC6AAAA6A24ABDBF80CDF91258D89225B9723579E97FAAA931C1661C088A4C8AB5F34B72E4FB487B872368A4C99BF010E9AF9A490D819BF03D00E6AADA304EF6DA11B472368A4ABDB21DBE078E87BB862F';
wwv_flow_imp.g_varchar2_table(449) := '0E06915947B1A69C8C8A4C99A86873E2ED3B4ED3B4ED1AF915CAF6C5B384661260444A6D8932657F34368A4B3B327E1F00D363B4ED3B4ED3B4ED3B4BAB487E1C8DA292AF67E80FD81008A53B4ED3B4ED3B4445267666FC0F405955B429EC6D3C6892C6C4';
wwv_flow_imp.g_varchar2_table(450) := '912DCB93ED21EE1C88255B3B4ED3B46A832CAAD89A267B702D5C316381340CDF3C7FD1AE1C935698AF4DA1C2B28F68F406608F6E45BB843D7036820C9DBF0A28A28A31C4F7F052956F2C4D51C0E982D2C1864E8B72E4FB487B8723229322557C28A28A28';
wwv_flow_imp.g_varchar2_table(451) := '52583901D3CB92AE8429E0F63C01299791935145145142A3F407EC0B2AB62689DEDC0DD3F0C933B3F41F012516D892247B6D9564D228A28A1DA87D81F698B30E0445264CC3D2336BCCA2C71F032870C749C129862C0BEE3B4A2DB304AF6F6C5BB8466822';
wwv_flow_imp.g_varchar2_table(452) := '1487C9320616108AC2E6C8741AC316F24741D0741D0741D04945B12448F6E45BB843D70368259790A95235887146B284AA21E28C1D2741D0741D0741D04AA6BD082CA2E40E425A14C25963B8D093FF00B12604D13CCB83ED31661C088A4C9987A062B6AA';
wwv_flow_imp.g_varchar2_table(453) := 'DA304EE47B4425AD9D0741D0740D79823EA3ED21B872368A4B3B3F41F01D0741D0741D07418E8666A1EAE10EF4B6CC12B4ABDB1B75D048C0DB078E87BB862BD38194A126052CFF00AAA93151E80928B6CC12BDB6CA68E0C13B6A3DA3D019BF224C0CBFDD';
wwv_flow_imp.g_varchar2_table(454) := 'D552AAD14556D1829C8DA048C99AC7AB84362391E65C1F698B30E069159676758D26AB45955B4284CF6DA16AE199A7E29758759D6758D9024C08896E5C9F690F70E4644965DBFD55484A304A639426C33763D5C21DE9B62DC3358F770C57B5B46094B724';
wwv_flow_imp.g_varchar2_table(455) := '41F00CE03D99ECCF667B33D99ECC4219A87AB843BD2DB1A2E82D5C33341260644F321A5A99ECCF667B33D99ECC6E954D8A13BDB68497BC5BB8466924C09B85B90EDD701A45651ED7C0356E9ECC6AF963F2E0FB4C598085264CD44AB867B33D9884B59067';
wwv_flow_imp.g_varchar2_table(456) := '7F01FB024A2D89225E5C8D7A11ECCF667B33D99ECCF663BD3DA168E18B1A2F5049811133C9C8D262B6AADA304EF4F685AB86455F03F0E46D14957B16D4E2FF0052491BB0C3681361B2E7462E04D036C31763DDC32995FEE4924765B67DA62CC044485EA2';
wwv_flow_imp.g_varchar2_table(457) := 'B4ABDB3D02330930222669C7CE8CC20FF124D82888A4C9987A062D556D18256C37AF8893C8EA43DC391B45259D993F0F80928B6C48513FF524913706D98B91340DB04A63D00EDE0609094D867B702D5C3163921FFC08896E5C9F690F70E46453C89E489E';
wwv_flow_imp.g_varchar2_table(458) := '489E489E489E484CDD1C4FA88C04993350F670C57B5B460924E49E489E489E489E489E48A120B30E0445264CDF80A49C07E1B6368A4ABDBF80FD81ACE4604951327913C89E44F32DA8FD816556D09A27E5B42D5C311AC0655BD89225B9727DA43DC39191';
wwv_flow_imp.g_varchar2_table(459) := '499126413C913C913C913C913C90DAAB1114993350F670CB2AB624568E7762D5C3185634EEC115217C06A747EC0928B624895EDC8B7708E017C44D5233C835CA8695609AAA422DC6C454845A823C7076A34285209BA4D99E413568BE226A909EE436C869';
wwv_flow_imp.g_varchar2_table(460) := '15947B3F407EC0B2AB684D1246EECD69E8AD0512C1ADE45E4559725F02F817C0BE05F01A551C992B637CD1AA6C8D856645AAB5C098A0F0D08A89092B6E0D3B4E0DB90D0D17C4455213DC835B4A08AB4499337E07A01CD55B4609DEDB453F0226A08AD17C';
wwv_flow_imp.g_varchar2_table(461) := '3FCC92499D993F0F80928B6C50A11B7C8F1D0F770C5E1C0D22B28F62D2955FEA4923565A13419D6D8B77087B80DA093266A1D3066FC8B2C6C4D13CCB82330AA6356022293266A1ECE18AE55B460B4A6BFC8005BD1984981112DCB93ED219E9C890A2FF00';
wwv_flow_imp.g_varchar2_table(462) := '49248C944783E346691B409B05AE87AB843A5BF25955B1344EF6E05AB865269AD89224EF949E8CF467A33D18CC48645264CC1909EEE18AF4DA1C2B28F6BE011B41E8CF467A33D19E8CF46210CC29AAE45091EDB62DDC2334906073DC413CCB83ED315E9C';
wwv_flow_imp.g_varchar2_table(463) := '1E8CF4641FC02CAADA304EF6DA16AE199A4F467A33D18D782CB1C292AF6FE0327E449636248B2364CF467A33D19E8CF4625B83DDC315E9B4263B0B6708CD0498111643726CF03ED31661C088A9A8FD8081E8CF46779DE779DE778B77087AE0413754B660';
wwv_flow_imp.g_varchar2_table(464) := '9DC8F685AB8666824C0A593BCEF3BCEF3BC4C447A02CAADA14255AB81DC8B6CC12B95ED9E911983FA4C47A703489225363BCEF1E58791344FCB816AE18B1C09A0832242779DE2DC8E2E10FC391B45255ECFD008B4779DE779DE779DE2B6AADA304EE47B4';
wwv_flow_imp.g_varchar2_table(465) := '3AD1C98292AF6CF4066FC8931B1C535C0D22B2CEC75381914993306871B3BCEE3B8EE3B8EE1A3915EDB64ACE877B6D0B570CCD24181B67C13B8EE3B8EE3B8EE2CAAD89A27E5C0B570C58E0CD63D5C21DE9B6385255ED929B7A2CA3DA134F1E8EC3B0EC3B';
wwv_flow_imp.g_varchar2_table(466) := '048B17862CC38111499330F40C56D55B4262D8C9E09302225B9727DA43DC3919128B2F2771DC771DC7718419EDB42D5C333490604DB678FF00A3BD391B45255ECFD07C07E80CDF90BCB93ED21EE03229327710410410418A2DB13070C58E04093266A1EE';
wwv_flow_imp.g_varchar2_table(467) := 'E18EB6410410414E0799707DA62CC38111499367D8220CDD0DA8708E2723429FB8AC41041030A1264C9F87C05955B4284CF6DA1C775618892CEC6406A1258142F37263A91041041040B570C58E04093266B3D2333CB92AE845B0E4684A933B267F61A17D';
wwv_flow_imp.g_varchar2_table(468) := 'C928B6C5091EDB62DDC23349D02B01E28C0D2C213585CD90F30B0C4F40445264CC3D0315B556D18288B0C91650E2AD0B10B08B922115823657917870348ACA3D9FA0F8069B1D2749D2749D2748936C8E93A4E93A44D56882BE45E823309302225B972358';
wwv_flow_imp.g_varchar2_table(469) := 'B84749D2749D2749D252AB029AAD0B518434D2215684964518FF002111499330F40C5AAADA1345D2749D2749D27491743330F40876945B66095EDED8DBBC09303227991F698BC381A4BF166FC3E02CAADA1344CF6DA16AE18B1A396344945B624895EDB6';
wwv_flow_imp.g_varchar2_table(470) := '2DDC23825947B5F0193F22CB1B135FEEAAA97782CAA1B557F8AA5CAE077A6D98256957B67A0330930252FF005553D2F887786D98257B7B62D9C23348F182DEBE02CAADA1344CF6DAFF006555150D22531CA20C99A87AB843BD36C4B90C5D8F770C57A6D0';
wwv_flow_imp.g_varchar2_table(471) := 'E15947B461A6CF663369E44D134CB83ED316602229322A76330F40876945B66095EDED8DB0E8930322799703CAA70AF2CAF2CAF2CAF2CAF2C6A553304EF6DA308B867B33D9926D89B0CDD0F570877A72368A4ABD895E45796579657965796579637986CD';
wwv_flow_imp.g_varchar2_table(472) := '818BB1A5DA1EAE10EF4B6CC12B4ABDB3D0229B9B21344F32E0FB4CABA57965796579657965796579639A8F68F40C58D17A820C09B0679391A3D8AE55B4609DB51ED1E818D6EA73FC249279B91661C0D2293266FC0F40418255A24C99AC7AB843BD36C73A';
wwv_flow_imp.g_varchar2_table(473) := '076B21EEE194CAD9FC91FC91FC91FC91FC91FC90ECA7B16AE18B1C09A08B7F095B56EC3309302225B9727DA433787225A8BF03F923F923F923F923F9219A60F670C572ADA3050934F833743D5C21DE9C8DA292AF6C8570C59870348BF923F923F923F923';
wwv_flow_imp.g_varchar2_table(474) := 'F923F9213818CD24981B6094C7A043B780D224C9B0EF6DA16AE199A48307D07D07D07D0228E1651ECFD01FB02CAAD89A26E5C11975FB3348DA04D82D743D5C21E35366092E87D07D07D07D07D041C0B30E0445264CC2DAAE46FAC385255EDFC066FC892C';
wwv_flow_imp.g_varchar2_table(475) := '6C49123BEC7D07D07D07D07D03E90B2AB68C13BDB685AB867FF610C0444B72E4FB487B8722A525947B161687D07D07D07D07D0379989A06D866B1EEE18E6AAD8A8AD1CEECF40C6158D6A114859CA1B50BE25F12F897C4BE2270C1CDC8F2B23B183A5A314';
wwv_flow_imp.g_varchar2_table(476) := '6B6455334DBD9BC8D52E0A5808A219B37B2B92E477904D5A3A44D5213DC86C10D22933B337E07A02CAADA1424CBBB3254F433580B0B06B79165A9784357035AAD09AAC13F48CF2093284D13BDB816AE18B1C09A068C89CF308A41B8C2229052DB83B69C1';
wwv_flow_imp.g_varchar2_table(477) := '9D80D4AB47489AA427B906B720D6AB44866A3D2315CAB68C13B91ED0D4F1A26A1168E92C58C368572ADA133552FF001246C956857B6D8B7708CDC8DA04D866EC76E12A914B0445955B4284EF6DA16AE199A448C1956D9F690F70E4645264CD43A61FD816';
wwv_flow_imp.g_varchar2_table(478) := '556C4D133DB832F858632E026824C99AC7BB862BD368C15367B23D012516D98257B6D8B7708AA3E459870222932660D380B162C58B16134A23C9C0F5C0DA083266B1EAE10C96FC96556D0A13BDB685AB86234E0B162C588F0C8F0CC133DB68BE86478647';
wwv_flow_imp.g_varchar2_table(479) := '8647865A9C0ED28B6CC12BDBDB16EE119A0D40A4918D5A8D32CA3E05AB862C702049933596D572248939722DDC233703681CF71913CCB83ED315AC08F0C8F0CC83D0315B556D1827723DA16AE195845D8660F47087722DB304ADAED90193F0F80B2AB689';
wwv_flow_imp.g_varchar2_table(480) := 'F04786478647864786478625A0F770C47A6D098AE45BB8466920C09B04C9B9391C0B570C598080B0CA23C323C323C323C33BCD2316AE18B301094B3B3BC72C1264CD63D5C219E96D98256957B65ADBD1DE7796246222932661E818ADAAB68C12AD5C0E4A';
wwv_flow_imp.g_varchar2_table(481) := '2DB3048F6DB16EE119A4FB4C5E1C0D224A5363BCEF1E553CA1344EF6DA16AE199A44D036C33FCE06D04193358F570867A6D8D264D68B2AB6268920EF3BCEF3BCEF3BC57B5B4609DB51ED0EB4726095A55ED9E911984981C5270222932246A3BCEF3BCEF3';
wwv_flow_imp.g_varchar2_table(482) := 'BCEC1661C088A4C9987A06770B7708CD236813619BA1EAE11053C892A26771DC770A4E3E02CAADA14267B6D0B570CC5C99AC7AB843BD2DB304AD2AF6C94DF05947B42775A3B8EE3B8EE12453C3166022293266B1EEE18AF6B686EA23349260425B90D62E';
wwv_flow_imp.g_varchar2_table(483) := '10F32E0FB4CEE3B8EE3B8EE3B86920EF4F685AB8666924C09D2E867A6D8E14957B7F01FB03F41F01DC771DC771DC770D8B45947B3F41F016556D09A2E31C982572BDB16EE119A0930222540E83A0E83A04CF21344D32E0FB4C598088A4C9B7EC11643374';
wwv_flow_imp.g_varchar2_table(484) := '3D1C21F872368A3CBF51C7B3A0E83A0E81A5093266FC0F40C56D55B4609DE9ED169F8162AF6CF408CC24C088A3F6FD1843A0E83A0E83A0EA16AE198B81340DB0C5D8F770C5B91F690FC391B45255EC8F17D04253A0E83A0E83A0E833D193F22CB1B1344F';
wwv_flow_imp.g_varchar2_table(485) := '32E0FB4C59870222932663E8188E55B4609EC3594759D6759D62EB3E2B317A3843622DB3048D2AF6C8A8F48EB3ACEB3ACEB3ACEB3ACEB3ACEB1A556892BE45B384663260405AE86B1708EB3ACEB3ACEB3AC6955A1C55A162161152442EB049644A63FC84';
wwv_flow_imp.g_varchar2_table(486) := '45264CD63DDC315CAB68C13623DA343C998C9819134CB812B7A658730374242CA259634AB44D5A2AF0C16D170322799707DA62CC381A4A4F9337E07A016AAB68C13BDB685AB87F30820810EB8466E06D02464CD63D5C219E9B66095AAC47964796479647';
wwv_flow_imp.g_varchar2_table(487) := '96479647964104104B95C0EE45B66095CAF6CF408CD04981116C88F2C8F2C8F2C8F2C8F2C924A2DB14247B6D8B7708CD2385359E80B2AB68C13BDB6881D6093036C1E3A1EEE188F4E069129EE893266A1E8E10EE45B6224889323178189C381A45651ECC';
wwv_flow_imp.g_varchar2_table(488) := '34CB0CDDC89A26E5C0B570CC5C09A068C8C4F22C5856B09E4C12BDB6C5BB8466924C080B5D8F570877A5B658B162C58B162C5856969B03350F570867A6D8E14957B67A0337E4498F8962C58B1622EB74F48876945B66095CAF6C5BB8453696C84D13BDB8';
wwv_flow_imp.g_varchar2_table(489) := '16AE1957532C5793358F770C57A6D182B28F68F402A485EA06D026C3350F4E243D7042918D47B47A01B6A6769DA76959B91661C088A4C99A8F40C63556D1154C9E623790F470877A5B66095A55ED9E8119A49302225B97236C9C09E64F327993CC9E6769';
wwv_flow_imp.g_varchar2_table(490) := 'DA768AE8DE8CD04981016E47170867A72368A4ABD9FA018C13CC9E64F327993CC9E64066B1EAE10EF4DB305255ED90E8C59870222ED3B4ED36EE8C13B91ED0BD0666824C0C8929A7B16CE119A493049057B6D8B7708CCAFA9060FA0FA0FA0FA0451C2CB3';
wwv_flow_imp.g_varchar2_table(491) := 'B327E1F016556D0A13BDB68784B91DBA1B409B0CDD8F570867A6D8DA292AF6FE0330931B12449B2AA1F41F41F41F41F41F40DAF9304B157B67A04661260444972E4FB487B872368A4CEC595A1F41F41F41F41F40D6264981360B5D0F57086E1C8A949267';
wwv_flow_imp.g_varchar2_table(492) := '62C25A3E83E83E83E82A0F933490606D83C763DDC31CD55B13A56858ABDB3D02184633A890C88BF2116D5B2290FE4CFE4CFE4CFE4CFE4C4F80D6F23556476C60E968C51AD88B611CAF6C5BB8466824C080B721EAE10CF4E46D14957B3F41F01389EAAFC8';
wwv_flow_imp.g_varchar2_table(493) := '4CD0C90346C7F26262B3F2333C0A96067512134517E47847310D616A224B1B1244B72E4FB487B8723224E552FC898E0687186A558FECC4CD04D8B82E0669A08924336DBD992A65B41FC99FC99FC99FC99FC98CD9232C8D5AE0D60611AD889E4336948F05';
wwv_flow_imp.g_varchar2_table(494) := '94867512134517E42E4A2BC32BC32BC32BC32FC32FC32FC32FC31C65A6272E45BB843DC06093266A1EAE10EF4B6CC12B4ABDB3D02330930412315D6C7DA43DC391914991D3864FC3E02CAADA14277B6D0DB0E98842BC32BC32BC32BC32BC32BC311D1F01';
wwv_flow_imp.g_varchar2_table(495) := '2516D892257B7226BD62D5C31660204993358ED12D8E7949D4609DB51ED1E8199BF224C0C8999152FC32FC32FC32FC32E0E10EF4DB305255ED9E8119849811165C32BC32BC3FF55549248DD45A24A2DB14257B6D8B7708CD06804D866EC7AB8433D36C6D';
wwv_flow_imp.g_varchar2_table(496) := '14957B62574FE274A6C24892E5C9F690D5A5E44B8D16556C4D13F2E0FB4CE08AD2AF6CF4086A73FD554D7824C9987A044145B6409AE0445264CC3D0315B556D7CD2942D33349260627991F698BC38F8A491ACC09B05AEC7AB8433D391B45255EDFC066FC';
wwv_flow_imp.g_varchar2_table(497) := '846DF35DE779DE779DE779DE396093266A3D021DA516D982572BDB16EE119A09302225B91F69125D84B5133B4EF1B4D168928B6C5093A790C89E65C1F698B30E0444CDE3E067A6D8DA292AF6CED3BCEF3BCEF3BC411914991646FA1651ECFD07C05955B4';
wwv_flow_imp.g_varchar2_table(498) := '26893D03BCEF176C5162EC7BB8623D36870ACA3DA134D1E8EF3BCF488CC24C08896E5C9F690DC391B45255ECFD00D4E36779451451451D8294E10F5C0DA083266B1EAE10CF4DB304AD2AF6CF406612604913A797251451D8661E907990F770C47A70348A';
wwv_flow_imp.g_varchar2_table(499) := 'CA3D95DFD82225B9727DA43DC39220A28A28A3B05BB846693D0193F22CB1B1344F32E0FB4CEC28A286D51698AE55B4609EA8F68F40CCC24C0D2A3A78D998292AF6CF4066FC8931B12448DE5C9F690F70E4645259D94751D4751D4751D428A2596609796D';
wwv_flow_imp.g_varchar2_table(500) := '8B6708CD04181102D763D5C219E9C8DA292AF67E80FD81D4751D4751D5F009364DF22BD36870ACA3DAF80CDF91E80CDF91263624896E5C9F691D4751D4751D4750DA423CBF524C0C89E65C1F698B30E0C21D4751D4750D8B43BDB685AB8666924C0DB0C5';
wwv_flow_imp.g_varchar2_table(501) := 'D140F4C407AB84370E46D14957B3F407EC092C6C4912DCB93ED21EE0740F7FEDFC2FF1A2357ECFD4E3ECD86937FF00AD46FF00916C6DEC6C35FCC5BC5AFF00C4371A8DBD87A7C4C5FECE3ECD869F81A0DBF08E47F08E7F037FCAB6F8FFC4002810010002';
wwv_flow_imp.g_varchar2_table(502) := '01030304030101010100000000010011213141516181F17191D1F0A1B1E1C1201030FFDA0008010100013F10063AB0941A9DE25663AF4ADEB923CBE148D76ED09BD917A9318134DA7C466ACEB15B5EF3C5678ACF159E2B3C5678AC674ECAB089063AF1DF';
wwv_flow_imp.g_varchar2_table(503) := 'B0CCCD0F7F927784B5B803EB8943CD82ECECC3D816DD9DC88DAF5AEFFCCD20BA8F03DE78ACF159E2B3C5678AC4590D2064DA58D30F40EE4B1F7AA7B2C3A06B3EBBC356F013BBEDACA26801ECECCC6D16339DE0C91464705D3B3075876CDDDE217C60BB72';
wwv_flow_imp.g_varchar2_table(504) := 'EF314E50FC0102D65A3C3762E3631CF98E43B23589A57A465B55197E204BA4A1515B932A39436DA3191D8962BFBC6285588ADC978CDC608ECC4612EABAFF006275E6D9E373B4C7715F49DA35E83D7E4EF15EABCE38F112D65B3C36619B2201E42780CF01';
wwv_flow_imp.g_varchar2_table(505) := '9E033C0619505AD66648D115C1EF1D0D5BB7F1883EB5877597AC0416EEC4465B6F59FC81398E278DDEF315CD7D6E23C7678ACF159E2B3C5678AC6AD7940441D5A576FEE628CA7E90ED2DA53D1F719760AAC1CCD768F4F83B4C798EA6CDE50F3345D9D987';
wwv_flow_imp.g_varchar2_table(506) := 'A01B6ECEF11B5EB5DF8F698A309FA06246CB4386E42BA830D33A6F77CCE9BDDF33A6F77CCE9BDDF33A6F77CCE9BDDF30485723EB7055BC04EEFCCA26801ECECCBD28B1DCC6A5C333BF0ED311C53D37680CB2FA86E779EABD978822EED567875DE74DEEF9';
wwv_flow_imp.g_varchar2_table(507) := '9D37BBE674DEEF99D37BBE679C7E6133A2ABC7F5943EF40774943C0D2D9D988834DEB3FB12F33CCF1B9DA63B8AFA4ED005967AFD3BC14681B4D8D4F5BC43D41517776250F316DDDDD84B53807EB994A956F2D876963CCDB7677232D6E49FAE262687AFC1';
wwv_flow_imp.g_varchar2_table(508) := '7BC18D79EBDC25346EE703B31D6A3575E7BC57E66689A51BAE20D6A3775E3BCB6A5D4E07720CEBC77EC333343DF0DD3BC25ADC01F5C44A51A7AAD98492190E06BBCF2CCF2CCF2CC0CC31CB8363BC413CD575E7B4A0BA8723BB286D650F609D41E8FAED1C';
wwv_flow_imp.g_varchar2_table(509) := 'DACACEEFBE92E9A003BBB1332AEC773114A642986FDE74DEEF99D37BBE674DEEF99D37BBE674DEEF99D37BBE668E2E8DBBB4A8E6053BBBB0CCAC21ECFBEB3035BDF0E1ED0265615F7194DB0F16FB2352E199DF87698CE28E9BB406597D4373BCF55ECBC4';
wwv_flow_imp.g_varchar2_table(510) := '4832FA86CF7942A72ADA03B4F359E6B3CD679ACF35845D2B5D37250F034B6766220D37ACFEC4EB4DB3C6E7698CE2BE9711AED1EBF2779764BAC9C4B696B6786CCCDD09FB03BCA9716388BFC40C989623CCF239E4F395FBE796C50978B10638D46AE7AF79';
wwv_flow_imp.g_varchar2_table(511) := 'D487FDA3A54974DA052E5BBAF1DE5F52E8703B90675E3BF6186D4349E06DDE6739B3AEEF0D4B96636E1DE5484683732CA0F69BAFE6629C21F80624ACB4386E415AEF19E3C4D7A0F5787BCCF717F49DE1934CA57B7ACF2D89921D45C41F7AC7B2C34346C7';
wwv_flow_imp.g_varchar2_table(512) := '1FD60AB7A53BBF3299A005B3B32F4356BB98D4B86677E1DA3E9AE5A8ECCF2D9E5B12628C17CBB11AE579C379FE43C982E9BF74C236BADC46B8455C75ED2AAB579798B129EEBD82656B7AFCD7B46529C91F5CCB1E628BBBB1154422EC05CF359E6B3CD679';
wwv_flow_imp.g_varchar2_table(513) := 'ACF358F9BC6C512D7946DB0EF1886DEA732B580AADDDD866D60DEA3E513B53A935DA3D7E4EF2E897593896D2DE97D8664E84FDA1DE5282594E49E009E009E009E193C3234E2FF44D401AB9EBDE659BBD2E63A54174DBB20B7CB775E3BCBEA68381DC8332';
wwv_flow_imp.g_varchar2_table(514) := 'F18FB0CCCD2F7F927786A5B883BBEDACA1E6403B3B3074836CD9DE542452023DDC4F004F004F0A7C4F0A7C4F0A7C416D4AA07A1C7110969FD67F65EB0155B3B9107DEB1ECB36346EDFD60AB7A53BA7FB188C0F44ECC50D13D3BE66BB47A7C1DA25F28E32';
wwv_flow_imp.g_varchar2_table(515) := 'FCB135727D5373BC3AAF65E225197D06CCC830AF47710A3F06037E5DA66AA13561E49E14F89E14F89E14F8899AC2033B8941302C36766229D355D7FB1BA9B6DD373B4C671574B88D768F5F93BCBBA5D64E23A44AA2A9D8CFBA4B620C634FF3107D6B0EEB';
wwv_flow_imp.g_varchar2_table(516) := 'FE4BD6020B7762332EDEE730A5784EDB9EF30CCD5D7768D5A1F4797B4A35D673CF9812B2D8E1B1335E51FC831E0BE0FD333C327864F0C9E009E009E0080359EECCCA373ADCC2CC2A9E4DBBA55033ECBC4A546DAFD8C0997847D8664697BFC93BC332F083';
wwv_flow_imp.g_varchar2_table(517) := 'BBEDACA253743D9D99F57F33EAFE67D5FCCFABF99F57F33EAFE609CB4A4B4D48139C23D8F68C4B4FEB25EB0155B3B9107DEB1ECBFE4EC376FEB057BD29DD3FD94EC0016CECC660D2DCE6352F29DF71DA6118ABA6ED0730B5BCF24C3D4BE9FCCFBDF99F7B';
wwv_flow_imp.g_varchar2_table(518) := 'F33EF7E67DEFCC6AF0A4DDF98F581DFD8D27406A78FEB2865E54F70941350E0766229D355D79EF1BB9A6E9B9DA060DC876BDC94A541D36DCCF60153FB2DA5BD2FB0CC9D09FB53BC41D7A53EB887D085D9D99D771BB3B90389A0B10F5B9F7BF33EF7E67DE';
wwv_flow_imp.g_varchar2_table(519) := 'FCCFB8F98124B2628EA43C182E9B76416F96EEBC779754D0703B90265E11F61991A5EFF24EF0B1A856377E8E910960004BBDE555751C8EEC0895943D82646B7AFC97B4772B2A3BBEFA4B8E6003BBB1075876CDDDE20FC603B72EF300CD3D7D844A32FA0D';
wwv_flow_imp.g_varchar2_table(520) := 'D9E8BDD799AB93E81B1DA5B1E05B63567D5FCCFABF99F57F33EAFE67D5FCC0C50A7035EF2C260D06EEC4486E0CDEF47D266BC23F902650A95770182D3181C388F0FDC4B079310E1253793F129B1150E038D22E0895743A7ACBF0402D0DA02D8130C2C15A';
wwv_flow_imp.g_varchar2_table(521) := '3D81B09A2F495D7194AD9573672A36CED2EBAC29D9DC8E6DE54F67DB4981A5EBF67BCA097953DC26A4C81ADED5D6E26C2A2ED6EF1E0BB90EA36D2030B5601E1D35880A5859E9A45481A609A2B55AC7F1280EB050B7AC4BFED8BFED8BFED8BFED8BFED876';
wwv_flow_imp.g_varchar2_table(522) := '49BAACDF2BBDA1FC71ADED5DE5FC72341D05F3AE971C1DCFA35FEA56FD31873F1502C1CD35A1C84DA0D0C4E215003BD621085AAB038712B0F910588DCC4CAA64A6F27E214222EC071A44F484A168ECBC4BFED8BFED8BFED8BFED8BFED87740464EC25F8F';
wwv_flow_imp.g_varchar2_table(523) := 'EDF4CC4B32B9EBC2E605B87473AFF660DAABD1CEFF00C9B92CDBAF0A97D731F4E99962B515C59375363507C6FA5CAF96413F3ABDEFBCC9FED30E9333DC3C7D7DA6CEC42E6BCEA16115016EBA43EA06EEEEC41D5A576FEE608CA7E94ED2DA53D0FB8CBA05';
wwv_flow_imp.g_varchar2_table(524) := '560E6179A21091301B82D1816E4051D4DDE9108AC5D1633AB945843C6AA16472749772ED1DB6FE200C52AB038712D221016237310485B7587530EA61D4C1A5ACE0CCB17F5D027784EDB9EF30CCD5D7768D580F4797B40E37BEF311B8642EDB0F695820DB';
wwv_flow_imp.g_varchar2_table(525) := 'B93FC983A13F4AF794D2DEC3DC25546EF0F135DA2AE787BC7C309EA6DDA2B3DB434A0DEE7530EA61D4C3A987530EA61D37B274DEC9D37B274DEC8BCA05AA3128886BE86B31353DFE09DA2C7563BF7196D0AA83976238D46EFF003B4EA425FB862F548059';
wwv_flow_imp.g_varchar2_table(526) := 'B172893A987530EA61D4C122AF1C183CAF65E23543421636733A6F64E9BD93A6F64E9BD91EB9EBD65EEDC4BCC698E363BC401B6F59FC953C06D6EEEC40F5A07B2435356C7D7682903B0355BB303CDA245AE952CA9751388352DEAFD8664695FDA9DE30EB';
wwv_flow_imp.g_varchar2_table(527) := '704FAE256F685D9D987D48DD9DC99C304BB8BAF6D225FE320DB8779BB9513776955D214EEEEC332B087B3EFAC74351E87B7685D8D174D9ED01BD25DD78EF2E29A0E077258CBC22F619D05ECE387BCB28141C1F8D6575751C8EEC32DA2CB24EA61D4C3ECB';
wwv_flow_imp.g_varchar2_table(528) := 'E67D97CCFB2F99F65F308366A9AB74B8E6003BBB13761DB3777812F8C076E5DE608CA9F80205ACB4786EC6E8A8A766E779EABD9788B965F54D9EF339C59D3778C19D7FE07B4AD602AB7776287AD23D93FD80BE5B582F89F65F33ECBE67D97CCFB2F99F65';
wwv_flow_imp.g_varchar2_table(529) := 'F338BD9FCCF0CF99E19F33C33E61676234F47795A5941B9944D02BDDDD82AD622F67E63A1AB678FE3117D6A0EEB2C781A5BBB11BDA406A7DE7D97CCFB2F99F65F33ECBE67D97CCC5F9D9535CCC8D2FFB53BC2195141F5C404889620CFE67867CCF0CF994';
wwv_flow_imp.g_varchar2_table(530) := '78314856E65B42AA723B11D6A3775E3B4EA525FB8E852DFA831A8D5D79ED29AB57391DD8FCD2EF01B027867CC4618B2955FDC336F093BBEDACAA6800ECECCC2D163B6778D5F8C877E1DA6018A7A3B181065F41B92D008B0DB83B4CB33775DDE12F3947B0';
wwv_flow_imp.g_varchar2_table(531) := 'EF0D281E1EBFC805E3D75AAFBCB7600AB67722AB7AD7B2FF0093B0DF5F5881EF48774886B03A376603D565234EAF798EE6BEB3B45757B43B59F65F33ECBE675FE8E93AFF004749D7FA3A4FA3E09F47C1137831815C8C45D5AD36FEE1F4017776252F78DD';
wwv_flow_imp.g_varchar2_table(532) := 'DDD84B5380FD733135BFE94ED095A18AF70885F8A6FCBB41C5028BB3B462A0F5A6E9D221BA6DDD019E5ABAF3DA051A05A6EEECEBFD1D275FE8E93AFF004749D7FA3A4EA7D1D27D1F04E8BEE9D1F7E27A63A0A2D9AED1E9F07699CE6FEB7309D29A6E9B1D';
wwv_flow_imp.g_varchar2_table(533) := 'E208DB7ACFE4A1B836B777650FAD13D821AB2D0B13B3C4FA3E09D5FA3A4EBFD1D275FE8E93AFF4748000551685C336F093BBEDACAA6800ECECCC2D163B9DE5E84B609B5B769D1F7E24B421BAA0AB5A57B3F31D0D5B3C7F1883EB5077597BC0416EEC4465';
wwv_flow_imp.g_varchar2_table(534) := 'B6F59FC81398E278DDEF2C34F946DDB09D39BA733C6AB95A4ECCA14EC09BFF00625E6799E373B4C3715F49DA35E83D5E4EF15EABCE38F112D65B3C366600BD558B685541CC71A8DDC74ED057F6FF0071EF194B734F67DA62687AFC17BC18D79EBDC25747';
wwv_flow_imp.g_varchar2_table(535) := '51C0ECC56796AEBCF79AC0B50EBEA7DE6593400777625EB658EE77850F96276E5DE3546A5AD4EBFD1D279A9E6A79A9E6A79A87CA45D0E581065F40D8998E6DEBEE6356E598DB87798DB28373B4A26814EEEECB94A6F44D20E02B7C4778AEDB97A4B5F6D2';
wwv_flow_imp.g_varchar2_table(536) := '58CC1A0DDD888AB6D775FE43B5365D377BCC673575B881CCA696EB3CD4F353CD4F353CD4F35FF865CBAA3B6CFB419958D7DC65F4341C8EC446F96EEBC769D6A0BA6FDD3A10B7EA0EB0465DBAF6958B0CB7ABBB3CD4F353CD4F353CD45204367B3B311069';
wwv_flow_imp.g_varchar2_table(537) := 'BD67F625E6799E373B4C7715F49DA35C83D7E4EF130A995A928D76271B1DE209DB55D7F9282E05A6EEECA1B5A27B043A86A38FE31CDACACEEFBE9149003D53B129CC7C8D54F273C9CF27311D8CFB76431A8DDD78EF2DA975070EE418EBC77EC333343DFE';
wwv_flow_imp.g_varchar2_table(538) := '49DE12D6E00FAE250F3345D9D988AFAFB7FE258FAD57DC621DC02F61945B2D0E1B928D777878F135DA3D7E1EF33DC5FD2778B925788DCD9ED161AB3D7B04CCD6FF00B57B465A9C83EB996BDA1777621E02D6DDDDD9E6A52D3EE13CE13CE13CE13CE13CE1';
wwv_flow_imp.g_varchar2_table(539) := '322B28061BB310DC2016C765068B1C1DA146DA68CBBC080B66556C779535E0C4C3CC4323E0B3040F5A07B2435356C71FC62AB5999DDF896CD002DDD8972BB55DCCCAE3CC34E5DE2A2209B353CE13CE13CE13CE13CE11B2D8A4AD58CF7A96532EEC219C28';
wwv_flow_imp.g_varchar2_table(540) := '3A240A073E47D4811C4A01D48F959508CF04CAA9AEA6ACA98D9C306EF79E709E709E709E709E709615A35AA675296FDC74292FD41AD46EEBC7797D4BA9C0EE419D78EFD865240A1575C7BC65A2EBBAF1DA1E44174DFBA611B1D6E20C6A1571D7B4A6AD5C';
wwv_flow_imp.g_varchar2_table(541) := '5E62C6A7BAF608344E003A8F69E589E589E649E6495158A7098CCC506F8186868D8E3FAC356F113BBF3299A007B3B32F4AAC7731A970CCEFC3B42D4ECBB3B32B1B66E307FD12881D122C8C2DEB28C3666A595814B722DC9A619E5DA69597118495F08417';
wwv_flow_imp.g_varchar2_table(542) := '3B235E83D1E5ED038D9DD7CC09597D06C4C97957F20C4B7C641B70EF0100ACE89433763B69A9FEC4617D9A9DFB44988D20CFF21BD81AC5B933720416DA30756159C0BFC61A4572E1C9EACF1A9E353C6A78D4F1A9E350C6A357FBDA5356AE2E5DD8B0D59E';
wwv_flow_imp.g_varchar2_table(543) := 'BD82666A7AFC97B46529C91F5CCB1E628BBBB10C0608DFF187EF5B1C0EE4C5A2CC811C1AB5535E7BCFD9BC21D92DABD185E917FC29E353C6A78D4F1A9E353C6A6E5286C9743B3026236831FC80C2DB351BF799A38A6A768B9AED061BBDA2D29917262E0A';
wwv_flow_imp.g_varchar2_table(544) := '2C06134F6884B4DEB3FB2F580DAD9DC883EF58F6586868DDBFAC156F4A774FF652B0005B3B31A814BEB2352E199DF87698CE28E9BB3FE4D4C9F5793BCF5DECBC44832FA86CCD5AE20A778F0A9E153C2A785432A0B5A625B03B115C1EF3035B5FE8F69632';
wwv_flow_imp.g_varchar2_table(545) := 'B0AFB8CB8868391D888DF3DDD78ED0F268BA6EF798466AEB711E353C6A78D4F1A9E353C6A06231C34DA7BC43F8C076E5DE608CA9F80225197D06EC5E37BEF335723D1E0ED05932B9D9AB0FA00BB3B33AAE37677232D6E43F5C4C0D2BFA57BC186BCF5EE1';
wwv_flow_imp.g_varchar2_table(546) := '161A2271B0F565697526E6068D2E49F79F70FF0067DC3FD9F70FF67DC3FD9F70FF0065C604A1535EF30DCD7D6768D7A0F4797B415B4CE79F302565B1C362265B7F5040E7633C789AF41EAF0F7996E2FE93BC04E718E367B4425A7F59FD97AB036B67727D';
wwv_flow_imp.g_varchar2_table(547) := 'C3FD9F70FF0067DC3FD9F70FF67DC3FD9F70FF0065A7182536D9CC26457D7E487858D8774F5DA58F360BBBB10F5056DDDDD883AB4AEDFDCC5194FD01DA5453EC373145BCADECFB693A03D3C7F59436F2A1DC2504D4381D988A74D575E7BCEA3EDD61ECE1';
wwv_flow_imp.g_varchar2_table(548) := 'F6B5C6535DA2EE793BCBBA5D64E25B4B7A5F61992B09FB53BC41D7A537FE63F42D3D56D08363C286BBCEB3EDD6759F6EB3ACFB758C48DD8D1B1AEF1C86DEA732B580AADDDD881EB48F649DC6FAFA455F5AD3BAFF0092F58082DDD8820F0E9997D19F70FF';
wwv_flow_imp.g_varchar2_table(549) := '0067DC3FD9F70FF67DC3FD9F70FF0065581F0B34DCCC14B5C2E9E2006B82776E94BDE37777611D4E0BF5CCC0D6FF00A53B45A958EFDC62258B135D911FE321DF87698230A7E01892B2FA0DC89CEC6E9E27A47BF83DE5E01349B74ED339CDDD6E604C22FE';
wwv_flow_imp.g_varchar2_table(550) := '90D8EFFF006EEEEEE148B54ED7AAC28FC603B72EF300CA9D5D844A32FA0DD954C45837367BCC85857F20429FC601BF2ED32F4546D9DA5D348A7677239B7953D9F6D25D6FD8A45E7FE9DDDDD1E1AAD14DA5D52EB2712DA5BD2FB0CAB832700DA64BCA3F90';
wwv_flow_imp.g_varchar2_table(551) := '6237C649B70EF0758744DDDA5473029DDDD8665610F67DF58E44832E6EBEC9551BBC3C4D708AB9EBDE651BDD2E61003C1A97ACA7F547CA1A8DC6594BC23EC33234BDF0E1EF0CCBC20EEFB6B2A39900ECECCD9CB9DB3BC47F8C877E1DA05BF2CC2D8B29FD';
wwv_flow_imp.g_varchar2_table(552) := '529FD52B15182D976258D5C816FA769906E75B987C286E9B77406796AEBCF695D5D4723BB0225650F609AD1D49A5DEF6FF00A77777B4EF6DAD9C366642C2BF90208B36857BBB4CA2006FC3BCC2D941B9DA55348A77776556B5FD4FCA356C6969735603D5';
wwv_flow_imp.g_varchar2_table(553) := 'E4EF079DEDBC44B597D06CCC95857F204531840FD83B40995857DC65D4341C8EC446F96EEBC7688AF100B437CFFD24924924FF004740964E9985DDD887D40DDDDD82EBB15D836EFAC41D7A13EB887D185D9D987D48DD9DC88BAF52FD713034AFE95EF2D4';
wwv_flow_imp.g_varchar2_table(554) := 'EF512F0EDFF7524924974EBA2ECAB3467417BFD1EF0CDBC20EEFB6B176800B67666861F2E9F3FECD5C9F4783B4CB33775DDE12D7946DB0EF18836FEB256B0155BBBB35A941C74F6CC295E11BEC7B4A59B0D99FF8618637285017BB495AC0416CECC660D3';
wwv_flow_imp.g_varchar2_table(555) := 'DCE625E729F71DA6198ABA6ED1AB01EAF27783CAF65E2309E5A96CD9FF00C61A296F001EDE258DAD54EE32C660D0DDD888AB6DEB3F903A5365D377BCC673575B88D768F4F97B41E31B53FE924924B2A216CE0A1B6220EBD09F5C43E842ECECC3EA46ECEE';
wwv_flow_imp.g_varchar2_table(556) := '4D4334EF44F699EE6FEB3BC30E174F21B778D01C0ADBC4AAE6E6DEB7EF06B5BD5FB0CC8D2FFB53BC23ADC13EB89B970167832B580AADDDD881EB48F64FF6771BB7F1883EB58775FF0025EB0105BBB114158992F8FCCF2DF99E5BF33CB7E6796FCCF2DF99';
wwv_flow_imp.g_varchar2_table(557) := '4AFCE281778C9580E61786580401B3B33672C76CEF1ABF190EFC3B4C0314F4363028CBE8372272BDB7885F0455AED9E5BF33CB7E6796FCCF2DF99E5BF30C5B0852B60FAC40F7A43BA4AD6020B6766330D3FACFEC4BCE53C6E76977B46BB59A98B533D5FB';
wwv_flow_imp.g_varchar2_table(558) := '8CBA85540E59AE01771D3B4CA373ADCC3E04374DBBA52AED1A1A9CA58F3229D9DC819FC16D6A7957CCF2AF99E55F32EC3EF3E65D2881734EA4C2363A5C418D46EE7A7796D4BA89C306A5BD5FB0CC8D2BFB53BC784A3D1BBFE227858195B943C06D6EEEC4';
wwv_flow_imp.g_varchar2_table(559) := '0F5A07B2435356C7D768AAD6B4EEFC4B66801EEEC4BD6EB1DCC7885668FABBCF2DF99E5BF33CB7E6796FCCF2DF9966076D0D6F52A9A403B3B330F458ED9DE357E321DF876980629E86C65CD42546A9B9ED0C2C1E45E3D6E2698CB2F5D3B4CC316F4F712E';
wwv_flow_imp.g_varchar2_table(560) := 'EDA558D41C068D3C38711024B10568DF496E95539E7F101A88105BA3AC7C086E9B77406796AEBCF69555D4723BB0025650F60991ADEB872F68E84A7269A16CB2852ACA5998385A22C47865320469793920F06037AB8B540B455888E1636F88D5CF91FB69';
wwv_flow_imp.g_varchar2_table(561) := 'A4437090AC3883E9517694DF483BA383EE690A3634E5F112A11567998D142B11DCB96C815A1E0E598385800D57A625160956DAC40774D15971E60055E8BDA2576DA96B46B2BA3A8E0766233CB575E7BCEB52DD37EC9826CFF9418D46EE7A7796D4BA8387';
wwv_flow_imp.g_varchar2_table(562) := '7233D982BED49B0593C1DA310AD4D0CD4DC90B888F45E25179539EA709D18A9B53ABEB1DFC605506C6796FC4F2DF89E5BF13CB7E2796CAC92599B7109E417A27310AD591BABB2E6E558781BC27240839DF705A48E4CD4D9531F858F6EB117A984517A906';
wwv_flow_imp.g_varchar2_table(563) := '80841E8DA300D28478FC4AC9772AD79D22F93EABC1B0623DE176DD5F32B68906EB53650C55BE02280205B6B10D3F42D971691A5AF43C45EA3D01FBC38B0CE5F1095BF5BD98979CE78DCED30DC57D2768D7A0F5793BC5A6BCE38F112D65B3C36655B21150';
wwv_flow_imp.g_varchar2_table(564) := 'AE7DA2CE0417A1D60D6C4015A37D21496AFABFE1861868C5F0455B6F59FC85D0DB2E9BBDE6339ABADC46BB457C72F69565ABCBCCA20595B0C10CA5B9A7B3EDA4C4D2F5F82F7831AF3A7B84AE8EA381D98ACF2D5D79EF03EC3600CB533FF4C30C30C33CD2';
wwv_flow_imp.g_varchar2_table(565) := '556894BCD82ECECC2970D47A76999ADEBF25ED1D4A734777DF4973CC00777620EB0ED9BBBC42B8C176E5DE022CDF51AB01299D11C6CF6880B4DEB3FB2C781B5B3B92C7DEA9ECB16872801C9AF336A8AEADEF2553400767665A9458EE778D5F86677E1DA6';
wwv_flow_imp.g_varchar2_table(566) := '238A7A7B181065F50DC9EABD978964BC004BE1CFFCF5D75D6A4B6C5E776352E598DB87795A1B53AC94CD02ADDDD82AD695ECFCC74356CF1FC620B879351BA0628507FD0C30C30C215A8DEAC3B8C3B8643B1DFB6911756B4DBFB87B828BBBB1297BC6EEEE';
wwv_flow_imp.g_varchar2_table(567) := 'C21A9C07EB9981ADFF004A76982607A234831A8DDCF4EF2DA975070EE418EBC77EC333343DFE49DE07A05A9C1F8D650F036B77761D702C6A63FF005863CDA79B4F369E6D0A17555E374B66801EEEC4B96E559CC285CB13B72EF28BB4CE5B1314610FC031';
wwv_flow_imp.g_varchar2_table(568) := '2165A1C37251AEEF0F135DA3D7E1EF339C5FD2E60742E3ED4D9AE93CDA79B4F369E6D3CDA79B45A0528749EA46A5C333BF0ED025000EE9B1146BABCBCCA2996C70D899AB29FB07B445D5AD36FEE1EE0A2EEED068A899BBD6096087A27723AB791BD9F88F';
wwv_flow_imp.g_varchar2_table(569) := '40D4F1FD63C65646BBC7FE3A529719BCC2A1435B9DA63B8AFA4ED1AEC1EAF277966ABCE38F112B65B3C36666BC23F90214F2D697D3100080E44D7FFAEE3188C3451BB2EA1558399AED17F1C1DA673BDD6E61BB12638D8EF104EDAAEBFC941702D377763A';
wwv_flow_imp.g_varchar2_table(570) := '64E2D43604F369E6D3CDA79B4F368CB15A1907498A309FA06510B5A1C3725E388B26C6C76998E6DEBEE6356E1CC6DC3BCC2D941B9DA51340A777766DD0B1D9F99A46AA3EC7C434346C71FD60AB7889DDF99580A070DD9958468469D7BA7421FF002822E0';
wwv_flow_imp.g_varchar2_table(571) := 'E876BDA79B4F369D67DBA4EA3EDD2751F6E93A8FB749D47DBA40336EECAEA768CA53923EB98D8028EA9D89AF31395D49EABD97889065F50D9EF331C5BD3DC4285C311BF2ED2B5A28373B4458D1A9C3ED3A8FB749D47DBA4EA3EDD2751F6E93EDF8A11B69';
wwv_flow_imp.g_varchar2_table(572) := '6163F7319C57D2E235DA3D7E4EF2CE97593880B32D904C32FA06EF69E8BDD7981065F40D8ED339CDBD77786A5CB31B70EF2A0ACB1ECBDE0C35E7AF7094D1BB8B87684B7C85BADF04FBC7F93EF1FE41E72D9B9C69BCBAA5D41C72419D78EFD8666687BFC9';
wwv_flow_imp.g_varchar2_table(573) := '3BC252DC01F5C4A1E668BB3B3074036DD9DE05A25D4B6B6C713EF1FE440B7EC748665610F67DF5981ADEFF0047B40995857DC65D4341C8EC446F96EEBC76879105D37EE968758C5BE309D57DBA4EA3EDD2751F6E93A8FB749F6FC504437B5947F9032CBE';
wwv_flow_imp.g_varchar2_table(574) := 'A1B9DE7AAF65E224197D4366139A6EE62CD5558399AFC1E9F07699EE6FEB3BC274E698E363BC401B6F59FC9ABCC8F8B143306C36766228D355D7FB2E4AFEA7D4FBCCBD6020B77623B2DBFACFE409CE33EE7BC6F5358135EC4FB7E29E073C0E781CF039E0';
wwv_flow_imp.g_varchar2_table(575) := '7313017405604ACB6386C4D648BF9C7B4B699ECFB0CCDD09FB43BC41D7A537FE61F401767665AF365BB3B90250C995669ED3C0E781CF039E073C0E781C07ACDDD78EF2FA9A0E07720CCBC63EC33334BDFE49DE1A96E20EEFB6B10F5695DBFB98BA93F404';
wwv_flow_imp.g_varchar2_table(576) := 'B694B4786ECB305560E66BB47A7C1DA1A5C1F5378D7A0F5787BC29D79CE16F1E353C6A78D4F1A88B3BE95F960AB7A53BA7FB29D8002D9D997A1A5B9CC6A5C333BF0ED319C51D3768D5C9F50DCEF110A4BB6440FED90C51B778C436FEB256B0155BBBB143';
wwv_flow_imp.g_varchar2_table(577) := 'D691EC9FECEE376FE3147D6B0EEBFE44200A5CCEC4CB4B5D5CACF039E073C0E781CF03806014B572DA5BD9F6199AB09FB43BC41D7A537FE61EC0A2ECECCBE9C84DF876833AB1DFB8CBE8550E4762336CB775E3B4EB525D378C1367FCA328DCE9731861D0';
wwv_flow_imp.g_varchar2_table(578) := '8E366514ACA1EC13A8BD7ECF68E6D654777DF4975D200EEEC4D1C6E66EEF3C0E78C278E278E278E278E2786225015C0E8DD846AD793B1F98665E10777DB5951CC80767660E906DDB3BC46F8C977E1DA608C29F80662389A60CF1C4F1C4F1C4F1C4F1C453';
wwv_flow_imp.g_varchar2_table(579) := 'B02534220FBD63D97FC9D86EDFD60AF7A53BA7FB2958002D9D98C81A5B9CC495AB5EBB74ECCA2A92EC6AEEC60A3023F5B879D9DB38D9F694102D36F518B5580075E20401181D9E3D20AA1D4B4678C278C278C278C2072F4C5023B32FA8BAAEBCF78F934D';
wwv_flow_imp.g_varchar2_table(580) := 'D373B4C631574B88D768BF9E4EF2EC97593896D2DECFB0C4F883AEADE778F497C698E9DA1FEC84BEF04A34CD7A9B40820D50E8F3DA516A02BCAEECA5219C17D0258ACC40B8DD7B4F1C4F1C4F1C4F1C4F1C4114BF4109B67BE1C3DE1997841DDF6D654732';
wwv_flow_imp.g_varchar2_table(581) := '01D9D983A41B66CEF11BE325DF87681B3FF246303988AFA246BDB3BCBF5A834A3407D46245A2A2757622D58D99BC540368AD69BF78018801F5DBDD35DA2AE397B4AAAD5E5E6534A7B4F60993A93F6AF688BAB5A6DFDC0002A3A255A0EE566A7FB0D2C985';
wwv_flow_imp.g_varchar2_table(582) := 'B3BF69838969BF480C7381BADC844F76235B461A2B5CF6BBC2474DF784AD6020B6766330696E7312D394EFB8ED30CC55D3768D5C9F5793BC1E57B2F136D581BB4F6435E30BBC7370FF00048EE6CEAEF7B4C01E01A5BC6FB1399B12EF58B87C3B4A197953';
wwv_flow_imp.g_varchar2_table(583) := 'DC2544751C0ECC46792AEBCF79D661BA6FD9308DAE97103940697B4F073C1CF07FF0777991D0353E278A9E2A78A9E2A19B0DB882A17586CD899EE6DEBEE6257E1CC6DC3BCD2574731DA6D4055BBBB05CAC05ECFCC441B06DC3DA7839E0E783FF0083BB4A';
wwv_flow_imp.g_varchar2_table(584) := 'C359B56B0CAD1A71EC430EC10EF7B4C4BE96C7CC5055D16AB495E716DF995A0AC1DF777DE56B0105B3B319834F739896BCA77DC7698662AE9BB46AC47ABC9DE210132BF53C1CF073C1FF00C1DD8620C7782D3DE142E589DB97798CE68EBBB46AE4FA26EF';
wwv_flow_imp.g_varchar2_table(585) := '68745EFBCC0832FA0D880B04AAEE3566CE546D9DA5D35853B3B91CCBCA9ECFB693034BD70E5EF28A5E54F7083A9544982BE8EF32C3A93C6E769846D74B88D708BB9E9DE5D52EA27106A5BD5FB0CC8D2BFB53BCC81388AD57C427B405347826B8455C75ED';
wwv_flow_imp.g_varchar2_table(586) := '2AAB579798B129EEBD82646B5FDABDA5D753A7687F66BA455CF0F799C6F74B98E9345D367B402F4D775E3BC0CD8149B3B929287DE9D79BAF375E6EBCDD799BE9D5C7819582B840D53725D706CF24E8FD1D6747E8EB3A3F475818756948EC3302D65A3C37';
wwv_flow_imp.g_varchar2_table(587) := '62BDA631CF99AF41E8F076996E6FEB3BC274E698E363BC421B6F59FC84846E08B77675E6EBCDD79BAF375E6B082531937ED3091D475DA6021BD4EEF681C2F7DE604ACBE836264ACABF90623FC641B70EF0E806AE6BB418B0F56E49846C74B8831A85DCF4';
wwv_flow_imp.g_varchar2_table(588) := 'EF2DA975138835ADEAFD86090B968A173AF375E6EBCDD79BAF35020B64D06E4A75DDE1E23135857D8AF583A83B6EEEF10BF15DB97798A7287E00816B2D1E1BB32104D87A0C45D7AD7EB8983A13F4AF794D2DEC3DC25546EF0F135D22AE787BC2C97150E0';
wwv_flow_imp.g_varchar2_table(589) := '7A627897C4A7C4F012FDA585D0381DC9636F08FB0CE80D67D77866DE12777DB5954D201D9D9987A2C76CEF0A20395F4C4095E13B6E7BCC333575DDA35703D1E5ED038DEFBCC0A32FA0D8851168E6CDFB1958BA509CCB7600AB67722AB7AD7B2FF9073F36';
wwv_flow_imp.g_varchar2_table(590) := '105F33C13E27827C4F04F89E09F13C13E225C4B389D1079D9DD3C44B597D06CC4D507001B89E25F13C4BE25C4C613269B4A5E6053BBBB096A700FD73ACC4D4F7C364ED163AB1DFB8CB68554E476238D46EEBC769720AA62BCB3C13E27827C4F04F89E09F';
wwv_flow_imp.g_varchar2_table(591) := '13C13E2134974157ED0FA81BB3B91175EB5DFF00995E9AF7E4EF304654FC0102D65F41BB178DEFBCCD5A0F4783B4CB337F5DDE1019ADFC07796170293677258DBD17D867406B3EBBC1694C8A5389E09F13C13E27827C4F04F89E09F13C1BE23C19BD5E1E';
wwv_flow_imp.g_varchar2_table(592) := 'F32CC5DD3778C18957A367B4D34852DBFB87A83A2EEED28798B6EEEEC153B3CEA76F79622555A40A32FA86E4F55ECBC4D5C9F50D9EF339C59D37782CB6B14A36FF008210838D76FA1B881EF4877495BC0416CECC461A6F59FD89799E678DCED30CC57D27';
wwv_flow_imp.g_varchar2_table(593) := '68746F91A6E6E77238DC403D81075876EDDDE217C60BB72EF314E50FC0102D65A746EC1A60F5F5BCAC9442EEBE34989A1EBF05EF32B7559B0ED53A4F64E93D93A4F64E9BD93A6F64E9BD919015CA154D9999A5EFF34EF096B700FAE252F360BB3B30E46E';
wwv_flow_imp.g_varchar2_table(594) := '57906DFF0084B3005680BBB446A5CB31B70EF2B436A1B994CD02ADDDD82AD695ECFCC74356CFD76965AB55F71838C0A0A4E93D93A4F64E9BD93A6F64E9BD905ED744AA6FED300C53D3D8C0A32FA86E4F55ECBC4C9A02D75DFF0008435382FD733035AFE9';
wwv_flow_imp.g_varchar2_table(595) := '4ED163AB1DFB8CB685541CB1C6A3771D3B4A4EC5D137EF103DE80EE92946080D9D99D0FB2749EC9D27B274DEC9D37B274DEC8694BD50D4885F1826FCBB41D20D13676963CC8A767725AFB821E89ED339CD9D7778D80540ECDBBCEB300DB8F683B04AD75A';
wwv_flow_imp.g_varchar2_table(596) := 'DE25ACB6786CCCD7847F20442D7A537E7DA18D60AE2BB3FF0024104116E5370B11DEA3575E7BCEA52DFB8E843FE506351BB9E9DE5B52EA0E1DC831D78EFD862F9B621B6E445D5AD36FEE1EA0A8BBBB12979B2DDDDD84A53807EB9989A9EFF04ED1D51080';
wwv_flow_imp.g_varchar2_table(597) := 'DE99B946BBBC3C7887F0055A5995FC315FC315FC315FC315FC302C69C4E38370D5BC24EEFB6B289A003B3B32F4A2C773BC6ADC333BF0ED0091251C0ECC2AF2A66B0DD9760AAC1CCD768BF8E0ED339CDDD6E61BA534C71B1DE208DB7ACFE4A1B837C8EECB';
wwv_flow_imp.g_varchar2_table(598) := 'C5860B2EC1895FC315FC315FC315FC315FC3174DA00DDB473B4D7A0F5793BC57AAF38E3C44B596CF0D999AF08FE4086834141C98628288B75D255348A7777618B584BD9F7D63D435BF5DA58DAD51DC655208135BDABBC4454B639E7BCD68620376DB12BF';
wwv_flow_imp.g_varchar2_table(599) := '862BF862BF862BF862BF862AEB854DAB7943CD82ECECC3C056DBB3BC46DCD77FE6628C27E81EF2FC216935475271215BBD3D6E506C3B97F1DAA6598BBA6EF166D8561AB81571C1C3886E14200DA379AE60AC3998D508FB0BDEA7DCFC4FB9F89F73F13EE7';
wwv_flow_imp.g_varchar2_table(600) := 'E27DCFC42DC8696D8D1600034759AF44622060DE0C6667CA146D43466EA30E15E275463DCDFA462C050D4D953362D3B14D3423830160D95D5F58DB4A016C44F12DA462C058D55ACE848FB1AF58B8914282DC8BF5150369BB88DC10D62EAFB4D4246B9FE2';
wwv_flow_imp.g_varchar2_table(601) := '136D385ADFE22EC98EC97DA6E48C1638D76943C0D2D9D988834DEB3FB12F33B678DCED31DC57D2E235DA3D7E4EF2CC975938847869BF6A7ACDB3CB807418AF70682D77185488F45E25156D79EA709C103C14EAFACA00460B417617898F2406BFC42200B5';
wwv_flow_imp.g_varchar2_table(602) := 'F080120B2EBFE45EE4B8E9BF6898B2B01A4EB887AA5401755ED2DA9A4E07720CEBC77EC333343DFE49DE1296E00FAE250F3345D9D987A01B6ECEF1B01D05347ED428E94934B88E4A2A86B8FC40C5D6542D6ECC17786A7426A6BE579E5347140B1C1866D0';
wwv_flow_imp.g_varchar2_table(603) := '8157B5E3110B080B6F47E211DAC5ADFE23D8D1C25F696F0D40BFF906A02D7C622A22AF66352E199DF876988E28E9BB40E597D4373BCF55ECBC44832FA86CF78632B46085069476A11A703CD1DA1516CFA67D53E67D53E629B3C18A8B81965F50DCEF0A22';
wwv_flow_imp.g_varchar2_table(604) := '688278C4F189E31050C5AA31162567AF60991AD7F6AF68C753927D732F3B42EEEC43EA46EEEEC41D5A17EB989462CD33B0ED10C042D2AF67135DA3D7E4EF2CD57593896D2D6CF0D999AB09FB03BC40D7A537FE61E8028BB3B32D6C34AE26D0D4D5A8FAED';
wwv_flow_imp.g_varchar2_table(605) := '1D5AC8CEEFC4B26801EEEC4BD6CB1DCC63B96276E5DE16ED7F43763A54974DA053E5BBAF1DE5F52E8703B90675E31F61960D510753DE142B293599A1E668BB3B3074836DD9DE237E6BBF0ED314E10FC0312565A1C3720AD778CF1E212440E01F298EE6BE';
wwv_flow_imp.g_varchar2_table(606) := 'B3B46BB07A7CBDA51AEAF2F302365B1C36266BCA3F9060D11B4FAEB055BD29DDF994CD002D9D997A1A5B9CC6A5C333BF0ED299DEB5D668CFAA7CCFAA7CCFAA7CCFAA7CCFAA7CCFAA7CC48DB26A47232A7340BB1D1EDA46529C91F5CCB1E628BBBB10F507';
wwv_flow_imp.g_varchar2_table(607) := '6DDDDE216E2BB73EF314E50FC0129C01EC348D768F5F93BCBB25D64E25B4B7B3C36666E84FDA1DE381C63F4C4FAA7CCFAA7CCFAA7CCFAA7CCF219E4305158152DA67B3EC312A3BA4DBB84F239E473C8E214669A95D89AB93E8F2F681C2F7DE605197D06C';
wwv_flow_imp.g_varchar2_table(608) := '4C95957F20C6BFC641B70EF06FB9E01ABB4DD865DC9AB1C9C292F156860294EC33334BDFE49DE1B96E20EEFB6B2879900ECECC1D20DB367788DF192EFC3B4C50C3760D88A6AD5C5CBBC586ACF5EC133353D7E4BDA32D4E48FAE658F360BBBB11B462E6EF';
wwv_flow_imp.g_varchar2_table(609) := '7B6D022068703B9107DEB1ECB36346EDFD6370C10D7789E47171171D4B404C45C03D1DA6338A3A6ED1AB93EA9B9DE7AAF6DE225197D06CCC8316F477109EE3D00D9ECC0A13EB95851B8713B72EF311CD3D7D844832FA06EF69E8BDD798F8A64BCF676859';
wwv_flow_imp.g_varchar2_table(610) := 'A2B8B779EF1BB9A6E9B9DA631B5D2E235DA2EE793BC5844D64BE2790CF219E433C86790C42452EB30989A1FF004AF7830D79EBDC23BB14B56C6C4CD7947F20C46FCD36E1DE0EB0E8BBBB4A1E62DBBBBB04E20DAFAE759682A32F61991A5EFF0024EF0DCB';
wwv_flow_imp.g_varchar2_table(611) := 'C20EEFB4A9E6403B3B30803928092E790CF219E433C867866300BC90991A5EFF0024EF0CCBC20EEFB6B2A39900ECECC1934830E1274DEEF884CC3831CBB41D61DB3777885F182EDCBBCC13943F0040B5969D1BB171B18E7CCD5A0F4783B40E184D2DBBC7';
wwv_flow_imp.g_varchar2_table(612) := '4DEEF89D37BBE253C2A9A39B5253B0005B3B319834B7398D6BCA77DC7698662AE9BB46AE4FABC9DE0F2BD97895F70ADF4C6BD07A3CBDA0E3673CF9812B2D8E1B1325E51FC8312DF1926DC3BC4A6AC3ADBFACA197953DC2544751C0ECC37A26A394DE74DE';
wwv_flow_imp.g_varchar2_table(613) := 'EF89D37BBE2190BB519E4D37976ABAC9C4B696F4BEC3323427ED4EF1075E94DFF987D005D9D996BDE37677253AB66FFC7D7696BDA1777621EA1937777620EAD2BB7F7307527E94ED2DA53D1F71836D501E9B40B7CB775E3BCBAA68381DC882CBA41E833C';
wwv_flow_imp.g_varchar2_table(614) := '63F13C333C333C333C33040B168C312565A746E44E7633C789AF41EAF0F7949F2DF53A23D17BAF3072CBE8F07699CE6CEBBBC352F28DB61DE3986D6A7339CE5F162B58082D9D98CC1A5B9CCDC528170EDDA78C7E278667866786678660224B800E633C64';
wwv_flow_imp.g_varchar2_table(615) := '3BA4AD6020B676633069EE7312F794EFB8ED38653D3768F0594639F48DC622EAD69B7F70F50C0BBBB1297BC6EEEEC25A9C07EB9989AD7F4A768280F91AE461160518CF1D9E3B2C29F6B1E7ECE0D1BC631B5D2E235D22EE793BCBAA5D64E25B4B7ABF6199';
wwv_flow_imp.g_varchar2_table(616) := '3A57F6A77883AF427D710A3F180EDCBBCC0334F5361128CBE83762F0BDD799AB93E8F0768A15A5F5F78D748AB9E1EF0575F728398F1D9E3B3C7678EC408DB007CB0CCBC20EEFB6B2ABAC01D9D99B3973B677897F8C877E1DA609853F00C49597D06E4A7A';
wwv_flow_imp.g_varchar2_table(617) := 'A05077DCFF00912DF1926DC3BCDDC746DDDA5573029DDDD8665610F67DF586F93F85ED157DEB1ECBFE442A09CAE9FD62BAFB59E273C4E789CF139E272EA8B56AE25197D06CCC95857F20429FC601BF2ED3672A26CED0D97256FC7B4B694F43EE32EE1558';
wwv_flow_imp.g_varchar2_table(618) := '399AE91771C1DA671BDD6E61F029BA6C778F930DD37EC9846D74B88575F6B3C4E789CF139E273C4E284530011E62B3CB575E7BC7C886E9BF64C2363A5C46B80DDCF4EF2DA97513894EBDA439FE13D17BAF3020CBE81B1339CDBD7DCC6AFC398DB87795A5';
wwv_flow_imp.g_varchar2_table(619) := '941B9DA51340A7777624D9A68F04F0D9E1B3C36786CBA70B405A6D2CA974381DC9632F08FB0CE80F67D77866DE10777DB5954D600ECECCD9CB9DB3BC1AC433D076ECCAE1B935D5DD8346382FD7310172CFD29DA2290F57EE32E25630732CB17E80E9ED0A';
wwv_flow_imp.g_varchar2_table(620) := '546A506786CF0D9E1B3C36236060047696002DF5912F394FB8ED30CC55D3768D5A0F5793BC1E77B6F112D65F41B31D0AEF4B77745645BE8F0768871D6EBBBC5D4E71EC3BCC7555A9CCA20D1794EECB92BA4B7B3DB30540510173C46788CF119E233C465B';
wwv_flow_imp.g_varchar2_table(621) := 'F16131A9AF8EE1DE11D6E09F5C4E9985D9D987D48DD9DC88BAF5AFD7102C631FE03DE19B5843D9F7D67517B7F4F69632B0AFB8CB8868391D888DF25DD78ED17512A3CD6AF78B10415B2772788CF119E233C46788CF1196103B5CEE7FB0BB1A2E9B3DA20B';
wwv_flow_imp.g_varchar2_table(622) := 'D35DD78EF2C2E0526CEE4B1B7A2BD861D0359F5DE25F1809DDF68D70082E7519A4693A4489D1E66E56DDA7A77E9BB3FE40DEDEAE4DC9B46FD94BCD2D573C3DE79667966796679665A0B458E4E8401607576B852540AFA37EECC73586E76135017D03765F';
wwv_flow_imp.g_varchar2_table(623) := '13DD40EA96BE382683E372DD9D37BBE674DEEF99D37BBE674DEEF99D37BBE679C7E67966796679667966796606C0DB960AB7D61B36267723F30C6B7E6F03E664CDBAE63B405A22AE7761014E2383A7BCA45793F53B4E9BDDF33A6F77CCE9BDDF33A6F77C';
wwv_flow_imp.g_varchar2_table(624) := 'CE9BDDF33A6F77E615305ADBF31C0EDE4BD022691B05EB7B42BC9A4B82504EE272686B2AE096CB10AA581DF73FECAA6900ECECCC38163B6778D5F8323BF0ED300C53D1D8C0A32FA0DC8F55ECBC4D425F58D9EF33FD75B8DC428AB057D5BF663E4661BA9A';
wwv_flow_imp.g_varchar2_table(625) := '4B20D0F09D122A6727D96161E05AD79639089CA721BC2803A4B9E22F48B55C72F68C4E9912DB2826CA59C36232EDB9AB94D585A402DC7612D9A055B3B9155BD6BD9F88EA68D9E3FAC40F7A03BA40038204698B14B1EB9744BAE77373B4C3715F49DA35E8';
wwv_flow_imp.g_varchar2_table(626) := '3D5E4EF173B38E3C44B596CF0D999AF08FE40860EA637A2F2ED04262588E79DCF3B9E771D74E4F92F68CB53923EB9963CD82EEEC43DC16DDDDE206AD2BB7F7314653F4076857B2D1E1BB178D8C73E61D3331016DAA797CF2F9E5F3CBE797CE54EF9E773C';
wwv_flow_imp.g_varchar2_table(627) := 'EE79DCF3B81FAA2545D889065F40DD9E8BDD7981965F40D8ED339CD9D77786A5CB31B70EF3122E83732A9A053BBBB0D0D56BD364F2F9E5F3CBE797CF2F97D55DDD8466BB457C72F69575ABCBCCA694F69EC1327527ED1ED11756B4DBFB943355735D89AC';
wwv_flow_imp.g_varchar2_table(628) := '6EE9C9D9986E2BE93B46BD07ABC9DE2D35E71C78896B2D9E1B31B4152D307B403070361E5DA0E9068BB3B4B1E66DBB3B91D4B734F67DB4989A1EBF05EF0635E74F708DAD77171C40311A36FB2BD65AB658EE77851F8703B72EF311CD3D7D844832FA06EC';
wwv_flow_imp.g_varchar2_table(629) := '2B70D4B95DAAEE6257D823B3DF3061AF3D7B84A68DDC5C3B31C6A3575E7BCB0B054AA89F64945876D35E25B52EA0E1DC831D78EFD8666687BFC93BC252DC01F5C4A1E668BB3B30F4016DD9DE3E0029453FC4FB07C4FB07C40AE3C93BBA41C6CE79F30256';
wwv_flow_imp.g_varchar2_table(630) := '5B746C4CD7947F20C46F8C936E1DE0EB0E8BBBB4A1E62D3BBBB0D6A700FD733035BFE94ED04D3261F719E009E009E009E009E009E009CDF87E27D83E27D83E22428BA2C9A1A43A6CC9BBBBB1075695DBFB98BA93F487696D29E8FB8CBA85560E66BB47A7';
wwv_flow_imp.g_varchar2_table(631) := 'C1DA67B9BFACEF0979CE38D8EF1886DFD67F214B22B3413C013C013C013C013C013176D8AE1319CD1D77685CB2FA06EF69E8BDD7981065F40D899CE6DEBEE6204363E0E3BCB6A5D4E07720C75E3BF61999A1EFF24EF048A59BA4FB245898948D6635235B';
wwv_flow_imp.g_varchar2_table(632) := '5F4C4C5184FD0328B65A1C37251AEEF0F135DA3D7E1EF339C5FD2E61BB740E8D8EC8BA04A1B7F72D7B42EEEC43EA06EEEEC41D5A576FEE2653806CF1194A7247D732F5B88179DAA2EC6D4F3C3DE65B8BFA4EF1556B934709E05F33C0BE67817CCAB46E8A';
wwv_flow_imp.g_varchar2_table(633) := '3D1EB0D5BC44EEFCCA66801ECECCBD0558EE6352E199DF87698CE28E9BB41A7ACCF3C90D1BB7A3E62A230CAD3E65F96CB87AABACC0334FE0089465F41BB178DEFBCCD5C9F4783B4CA33675DDE1A9F2CC6DC3BCC6D941B9DA51340A7777618B584BD9F7D6';
wwv_flow_imp.g_varchar2_table(634) := '60C039470ED3EE7E67DCFCCFB9F99F73F33EE7E67DCFCCF02F99E05F30D9B54283B988DF1926DC3BC1D61D13776951CC0A777761995843D9F7D6606B7BFC13B439958D7DC65B42AA0E5D88E351BBFCED3A9097EE0FA4B8D83827DCFCCFB9F99F73F33EE7';
wwv_flow_imp.g_varchar2_table(635) := 'E67DCFCCFB9F9880CA2DDDDD885B8AEDCFBCC53943F0040BD968F0DD966AAAC1CF99AFC1E9F07699D0036ABBF782ADE94EEFCCA998007B3B33C2BE67817CCF02F986D8A8A2F24F55ECBC44832FA86CF799CE2DE9BB90A170C46FCBB4AD68A0DCED2C9A05';
wwv_flow_imp.g_varchar2_table(636) := '7B3B91C1534A3E8FB4C95957F20C46F8C936E1DE6EC3A36EED050773996AC09596C70D899AF28FE418202A633AF0B2AA818E2BB4F4FBE2F8FBE2F8FBE2F8FBE1A981D11B0F24451A6F59FD89D69B6E9B9DA6338AFA5C46BB47AFC9DE5D92EB2712DA5BD9';
wwv_flow_imp.g_varchar2_table(637) := 'E1B334D6CE456E1888480597B3BB99D330BBBB10FA91BBBBB1075685FAE6606B5FD29DA5B4A7ABF719760AAC1CCD5E8BF8E0ED339CDFD67784BCC698E363BC401B6F59FC943C0DADDDD85B3CC3B56D72FF00BE2FFB62FF00B62FFB62FF00B62F8FBE08B2';
wwv_flow_imp.g_varchar2_table(638) := '2D1AC1BB1785EFBCCD5C9F4783B4CB33775DDE12D7946DB0EF18836F53995AC0556EEEC056B4AF663A1AB67EBB445F5A83BACB1E0696EEC4445B6F59FC820DB069B1CE25FF007C5FF6C5FF006C5FF6C5FF006C5E478BAB271987A83A2EEED28798B6EEEE';
wwv_flow_imp.g_varchar2_table(639) := 'C2529C43D9F7D6626A7BFC13B419D58EFDC62D0A62BADED5D6E36359A732C1DC25361DB12F8FBE2F8FBE2F8FBE2F8FBE2EC0B36DA6E33CC41D7A537FE61E8028BB3B32C79B2DD9DC8CB5B927EB8989A1EBF05EF2EEA1726AAD48856A4EBFDB9AB11E8F07';
wwv_flow_imp.g_varchar2_table(640) := '699666EEBBBC59B70BC17509C828A1A87641A31F897876B6831B1E90BA2C6C810E274FEDF89D3FB7E274FEDF89D3FB7E274FEDF88664BC60B068C000D328D578EF1C88306F499A28956C68CDDD61C4FB77D66F9D8FB8F698C03C806918E5ED86C4C932AF';
wwv_flow_imp.g_varchar2_table(641) := '537312FF001906DC3BCDD8A89BBB4AAE90A777761995843D9F7D6626B7BFD1ED0675635F7197D0AA1C8EC454B96EEBC769D6A4BA6F1D085BF5022D668717CC3AC858D73F89AFD6A1023ED130EAA82993DA0DBE2174DFB458B10BC0F882CCA2F0FC43E699';
wwv_flow_imp.g_varchar2_table(642) := '62403E590AB2DA01B42B03503203463F105418022F82214D855BD4C708CC40A0DA208DB7ACFE4A1B836B777650FAD13D821D4351C7F18E2D656777DF49435C00F7762053A68D3E269EDA88DFB4A71A560CBED29699140FF9050112C4398B2C88B0113B4D';
wwv_flow_imp.g_varchar2_table(643) := 'C25646BAB71219447E83BCB60E1A62002DC8EACE317A634F79B2A83FB691969933AAF865A583DBF13A7F6FC4E9FDBF13A7F6FC4E9FDBF1134C5454A8D1D234CC8C6BEB0E49C7699790EB21A3DE60D160756A466A9D978EB09EC8D5DCD9976CBFC0E17D18';
wwv_flow_imp.g_varchar2_table(644) := '43D0AC0D42C80518FC4209482FB4F06F99E0DF33C1BE67837CCF0E7CCF0E7CCF0E7CCF0E7CC7270B5431F98112B287B04C8D6F5C375ED1DCACA8EEFBE92E79800EEEC41D61DB3777885F182EDCBBCC11953F0044A32FA0DD8BC2F75E66AE0FA3C1DA6599';
wwv_flow_imp.g_varchar2_table(645) := 'BBAEEF096BCA36D87789AB6086F082A99A196EEB14360A6D684D8D5BB7F1883EB5877597AC0416EEC4465B7F59FC8BD41E9073DE37734DD373B4C631574B88D768BB9E4EF2EA97593896D2DE97D863F2E82353B9DE2029B41F2BC13C1BE67837CCF06F99';
wwv_flow_imp.g_varchar2_table(646) := 'E0DF33C1BE67837CC32C0DD8E59846CF5B8831A8D5C75ED29AB57172C58D59EBD8261E25FB07B4C8D2F7FA3DE1B97841DDF6D654F3201D9D983A41B76CEF11BE325DF8768843943C83462366414526E3139D8DD3C4D5A0F5787BCCB31774DDE0273847B1';
wwv_flow_imp.g_varchar2_table(647) := 'ED18969FD64BD602AB677226DBD9CED67873E67873E67873E67873E60DAE7D84205ACB4E8DD8B8D8C73E66BD07A3C1DA6599BFACEF0979CE3D8778949B7A9CCDAC0AB777602551620CFE67837CCF06F99E733CA6794CF299E633CD679ACF3580204C6ABE';
wwv_flow_imp.g_varchar2_table(648) := '235DA2BE397B4AB2D5E5E6534A7B1EC1337527ED1ED11756B4DBFB87A92A2EEEC4ADEF1BBBBB08EA705FAE6606B5FD29DA2D4A7ABF719650AAC1CC71A85DC74ED09045914EB1E7305DAD5580BBCA0AEA391DD9432B287B04EA0F471FC6728CF7A6EF7834';
wwv_flow_imp.g_varchar2_table(649) := '85416C6CF680DF25DD78EF2EA9A0E0772584BC23EC33234BDFE8F785E2CB7A9B4D581F4783B4CB33775DDE2E3A25A235ED3CE679CCF299E533CA6131070B16C665B7F59027384FB9EF30CCD5D7768704173BA7599241A1EF7CCAD6020B67663B0D3FAC89';
wwv_flow_imp.g_varchar2_table(650) := '6BCA77DC7698662AE9BB46AC07ABC9DE20293592D89E5300709902B71027F1806FCBB4D9CA89B3B4BAEB0A7677239B7953D9F6D260697AFD9EF2825E54F7083101DC53CD679AC1A1D88A96ED2979B2DDDDD84B5380FD7331352DFE29DA2C7563BF7196D0';
wwv_flow_imp.g_varchar2_table(651) := 'AA839768E351BB8E9DA7522EB7309798D31C6C778AC905405AF69E733CE7FF0085DDDDDDB55630EABB4BD5DD8EE6142E589DB97798CE68EBBB426597D0377B4F45EEBCC0832FA06C76998E6DEBEE6357E320DB877987B2836EED2A9A453BBBB0CDAC25EC';
wwv_flow_imp.g_varchar2_table(652) := 'FBEB3A835BC7F1950C8A57718448141FFA77A3A3ED1E235D22AE397B4AAAD5E5E6654809D1A1ED2D5802AD9DC8ABDEB5ECBFE4EC376FEB103DE90EE9FECAD6020B67663C54E3B0E9F316B563BF7196D0AA81CC71A8DDC74EDFF6777777AF81F907BCBAE9';
wwv_flow_imp.g_varchar2_table(653) := '00777626EE5CEDDDE0E260F406FEF119E5ABAF3DE3E44374DFB2601B1D2E235C22EE7A779654BA89C46256517B0FFEDDB022FA21A43EC153D56F1175EB5DFF009983A13F4AF794D2DEC3DC25546EF0F135D22AE787BCD5D1F6873FFABB43EAEE2DE1AB72';
wwv_flow_imp.g_varchar2_table(654) := 'CC6DC3BCAD2CA0DCED289A057BBBB0D5AC05ECFBEB1EA1ADFAED2FF5615F7197D0AA1C8EC475AADDD78ED3A9497EE1F0C6A3FF0097E393C7278E4F1C9E393C7278B42A22EA669BAF68CB53923EB9963CC51777621EA0EDBBBBC42DC576E7DE628CA1F802';
wwv_flow_imp.g_varchar2_table(655) := '05ECB4786EC5C6C639F335C83D1E0ED32DCDFD67784BCC731C6C7788436DEB3F92B780AADDDD895E4C07489E053C0A78140180F410A1784EDB9EF0D5AFBA3B43A96E69ECFB693034BD7E0BDE0C4BCE9EE12BA376381D98ACF2D5D79EF135B57D6BA76655';
wwv_flow_imp.g_varchar2_table(656) := '340A7777619B584BD9F7D63D435BF5DA58DAD54EE30540EA1A13C7278E4F1C9E393C721A00F4133F5374371ED11756B4DBFB99062EE97305D4DA2E9B3DA20BE6BBAFF658DC1A4D9DC9636F457B0CB14426C5D3FAC51B51EA278E4F1C9E391D0AB00C3B30';
wwv_flow_imp.g_varchar2_table(657) := '28CBEA1B91EABD9789AB93EAF0F799C62CE9BBC142F08DF63DA64D1EE4885AEA011DE2942CA8D3765982AB07335FA3D3E0ED33DCDFD67784E9CD374D8EF1006DBD67F250F036B7776305AD23D926C6ADF5F4883EB5877597AC0416EEC4D285DCE678E4F1';
wwv_flow_imp.g_varchar2_table(658) := '19E233C46788CF119E232EAA3478E5ED052D339E600ACB6E8D899AF28FE4188DF19A6DC3BC1C42E89BBB4A1E62DBBBBB096A700FD7331353DFE09DA2C7563BF7196D0AA83976238D46EFF3B4EA525FB8E952DFA8F119E233C46788CF118A05780EEEC454';
wwv_flow_imp.g_varchar2_table(659) := 'B84DDB6BFE4A296B4386E4A30DDE1E26BB47AFC3DE6738BFA5CC04E674471B3DA67B9BFACEF09798E6E9B1DE200DB7ACFE4A1E036B7776207AD03D9229004553A7F39E233C46788CF119E233C4652912E854B78A9EB9A7B4A96A50DCCB768156CEE4556F';
wwv_flow_imp.g_varchar2_table(660) := '5AF67E23A9A3678FEB103DE80EE92964002964F119E233C46788CCEC055804896B2D9E1B3335E11FC8110BF14DF97683A41A26CED2C799B6ECEE4752DCD3D9F6D2699B681EB7794469205792626A7BFC13B411D58D7DC65F4341C8EC456B96EEBC769D4A';
wwv_flow_imp.g_varchar2_table(661) := '4BA6F0F8F2DD3680276D575E7B4A0AEA391DD9432B287B04EA0F471FC639B5951DDF7D200068F4CFCF7FD30D5FFCD186A9ABD53527E1FF005FF9F357FE0DFA8E27E27FECFF00013F57F64D1F49A5F6CFFE2BF073F21FAFFCEFA6E27E1FEB3F53F64FC69F';
wwv_flow_imp.g_varchar2_table(662) := '7BACFC67FD7E1BF73EB389F41C4FC9FF00E5BEF759F8D34BFEBE87526983ED389F859F73A7FE0FF20FDCD0F49FBA7F89A4F58E8CD39A7ECD67DAF13ED75268FA4FA8E7FF0059FFD9';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(10584954961176268)
,p_file_name=>'istockphoto-1160720443-612x612.jpg'
,p_mime_type=>'image/jpeg'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8918066545801290)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>46517526241762
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8918355012801292)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>46517526242000
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8918612428801293)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>46517526242022
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8918985420801293)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>46517526242038
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8919265367801294)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>46517526242153
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8919534159801294)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>46517526242160
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8919879534801294)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>46517526242171
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8920140257801294)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>46517526242191
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8920475681801296)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>46517526242309
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8920729439801296)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>46517526242326
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8921005732801296)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>46517526242339
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8921224493801296)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>46517526242345
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8921560097801296)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>46517526242356
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(8921836920801297)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>46517526242369
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(8927968031801496)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>46517526271082
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/lov_using_buckets
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(10732818897157123)
,p_lov_name=>'LOV_USING_BUCKETS'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'BUCKETS'
,p_return_column_name=>'ID'
,p_display_column_name=>'BUCKET_DESCRIPTION'
,p_default_sort_column_name=>'BUCKET_DESCRIPTION'
,p_default_sort_direction=>'ASC'
,p_version_scn=>46568664876975
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8928185739801497)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(8922786924801305)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8922975689801307)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9130566894841960)
,p_short_name=>'UPLOAD_PAGE'
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(10392248547078820)
,p_short_name=>'Human_review_form'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(10618603742080772)
,p_short_name=>'BOT'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(10871440052788803)
,p_short_name=>'chat_bot'
,p_link=>'f?p=&APP_ID.:11:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11575379833478308)
,p_short_name=>'Status'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11605781543967854)
,p_short_name=>'PRBLM_MANAGEMENT'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11609479818988053)
,p_short_name=>'Master_document'
,p_link=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11610325354990287)
,p_short_name=>'Published_FAQ'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12247774444803916)
,p_short_name=>'Human_approval_page'
,p_link=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13535852129399014)
,p_short_name=>'FAQ_NON_SSO'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16117481118955235)
,p_short_name=>'Non_Agentic_AI'
,p_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>15
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(8923625236801343)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.2'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4072363937200175119
,p_is_locked=>false
,p_current_theme_style_id=>wwv_flow_imp.id(11789027615522567)
,p_default_page_template=>4072355960268175073
,p_default_dialog_template=>2100407606326202693
,p_error_template=>2101157952850466385
,p_printer_friendly_template=>4072355960268175073
,p_login_template=>2101157952850466385
,p_default_button_template=>4072362960822175091
,p_default_region_template=>4072358936313175081
,p_default_chart_template=>4072358936313175081
,p_default_form_template=>4072358936313175081
,p_default_reportr_template=>4072358936313175081
,p_default_tabform_template=>4072358936313175081
,p_default_wizard_template=>4072358936313175081
,p_default_menur_template=>2531463326621247859
,p_default_listr_template=>4072358936313175081
,p_default_irr_template=>2100526641005906379
,p_default_report_template=>2538654340625403440
,p_default_label_template=>1609121967514267634
,p_default_menu_template=>4072363345357175094
,p_default_calendar_template=>4072363550766175095
,p_default_list_template=>4072361143931175087
,p_default_nav_list_template=>2526754704087354841
,p_default_top_nav_list_temp=>2526754704087354841
,p_default_side_nav_list_temp=>2467739217141810545
,p_default_nav_list_position=>'TOP'
,p_default_dialogbtnr_template=>2126429139436695430
,p_default_dialogr_template=>4501440665235496320
,p_default_option_label=>1609121967514267634
,p_default_header_template=>1485369341786500999
,p_default_required_label=>1609122147107268652
,p_default_navbar_list_template=>2847543055748234966
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/24.2/')
,p_files_version=>67
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(11789027615522567)
,p_theme_id=>42
,p_name=>'Redwood Light (copy_1)'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_css_classes=>' rw-mode-header--dark rw-mode-nav--dark rw-mode-body-header--dark rw-mode-body--dark rw-pillar--pebble rw-layout--edge-to-edge'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_config=>'{"classes":["rw-layout--fixed t-PageBody--scrollTitle","rw-mode-header--dark","rw-mode-nav--dark","rw-mode-body-header--dark","rw-mode-body--dark","rw-pillar--pebble","rw-layout--fixed t-PageBody--scrollTitle","rw-layout--edge-to-edge"],"vars":{},"cu'
||'stomCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#11789027615522567.css'
,p_theme_roller_read_only=>false
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210D0A20436F707972696768742028632920323032302C20323032342C204F7261636C6520616E642F6F722069747320616666696C69617465732E0D0A202A2F0D0A';
wwv_flow_imp_shared.create_theme_file(
 p_id=>wwv_flow_imp.id(11789441687522579)
,p_theme_id=>42
,p_file_name=>'11789027615522567.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8922126162801297)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>46517526242440
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(8922435154801302)
,p_name=>'Oracle APEX Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>46517526242847
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'PAGE_VIEW'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8935734103801555)
,p_plug_name=>'PAGE_VIEW'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8943880053811944)
,p_plug_name=>'side_bar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8943939290811945)
,p_plug_name=>'content'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>9
,p_plug_display_column=>4
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22317891036922706)
,p_button_sequence=>40
,p_button_name=>'New'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'click me'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22317687488922704)
,p_name=>'P1_NEW'
,p_item_sequence=>30
,p_prompt=>'enter something'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Status'
,p_alias=>'STATUS'
,p_step_title=>'Status'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setInterval(function() {',
'    apex.region("pipeline_status_region").refresh();',
'    apex.region("progress_bar_region").refresh();',
'}, 15000);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11528225988875108)
,p_name=>'New'
,p_title=>'Job Summary'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT(*) AS value,',
'       ''Total Jobs'' AS label',
'FROM pipeline_jobs',
'UNION ALL',
'SELECT COUNT(*), ''Pending''',
'FROM pipeline_jobs WHERE status = ''PENDING''',
'UNION ALL',
'SELECT COUNT(*), ''Running''',
'FROM pipeline_jobs WHERE status = ''RUNNING''',
'UNION ALL',
'SELECT COUNT(*), ''Completed''',
'FROM pipeline_jobs WHERE status = ''COMPLETED''',
'UNION ALL',
'SELECT COUNT(*), ''Failed''',
'FROM pipeline_jobs WHERE status = ''FAILED'''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11528313150875109)
,p_query_column_id=>1
,p_column_alias=>'VALUE'
,p_column_display_sequence=>10
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11528456620875110)
,p_query_column_id=>2
,p_column_alias=>'LABEL'
,p_column_display_sequence=>20
,p_column_heading=>'Label'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11528660476875112)
,p_name=>'New'
,p_title=>'Jobs'
,p_region_name=>'pipeline_status_region'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    job_id,',
'    file_name,',
'    status,',
'    current_phase,',
'    progress_pct || ''%'' AS progress,',
'    phases_done || '' / '' || total_phases AS phases,',
'    progress_msg,',
'    TO_CHAR(started_at, ''YYYY-MM-DD HH24:MI:SS'') AS started,',
'    TO_CHAR(completed_at, ''YYYY-MM-DD HH24:MI:SS'') AS completed,',
'    CASE',
'        WHEN completed_at IS NOT NULL THEN',
'            ROUND((CAST(completed_at AS DATE) - CAST(started_at AS DATE)) * 24 * 60, 1) || '' min''',
'        WHEN started_at IS NOT NULL THEN',
'            ROUND((CAST(SYSTIMESTAMP AS DATE) - CAST(started_at AS DATE)) * 24 * 60, 1) || '' min (running)''',
'        ELSE ''Waiting''',
'    END AS duration,',
'    error_msg',
'FROM pipeline_jobs',
'ORDER BY job_id DESC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11528720431875113)
,p_query_column_id=>1
,p_column_alias=>'JOB_ID'
,p_column_display_sequence=>10
,p_column_heading=>'Job Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11528850037875114)
,p_query_column_id=>2
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'File Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11528973503875115)
,p_query_column_id=>3
,p_column_alias=>'STATUS'
,p_column_display_sequence=>30
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529006086875116)
,p_query_column_id=>4
,p_column_alias=>'CURRENT_PHASE'
,p_column_display_sequence=>40
,p_column_heading=>'Current Phase'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529125644875117)
,p_query_column_id=>5
,p_column_alias=>'PROGRESS'
,p_column_display_sequence=>50
,p_column_heading=>'Progress'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529231477875118)
,p_query_column_id=>6
,p_column_alias=>'PHASES'
,p_column_display_sequence=>60
,p_column_heading=>'Phases'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529364454875119)
,p_query_column_id=>7
,p_column_alias=>'PROGRESS_MSG'
,p_column_display_sequence=>70
,p_column_heading=>'Progress Msg'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529450398875120)
,p_query_column_id=>8
,p_column_alias=>'STARTED'
,p_column_display_sequence=>80
,p_column_heading=>'Started'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529564437875121)
,p_query_column_id=>9
,p_column_alias=>'COMPLETED'
,p_column_display_sequence=>90
,p_column_heading=>'Completed'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529676030875122)
,p_query_column_id=>10
,p_column_alias=>'DURATION'
,p_column_display_sequence=>100
,p_column_heading=>'Duration'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529747393875123)
,p_query_column_id=>11
,p_column_alias=>'ERROR_MSG'
,p_column_display_sequence=>110
,p_column_heading=>'Error Msg'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11529819264875124)
,p_name=>'New'
,p_title=>'Current Progress'
,p_region_name=>'progress_bar_region'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    NVL(current_phase, ''No active job'') AS phase,',
'    NVL(progress_pct, 0) AS pct,',
'    status',
'FROM pipeline_jobs',
'ORDER BY job_id DESC',
'FETCH FIRST 1 ROW ONLY'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11529913625875125)
,p_query_column_id=>1
,p_column_alias=>'PHASE'
,p_column_display_sequence=>10
,p_column_heading=>'Phase'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11530015173875126)
,p_query_column_id=>2
,p_column_alias=>'PCT'
,p_column_display_sequence=>20
,p_column_heading=>'Pct'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11530120304875127)
,p_query_column_id=>3
,p_column_alias=>'STATUS'
,p_column_display_sequence=>30
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11750547967401620)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_input_tokens number;',
'  v_output_tokens number;',
'  v_total_tokens number;',
'  v_total_cost number;',
'  v_run_date timestamp;',
'  v_html clob := '''';',
'begin',
'  select input_tokens, output_tokens, total_tokens, ',
'         total_cost, run_date',
'    into v_input_tokens, v_output_tokens, v_total_tokens,',
'         v_total_cost, v_run_date',
'  from token_usage_log',
'  order by run_date desc',
'  fetch first 1 row only;',
'',
'  v_html := ''<div style="display:flex;gap:16px;flex-wrap:wrap;">'';',
'',
'  v_html := v_html || ''<div style="background:#F1EFE8;padding:16px 20px;border-radius:8px;min-width:140px;">'';',
'  v_html := v_html || ''<p style="margin:0;font-size:13px;color:#888;">Input Tokens</p>'';',
'  v_html := v_html || ''<p style="margin:4px 0 0;font-size:22px;font-weight:600;">'' || to_char(v_input_tokens, ''999,999,999'') || ''</p>'';',
'  v_html := v_html || ''</div>'';',
'',
'  v_html := v_html || ''<div style="background:#F1EFE8;padding:16px 20px;border-radius:8px;min-width:140px;">'';',
'  v_html := v_html || ''<p style="margin:0;font-size:13px;color:#888;">Output Tokens</p>'';',
'  v_html := v_html || ''<p style="margin:4px 0 0;font-size:22px;font-weight:600;">'' || to_char(v_output_tokens, ''999,999,999'') || ''</p>'';',
'  v_html := v_html || ''</div>'';',
'',
'  v_html := v_html || ''<div style="background:#F1EFE8;padding:16px 20px;border-radius:8px;min-width:140px;">'';',
'  v_html := v_html || ''<p style="margin:0;font-size:13px;color:#888;">Total Tokens</p>'';',
'  v_html := v_html || ''<p style="margin:4px 0 0;font-size:22px;font-weight:600;">'' || to_char(v_total_tokens, ''999,999,999'') || ''</p>'';',
'  v_html := v_html || ''</div>'';',
'',
'  v_html := v_html || ''<div style="background:#EAF3DE;padding:16px 20px;border-radius:8px;min-width:140px;">'';',
'  v_html := v_html || ''<p style="margin:0;font-size:13px;color:#888;">Total Cost</p>'';',
'  v_html := v_html || ''<p style="margin:4px 0 0;font-size:22px;font-weight:600;color:#27500A;">$'' || to_char(v_total_cost, ''999.9999'') || ''</p>'';',
'  v_html := v_html || ''</div>'';',
'',
'  v_html := v_html || ''<div style="background:#E6F1FB;padding:16px 20px;border-radius:8px;min-width:140px;">'';',
'  v_html := v_html || ''<p style="margin:0;font-size:13px;color:#888;">Last Run</p>'';',
'  v_html := v_html || ''<p style="margin:4px 0 0;font-size:14px;font-weight:600;">'' || to_char(v_run_date, ''DD-MON-YYYY HH24:MI'') || ''</p>'';',
'  v_html := v_html || ''</div>'';',
'',
'  v_html := v_html || ''</div>'';',
'',
'  return v_html;',
'',
'exception',
'  when no_data_found then',
'    return ''<p style="color:#888;">No pipeline runs recorded yet.</p>'';',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'PRBLM_MANAGEMENT'
,p_alias=>'PRBLM-MANAGEMENT'
,p_step_title=>'PRBLM_MANAGEMENT'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530251325875128)
,p_plug_name=>'Human_Intervention_Needed'
,p_title=>'Human Action Needed'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530347608875129)
,p_plug_name=>'content'
,p_title=>' '
,p_parent_plug_id=>wwv_flow_imp.id(11530251325875128)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select bucket_no,bucket_description,bucket_topic,bucket_solution from BUCKETS where label = ''HUMAN'';'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>8
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(11530422227875130)
,p_region_id=>wwv_flow_imp.id(11530347608875129)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'BUCKET_TOPIC'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<h4>&BUCKET_DESCRIPTION.</h4>'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<p><strong>Solution : </strong>&BUCKET_SOLUTION.</p>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(12171324222943830)
,p_card_id=>wwv_flow_imp.id(11530422227875130)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_HIDDEN:&BUCKET_NO.'
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'FAQ_NON_SSO'
,p_alias=>'FAQ-NON-SSO'
,p_step_title=>'FAQ_NON_SSO'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.faq-wrapper {',
'    max-width: 680px;',
'    margin: 40px auto;',
'    font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif;',
'}',
'',
'.faq-header {',
'    background: #312D2A;',
'    padding: 16px 24px;',
'    border-radius: 12px 12px 0 0;',
'}',
'',
'.faq-logo {',
'    color: #C74634;',
'    font-weight: 800;',
'    font-size: 13px;',
'    letter-spacing: 1px;',
'    margin-right: 10px;',
'}',
'',
'.faq-title {',
'    color: white;',
'    font-size: 17px;',
'    font-weight: 600;',
'}',
'',
'.faq-empty {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 60px 24px;',
'    text-align: center;',
'    color: #706D69;',
'    font-size: 15px;',
'}',
'',
'.faq-answer-box {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 24px;',
'    animation: fadeIn 0.3s ease;',
'}',
'',
'.faq-answer-label {',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'    letter-spacing: 1px;',
'    color: #706D69;',
'    margin-bottom: 12px;',
'}',
'',
'.faq-matched-q {',
'    background: white;',
'    border-left: 3px solid #C74634;',
'    padding: 10px 14px;',
'    margin-bottom: 16px;',
'    font-size: 14px;',
'    font-weight: 600;',
'    color: #312D2A;',
'    border-radius: 0 8px 8px 0;',
'}',
'',
'.faq-answer-text {',
'    background: white;',
'    padding: 16px;',
'    border-radius: 8px;',
'    border: 1px solid #E0DDD9;',
'    font-size: 14px;',
'    line-height: 1.7;',
'    color: #312D2A;',
'    white-space: pre-wrap;',
'}',
'',
'.faq-meta {',
'    display: flex;',
'    gap: 16px;',
'    margin-top: 12px;',
'    font-size: 12px;',
'}',
'',
'.faq-meta-cat {',
'    color: #706D69;',
'    background: white;',
'    padding: 4px 10px;',
'    border-radius: 12px;',
'    border: 1px solid #E0DDD9;',
'}',
'',
'.faq-meta-score {',
'    color: #3A7D34;',
'    font-weight: 700;',
'    background: #E8F5E9;',
'    padding: 4px 10px;',
'    border-radius: 12px;',
'}',
'',
'.faq-loading {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 40px 24px;',
'    text-align: center;',
'    color: #706D69;',
'    font-size: 14px;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    gap: 10px;',
'}',
'',
'.faq-spinner {',
'    width: 20px;',
'    height: 20px;',
'    border: 3px solid #E0DDD9;',
'    border-top: 3px solid #C74634;',
'    border-radius: 50%;',
'    animation: spin 0.8s linear infinite;',
'}',
'',
'.faq-input-area {',
'    display: flex;',
'    gap: 0;',
'    background: white;',
'    border: 1px solid #E0DDD9;',
'    border-top: none;',
'    border-radius: 0 0 12px 12px;',
'    overflow: hidden;',
'}',
'',
'.faq-input-area input {',
'    flex: 1;',
'    padding: 14px 18px;',
'    border: none;',
'    font-size: 14px;',
'    outline: none;',
'    background: white;',
'    color: #312D2A;',
'}',
'',
'.faq-input-area input::placeholder {',
'    color: #B0ADA9;',
'}',
'',
'.faq-input-area button {',
'    padding: 14px 28px;',
'    background: #C74634;',
'    color: white;',
'    border: none;',
'    font-size: 14px;',
'    font-weight: 700;',
'    cursor: pointer;',
'    min-width: 80px;',
'    transition: background 0.2s;',
'}',
'',
'.faq-input-area button:hover {',
'    background: #A83A2C;',
'}',
'',
'.faq-input-area button:disabled {',
'    background: #B0ADA9;',
'    cursor: wait;',
'}',
'',
'@keyframes fadeIn {',
'    from { opacity: 0; transform: translateY(8px); }',
'    to   { opacity: 1; transform: translateY(0); }',
'}',
'',
'@keyframes spin {',
'    to { transform: rotate(360deg); }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12172410240943841)
,p_plug_name=>'faq_region'
,p_title=>'FAQ Assistant'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="faq-wrapper">',
'',
'    <div class="faq-header">',
'        <span class="faq-logo">ORACLE</span>',
'        <span class="faq-title">FAQ Assistant</span>',
'    </div>',
'',
'    <div id="faq-answer-box" class="faq-answer-box" style="display:none;">',
'        <div class="faq-answer-label">Answer</div>',
'        <div id="faq-matched-q" class="faq-matched-q"></div>',
'        <div id="faq-answer-text" class="faq-answer-text"></div>',
'        <div id="faq-meta" class="faq-meta"></div>',
'    </div>',
'',
'    <div id="faq-empty" class="faq-empty">',
unistr('        \D83D\DC4B Ask me anything about Oracle University services.'),
'    </div>',
'',
'    <div id="faq-loading" class="faq-loading" style="display:none;">',
'        <div class="faq-spinner"></div>',
'        <span>Searching FAQs...</span>',
'    </div>',
'',
'    <div class="faq-input-area">',
'        <input type="text" id="faq-input"',
'               placeholder="Type your question here..."',
'               autocomplete="off"',
'               maxlength="500" />',
'        <button id="faq-btn" onclick="submitQuestion()">',
'            Ask',
'        </button>',
'    </div>',
'',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12172525679943842)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ASK_FAQ'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_question VARCHAR2(4000);',
'    v_result   CLOB;',
'BEGIN',
'    v_question := APEX_APPLICATION.G_X01;',
'',
'    IF v_question IS NULL OR LENGTH(TRIM(v_question)) = 0 THEN',
'        HTP.P(''{"answer":"Please type a question."}'');',
'        RETURN;',
'    END IF;',
'',
'    v_result := ask_faq(v_question);',
'    HTP.P(v_result);',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        HTP.P(''{"answer":"Error: '' || REPLACE(SQLERRM, ''"'', '''''''') || ''"}'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12172525679943842
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Human_review_form'
,p_alias=>'HUMAN-REVIEW-FORM'
,p_step_title=>'Human_review_form'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E0DFDE !important;',
'    color: #E0DFDE !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}',
'',
'',
'/* Approve & Publish button */',
'#B11751328242401628 {',
'    background: #c0392b !important;',
'    color: white !important;',
'    padding: 14px 20px !important;',
'    border: none !important;',
'    border-radius: 8px !important;',
'    font-size: 15px !important;',
'    font-weight: 600 !important;',
'    width: 100% !important;',
'    cursor: pointer;',
'    transition: all 0.3s ease;',
'}',
'',
'#B11751328242401628 .t-Button-label {',
'    color: white !important;',
'}',
'',
'#B11751328242401628:hover {',
'    background: #922b21 !important;',
'    transform: scale(1.02);',
'    box-shadow: 0 4px 12px rgba(192, 57, 43, 0.4);',
'}',
'',
'/* Reject Topic button */',
'#B11751413494401629 {',
'    background: white !important;',
'    color: #c0392b !important;',
'    padding: 14px 20px !important;',
'    border: 1px solid #eee !important;',
'    border-radius: 8px !important;',
'    font-size: 15px !important;',
'    font-weight: 600 !important;',
'    width: 100% !important;',
'    cursor: pointer;',
'    transition: all 0.3s ease;',
'}',
'',
'#B11751413494401629 .t-Button-label {',
'    color: #c0392b !important;',
'}',
'',
'#B11751413494401629:hover {',
'    background: #fdecea !important;',
'    border-color: #c0392b !important;',
'    transform: scale(1.02);',
'    box-shadow: 0 4px 12px rgba(192, 57, 43, 0.2);',
'}',
'',
'',
'#topic{',
'    background-color: #E0DFDE;',
'}',
'',
'',
'/* =====================================================',
'   REGION BODY BACKGROUND COLOR (NOT HEADER)',
'===================================================== */',
'.t-Region .t-Region-body {',
'    background-color: #E0DFDE !important;',
'}',
'',
'/* =====================================================',
'   REGION TITLES - ACCENT 14 COLOR',
'===================================================== */',
'/* =====================================================',
'   REGION TITLES - ACCENT 14 COLOR',
'===================================================== */',
'.t-Region-title,',
'.t-Region-header h2,',
'.t-Region-header .t-Region-title,',
'h2.t-Region-title {',
'    color: #6F757E !important;',
'}',
'',
'',
'',
'/* =====================================================',
'   SOLUTION REGION - BORDERLESS, FILLED #E0DFDE',
'===================================================== */',
'#R10399943205171235 {',
'    background-color: #E0DFDE !important;',
'    border: none !important;',
'    box-shadow: none !important;',
'}',
'',
'#R10399943205171235 .t-Region-header {',
'    background-color: #E0DFDE !important;',
'    border: none !important;',
'}',
'',
'#R10399943205171235 .t-Region-body {',
'    background-color: #E0DFDE !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8944034989811946)
,p_plug_name=>'side_bar'
,p_title=>' '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>3
,p_plug_display_column=>1
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8944206455811948)
,p_plug_name=>'topic_wise'
,p_title=>' '
,p_parent_plug_id=>wwv_flow_imp.id(8944034989811946)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10396631642171202)
,p_plug_name=>'cards'
,p_parent_plug_id=>wwv_flow_imp.id(8944206455811948)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    COUNT(*) AS value,',
'    ''Total'' AS label,',
'    ''blue-card'' AS card_class',
'FROM buckets',
'WHERE status IN (''NEW'', ''AI_UPDATE'') and label=''GENERIC''',
'',
'UNION ALL',
'',
'SELECT ',
'    COUNT(*) AS value,',
'    ''NEW'' AS label,',
'    ''brown-card'' AS card_class',
'FROM buckets',
'WHERE status = ''NEW'' and label=''GENERIC''',
'',
'UNION ALL',
'',
'SELECT ',
'    COUNT(*) AS value,',
'    ''Approved'' AS label,',
'    ''green-card'' AS card_class',
'FROM buckets',
'WHERE status = ''APPROVED'' and label=''GENERIC''',
'',
'UNION ALL',
'',
'SELECT ',
'    COUNT(*) AS value,',
'    ''AI_UPDATE'' AS label,',
'    ''red-card'' AS card_class',
'FROM buckets',
'WHERE status = ''AI_UPDATE'' and label=''GENERIC'';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P5_SR_STATUS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10396717058171203)
,p_region_id=>wwv_flow_imp.id(10396631642171202)
,p_layout_type=>'GRID'
,p_grid_column_count=>2
,p_title_adv_formatting=>false
,p_title_column_name=>'VALUE'
,p_title_css_classes=>'#CARD_CLASS#'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'LABEL'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(11532441087875150)
,p_card_id=>wwv_flow_imp.id(10396717058171203)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_LOV_STATUS:&LABEL.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8944435597811950)
,p_plug_name=>'LOV'
,p_title=>'<span style="color:#9C27B0;">New</span> | <span style="color:#C2185B;">AI</span> | <span style="color:#2E7D32;">Approved</span>'
,p_parent_plug_id=>wwv_flow_imp.id(8944034989811946)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from buckets ',
'where (',
'    :P5_LOV_STATUS = ''Total'' ',
'    or status = :P5_LOV_STATUS',
') and label=''GENERIC'';'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P5_SR_STATUS'
,p_plug_query_num_rows=>8
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10606411822902524)
,p_region_id=>wwv_flow_imp.id(8944435597811950)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'BUCKET_TOPIC'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(10609031729902550)
,p_card_id=>wwv_flow_imp.id(10606411822902524)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_HIDDEN,P5_TOPIC,P5_SR_STATUS:&BUCKET_NO.,&BUCKET_TOPIC.,&STATUS.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10396876132171204)
,p_plug_name=>'description'
,p_title=>' '
,p_region_name=>'topic'
,p_parent_plug_id=>wwv_flow_imp.id(8944034989811946)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3 >Generic Topics',
'</h3>',
'<p >Oracle University SR - week &P9_WEEKS.</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8944184016811947)
,p_plug_name=>'content'
,p_title=>'<div class="header-bar" style="background-color:#6F757E; color:#FFFFFF"> <span class="title" style="color:#FFFFFF;font-size:24px">FAQ Review / &P5_TOPIC.</span>  </div>'
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>9
,p_plug_display_column=>4
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10396951381171205)
,p_plug_name=>'Prob_description'
,p_title=>'PROBLEM DESCRIPTION'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>7
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_desc varchar2(4000);',
'begin',
'  select bucket_description ',
'    into v_desc',
'  from buckets ',
'  where bucket_no = :P5_HIDDEN;',
'  ',
'  return v_desc;',
'exception',
'  when no_data_found then',
'    return null;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10397047523171206)
,p_plug_name=>'AI_Summary'
,p_title=>'AI SUMMARY'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>7
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_desc        varchar2(4000);',
'  v_root_cause  varchar2(4000);',
'begin',
'  select AI_SUMMARY, ROOT_CAUSE',
'    into v_desc, v_root_cause',
'  from buckets ',
'  where bucket_no = :P5_HIDDEN;',
'',
'  return  v_root_cause || chr(10) || chr(10) ||v_desc;',
'',
'exception',
'  when no_data_found then',
'    return null;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10397198479171207)
,p_plug_name=>'Solution'
,p_title=>'SOLUTION'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10397265056171208)
,p_plug_name=>'SR'
,p_title=>'<div class="header-bar" style="background-color:#6F757E; color:#FFFFFF"> <span class="title" style="color:#FFFFFF">TOPIC DETAILS</span>  </div>'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_confidence varchar2(4000);',
'  v_label varchar2(4000);',
'  v_sr_nos varchar2(4000);',
'  v_sr_count number;',
'begin',
'  select confidence, label, sr_nos',
'    into v_confidence, v_label, v_sr_nos',
'  from buckets',
'  where bucket_no = :P5_HIDDEN;',
'',
'  v_sr_count := regexp_count(v_sr_nos, '';'') + 1;',
'',
'  return ''<b>Weightage:</b> '' || v_confidence || ''<br>'' ||',
'         ''<b>Label:</b> '' || v_label || ''<br>'' ||',
'         ''<b>Total SR Count:</b> '' || v_sr_count;',
'exception',
'  when no_data_found then',
'    return '''';',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10397423006171210)
,p_plug_name=>'Actions'
,p_title=>'<div class="header-bar" style="background-color:#6F757E; color:#FFFFFF"> <span class="title" style="color:#FFFFFF">ACTIONS</span>  </div>'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P5_SR_STATUS'
,p_plug_display_when_cond2=>'AI_UPDATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10398405248171220)
,p_plug_name=>'Sr_search'
,p_title=>'<div class="header-bar" style="background-color:#6F757E; color:#FFFFFF"> <span class="title" style="color:#FFFFFF">SR SEARCH</span>  </div>'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10398521061171221)
,p_plug_name=>'action_log'
,p_title=>'<div class="header-bar" style="background-color:#6F757E; color:#FFFFFF"> <span class="title" style="color:#FFFFFF">ACTION LOG</span>  </div>'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:flex;flex-direction:column;gap:0;">',
'',
'  <!-- UPDATED -->',
'  <div style="padding:16px 20px;border-bottom:1px solid #eee;">',
'    <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">',
'      <span style="padding:3px 10px;border-radius:4px;font-size:11px;font-weight:600;letter-spacing:0.5px;background:#E1F5EE;color:#085041;">UPDATED</span>',
'      <span style="font-size:15px;font-weight:600;">AI Engine</span>',
'    </div>',
'    <p style="margin:0 0 6px;font-size:13px;color:#888;">26JAN12-000102</p>',
'    <p style="margin:0;font-size:14px;line-height:1.5;">Pre-week-6 certificate migration issue detected in 11 new SRs</p>',
'  </div>',
'',
'  <!-- REJECTED -->',
'  <div style="padding:16px 20px;border-bottom:1px solid #eee;">',
'    <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">',
'      <span style="padding:3px 10px;border-radius:4px;font-size:11px;font-weight:600;letter-spacing:0.5px;background:#FCEBEB;color:#791F1F;">REJECTED</span>',
'      <span style="font-size:15px;font-weight:600;">Anjali Rao</span>',
'    </div>',
'    <p style="margin:0 0 6px;font-size:13px;color:#888;">25NOV28-000199</p>',
unistr('    <p style="margin:0;font-size:14px;line-height:1.5;">Suggested rewording declined \2014 original phrasing preferred</p>'),
'  </div>',
'',
'  <!-- APPROVED -->',
'  <div style="padding:16px 20px;">',
'    <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px;">',
'      <span style="padding:3px 10px;border-radius:4px;font-size:11px;font-weight:600;letter-spacing:0.5px;background:#EAF3DE;color:#27500A;">APPROVED</span>',
'      <span style="font-size:15px;font-weight:600;">James Liu</span>',
'    </div>',
'    <p style="margin:0 0 6px;font-size:13px;color:#888;">25NOV10-000034</p>',
unistr('    <p style="margin:0;font-size:14px;line-height:1.5;">Approved after minor edit to step 3 \2014 added Chrome as preferred browser</p>'),
'  </div>',
'',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10399774210171233)
,p_plug_name=>'Sr'
,p_title=>'Service Request'
,p_parent_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10400279058171238)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(10399774210171233)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trim(regexp_substr(sr_nos, ''[^;]+'', 1, level)) as sr_no',
'from buckets',
'where bucket_no = :P5_HIDDEN',
'connect by level <= regexp_count(sr_nos, '';'') + 1',
'  and prior bucket_no = bucket_no',
'  and prior sys_guid() is not null'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(10400350371171239)
,p_region_id=>wwv_flow_imp.id(10400279058171238)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'SR_NO'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11751328242401628)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10397423006171210)
,p_button_name=>'BTN_APPROVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Approve & Publish'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-success-bg u-color-1-text'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10399615988171232)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10398405248171220)
,p_button_name=>'Open'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Open'
,p_grid_new_row=>'N'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11751413494401629)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10397423006171210)
,p_button_name=>'BTN_REJECT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reject Topic'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'u-danger-text'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11750164681401616)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(10397198479171207)
,p_button_name=>'BTN_USE_CURRENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'USE CURRENT SOLUTION'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P5_SR_STATUS'
,p_button_condition2=>'AI_UPDATE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11750296268401617)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10397198479171207)
,p_button_name=>'BTN_AI_SOLUTION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'APPROVE AI SOLUTION'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P5_SR_STATUS'
,p_button_condition2=>'AI_UPDATE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10399525602171231)
,p_name=>'P5_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10398405248171220)
,p_prompt=>'eg.029292-38383'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_colspan=>8
,p_grid_column=>1
,p_field_template=>1609121967514267634
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10606081963902520)
,p_name=>'P9_WEEKS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10396876132171204)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10608661231902546)
,p_name=>'P5_STORE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8944184016811947)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11527588390875101)
,p_name=>'P5_HIDDEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8944435597811950)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11527677118875102)
,p_name=>'P5_TOPIC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8944435597811950)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11531187191875137)
,p_name=>'P5_SOLUTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10397198479171207)
,p_prompt=>'Solution'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cHeight=>25
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11531945750875145)
,p_name=>'P5_SR_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8944435597811950)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749768877401612)
,p_name=>'P5_LOV_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8944435597811950)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11749861017401613)
,p_name=>'P5_AI_SOLUTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10397198479171207)
,p_prompt=>'Ai Solution'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>25
,p_begin_on_new_line=>'N'
,p_display_when=>'P5_SR_STATUS'
,p_display_when2=>'AI_UPDATE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11750419531401619)
,p_computation_sequence=>10
,p_computation_item=>'P9_WEEKS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select floor((sysdate - date ''2026-03-15'') / 7) from dual'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11751503232401630)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11751328242401628)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11751625717401631)
,p_event_id=>wwv_flow_imp.id(11751503232401630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    insert into master_report (',
'        bucket_no, bucket_description, bucket_solution,',
'        SR_NOs, bucket_topic, label, status, AI_summary,',
'        bucket_Description_embedding,',
'        bucket_solution_embedding, confidence',
'    )',
'    select bucket_no, bucket_description, ',
'           bucket_solution,',
'           SR_NOs, bucket_topic, label, ''APPROVED'', AI_summary,',
'           bucket_Description_embedding,',
'           bucket_solution_embedding, confidence',
'    from buckets',
'    where bucket_no = :P5_HIDDEN;',
'',
'    delete from buckets where bucket_no = :P5_HIDDEN;',
'    commit;',
'',
'    :P5_HIDDEN := null;',
'end;'))
,p_attribute_02=>'P5_HIDDEN'
,p_attribute_03=>'P5_HIDDEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11751752209401632)
,p_event_id=>wwv_flow_imp.id(11751503232401630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11751828096401633)
,p_name=>'New_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11751413494401629)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11751934915401634)
,p_event_id=>wwv_flow_imp.id(11751828096401633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update buckets ',
'    set status = ''HUMAN'', label = ''HUMAN'' ',
'    where bucket_no = :P5_HIDDEN;',
'    ',
'    commit;',
'',
'    :P5_HIDDEN := null;',
'end;'))
,p_attribute_02=>'P5_HIDDEN'
,p_attribute_03=>'P5_HIDDEN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11752036556401635)
,p_event_id=>wwv_flow_imp.id(11751828096401633)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11752140059401636)
,p_name=>'New_2'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11750164681401616)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11752211188401637)
,p_event_id=>wwv_flow_imp.id(11752140059401636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    insert into master_report (',
'        bucket_no, bucket_description, bucket_solution,',
'        SR_NOs, bucket_topic, label, status, AI_summary,',
'        bucket_Description_embedding,',
'        bucket_solution_embedding, confidence',
'    )',
'    select bucket_no, bucket_description, ',
'           bucket_solution,',
'           SR_NOs, bucket_topic, label, ''APPROVED'', AI_summary,',
'           bucket_Description_embedding,',
'           bucket_solution_embedding, confidence',
'    from buckets',
'    where bucket_no = :P5_HIDDEN;',
'',
'    delete from buckets where bucket_no = :P5_HIDDEN;',
'    commit;',
'',
'    :P5_HIDDEN := null;',
'end;'))
,p_attribute_02=>'P5_HIDDEN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11752352712401638)
,p_event_id=>wwv_flow_imp.id(11752140059401636)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload()'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11752457712401639)
,p_name=>'New_3'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11750296268401617)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11752556768401640)
,p_event_id=>wwv_flow_imp.id(11752457712401639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    insert into master_report (',
'        bucket_no, bucket_description, bucket_solution,',
'        SR_NOs, bucket_topic, label, status, AI_summary,',
'        bucket_Description_embedding,',
'        bucket_solution_embedding, confidence',
'    )',
'    select bucket_no, bucket_description, ',
'           AI_update_solution,',
'           SR_NOs, bucket_topic, label, ''APPROVED'', AI_summary,',
'           bucket_Description_embedding,',
'           bucket_solution_embedding, confidence',
'    from buckets',
'    where bucket_no = :P5_HIDDEN;',
'',
'    delete from buckets where bucket_no = :P5_HIDDEN;',
'    commit;',
'',
'    :P5_HIDDEN := null;',
'end;'))
,p_attribute_02=>'P5_HIDDEN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11752663702401641)
,p_event_id=>wwv_flow_imp.id(11752457712401639)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'location.reload()'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11750025807401615)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Bucket Details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select dbms_xmlgen.convert(bucket_solution, 1),',
'           dbms_xmlgen.convert(ai_update_solution, 1),',
'           bucket_topic,',
'           status',
'      into :P5_SOLUTION,',
'           :P5_AI_SOLUTION,',
'           :P5_TOPIC,',
'           :P5_SR_STATUS',
'    from buckets',
'    where bucket_no = :P5_HIDDEN;',
'exception',
'    when no_data_found then',
'        :P5_SOLUTION := '''';',
'        :P5_AI_SOLUTION := '''';',
'        :P5_TOPIC := '''';',
'        :P5_SR_STATUS := '''';',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P5_HIDDEN'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>11750025807401615
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'UPLOAD_PAGE'
,p_alias=>'UPLOAD-PAGE'
,p_step_title=>'UPLOAD_PAGE'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9130069684841959)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8922786924801305)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11528081860875106)
,p_plug_name=>'Upload CSV File'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8942362701811929)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11528081860875106)
,p_button_name=>'BTN_SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'UPLOAD'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8942246144811928)
,p_name=>'P_FILE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11528081860875106)
,p_prompt=>'P File'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11528145315875107)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save File and Create Job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_upload_id NUMBER;',
'    v_file_name VARCHAR2(200);',
'    v_blob      BLOB;',
'BEGIN',
'    -- Get uploaded file',
'    SELECT filename, blob_content',
'    INTO v_file_name, v_blob',
'    FROM apex_application_temp_files',
'    WHERE name = :P_FILE;',
'',
'    -- Save to uploads table',
'    INSERT INTO pipeline_uploads (file_name, file_content, uploaded_by)',
'    VALUES (v_file_name, v_blob, :APP_USER)',
'    RETURNING upload_id INTO v_upload_id;',
'',
'    -- Create pipeline job',
'    INSERT INTO pipeline_jobs (upload_id, file_name, status, current_phase, progress_msg)',
'    VALUES (v_upload_id, v_file_name, ''PENDING'', ''Waiting for VM to pick up'', ''Job queued'');',
'',
'    COMMIT;',
'',
'    -- Success message',
'    apex_application.g_print_success_message :=',
'        ''Pipeline job created successfully. Job ID: '' || v_upload_id ||',
'        ''. Go to Status Dashboard to track progress.'';',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11528145315875107
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'BOT'
,p_alias=>'BOT'
,p_step_title=>'BOT'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10605778948902517)
,p_button_sequence=>10
,p_button_name=>'Example'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Show AI Assistant'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10605877598902518)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(10605778948902517)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10605935571902519)
,p_event_id=>wwv_flow_imp.id(10605877598902518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_attribute_01=>'DIALOG'
,p_attribute_14=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Certificatio Issue',
''))
,p_attribute_15=>'Exam related Issue'
,p_ai_config_id=>wwv_flow_imp.id(10602244763827263)
);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Master_document'
,p_alias=>'MASTER-DOCUMENT'
,p_step_title=>'Master_document'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530852944875134)
,p_plug_name=>'MASTER REPORT'
,p_title=>'Master Document Details'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530976428875135)
,p_plug_name=>'content'
,p_title=>' '
,p_parent_plug_id=>wwv_flow_imp.id(11530852944875134)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select * from master_report;'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(11531060122875136)
,p_region_id=>wwv_flow_imp.id(11530976428875135)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'BUCKET_TOPIC'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<h4>&BUCKET_DESCRIPTION.</h4>'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<P><strong>Solution : </strong>&BUCKET_SOLUTION.</P>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_name=>'Published_FAQ'
,p_alias=>'PUBLISHED-FAQ'
,p_step_title=>'Published_FAQ'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530566185875131)
,p_plug_name=>'FAQ Content'
,p_title=>'FAQ Content'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11530602121875132)
,p_plug_name=>'faq_content'
,p_parent_plug_id=>wwv_flow_imp.id(11530566185875131)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select * from FAQ_DOCUMENT;'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(11530746213875133)
,p_region_id=>wwv_flow_imp.id(11530602121875132)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'SUBTYPE'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>'<h4>&QUESTION.</h4>'
,p_body_adv_formatting=>true
,p_body_html_expr=>'<P><strong>Solution : </strong>&ANSWER.</P>'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10
,p_name=>'non_sso_with_cost'
,p_alias=>'NON-SSO-WITH-COST'
,p_step_title=>'non_sso_with_cost'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById(''faq-input'').addEventListener(''keydown'', function(e) {',
'    if (e.key === ''Enter'') {',
'        e.preventDefault();',
'        submitQuestion();',
'    }',
'});',
'',
'function submitQuestion() {',
'    var input = document.getElementById(''faq-input'');',
'    var question = input.value.trim();',
'    if (!question) return;',
'',
'    var btn       = document.getElementById(''faq-btn'');',
'    var answerBox = document.getElementById(''faq-answer-box'');',
'    var emptyBox  = document.getElementById(''faq-empty'');',
'    var loading   = document.getElementById(''faq-loading'');',
'',
'    // Disable while processing',
'    btn.disabled = true;',
'    btn.textContent = ''...'';',
'    input.disabled = true;',
'',
'    // Hide previous answer, show loading',
'    answerBox.style.display = ''none'';',
'    emptyBox.style.display  = ''none'';',
'    loading.style.display   = ''flex'';',
'',
'    // Call APEX AJAX process',
'    apex.server.process(''ASK_FAQ'', {',
'        x01: question',
'    }, {',
'        success: function(data) {',
'            loading.style.display = ''none'';',
'',
'            var result;',
'            try {',
'                result = (typeof data === ''string'') ? JSON.parse(data) : data;',
'            } catch(e) {',
'                result = { answer: ''Sorry, something went wrong.'' };',
'            }',
'',
'            // Show matched question',
'            var matchedQ = document.getElementById(''faq-matched-q'');',
'            if (result.question) {',
unistr('                matchedQ.textContent = ''\D83D\DCCC '' + result.question;'),
'                matchedQ.style.display = ''block'';',
'            } else {',
'                matchedQ.style.display = ''none'';',
'            }',
'',
'            // Show answer',
'            document.getElementById(''faq-answer-text'').textContent = result.answer || ''No answer found.'';',
'',
'            // Show meta (category + score)',
'            var meta = document.getElementById(''faq-meta'');',
'            meta.innerHTML = '''';',
'            if (result.type) {',
unistr('                meta.innerHTML += ''<span class="faq-meta-cat">\D83D\DCC1 '' + escapeHtml(result.type) + ''</span>'';'),
'            }',
'            if (result.score) {',
'                var pct = Math.round(parseFloat(result.score) * 100);',
unistr('                meta.innerHTML += ''<span class="faq-meta-score">\2713 '' + pct + ''% match</span>'';'),
'            }',
'',
'            answerBox.style.display = ''block'';',
'',
'            // Re-enable',
'            btn.disabled = false;',
'            btn.textContent = ''Ask'';',
'            input.disabled = false;',
'            input.value = '''';',
'            input.focus();',
'        },',
'        error: function() {',
'            loading.style.display   = ''none'';',
'            emptyBox.style.display  = ''none'';',
'            answerBox.style.display = ''block'';',
'            document.getElementById(''faq-matched-q'').style.display = ''none'';',
'            document.getElementById(''faq-answer-text'').textContent = ''An error occurred. Please try again.'';',
'            document.getElementById(''faq-meta'').innerHTML = '''';',
'',
'            btn.disabled = false;',
'            btn.textContent = ''Ask'';',
'            input.disabled = false;',
'            input.focus();',
'        }',
'    });',
'}',
'',
'function escapeHtml(text) {',
'    var d = document.createElement(''div'');',
'    d.appendChild(document.createTextNode(text));',
'    return d.innerHTML;',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.faq-wrapper {',
'    max-width: 680px;',
'    margin: 40px auto;',
'    font-family: -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, sans-serif;',
'}',
'',
'.faq-header {',
'    background: #312D2A;',
'    padding: 16px 24px;',
'    border-radius: 12px 12px 0 0;',
'}',
'',
'.faq-logo {',
'    color: #C74634;',
'    font-weight: 800;',
'    font-size: 13px;',
'    letter-spacing: 1px;',
'    margin-right: 10px;',
'}',
'',
'.faq-title {',
'    color: white;',
'    font-size: 17px;',
'    font-weight: 600;',
'}',
'',
'.faq-empty {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 60px 24px;',
'    text-align: center;',
'    color: #706D69;',
'    font-size: 15px;',
'}',
'',
'.faq-answer-box {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 24px;',
'    animation: fadeIn 0.3s ease;',
'}',
'',
'.faq-answer-label {',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'    letter-spacing: 1px;',
'    color: #706D69;',
'    margin-bottom: 12px;',
'}',
'',
'.faq-matched-q {',
'    background: white;',
'    border-left: 3px solid #C74634;',
'    padding: 10px 14px;',
'    margin-bottom: 16px;',
'    font-size: 14px;',
'    font-weight: 600;',
'    color: #312D2A;',
'    border-radius: 0 8px 8px 0;',
'}',
'',
'.faq-answer-text {',
'    background: white;',
'    padding: 16px;',
'    border-radius: 8px;',
'    border: 1px solid #E0DDD9;',
'    font-size: 14px;',
'    line-height: 1.7;',
'    color: #312D2A;',
'    white-space: pre-wrap;',
'}',
'',
'.faq-meta {',
'    display: flex;',
'    gap: 16px;',
'    margin-top: 12px;',
'    font-size: 12px;',
'}',
'',
'.faq-meta-cat {',
'    color: #706D69;',
'    background: white;',
'    padding: 4px 10px;',
'    border-radius: 12px;',
'    border: 1px solid #E0DDD9;',
'}',
'',
'.faq-meta-score {',
'    color: #3A7D34;',
'    font-weight: 700;',
'    background: #E8F5E9;',
'    padding: 4px 10px;',
'    border-radius: 12px;',
'}',
'',
'.faq-loading {',
'    background: #F7F6F4;',
'    border-left: 1px solid #E0DDD9;',
'    border-right: 1px solid #E0DDD9;',
'    padding: 40px 24px;',
'    text-align: center;',
'    color: #706D69;',
'    font-size: 14px;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    gap: 10px;',
'}',
'',
'.faq-spinner {',
'    width: 20px;',
'    height: 20px;',
'    border: 3px solid #E0DDD9;',
'    border-top: 3px solid #C74634;',
'    border-radius: 50%;',
'    animation: spin 0.8s linear infinite;',
'}',
'',
'.faq-input-area {',
'    display: flex;',
'    gap: 0;',
'    background: white;',
'    border: 1px solid #E0DDD9;',
'    border-top: none;',
'    border-radius: 0 0 12px 12px;',
'    overflow: hidden;',
'}',
'',
'.faq-input-area input {',
'    flex: 1;',
'    padding: 14px 18px;',
'    border: none;',
'    font-size: 14px;',
'    outline: none;',
'    background: white;',
'    color: #312D2A;',
'}',
'',
'.faq-input-area input::placeholder {',
'    color: #B0ADA9;',
'}',
'',
'.faq-input-area button {',
'    padding: 14px 28px;',
'    background: #C74634;',
'    color: white;',
'    border: none;',
'    font-size: 14px;',
'    font-weight: 700;',
'    cursor: pointer;',
'    min-width: 80px;',
'    transition: background 0.2s;',
'}',
'',
'.faq-input-area button:hover {',
'    background: #A83A2C;',
'}',
'',
'.faq-input-area button:disabled {',
'    background: #B0ADA9;',
'    cursor: wait;',
'}',
'',
'@keyframes fadeIn {',
'    from { opacity: 0; transform: translateY(8px); }',
'    to   { opacity: 1; transform: translateY(0); }',
'}',
'',
'@keyframes spin {',
'    to { transform: rotate(360deg); }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25715726307913533)
,p_plug_name=>'faq_region'
,p_title=>'FAQ Assistant'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="faq-wrapper">',
'',
'    <div class="faq-header">',
'        <span class="faq-logo">ORACLE</span>',
'        <span class="faq-title">FAQ Assistant</span>',
'    </div>',
'',
'    <div id="faq-answer-box" class="faq-answer-box" style="display:none;">',
'        <div class="faq-answer-label">Answer</div>',
'        <div id="faq-matched-q" class="faq-matched-q"></div>',
'        <div id="faq-answer-text" class="faq-answer-text"></div>',
'        <div id="faq-meta" class="faq-meta"></div>',
'    </div>',
'',
'    <div id="faq-empty" class="faq-empty">',
unistr('        \D83D\DC4B Ask me anything about Oracle University services.'),
'    </div>',
'',
'    <div id="faq-loading" class="faq-loading" style="display:none;">',
'        <div class="faq-spinner"></div>',
'        <span>Searching FAQs...</span>',
'    </div>',
'',
'    <div class="faq-input-area">',
'        <input type="text" id="faq-input"',
'               placeholder="Type your question here..."',
'               autocomplete="off"',
'               maxlength="500" />',
'        <button id="faq-btn" onclick="submitQuestion()">',
'            Ask',
'        </button>',
'    </div>',
'',
'</div>'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13544141310969709)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ASK_FAQ'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_question VARCHAR2(4000);',
'    v_result   CLOB;',
'BEGIN',
'    v_question := APEX_APPLICATION.G_X01;',
'',
'    IF v_question IS NULL OR LENGTH(TRIM(v_question)) = 0 THEN',
'        HTP.P(''{"answer":"Please type a question."}'');',
'        RETURN;',
'    END IF;',
'',
'    v_result := ask_faq(v_question);',
'    HTP.P(v_result);',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        HTP.P(''{"answer":"Error: '' || REPLACE(SQLERRM, ''"'', '''''''') || ''"}'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>13544141310969709
);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'chat_bot'
,p_alias=>'CHAT-BOT'
,p_step_title=>'chat_bot'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function initChatBot() {',
'  var botIframe = document.getElementById(''oalai-inline-bot'');',
'  if (!botIframe) {',
'    console.error(''Bot iframe not found'');',
'    return;',
'  }',
'',
'  var userEmail    = apex.env.APP_USER || '''';',
'  var userFullName = apex.env.APP_USER || '''';',
'',
'  function sendConfig() {',
'    console.log(''Sending SET_CONFIG to bot...'');',
'    botIframe.contentWindow.postMessage({',
unistr('      type    : ''OALAI_WIDGET_COMMAND'',       // \2705 exact type the bot expects'),
unistr('      command : ''SET_CONFIG'',                  // \2705 exact command from logs'),
'      payload : {',
'        welcomeMessage  : ''Hello '' + userFullName + ''! Welcome to Oracle MyLearn support. How can I help you today?'',',
'        drawerTitle     : ''AI Assistant'',',
'        hideDisclaimer  : true,',
'        context: {',
'          user_full_name: userFullName,',
'          user_email    : userEmail',
'        }',
'      }',
'    }, ''*'');',
'    console.log(''SET_CONFIG sent'');',
'  }',
'',
unistr('  // \2705 Listen for READY event from bot \2014 exact event name from your logs'),
'  window.addEventListener(''message'', function(event) {',
'    console.log(''Message received:'', event.data);',
'',
'    if (',
'      event.data &&',
'      event.data.type  === ''OALAI_WIDGET_EVENT'' &&',
'      event.data.event === ''READY''',
'    ) {',
'      console.log(''Bot READY received, sending config...'');',
'      sendConfig();',
'    }',
'  });',
'',
unistr('  // \2705 Fallback: also send config after iframe loads'),
'  botIframe.addEventListener(''load'', function() {',
'    setTimeout(sendConfig, 1500);',
'  });',
'}',
'',
'apex.jQuery(document).on(''apexreadyend'', function() {',
'  initChatBot();',
'});',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}',
'',
'',
'/* Page / container background */',
'#container {',
'  display: flex;',
'  flex-direction: column;',
'  gap: 16px;',
unistr('  background: #F2F2F2;   /* \D83D\DD25 your required background */'),
'  padding: 20px;',
'  border-radius: 12px;',
'}',
'',
'/* Each item (card) */',
'.item {',
'  display: flex;',
'  align-items: flex-start;',
'  gap: 14px;',
'',
'  background: #ffffff;',
'  padding: 16px;',
'  border-radius: 10px;',
'  border: 1px solid #e6e6e6;',
'',
'  transition: all 0.2s ease-in-out;',
'}',
'',
'/* Hover effect */',
'.item:hover {',
'  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);',
'  transform: translateY(-2px);',
'}',
'',
'/* Icon styling */',
'.icon {',
'  font-size: 22px;',
'  color: #e60000;  /* Oracle red tone */',
'  flex-shrink: 0;',
'  margin-top: 2px;',
'}',
'',
'/* Right side content */',
'.content {',
'  display: flex;',
'  flex-direction: column;',
'}',
'',
'/* Title (anchor) */',
'.content a {',
'  font-size: 15px;',
'  font-weight: 600;',
'  color: #1a1a1a;',
'  text-decoration: none;',
'  margin-bottom: 5px;',
'}',
'',
'/* Hover for link */',
'.content a:hover {',
'  color: #e60000;',
'  text-decoration: underline;',
'}',
'',
'/* Description */',
'.content p {',
'  margin: 0;',
'  font-size: 13px;',
'  color: #666;',
'  line-height: 1.4;',
'}',
'',
'',
'',
'#chat_bot .t-Region-body {',
'  padding: 0 !important;',
'  height: 560px;',
'}',
'',
'#chat_bot {',
'  overflow: hidden;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10608036814902540)
,p_plug_name=>'Main'
,p_title=>' '
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10608128974902541)
,p_plug_name=>'chat'
,p_region_name=>'chat_bot'
,p_parent_plug_id=>wwv_flow_imp.id(10608036814902540)
,p_region_template_options=>'#DEFAULT#:i-h480:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>9
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<iframe',
'  id="oalai-inline-bot"',
'  src="https://botct-e.oracle.com/oalasx/pub/aibots/ui/superagent/?route=ai-widget&agent=dab3168e-4e3b-5297-96f5-719a84e4c4e5"',
'  width="100%"',
'  height="550px"',
'  style="border:none; border-radius:8px; display:block;"',
'  allow="microphone; camera; clipboard-write"',
'  sandbox="allow-scripts allow-same-origin allow-forms allow-popups allow-modals allow-top-navigation"',
'  title="AI Assistant">',
'</iframe>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10608369709902543)
,p_plug_name=>'advertise'
,p_title=>'Recomended Activities'
,p_parent_plug_id=>wwv_flow_imp.id(10608036814902540)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_column=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="container">',
'',
'  <div class="item">',
'    <div class="icon">',
'      <span class="fa fa-user-headset"></span>',
'    </div>',
'    <div class="content">',
'      <a href="https://www.google.com">Live chat with an analyst</a>',
'      <p>Here you can initiate a chat conversation with our analyst</p>',
'    </div>',
'  </div>',
'',
'  <div class="item">',
'    <div class="icon">',
'      <span class="fa fa-user-headset"></span>',
'    </div>',
'    <div class="content">',
'      <a href="https://www.google.com">Live chat with an analyst</a>',
'      <p>Here you can initiate a chat conversation with our analyst</p>',
'    </div>',
'  </div>',
'',
'  <div class="item">',
'    <div class="icon">',
'      <span class="fa fa-user-headset"></span>',
'    </div>',
'    <div class="content">',
'      <a href="https://www.google.com">Live chat with an analyst</a>',
'      <p>Here you can initiate a chat conversation with our analyst</p>',
'    </div>',
'  </div>',
'',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'education_oracle_com'
,p_alias=>'EDUCATION-ORACLE-COM'
,p_step_title=>'education_oracle_com'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'  "use strict";',
'',
'  function el(id) { return document.getElementById(id); }',
'  function on(id, event, fn) { var n = el(id); if (n) n.addEventListener(event, fn); }',
'',
unistr('  /* \2500\2500 Search \2500\2500 */'),
'  var searchInput=el(''searchInput''),searchPanel=el(''searchPanel''),quickLinksSection=el(''quickLinksSection''),suggestedSearchSection=el(''suggestedSearchSection''),suggestedLinksSection=el(''suggestedLinksSection''),suggestedSearchList=el(''suggestedSearchL'
||'ist''),suggestedLinksList=el(''suggestedLinksList'');',
'  var searchTerms=[''Oracle University'',''Oracle certification'',''Education support'',''Training and labs'',''Technical support'',''Billing questions'',''AI training'',''Guided learning''];',
'  var pageLinks=[{label:''Oracle University'',href:''#''},{label:''Certification'',href:''#''},{label:''Education Support'',href:''#''},{label:''Skills Development'',href:''#''}];',
'  function openSearchPanel(){if(searchPanel)searchPanel.classList.add(''active'');}',
'  function closeSearchPanel(){if(searchPanel)searchPanel.classList.remove(''active'');}',
'  function renderSearch(q){',
'    if(!searchPanel)return;',
'    var v=q.trim().toLowerCase();',
'    if(!v){if(quickLinksSection)quickLinksSection.style.display='''';if(suggestedSearchSection)suggestedSearchSection.style.display=''none'';if(suggestedLinksSection)suggestedLinksSection.style.display=''none'';return;}',
'    if(quickLinksSection)quickLinksSection.style.display=''none'';',
'    var mt=searchTerms.filter(function(i){return i.toLowerCase().includes(v);}),ml=pageLinks.filter(function(i){return i.label.toLowerCase().includes(v);});',
'    if(suggestedSearchList)suggestedSearchList.innerHTML='''';if(suggestedLinksList)suggestedLinksList.innerHTML='''';',
'    if(mt.length&&suggestedSearchSection&&suggestedSearchList){suggestedSearchSection.style.display='''';mt.forEach(function(item){var li=document.createElement(''li''),btn=document.createElement(''button'');btn.type=''button'';btn.textContent=item;btn.addEv'
||'entListener(''click'',function(){searchInput.value=item;renderSearch(item);});li.appendChild(btn);suggestedSearchList.appendChild(li);});}else if(suggestedSearchSection){suggestedSearchSection.style.display=''none'';}',
'    if(ml.length&&suggestedLinksSection&&suggestedLinksList){suggestedLinksSection.style.display='''';ml.forEach(function(item){var li=document.createElement(''li'');li.innerHTML=''<a href="''+item.href+''">''+item.label+''</a>'';suggestedLinksList.appendChild'
||'(li);});}else if(suggestedLinksSection){suggestedLinksSection.style.display=''none'';}',
'  }',
'  if(searchInput){searchInput.addEventListener(''focus'',function(){openSearchPanel();renderSearch(searchInput.value);});searchInput.addEventListener(''input'',function(){openSearchPanel();renderSearch(searchInput.value);});}',
'',
unistr('  /* \2500\2500 Sign In \2500\2500 */'),
'  var signinPop=el(''signinPop'');',
'  on(''signinBtn'',''click'',function(e){e.stopPropagation();if(signinPop)signinPop.classList.toggle(''active'');});',
'',
unistr('  /* \2500\2500 Training Dropdown \2500\2500 */'),
'  var trainingDd=el(''trainingDd'');',
'  on(''trainingTrigger'',''click'',function(e){e.stopPropagation();if(trainingDd)trainingDd.classList.toggle(''open'');});',
'',
unistr('  /* \2500\2500 Drawer \2500\2500 */'),
'  var drawer=el(''drawer''),drawerOverlay=el(''drawerOverlay''),drawerTrainingSub=el(''drawerTrainingSub'');',
'  function openDrawer(){if(!drawer||!drawerOverlay)return;drawer.classList.add(''active'');drawerOverlay.classList.add(''active'');drawer.setAttribute(''aria-hidden'',''false'');document.body.style.overflow=''hidden'';}',
'  function closeDrawer(){if(!drawer||!drawerOverlay)return;drawer.classList.remove(''active'');drawerOverlay.classList.remove(''active'');drawer.setAttribute(''aria-hidden'',''true'');document.body.style.overflow='''';}',
'  on(''menuBtn'',''click'',openDrawer);on(''drawerClose'',''click'',closeDrawer);',
'  if(drawerOverlay)drawerOverlay.addEventListener(''click'',closeDrawer);',
'  on(''drawerTrainingBtn'',''click'',function(){if(drawerTrainingSub)drawerTrainingSub.classList.toggle(''active'');});',
'',
unistr('  /* \2500\2500 Sales Overlay (full-page like oracle.com) \2500\2500 */'),
'  var salesOverlay=el(''salesOverlay''),step1=el(''step1''),step2=el(''step2''),businessEmail=el(''businessEmail''),businessEmailWrap=el(''businessEmailWrap''),businessEmailStep2=el(''businessEmailStep2''),switchEmailText=el(''switchEmailText''),fullSalesForm=el('''
||'fullSalesForm'');',
'',
'  function setEmailError(show){if(!businessEmailWrap)return;if(show)businessEmailWrap.classList.add(''has-error'');else businessEmailWrap.classList.remove(''has-error'');}',
'',
'  function resetSalesModal(){',
'    if(step1)step1.classList.add(''active'');',
'    if(step2)step2.classList.remove(''active'');',
'    if(businessEmail)businessEmail.value='''';',
'    if(businessEmailStep2)businessEmailStep2.value='''';',
'    if(switchEmailText)switchEmailText.textContent='''';',
'    setEmailError(false);',
'    if(fullSalesForm)fullSalesForm.reset();',
'    var c=el(''country'');if(c)c.value=''India'';',
'    [''faqAnswerArea'',''faqErrorArea'',''faqNoMatchArea''].forEach(function(id){var n=el(id);if(n)n.style.display=''none'';});',
'    var fat=el(''faqAnswerText'');if(fat)fat.textContent='''';',
'    var badge=el(''faqMatchBadge'');if(badge){badge.textContent=''\u2713 0% match'';badge.className=''faq-match-badge'';}',
'    var satRow=el(''faqSatisfactionRow'');if(satRow)satRow.style.display=''none'';',
'    var askBtn=el(''askFaqBtn'');if(askBtn){askBtn.disabled=false;askBtn.innerHTML=''Ask'';}',
'  }',
'',
'  function openSalesOverlay(){',
'    resetSalesModal();',
'    if(!salesOverlay)return;',
'    salesOverlay.classList.add(''active'');',
'    document.body.style.overflow=''hidden'';',
'    setTimeout(function(){if(businessEmail)businessEmail.focus();},60);',
'  }',
'  function closeSalesOverlay(){',
'    if(!salesOverlay)return;',
'    salesOverlay.classList.remove(''active'');',
'    document.body.style.overflow='''';',
'  }',
'',
'  /* Trigger buttons */',
'  on(''contactHeaderBtn'',''click'',openSalesOverlay);',
'  on(''salesCardBtn'',''click'',openSalesOverlay);',
'  on(''salesOverlayClose'',''click'',closeSalesOverlay);',
'',
'  /* Click outside the white box closes overlay */',
'  if(salesOverlay){',
'    salesOverlay.addEventListener(''click'',function(e){',
'      if(e.target===salesOverlay || e.target.classList.contains(''sales-modal-wrapper'')){',
'        closeSalesOverlay();',
'      }',
'    });',
'  }',
'',
unistr('  /* Step 1 \2192 Step 2 */'),
'  on(''continueBtn'',''click'',function(){',
'    if(!businessEmail)return;',
'    var email=businessEmail.value.trim();',
'    if(!email){setEmailError(true);businessEmail.focus();return;}',
'    setEmailError(false);',
'    if(businessEmailStep2)businessEmailStep2.value=email;',
'    if(switchEmailText)switchEmailText.textContent=email;',
'    if(step1)step1.classList.remove(''active'');',
'    if(step2)step2.classList.add(''active'');',
'    var fn=el(''firstName'');if(fn)fn.focus();',
'  });',
'',
'  if(businessEmail){businessEmail.addEventListener(''input'',function(){if(businessEmail.value.trim())setEmailError(false);});}',
'',
unistr('  /* Switch email link \2192 back to step 1 */'),
'  on(''switchEmailLink'',''click'',function(e){',
'    e.preventDefault();',
'    if(step2)step2.classList.remove(''active'');',
'    if(step1)step1.classList.add(''active'');',
'    setTimeout(function(){if(businessEmail)businessEmail.focus();},50);',
'  });',
'',
'  /* Form submit */',
'  if(fullSalesForm){',
'    fullSalesForm.addEventListener(''submit'',function(e){',
'      e.preventDefault();',
'      closeSalesOverlay();',
'      openTyModal();',
'    });',
'  }',
'',
unistr('  /* \2500\2500 FAQ Integration \2500\2500 */'),
'  var FAQ_ENDPOINT_BASE=''https://vndepyvklyhzyrr-qr3sbzfylnrinxn1.adb.us-ashburn-1.oraclecloudapps.com/ords/wksp_chaithrainterns/faq/ask/'';',
'  var askFaqBtn=el(''askFaqBtn''),faqAnswerArea=el(''faqAnswerArea''),faqAnswerText=el(''faqAnswerText''),faqMatchBadge=el(''faqMatchBadge''),faqSatisfactionRow=el(''faqSatisfactionRow''),faqNoMatchArea=el(''faqNoMatchArea''),faqErrorArea=el(''faqErrorArea''),faqE'
||'rrorText=el(''faqErrorText''),helpTextArea=el(''helpText'');',
'',
'  function resetFaqState(){',
'    if(faqAnswerArea)faqAnswerArea.style.display=''none'';if(faqErrorArea)faqErrorArea.style.display=''none'';if(faqNoMatchArea)faqNoMatchArea.style.display=''none'';',
'    if(faqAnswerText)faqAnswerText.textContent='''';if(faqErrorText)faqErrorText.textContent='''';',
'    if(faqMatchBadge){faqMatchBadge.textContent=''\u2713 0% match'';faqMatchBadge.className=''faq-match-badge'';}',
'    if(faqSatisfactionRow)faqSatisfactionRow.style.display=''none'';',
'  }',
'',
'  if(helpTextArea){helpTextArea.addEventListener(''input'',function(){helpTextArea.style.borderColor='''';helpTextArea.style.boxShadow='''';resetFaqState();});}',
'',
'  if(askFaqBtn){',
'    askFaqBtn.addEventListener(''click'',async function(){',
'      if(!helpTextArea)return;',
'      var query=helpTextArea.value.trim();',
'      if(!query){helpTextArea.focus();return;}',
'      resetFaqState();',
'      var url=FAQ_ENDPOINT_BASE+encodeURIComponent(query);',
'      askFaqBtn.disabled=true;',
'      askFaqBtn.innerHTML=''<span class="faq-spinner"></span> Searching...'';',
'      try{',
'        var response=await fetch(url,{method:''GET'',headers:{''Accept'':''application/json''}});',
'        var rawText=await response.text();',
'        if(!response.ok)throw new Error(''HTTP ''+response.status);',
'        var data;try{data=JSON.parse(rawText);}catch(e){throw new Error(''Invalid JSON'');}',
'        var answer=data.answer??data.ANSWER??''No answer returned.'';',
'        var score=Number(data.score??data.SCORE??0);',
'        var pct=Math.round(score*100);',
'        var isNoMatch=score<0.5||answer.toLowerCase().includes(''sorry'')||answer.toLowerCase().includes(''could not find'')||answer.toLowerCase().includes(''no matching'');',
'        if(isNoMatch){if(faqNoMatchArea)faqNoMatchArea.style.display=''block'';}',
'        else{if(faqAnswerText)faqAnswerText.textContent=answer;if(faqMatchBadge){faqMatchBadge.textContent=''\u2713 ''+pct+''% match'';faqMatchBadge.className=''faq-match-badge'';}if(faqAnswerArea)faqAnswerArea.style.display=''block'';if(faqSatisfactionRow)f'
||'aqSatisfactionRow.style.display=''flex'';}',
'      }catch(err){console.error(''FAQ error:'',err);if(faqNoMatchArea)faqNoMatchArea.style.display=''block'';}',
'      finally{askFaqBtn.disabled=false;askFaqBtn.textContent=''Ask'';}',
'    });',
'  }',
'',
unistr('  /* \2500\2500 Thank You Modal \2500\2500 */'),
'  var tyOverlay=el(''tyOverlay''),tyModal=el(''tyModal''),tyCloseBtn=el(''tyCloseBtn'');',
'  function openTyModal(){if(!tyOverlay||!tyModal)return;tyOverlay.classList.add(''active'');tyModal.classList.add(''active'');tyModal.setAttribute(''aria-hidden'',''false'');document.body.style.overflow=''hidden'';if(tyCloseBtn)tyCloseBtn.focus();}',
'  function closeTyModal(){if(!tyOverlay||!tyModal)return;tyOverlay.classList.remove(''active'');tyModal.classList.remove(''active'');tyModal.setAttribute(''aria-hidden'',''true'');document.body.style.overflow='''';}',
'  if(tyCloseBtn)tyCloseBtn.addEventListener(''click'',closeTyModal);',
'  if(tyOverlay)tyOverlay.addEventListener(''click'',closeTyModal);',
'',
unistr('  /* \2500\2500 Assistance buttons \2500\2500 */'),
'  on(''contactSupportBtn'',''click'',function(){window.open(''https://help-education.oracle.com/apex/f?p=232:24'',''_blank'',''noopener,noreferrer'');});',
'  on(''contactSalesBtn'',''click'',openTyModal);',
'  on(''noMatchSupportBtn'',''click'',function(){window.open(''https://help-education.oracle.com/apex/f?p=232:24'',''_blank'',''noopener,noreferrer'');});',
'  on(''noMatchSalesBtn'',''click'',openTyModal);',
'',
unistr('  /* \2500\2500 Outside click \2500\2500 */'),
'  document.addEventListener(''click'',function(e){',
'    if(!e.target.closest(''.header-search''))closeSearchPanel();',
'    if(!e.target.closest(''.tool-wrap'')&&signinPop)signinPop.classList.remove(''active'');',
'    if(!e.target.closest(''#trainingDd'')&&trainingDd)trainingDd.classList.remove(''open'');',
'  });',
'',
unistr('  /* \2500\2500 Escape \2500\2500 */'),
'  document.addEventListener(''keydown'',function(e){',
'    if(e.key===''Escape''){closeDrawer();closeSearchPanel();if(signinPop)signinPop.classList.remove(''active'');if(trainingDd)trainingDd.classList.remove(''open'');closeSalesOverlay();closeTyModal();}',
'  });',
'',
'}());'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   APEX PAGE RESET',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'html,body{margin:0;padding:0;width:100%;overflow-x:hidden;}',
'.t-Body-main,.t-Body-content,.t-Body-contentInner,',
'.t-Region-body,.t-Region-bodyWrap{margin:0!important;padding:0!important;}',
'.t-Body-title,.t-BreadcrumbRegion,.t-Header,.t-Footer{display:none!important;}',
'#plain-html-page{width:100%;margin:0!important;padding:0!important;max-width:none!important;}',
'.t-Region,.t-Region-header{border:0!important;box-shadow:none!important;background:transparent!important;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   DESIGN TOKENS',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
':root{',
'  --oracle-red:#c74634;',
'  --text:#161513;',
'  --header-bg:#f7f7f7;',
'  --subnav-bg:#201b1a;',
'  --subnav-bg-2:#2a2422;',
'  --card-bg:#ece9e8;',
'  --btn-bg:#302b29;',
'  --btn-hover:#45403c;',
'  --border:#d2ccc7;',
'  --overlay:rgba(0,0,0,.58);',
'  --shadow:0 20px 44px rgba(0,0,0,.22);',
'  --shadow-sm:0 4px 16px rgba(0,0,0,.12);',
'}',
'*{box-sizing:border-box;}',
'body{font-family:Inter,system-ui,-apple-system,"Segoe UI",Roboto,Arial,sans-serif;color:var(--text);background:#fff;}',
'a{text-decoration:none;color:inherit;}',
'button,input,textarea,select{font:inherit;}',
'.container{width:min(calc(100% - 64px),1612px);margin:0 auto;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   HEADER',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.site-header{background:var(--header-bg);border-bottom:1px solid #e5e0dc;}',
'.header-inner{',
'  width:min(calc(100% - 40px),1760px);margin:0 auto;',
'  min-height:80px;display:grid;',
'  grid-template-columns:auto 1fr auto;gap:26px;align-items:center;',
'}',
'.header-left{display:flex;align-items:center;gap:18px;min-width:max-content;}',
'.icon-btn{width:34px;height:34px;border:none;background:transparent;cursor:pointer;display:grid;place-items:center;border-radius:8px;padding:0;color:#1b1b1b;}',
'.icon-btn:hover{background:#ece7e4;}',
'.menu-icon{width:29px;height:29px;}',
'.oracle-logo{display:flex;align-items:center;}',
'.oracle-logo svg{width:160px;height:21px;display:block;}',
'.header-search{position:relative;}',
'.search-shell{height:52px;border:2px solid var(--border);border-radius:10px;background:#fff;display:flex;align-items:center;gap:12px;padding:0 16px;}',
'.search-shell svg{width:22px;height:22px;flex:0 0 auto;}',
'.search-input{width:100%;border:none;outline:none;background:transparent;font-size:16px;color:#2b2b2b;}',
'.header-right{display:flex;align-items:center;gap:22px;min-width:max-content;}',
'.flag-btn img{width:28px;height:18px;display:block;object-fit:cover;border-radius:2px;}',
'.tool-wrap{position:relative;}',
'.tool-btn{width:34px;height:34px;border:none;background:transparent;cursor:pointer;display:grid;place-items:center;padding:0;border-radius:8px;color:#1a1a1a;}',
'.tool-btn:hover{background:#ece7e4;}',
'.tool-btn svg{width:27px;height:27px;}',
'.signin-pop{position:absolute;right:0;top:46px;width:316px;background:#fff;border:1px solid #ddd7d2;border-radius:16px;box-shadow:var(--shadow);padding:18px;display:none;z-index:40;}',
'.signin-pop.active{display:block;}',
'.signin-title{font-size:14px;font-weight:800;color:#383230;margin:10px 0;}',
'.signin-link{display:block;text-align:center;border-radius:10px;padding:12px 14px;margin-bottom:10px;font-size:15px;font-weight:700;}',
'.signin-link.dark{background:var(--btn-bg);color:#fff;}',
'.signin-link.light{background:#fff;border:1px solid #d7d1cb;}',
'.signin-list{margin:8px 0 0;padding:0;list-style:none;}',
'.signin-list a{display:block;padding:8px 2px;font-size:15px;}',
'',
'.search-panel{position:absolute;left:0;right:0;top:64px;background:#fff;border:1px solid #ddd8d3;border-radius:16px;box-shadow:var(--shadow);padding:16px;display:none;z-index:35;}',
'.search-panel.active{display:block;}',
'.search-section{margin-bottom:10px;}',
'.search-title{margin:0 0 8px;font-size:11px;font-weight:800;letter-spacing:.08em;color:#706964;}',
'.search-list{list-style:none;margin:0;padding:0;}',
'.search-list li a,.search-list li button{width:100%;border:none;background:transparent;display:block;text-align:left;padding:10px 12px;border-radius:10px;cursor:pointer;font-size:15px;color:#1f1f1f;}',
'.search-list li a:hover,.search-list li button:hover{background:#f3efed;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   SUBNAV',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.subnav{background:linear-gradient(90deg,var(--subnav-bg),var(--subnav-bg-2));color:#fff;position:sticky;top:0;z-index:20;}',
'.subnav-inner{width:min(calc(100% - 64px),1720px);margin:0 auto;min-height:72px;display:flex;align-items:center;gap:36px;overflow-x:auto;scrollbar-width:none;}',
'.subnav-inner::-webkit-scrollbar{display:none;}',
'.subnav-link,.subnav-trigger{font-size:17px;line-height:1;white-space:nowrap;color:#fff;padding:6px 0;}',
'.subnav-dd{position:relative;}',
'.subnav-trigger{border:none;background:transparent;cursor:pointer;display:flex;align-items:center;gap:8px;color:#fff;}',
'.chev{width:10px;height:10px;border-right:2px solid currentColor;border-bottom:2px solid currentColor;transform:rotate(45deg) translateY(-2px);transition:.2s ease;}',
'.subnav-dd.open .chev{transform:rotate(-135deg) translateY(-1px);}',
'.subnav-menu{position:absolute;top:50px;left:0;min-width:390px;background:#fff;color:#1b1b1b;border-radius:14px;box-shadow:var(--shadow);padding:8px;display:none;z-index:30;}',
'.subnav-dd.open .subnav-menu{display:block;}',
'.subnav-menu a{display:block;padding:12px 14px;border-radius:10px;font-size:15px;}',
'.subnav-menu a:hover{background:#f3efed;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   HERO BANNER',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.hero-banner{',
'  background-color:#1e3832;',
'  background-image:',
'    repeating-radial-gradient(circle at 50% 50%,transparent 0,transparent 38px,rgba(255,255,255,.04) 38px,rgba(255,255,255,.04) 40px),',
'    repeating-radial-gradient(circle at 80% 20%,transparent 0,transparent 58px,rgba(255,255,255,.03) 58px,rgba(255,255,255,.03) 60px),',
'    repeating-radial-gradient(circle at 10% 80%,transparent 0,transparent 48px,rgba(255,255,255,.035) 48px,rgba(255,255,255,.035) 50px);',
'  padding:56px 0 52px;',
'}',
'.hero-inner{width:min(calc(100% - 64px),1612px);margin:0 auto;}',
'.hero-title{margin:0;font-size:clamp(24px,3vw,38px);font-weight:700;color:#fff;letter-spacing:-.01em;line-height:1.2;max-width:700px;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   MAIN CARDS',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.main{padding:48px 0 56px;}',
'.main-title{margin:0 0 28px;font-size:clamp(26px,2.8vw,38px);line-height:1.1;font-weight:900;letter-spacing:-.02em;max-width:900px;}',
'.cards{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:28px;}',
'.card{background:var(--card-bg);border-radius:14px;padding:32px 30px;min-height:360px;display:flex;flex-direction:column;}',
'.card h3{margin:0 0 14px;font-size:22px;line-height:1.2;font-weight:900;}',
'.card p{margin:0;font-size:16px;line-height:1.56;color:#2d2a28;}',
'.card .spacer{flex:1;}',
'.cta{display:inline-flex;align-items:center;justify-content:center;align-self:flex-start;min-height:52px;padding:0 22px;border-radius:8px;background:var(--btn-bg);color:#fff;border:none;cursor:pointer;font-size:15px;font-weight:700;margin-top:24px;bo'
||'x-shadow:inset 0 0 0 1px rgba(255,255,255,.08);}',
'.cta:hover{background:var(--btn-hover);}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   GET STARTED',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.get-started-section{padding:0;}',
'.gs-topo-bg{',
'  background-color:#f9f8f4;',
'  background-image:',
'    repeating-radial-gradient(circle at 60% 40%,transparent 0,transparent 68px,rgba(0,0,0,.028) 68px,rgba(0,0,0,.028) 70px),',
'    repeating-radial-gradient(circle at 20% 70%,transparent 0,transparent 88px,rgba(0,0,0,.022) 88px,rgba(0,0,0,.022) 90px);',
'  padding:60px 0 72px;',
'}',
'.gs-title{margin:0 0 36px;font-size:clamp(22px,2.4vw,32px);font-weight:900;color:#161513;letter-spacing:-.01em;}',
'.gs-cards{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:20px;}',
'.gs-card{background:#fff;border-radius:6px;overflow:hidden;display:flex;flex-direction:column;border:1px solid #e8e3de;}',
'.gs-card-top{background:#f5e8a3;padding:28px 24px 24px;min-height:175px;display:flex;flex-direction:column;justify-content:space-between;}',
'.gs-icon{width:44px;height:44px;margin-bottom:12px;color:#1a1a1a;}',
'.gs-icon svg{width:100%;height:100%;}',
'.gs-card-heading{margin:0;font-size:17px;font-weight:800;color:#1a1a1a;line-height:1.3;}',
'.gs-card-bottom{padding:24px 24px 28px;display:flex;flex-direction:column;flex:1;}',
'.gs-card-text{margin:0 0 20px;font-size:15px;line-height:1.6;color:#2d2a28;flex:1;}',
'.gs-btn-wrap{margin-top:auto;}',
'.gs-btn{display:inline-flex;align-items:center;height:40px;padding:0 18px;border:1.5px solid #1a1a1a;border-radius:4px;background:#fff;color:#1a1a1a;font-size:14px;font-weight:600;cursor:pointer;transition:background .15s,color .15s;white-space:nowra'
||'p;}',
'.gs-btn:hover{background:#1a1a1a;color:#fff;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   DRAWER',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.drawer-overlay{position:fixed;inset:0;background:var(--overlay);opacity:0;pointer-events:none;transition:.22s ease;z-index:90;}',
'.drawer-overlay.active{opacity:1;pointer-events:auto;}',
'.drawer{position:fixed;top:0;left:0;width:min(400px,88vw);height:100vh;background:#fff;transform:translateX(-100%);transition:.26s ease;z-index:100;box-shadow:var(--shadow);display:flex;flex-direction:column;}',
'.drawer.active{transform:translateX(0);}',
'.drawer-head{padding:18px 18px 14px;display:flex;justify-content:space-between;align-items:center;border-bottom:1px solid #eee8e5;}',
'.drawer-body{padding:10px 18px 24px;overflow:auto;}',
'.drawer-list,.drawer-sub{list-style:none;margin:0;padding:0;}',
'.drawer-list>li>a,.drawer-list>li>button{width:100%;text-align:left;border:none;background:transparent;display:flex;justify-content:space-between;align-items:center;padding:14px 0;border-bottom:1px solid #f0ebe8;cursor:pointer;font-size:16px;color:#1'
||'b1b1b;}',
'.drawer-sub-wrap{display:none;padding-left:12px;}',
'.drawer-sub-wrap.active{display:block;}',
'.drawer-sub a{display:block;padding:12px 0;border-bottom:1px solid #f4efec;font-size:15px;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
unistr('   SALES OVERLAY \2014 full-page style like oracle.com'),
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.sales-overlay{',
'  position:fixed;',
'  inset:0;',
'  background:rgba(244,241,239,0.92);',
'  z-index:100;',
'  display:none;',
'  overflow-y:auto;',
'}',
'.sales-overlay.active{',
'  display:block;',
'}',
'',
unistr('/* Close X button \2014 fixed top-right corner of viewport */'),
'.sales-overlay-close{',
'  position:fixed;',
'  top:20px;',
'  right:24px;',
'  z-index:110;',
'  width:40px;',
'  height:40px;',
'  border:none;',
'  background:transparent;',
'  cursor:pointer;',
'  display:grid;',
'  place-items:center;',
'  border-radius:4px;',
'  color:#333;',
'}',
'.sales-overlay-close:hover{',
'  background:rgba(0,0,0,.08);',
'}',
'.sales-overlay-close svg{',
'  width:28px;',
'  height:28px;',
'}',
'',
'/* Wrapper centers the form box */',
'.sales-modal-wrapper{',
'  display:flex;',
'  justify-content:center;',
'  align-items:flex-start;',
'  min-height:100vh;',
'  padding:60px 24px 80px;',
'}',
'',
'/* The white form card */',
'.sales-modal-box{',
'  background:#fff;',
'  border-radius:4px;',
'  box-shadow:0 4px 24px rgba(0,0,0,.15);',
'  width:100%;',
'  max-width:540px;',
'  padding:40px 44px 48px;',
'}',
'',
'/* Step visibility */',
'.modal-step{display:none;}',
'.modal-step.active{display:block;}',
'',
'/* Step title */',
'.modal-step-title{',
'  font-size:20px;',
'  font-weight:700;',
'  line-height:1.35;',
'  color:#161513;',
'  margin:0 0 24px;',
'}',
'',
unistr('/* \2500\2500 Form fields \2014 floating label style \2500\2500 */'),
'.mf-group{margin-bottom:16px;}',
'',
'.mf-field{',
'  position:relative;',
'  border:1px solid #767676;',
'  border-radius:2px;',
'  background:#fff;',
'  transition:border-color .15s;',
'}',
'.mf-field:focus-within{',
'  border-color:#006699;',
'  box-shadow:0 0 0 1px #006699 inset;',
'}',
'',
'.mf-label{',
'  display:block;',
'  position:absolute;',
'  top:7px;left:10px;',
'  font-size:11px;font-weight:500;',
'  color:#6a6560;letter-spacing:.01em;',
'  pointer-events:none;',
'  white-space:nowrap;',
'}',
'',
'.mf-input{',
'  display:block;width:100%;',
'  border:none;outline:none;',
'  background:transparent;',
'  padding:24px 10px 8px;',
'  font-size:15px;color:#161513;',
'  border-radius:2px;',
'}',
'.mf-textarea{',
'  min-height:90px;resize:vertical;',
'  padding-top:22px;',
'}',
'.mf-field--select{overflow:hidden;}',
'.mf-select{',
'  appearance:none;-webkit-appearance:none;',
'  cursor:pointer;padding-right:30px;',
'}',
'.mf-select-arrow{',
'  position:absolute;right:10px;top:50%;',
'  transform:translateY(-50%);',
'  font-size:16px;color:#6a6560;pointer-events:none;',
'}',
'.mf-hint{',
'  display:block;',
'  font-size:12px;color:#6a6560;',
'  margin-top:4px;',
'}',
'.mf-error{',
'  display:none;font-size:12px;',
'  color:#b42318;font-weight:600;margin-top:4px;',
'}',
'.mf-group.has-error .mf-field{',
'  border-color:#b42318;',
'  box-shadow:0 0 0 1px #b42318 inset;',
'}',
'.mf-group.has-error .mf-error{display:block;}',
'',
'/* Legal text */',
'.modal-legal{',
'  font-size:13px;line-height:1.55;',
'  color:#4a4540;margin:18px 0 0;',
'}',
'.modal-legal a{color:#006699;}',
'.modal-legal a:hover{text-decoration:underline;}',
'',
'/* Switch email link */',
'.modal-switch-email{',
'  display:block;margin-top:12px;',
'  font-size:13px;color:#006699;',
'}',
'.modal-switch-email:hover{text-decoration:underline;}',
'',
'/* Action row */',
'.modal-actions{margin-top:18px;}',
'.modal-btn-primary{',
'  display:inline-flex;align-items:center;justify-content:center;',
'  height:46px;padding:0 26px;',
'  border:none;border-radius:3px;',
'  background:#302b29;color:#fff;',
'  font-size:15px;font-weight:700;',
'  cursor:pointer;transition:background .15s;',
'  min-width:120px;',
'}',
'.modal-btn-primary:hover{background:#45403c;}',
'',
unistr('/* \2500\2500 Ask/FAQ styles \2500\2500 */'),
'.ask-btn-wrap{margin-top:10px;}',
'.ask-btn{',
'  display:inline-flex;align-items:center;gap:7px;',
'  height:38px;padding:0 18px;',
'  border:none;border-radius:3px;',
'  background:#c74634;color:#fff;',
'  font-size:14px;font-weight:600;',
'  cursor:pointer;transition:background .15s;',
'}',
'.ask-btn:hover{background:#a8392a;}',
'.ask-btn:disabled{background:#9b8f8c;cursor:not-allowed;}',
'',
'.faq-answer-card{background:#f8f8f8;border:1px solid #e0dbd7;border-radius:4px;padding:14px 16px 10px;margin-top:10px;}',
'.faq-answer-text{font-size:14px;line-height:1.6;color:#1a1a1a;margin:0 0 10px;}',
'.faq-card-footer{display:flex;align-items:center;justify-content:space-between;gap:8px;flex-wrap:wrap;}',
'.faq-category-badge{display:inline-flex;align-items:center;gap:5px;background:#f0ebe8;color:#4a4540;border-radius:99px;font-size:11px;font-weight:600;padding:3px 9px 3px 7px;}',
'.faq-category-badge svg{flex-shrink:0;opacity:.7;}',
'.faq-match-badge{display:inline-flex;align-items:center;gap:3px;border-radius:99px;font-size:11px;font-weight:700;padding:3px 9px;background:#d1fae5;color:#065f46;white-space:nowrap;}',
'.faq-match-badge.low{background:#fee2e2;color:#991b1b;}',
'.faq-error-area{background:#fff3f2;border:1px solid #f5c0ba;border-radius:4px;padding:10px 14px;margin-top:6px;font-size:13px;color:#8b1a1a;}',
'.faq-nomatch-box{display:flex;align-items:center;gap:8px;background:#fffbf0;border:1px solid #f0d580;border-radius:4px;padding:10px 14px;margin-top:8px;}',
'.faq-nomatch-icon{font-size:14px;flex-shrink:0;color:#b07d00;}',
'.faq-nomatch-text{font-size:13px;font-weight:600;color:#7a5c00;}',
'.faq-nomatch-actions{display:flex;gap:8px;margin-top:10px;flex-wrap:wrap;}',
'.faq-satisfaction-row{display:flex;align-items:center;gap:8px;margin-top:10px;flex-wrap:wrap;}',
'.faq-satisfied-question{font-size:13px;font-weight:600;color:#3a3530;}',
'.faq-sat-btn{min-height:34px;font-size:13px;font-weight:600;padding:0 12px;border-radius:3px;border:none;cursor:pointer;display:inline-flex;align-items:center;gap:5px;transition:background .15s;}',
'.faq-sat-support{background:#1a7a4a;color:#fff;}',
'.faq-sat-support:hover{background:#155f3a;}',
'.faq-sat-sales{background:#006b9a;color:#fff;}',
'.faq-sat-sales:hover{background:#005580;}',
'.faq-spinner{width:13px;height:13px;border:2px solid rgba(255,255,255,.4);border-top-color:#fff;border-radius:50%;animation:spin .7s linear infinite;display:inline-block;}',
'@keyframes spin{to{transform:rotate(360deg);}}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   THANK YOU MODAL',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.ty-overlay{position:fixed;inset:0;background:rgba(0,0,0,.52);opacity:0;pointer-events:none;transition:.2s ease;z-index:200;}',
'.ty-overlay.active{opacity:1;pointer-events:auto;}',
'.ty-modal{position:fixed;top:50%;left:50%;transform:translate(-50%,-50%) scale(.97);width:min(520px,calc(100vw - 40px));background:#fff;border-radius:4px;box-shadow:0 24px 56px rgba(0,0,0,.28);padding:44px 48px 40px;z-index:210;opacity:0;pointer-even'
||'ts:none;transition:.2s ease;}',
'.ty-modal.active{opacity:1;pointer-events:auto;transform:translate(-50%,-50%) scale(1);}',
'.ty-close{position:absolute;top:14px;right:16px;width:32px;height:32px;border:none;background:transparent;cursor:pointer;font-size:22px;color:#555;border-radius:4px;display:grid;place-items:center;}',
'.ty-close:hover{background:#f0ebe8;}',
'.ty-heading{margin:0 0 18px;font-size:20px;font-weight:700;color:#161513;}',
'.ty-body{margin:0;font-size:15px;line-height:1.65;color:#3a3530;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   FOOTER',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'.ou-footer{',
'  background:#161513;',
'  color:#b0aba6;',
'  padding:20px 0;',
'  border-top:1px solid #2a2520;',
'}',
'.ou-footer-inner{',
'  width:min(calc(100% - 64px),1612px);',
'  margin:0 auto;',
'  display:flex;',
'  align-items:center;',
'  justify-content:space-between;',
'  flex-wrap:wrap;',
'  gap:16px;',
'}',
'.ou-footer-legal{',
'  list-style:none;margin:0;padding:0;',
'  display:flex;flex-wrap:wrap;align-items:center;gap:0;',
'}',
'.ou-footer-legal li{',
'  display:flex;align-items:center;',
'  font-size:13px;color:#b0aba6;',
'  padding:4px 0;',
'}',
'.ou-footer-legal li:not(:last-child)::after{',
'  content:'''';display:inline-block;',
'  width:1px;height:12px;background:#4a4540;',
'  margin:0 12px;',
'}',
'.ou-footer-legal a{color:#b0aba6;transition:color .15s;}',
'.ou-footer-legal a:hover{color:#fff;}',
'.ou-sep{margin:0 4px;color:#4a4540;}',
'.ou-footer-social{',
'  list-style:none;margin:0;padding:0;',
'  display:flex;align-items:center;gap:10px;',
'}',
'.ou-social-link{',
'  display:flex;align-items:center;justify-content:center;',
'  width:34px;height:34px;',
'  border-radius:50%;',
'  background:#2e2924;',
'  color:#b0aba6;',
'  transition:background .15s,color .15s;',
'}',
'.ou-social-link:hover{background:#c74634;color:#fff;}',
'.ou-social-link svg{width:16px;height:16px;}',
'',
unistr('/* \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'   RESPONSIVE',
unistr('\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 */'),
'@media(max-width:1024px){',
'  .header-inner{grid-template-columns:1fr;gap:14px;padding:14px 0;}',
'  .header-left,.header-right{justify-content:space-between;}',
'  .subnav-inner{min-height:60px;gap:24px;}',
'  .cards{grid-template-columns:1fr;}',
'  .gs-cards{grid-template-columns:repeat(2,minmax(0,1fr));}',
'  .card{min-height:auto;}',
'  .hero-banner{padding:40px 0 36px;}',
'  .ou-footer-inner{flex-direction:column;align-items:flex-start;gap:14px;}',
'}',
'@media(max-width:700px){',
'  .container{width:min(calc(100% - 28px),1612px);}',
'  .header-inner{width:min(calc(100% - 24px),1760px);}',
'  .subnav-inner{width:min(calc(100% - 24px),1720px);}',
'  .oracle-logo svg{width:130px;}',
'  .search-shell{height:48px;}',
'  .hero-title{font-size:22px;}',
'  .main{padding:28px 0 40px;}',
'  .main-title{font-size:24px;}',
'  .card{padding:22px;}',
'  .gs-cards{grid-template-columns:1fr;}',
'  .gs-card-top{min-height:auto;padding:22px 22px 18px;}',
'  .gs-card-bottom{padding:18px 22px 22px;}',
'  .sales-modal-box{padding:28px 24px 36px;}',
'  .modal-step-title{font-size:18px;}',
'  .ou-footer-legal{gap:0;}',
'  .ou-footer-legal li:not(:last-child)::after{margin:0 8px;}',
'}'))
,p_step_template=>2979075366320325194
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12172785338943844)
,p_plug_name=>'content'
,p_title=>' '
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="plain-html-page">',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 HEADER \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <header class="site-header">',
'    <div class="header-inner">',
'      <div class="header-left">',
'        <button class="icon-btn" id="menuBtn" aria-label="Open menu" aria-expanded="false">',
'          <svg class="menu-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9">',
'            <path d="M2 4h20"/><path d="M2 12h20"/><path d="M2 20h20"/>',
'          </svg>',
'        </button>',
'        <a href="#" class="oracle-logo" aria-label="Oracle Home">',
'          <svg width="136" height="18" viewBox="0 0 231 30" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMid">',
'            <path fill="#C74634" d="M99.61,19.52h15.24l-8.05-13L92,30H85.27l18-28.17a4.29,4.29,0,0,1,7-.05L128.32,30h-6.73l-3.17-5.25H103l-3.36-5.23m69.93,5.23V0.28h-5.72V27.16a2.76,2.76,0,0,0,.85,2,2.89,2.89,0,0,0,2.08.87h26l3.39-5.25H169.54M75,20.3'
||'8A10,10,0,0,0,75,.28H50V30h5.71V5.54H74.65a4.81,4.81,0,0,1,0,9.62H58.54L75.6,30h8.29L72.43,20.38H75M14.88,30H32.15a14.86,14.86,0,0,0,0-29.71H14.88a14.86,14.86,0,1,0,0,29.71m16.88-5.23H15.26a9.62,9.62,0,0,1,0-19.23h16.5a9.62,9.62,0,1,1,0,19.23M140.25,'
||'30h17.63l3.34-5.23H140.64a9.62,9.62,0,1,1,0-19.23h16.75l3.38-5.25H140.25a14.86,14.86,0,1,0,0,29.71m69.87-5.23a9.62,9.62,0,0,1-9.26-7h24.42l3.36-5.24H200.86a9.61,9.61,0,0,1,9.26-7h16.76l3.35-5.25h-20.5a14.86,14.86,0,0,0,0,29.71h17.63l3.35-5.23h-20.6"/'
||'>',
'          </svg>',
'        </a>',
'      </div>',
'',
'      <div class="header-search">',
'        <div class="search-shell">',
'          <svg viewBox="0 0 24 24" aria-hidden="true">',
'            <path d="M15,15l6,6M17,10a7,7,0,1,1-7-7A7,7,0,0,1,17,10Z" fill="none" stroke="currentColor" stroke-width="1.6"/>',
'          </svg>',
'          <input id="searchInput" class="search-input" type="text" placeholder="Search" autocomplete="off"/>',
'        </div>',
'        <div class="search-panel" id="searchPanel">',
'          <div class="search-section" id="quickLinksSection">',
'            <div class="search-title">QUICK LINKS</div>',
'            <ul class="search-list">',
'              <li><a href="#">Cloud</a></li>',
'              <li><a href="#">Database</a></li>',
'              <li><a href="#">Java</a></li>',
'              <li><a href="#">AI</a></li>',
'            </ul>',
'          </div>',
'          <div class="search-section" id="suggestedSearchSection" style="display:none;">',
'            <div class="search-title">SUGGESTED SEARCHES</div>',
'            <ul class="search-list" id="suggestedSearchList"></ul>',
'          </div>',
'          <div class="search-section" id="suggestedLinksSection" style="display:none;">',
'            <div class="search-title">SUGGESTED LINKS</div>',
'            <ul class="search-list" id="suggestedLinksList"></ul>',
'          </div>',
'        </div>',
'      </div>',
'',
'      <div class="header-right">',
'        <button class="icon-btn flag-btn" aria-label="Country">',
'          <img src="https://www.oracle.com/asset/web/i/flg-in.svg" alt="India"/>',
'        </button>',
'        <div class="tool-wrap">',
'          <button class="tool-btn" id="signinBtn" aria-label="Sign in">',
'            <svg viewBox="0 0 24 24" aria-hidden="true">',
'              <path d="M12,12c2.21,0,4-1.79,4-4s-1.79-4-4-4-4,1.79-4,4,1.79,4,4,4Zm0,2c-2.67,0-8,1.34-8,4v2h16v-2c0-2.66-5.33-4-8-4Z" fill="none" stroke="currentColor" stroke-width="1.5"/>',
'            </svg>',
'          </button>',
'          <div class="signin-pop" id="signinPop">',
'            <div class="signin-title">Cloud Account</div>',
'            <a href="#" class="signin-link dark">Sign in to Cloud</a>',
'            <a href="#" class="signin-link light">Sign Up for Free Cloud Tier</a>',
'            <div class="signin-title">Oracle Account</div>',
'            <a href="#" class="signin-link dark">Sign-In</a>',
'            <a href="#" class="signin-link light">Create an Account</a>',
'            <ul class="signin-list">',
'              <li><a href="#">Help</a></li>',
'              <li><a href="#">Sign Out</a></li>',
'            </ul>',
'          </div>',
'        </div>',
'        <button class="tool-btn" id="contactHeaderBtn" aria-label="Contact us">',
'          <svg viewBox="0 0 24 24" aria-hidden="true">',
'            <path d="M20,2H4c-1.1,0-2,.9-2,2v18l4-4h14c1.1,0,2-.9,2-2V4c0-1.1-.9-2-2-2Z" fill="none" stroke="currentColor" stroke-width="1.5"/>',
'          </svg>',
'        </button>',
'      </div>',
'    </div>',
'  </header>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 SUBNAV \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <nav class="subnav" aria-label="secondary">',
'    <div class="subnav-inner">',
'      <a href="#" class="subnav-link">Oracle University</a>',
'      <div class="subnav-dd" id="trainingDd">',
'        <button class="subnav-trigger" id="trainingTrigger">Training <span class="chev"></span></button>',
'        <div class="subnav-menu">',
'          <a href="#">Overview</a>',
'          <a href="#">Oracle AI Training and Certification</a>',
'          <a href="#">Oracle Fusion Cloud Applications Process Essentials Training and Certification</a>',
'        </div>',
'      </div>',
'      <a href="#" class="subnav-link">Certification</a>',
'      <a href="#" class="subnav-link">Oracle Guided Learning</a>',
'      <a href="#" class="subnav-link">Skills Development</a>',
'      <a href="#" class="subnav-link">Buy</a>',
'    </div>',
'  </nav>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 HERO BANNER \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <section class="hero-banner" aria-label="Oracle Certification Support and FAQs">',
'    <div class="hero-inner">',
'      <h1 class="hero-title">Oracle Certification Support and FAQs</h1>',
'    </div>',
'  </section>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 MAIN CARDS \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <main class="main">',
'    <div class="container">',
'      <h2 class="main-title">Need more support? Connect with the Oracle University team</h2>',
'      <section class="cards">',
'        <article class="card">',
'          <h3>Oracle Certification questions</h3>',
'          <p>Customers with Oracle Certification questions should use the Certification Support site to review frequently asked questions and submit support requests.</p>',
'          <div class="spacer"></div>',
'          <a class="cta" href="https://help-education.oracle.com/pls/apex/f?p=107:22" target="_blank" rel="noopener noreferrer">Visit Oracle Certification Support</a>',
'        </article>',
'        <article class="card">',
'          <h3>Technical support and billing questions</h3>',
'          <p>Customers with Oracle University training questions, including billing, account access, or general inquiries, should use the Education Support site to review frequently asked questions and submit support requests.</p>',
'          <div class="spacer"></div>',
'          <a class="cta" href="https://help-education.oracle.com/pls/apex/f?p=107:22" target="_blank" rel="noopener noreferrer">Visit Education Support</a>',
'        </article>',
'        <article class="card">',
'          <h3>Speak with sales</h3>',
'          <p>Send us a message here and we&#8217;ll get back to you. For a faster response, please provide your contact information and include details on how we can help.</p>',
'          <div class="spacer"></div>',
'          <button class="cta" id="salesCardBtn" type="button">Connect with sales</button>',
'        </article>',
'      </section>',
'    </div>',
'  </main>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 GET STARTED SECTION \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <section class="get-started-section">',
'    <div class="gs-topo-bg">',
'      <div class="container">',
'        <h2 class="gs-title">Get started with Oracle University</h2>',
'        <div class="gs-cards">',
'          <div class="gs-card">',
'            <div class="gs-card-top">',
'              <div class="gs-icon" aria-hidden="true">',
'                <svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">',
'                  <circle cx="17" cy="16" r="6"/><path d="M3 38c0-7.18 6.27-13 14-13"/>',
'                  <circle cx="33" cy="16" r="6"/><path d="M31 25c7.73 0 14 5.82 14 13"/>',
'                  <path d="M24 38c0-5-4-9-9-9"/>',
'                </svg>',
'              </div>',
'              <h3 class="gs-card-heading">Join the Oracle University Learning Community</h3>',
'            </div>',
'            <div class="gs-card-bottom">',
'              <p class="gs-card-text">Connect with Oracle Cloud experts, peers, and practitioners to collaborate and innovate.</p>',
'              <div class="gs-btn-wrap">',
'                <a class="gs-btn" href="https://community.oracle.com/ou/" target="_blank" rel="noopener noreferrer">Join the conversation</a>',
'              </div>',
'            </div>',
'          </div>',
'          <div class="gs-card">',
'            <div class="gs-card-top">',
'              <div class="gs-icon" aria-hidden="true">',
'                <svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">',
'                  <rect x="6" y="4" width="36" height="40" rx="2"/>',
'                  <rect x="12" y="4" width="24" height="10" rx="1"/>',
'                  <line x1="14" y1="24" x2="34" y2="24"/>',
'                  <line x1="14" y1="30" x2="34" y2="30"/>',
'                  <line x1="14" y1="36" x2="26" y2="36"/>',
'                </svg>',
'              </div>',
'              <h3 class="gs-card-heading">Read the Oracle University Blog</h3>',
'            </div>',
'            <div class="gs-card-bottom">',
'              <p class="gs-card-text">Discover the latest training and certification news, top industry trends, and tips to further develop your skills directly from Oracle University experts.</p>',
'              <div class="gs-btn-wrap">',
'                <a class="gs-btn" href="https://blogs.oracle.com/oracleuniversity/" target="_blank" rel="noopener noreferrer">Subscribe to the blog</a>',
'              </div>',
'            </div>',
'          </div>',
'          <div class="gs-card">',
'            <div class="gs-card-top">',
'              <div class="gs-icon" aria-hidden="true">',
'                <svg viewBox="0 0 48 48" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">',
'                  <path d="M44 6H4a2 2 0 0 0-2 2v24a2 2 0 0 0 2 2h12l8 8 8-8h12a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2Z"/>',
'                  <line x1="14" y1="18" x2="34" y2="18"/>',
'                  <line x1="14" y1="26" x2="26" y2="26"/>',
'                </svg>',
'              </div>',
'              <h3 class="gs-card-heading">Contact Oracle University Sales</h3>',
'            </div>',
'            <div class="gs-card-bottom">',
'              <p class="gs-card-text">Talk to a digital learning expert about Oracle University solutions.</p>',
'              <div class="gs-btn-wrap">',
'                <a class="gs-btn" href="https://www.oracle.com/in/education/contact/#contact-support" target="_blank" rel="noopener noreferrer">Contact us</a>',
'              </div>',
'            </div>',
'          </div>',
'        </div>',
'      </div>',
'    </div>',
'  </section>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 DRAWER \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <div class="drawer-overlay" id="drawerOverlay"></div>',
'  <aside class="drawer" id="drawer" aria-hidden="true">',
'    <div class="drawer-head">',
'      <strong>Menu</strong>',
'      <button class="icon-btn" id="drawerClose" aria-label="Close menu">',
'        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">',
'          <path d="M6 6l12 12"/><path d="M18 6L6 18"/>',
'        </svg>',
'      </button>',
'    </div>',
'    <div class="drawer-body">',
'      <ul class="drawer-list">',
'        <li><a href="#">Oracle University</a></li>',
'        <li>',
'          <button id="drawerTrainingBtn"><span>Training</span><span>+</span></button>',
'          <div class="drawer-sub-wrap" id="drawerTrainingSub">',
'            <ul class="drawer-sub">',
'              <li><a href="#">Overview</a></li>',
'              <li><a href="#">Oracle AI Training and Certification</a></li>',
'              <li><a href="#">Oracle Fusion Cloud Applications Process Essentials Training and Certification</a></li>',
'            </ul>',
'          </div>',
'        </li>',
'        <li><a href="#">Certification</a></li>',
'        <li><a href="#">Oracle Guided Learning</a></li>',
'        <li><a href="#">Skills Development</a></li>',
'        <li><a href="#">Buy</a></li>',
'      </ul>',
'    </div>',
'  </aside>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 SALES MODAL (Full-page overlay style like oracle.com) \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <div class="sales-overlay" id="salesOverlay">',
'    <button class="sales-overlay-close" id="salesOverlayClose" aria-label="Close">',
'      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">',
'        <path d="M6 6l12 12"/><path d="M18 6L6 18"/>',
'      </svg>',
'    </button>',
'    <div class="sales-modal-wrapper">',
'      <div class="sales-modal-box">',
'',
unistr('        <!-- \2500\2500 Step 1: Email only \2500\2500 -->'),
'        <section class="modal-step active" id="step1">',
'          <h2 class="modal-step-title">Please complete this form and a sales representative will contact you.</h2>',
'          <div class="mf-group" id="businessEmailWrap">',
'            <div class="mf-field">',
'              <label class="mf-label" for="businessEmail">Business email</label>',
'              <input class="mf-input" id="businessEmail" type="email" autocomplete="email"/>',
'            </div>',
'            <div class="mf-error" id="emailError">Business email is required.</div>',
'          </div>',
'          <p class="modal-legal">',
'            By filling and submitting this form you understand and agree that the use of Oracle&#8217;s website is subject to the',
'            <a href="https://www.oracle.com/legal/copyright.html" target="_blank" rel="noopener">Oracle.com Terms of Use</a>.',
'            Additional details regarding Oracle&#8217;s collection and use of your personal information, including information about',
'            access, retention, rectification, deletion, security, cross-border transfers and other topics, is available in the',
'            <a href="https://www.oracle.com/legal/privacy/" target="_blank" rel="noopener">Oracle Privacy Policy</a>.',
'          </p>',
'          <div class="modal-actions">',
'            <button class="modal-btn-primary" id="continueBtn" type="button">Continue</button>',
'          </div>',
'        </section>',
'',
unistr('        <!-- \2500\2500 Step 2: Full form \2500\2500 -->'),
'        <section class="modal-step" id="step2">',
'          <h2 class="modal-step-title">Please complete this form and a sales representative will contact you.</h2>',
'          <form id="fullSalesForm" novalidate>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="businessEmailStep2">Business email</label>',
'                <input class="mf-input" id="businessEmailStep2" type="email" readonly autocomplete="off"/>',
'              </div>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="firstName">First Name</label>',
'                <input class="mf-input" id="firstName" type="text" required/>',
'              </div>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="lastName">Last Name</label>',
'                <input class="mf-input" id="lastName" type="text" required/>',
'              </div>',
'              <span class="mf-hint">Required</span>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field mf-field--select">',
'                <label class="mf-label" for="country">Country/Region</label>',
'                <select class="mf-input mf-select" id="country">',
'                  <option>India</option>',
'                  <option>United States</option>',
'                  <option>United Kingdom</option>',
'                  <option>Australia</option>',
'                  <option>Singapore</option>',
'                </select>',
'                <span class="mf-select-arrow" aria-hidden="true">&#8964;</span>',
'              </div>',
'              <span class="mf-hint">Select</span>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="jobTitle">Job Title</label>',
'                <input class="mf-input" id="jobTitle" type="text" required/>',
'              </div>',
'              <span class="mf-hint">Required</span>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="company">Company</label>',
'                <input class="mf-input" id="company" type="text" required/>',
'              </div>',
'              <span class="mf-hint">Required</span>',
'            </div>',
'',
'            <div class="mf-group">',
'              <div class="mf-field">',
'                <label class="mf-label" for="helpText">How can we help you?</label>',
'                <textarea class="mf-input mf-textarea" id="helpText" required></textarea>',
'              </div>',
'              <span class="mf-hint">Required</span>',
'              <div class="ask-btn-wrap">',
'                <button class="ask-btn" id="askFaqBtn" type="button">Ask</button>',
'              </div>',
'            </div>',
'',
'            <!-- FAQ answer card -->',
'            <div id="faqAnswerArea" style="display:none;">',
'              <div class="faq-answer-card">',
'                <p class="faq-answer-text" id="faqAnswerText"></p>',
'                <div class="faq-card-footer">',
'                  <span class="faq-category-badge">',
'                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">',
'                      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>',
'                      <polyline points="14 2 14 8 20 8"/>',
'                      <line x1="16" y1="13" x2="8" y2="13"/>',
'                      <line x1="16" y1="17" x2="8" y2="17"/>',
'                      <polyline points="10 9 9 9 8 9"/>',
'                    </svg>',
'                    Activation &amp; Access',
'                  </span>',
'                  <span class="faq-match-badge" id="faqMatchBadge">&#10003; 0% match</span>',
'                </div>',
'              </div>',
'            </div>',
'',
'            <!-- Assistance row -->',
'            <div id="faqSatisfactionRow" class="faq-satisfaction-row" style="display:none;">',
'              <span class="faq-satisfied-question">Need further assistance?</span>',
'              <button class="faq-sat-btn faq-sat-support" id="contactSupportBtn" type="button">Contact Support</button>',
'              <button class="faq-sat-btn faq-sat-sales" id="contactSalesBtn" type="button">Contact Sales</button>',
'            </div>',
'',
'            <!-- No-match area -->',
'            <div id="faqNoMatchArea" style="display:none;">',
'              <div class="faq-nomatch-box">',
'                <span class="faq-nomatch-icon" aria-hidden="true">&#9888;</span>',
'                <span class="faq-nomatch-text">Please try again or use the options below.</span>',
'              </div>',
'              <div class="faq-nomatch-actions">',
'                <button class="faq-sat-btn faq-sat-support" id="noMatchSupportBtn" type="button">Contact Support</button>',
'                <button class="faq-sat-btn faq-sat-sales" id="noMatchSalesBtn" type="button">Contact Sales</button>',
'              </div>',
'            </div>',
'',
'            <!-- Hard error box -->',
'            <div id="faqErrorArea" style="display:none;">',
'              <div class="faq-error-area" id="faqErrorText"></div>',
'            </div>',
'',
'            <p class="modal-legal" style="margin-top:20px;">',
'              By filling and submitting this form you understand and agree that the use of Oracle&#8217;s website is subject to the',
'              <a href="https://www.oracle.com/legal/copyright.html" target="_blank" rel="noopener">Oracle.com Terms of Use</a>.',
'              Additional details regarding Oracle&#8217;s collection and use of your personal information, including information about',
'              access, retention, rectification, deletion, security, cross-border transfers and other topics, is available in the',
'              <a href="https://www.oracle.com/legal/privacy/" target="_blank" rel="noopener">Oracle Privacy Policy</a>.',
'            </p>',
'',
'            <a href="#" class="modal-switch-email" id="switchEmailLink">Click here if you are not <span id="switchEmailText"></span>.</a>',
'',
'            <div class="modal-actions" style="margin-top:20px;">',
'              <button class="modal-btn-primary" id="submitBtn" type="submit">Submit</button>',
'            </div>',
'',
'          </form>',
'        </section>',
'',
'      </div>',
'    </div>',
'  </div>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 THANK YOU MODAL \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <div class="ty-overlay" id="tyOverlay"></div>',
'  <div class="ty-modal" id="tyModal" role="dialog" aria-modal="true" aria-labelledby="tyTitle" aria-hidden="true">',
'    <button class="ty-close" id="tyCloseBtn" aria-label="Close">&#215;</button>',
'    <p class="ty-heading" id="tyTitle">Thank you,</p>',
'    <p class="ty-body">An Oracle representative will reach out to you shortly in order to help you with your inquiry.</p>',
'  </div>',
'',
unistr('  <!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 FOOTER \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'  <footer class="ou-footer" id="ou-footer">',
'    <div class="ou-footer-inner">',
'      <ul class="ou-footer-legal">',
'        <li><a href="/in/legal/copyright.html">&#169; 2026 Oracle</a></li>',
'        <li><a href="/in/legal/privacy/">Privacy</a><span class="ou-sep">/</span><a href="/in/legal/privacy/privacy-choices.html">Do Not Sell My Info</a></li>',
'        <li><a href="/in/legal/privacy/privacy-policy/#adchoices">Ad Choices</a></li>',
'        <li><a href="/in/corporate/careers/">Careers</a></li>',
'        <li><a href="https://secure.ethicspoint.com/domain/media/en/gui/31053/index.html" target="_blank" rel="noopener noreferrer">Integrity Helpline</a></li>',
'        <li><a href="/in/corporate/contact/">Contact Us</a></li>',
'      </ul>',
'      <ul class="ou-footer-social">',
'        <li>',
'          <a href="https://www.facebook.com/Oracle/" target="_blank" rel="noopener noreferrer" aria-label="Oracle on Facebook" class="ou-social-link ou-social-fb">',
'            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"/></svg>',
'          </a>',
'        </li>',
'        <li>',
'          <a href="https://x.com/oracle" target="_blank" rel="noopener noreferrer" aria-label="Oracle on X" class="ou-social-link ou-social-x">',
'            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>',
'          </a>',
'        </li>',
'        <li>',
'          <a href="https://www.linkedin.com/company/oracle/" target="_blank" rel="noopener noreferrer" aria-label="Oracle on LinkedIn" class="ou-social-link ou-social-li">',
'            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6zM2 9h4v12H2z"/><circle cx="4" cy="4" r="2"/></svg>',
'          </a>',
'        </li>',
'        <li>',
'          <a href="https://www.youtube.com/oracle/" target="_blank" rel="noopener noreferrer" aria-label="Oracle on YouTube" class="ou-social-link ou-social-yt">',
'            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.95-1.96C18.88 4 12 4 12 4s-6.88 0-8.59.46A2.78 2.78 0 0 0 1.46 6.42 29 29 0 0 0 1 12a29 29 0 0 0 .46 5.58 2.78 2.78 0 0 0 1.95 1.96C5.1'
||'2 20 12 20 12 20s6.88 0 8.59-.46a2.78 2.78 0 0 0 1.95-1.96A29 29 0 0 0 23 12a29 29 0 0 0-.46-5.58z"/><polygon points="9.75 15.02 15.5 12 9.75 8.98 9.75 15.02" fill="#fff"/></svg>',
'          </a>',
'        </li>',
'      </ul>',
'    </div>',
'  </footer>',
'',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_imp_page.create_page(
 p_id=>13
,p_name=>'CHAT_BOT'
,p_alias=>'CHAT-BOT1'
,p_step_title=>'CHAT_BOT'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ora-header">',
'  <div class="ora-header-left">',
'    <img ',
'      src="https://upload.wikimedia.org/wikipedia/commons/5/50/Oracle_logo.svg"',
'      alt="ORACLE"',
'      style="height: 28px; width: auto; display: block; margin:4px; "',
'    />',
'    <span class="ora-logo-sub">Support Assistant</span>',
'  </div>',
'',
'  <div class="ora-user-badge">',
'    <div class="ora-user-initials"></div>',
'    <span class="ora-user-name">&APP_USER.</span>',
'  </div>',
'</div>'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var aiSolutionFetched = 0;',
'var currentRequestId = null;',
'',
'function closeAISolution() {',
'    aiSolutionFetched = 0;',
'    savingInProgress = false;',
'    $("#ai-solution-panel")',
'        .removeClass("visible")',
'        .addClass("hidden");',
'',
'    apex.item("P3_AI_ISSUE_TITLE").setValue("");',
'    apex.item("P3_AI_CONFIDENCE").setValue("");',
'    apex.item("P3_AI_STEPS").setValue("");',
'    apex.item("P3_AI_ADDITIONAL").setValue("");',
'    apex.item("P3_AI_RESPONSE").setValue("");',
'',
'    apex.message.clearErrors();',
'}',
'',
'function showAIPanel() {',
'    $("#ai-solution-panel")',
'        .removeClass("hidden")',
'        .addClass("visible");',
'',
'    apex.item("P3_AI_ISSUE_TITLE").setValue("Finding solution...");',
'    apex.item("P3_AI_CONFIDENCE").setValue("");',
'    apex.item("P3_AI_STEPS").setValue("Please wait...");',
'    apex.item("P3_AI_ADDITIONAL").setValue("");',
'',
'    $("html, body").animate({',
'        scrollTop: $("#ai-solution-panel").offset().top - 20',
'    }, 400);',
'}',
'',
'// Call this AFTER the AI solution has been fetched and displayed',
'var savingInProgress = false;',
'',
'function saveRequest() {',
'    // Prevent duplicate saves',
'    if (savingInProgress) return;',
'    savingInProgress = true;',
'',
'    apex.server.process(''SAVE_SUPPORT_REQUEST'', {',
'        x01: $v(''P3_FULLNAME''),',
'        x02: $v(''P3_TYPE''),',
'        x03: $v(''P3_DESC''),',
'        x04: $v(''P3_AI_RESPONSE''),',
'        x05: $v(''P3_AI_CONFIDENCE'')',
'    }, {',
'         async: true,',
'        success: function(data) {',
'            currentRequestId = data;',
'            savingInProgress = false;',
'        },',
'        error: function(err) {',
'            console.error(''Error saving request:'', err);',
'            savingInProgress = false;',
'        }',
'    });',
'}',
'',
'function markSolved() {',
'    if (currentRequestId) {',
'        apex.server.process(''SAVE_FEEDBACK'', {',
'            x01: currentRequestId,',
'            x02: ''YES''',
'        }, {',
'            success: function() {},',
'            error: function(err) { console.error(''Feedback error:'', err); }',
'        });',
'    }',
'    closeAISolution();',
'    currentRequestId = null;',
'    apex.message.showPageSuccess("Great! We are glad the issue was resolved.");',
'}',
'',
'function createServiceRequest() {',
'    if (currentRequestId) {',
'        apex.server.process(''SAVE_FEEDBACK'', {',
'            x01: currentRequestId,',
'            x02: ''NO''',
'        }, {',
'            success: function() {},',
'            error: function(err) { console.error(''Feedback error:'', err); }',
'        });',
'    }',
'    closeAISolution();',
'    currentRequestId = null;',
'    apex.message.showPageSuccess("A Service Request will be created. Our team will contact you shortly.");',
'}',
'',
'function clearForm() {',
'    apex.item("P3_FULLNAME").setValue("");',
'    apex.item("P3_TYPE").setValue(null);',
'    apex.item("P3_DESC").setValue("");',
'    apex.message.clearErrors();',
'    closeAISolution();',
'    currentRequestId = null;',
'    savingInProgress = false;',
'}',
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'//  ACTIVITY CARD CLICK HANDLER',
unistr('//  - livechat  \2192 fires APEX "Show AI Assistant"'),
unistr('//  - callback  \2192 opens inline callback panel'),
unistr('//  - myrequests\2192 opens inline my requests panel'),
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'document.querySelectorAll(''.ora-ra .activity-card'').forEach(function(card) {',
'  card.addEventListener(''click'', function() {',
'    var activity = this.dataset.activity;',
'',
'    if (activity === ''livechat'') {',
unistr('      // \2500\2500 Trigger APEX native "Show AI Assistant" \2500\2500'),
'      // This fires the hidden button that has the',
'      // "Show AI Assistant" Dynamic Action attached to it.',
'      var trigger = document.getElementById(''btnShowAIAssistant'');',
'      if (trigger) {',
'        trigger.click();',
'      }',
unistr('      // Do NOT open inline panel \2014 AI Assistant handles the chat'),
'      return;',
'    }',
'',
unistr('    // \2500\2500 For callback and myrequests: open inline panel \2500\2500'),
'    // Hide all inline panels first',
'    document.querySelectorAll(''.ora-ra .activity-panel'').forEach(function(p) {',
'      p.style.display = ''none'';',
'    });',
'',
'    var panel = document.getElementById(activity + ''-panel'');',
'    if (panel) {',
'      panel.style.display = ''block'';',
'      setTimeout(function() {',
'        panel.scrollIntoView({ behavior: ''smooth'', block: ''start'' });',
'      }, 50);',
'    }',
'  });',
'});',
'',
unistr('// \2500\2500 Close buttons \2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500\2500'),
'document.querySelectorAll(''.ora-ra .close-panel'').forEach(function(btn) {',
'  btn.addEventListener(''click'', function() {',
'    var panel = document.getElementById(this.dataset.panel);',
'    if (panel) panel.style.display = ''none'';',
'  });',
'});',
'',
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'//  CALLBACK PANEL FUNCTIONS',
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'function updateCallbackAI(issueType) {',
'  var div = document.getElementById(''ai-callback-suggestions'');',
'  if (!issueType) {',
unistr('    div.innerHTML = ''<div class="o-alert o-alert-info"><strong>\D83D\DCA1 Suggestion:</strong> Select an issue type to get AI-powered recommendations</div>'';'),
'    return;',
'  }',
'  var r = {',
'    login:       { avgTime: ''15 minutes'', suggestion: ''Most login issues can be resolved through self-service password reset. Would you like to try that first?'',           articles: [''Password Reset Guide'', ''Two-Factor Authentication Setup''] },',
'    performance: { avgTime: ''20 minutes'', suggestion: ''Consider clearing your browser cache - this resolves 87% of performance issues.'',                                    articles: [''Browser Optimization'', ''Network Troubleshooting''] },',
'    data:        { avgTime: ''25 minutes'', suggestion: ''Data issues often resolve automatically after 15 minutes. Check if a manual refresh helps first.'',                   articles: [''Data Sync Troubleshooting'', ''Export/Import Guide''] },',
'    billing:     { avgTime: ''10 minutes'', suggestion: ''Have your account number ready for faster resolution.'',                                                               articles: [''Understanding Your Bill'', ''Payment Methods''] },',
'    technical:   { avgTime: ''30 minutes'', suggestion: ''Gather error messages and screenshots before the call for efficient troubleshooting.'',                                articles: [''System Requirements'', ''API Documentation''] },',
'    other:       { avgTime: ''20 minutes'', suggestion: ''Our general support team can handle a wide range of issues.'',                                                         articles: [''Getting Started'', ''FAQ''] }',
'  };',
'  var rec = r[issueType];',
'  div.innerHTML =',
unistr('    ''<div style="background:#fff;padding:16px;border-radius:6px;font-size:12px;"><strong>\23F1\FE0F Estimated Call Duration:</strong><br>'' + rec.avgTime + ''</div>'' +'),
unistr('    ''<div style="background:#FCF8E3;padding:16px;border-radius:6px;font-size:12px;"><strong>\D83D\DCA1 AI Suggestion:</strong><br>'' + rec.suggestion + ''</div>'' +'),
unistr('    ''<div style="background:#fff;padding:16px;border-radius:6px;"><strong style="font-size:12px;display:block;margin-bottom:4px;">\D83D\DCDA Helpful Articles:</strong>'' +'),
'    rec.articles.map(function(a) {',
unistr('      return ''<a href="#" style="display:block;color:#C74634;text-decoration:none;font-size:12px;margin-bottom:4px;">\2192 '' + a + ''</a>'';'),
'    }).join('''') + ''</div>'';',
'}',
'',
'// Set min date to today',
'var cbDate = document.getElementById(''callback-date'');',
'if (cbDate) cbDate.min = new Date().toISOString().split(''T'')[0];',
'',
'// Callback form submit',
'var cbForm = document.getElementById(''callbackForm'');',
'if (cbForm) {',
'  cbForm.addEventListener(''submit'', function(e) {',
'    e.preventDefault();',
'    var phone = document.getElementById(''callback-phone'').value;',
'    var date  = document.getElementById(''callback-date'').value;',
'    var time  = document.getElementById(''callback-time'').value;',
'    var msg = document.createElement(''div'');',
'    msg.className = ''o-alert o-alert-success'';',
'    msg.style.marginTop = ''16px'';',
'    msg.innerHTML =',
unistr('      ''<h3 style="font-size:16px;font-weight:600;margin:0 0 8px 0;">\2713 Callback Scheduled Successfully!</h3>'' +'),
'      ''<p style="margin:0;font-size:12px;">We\''ll call you at <strong>'' + phone + ''</strong> on <strong>'' +',
'      new Date(date).toLocaleDateString() + ''</strong> at <strong>'' + time + ''</strong>.</p>'' +',
'      ''<p style="margin:8px 0 0;font-size:12px;">Reference: <strong>CB-'' + Date.now().toString().slice(-6) + ''</strong></p>'';',
'    this.parentElement.insertBefore(msg, this);',
'    this.reset();',
'    updateCallbackAI('''');',
'    setTimeout(function() { msg.remove(); }, 10000);',
'  });',
'}',
'',
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'//  MY SUPPORT REQUESTS FUNCTIONS',
unistr('// \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550'),
'function filterSRs(status) {',
'  document.querySelectorAll(''.ora-ra .sr-card'').forEach(function(card) {',
'    card.style.display = (status === ''all'' || card.dataset.status === status) ? ''block'' : ''none'';',
'  });',
'}',
'',
'function viewSRDetails(srNumber) {',
'  alert(',
'    ''Viewing details for '' + srNumber + ''\n\n'' +',
'    ''In a full implementation this would open a detailed view with:\n'' +',
'    ''- Complete SR history\n- Attached files\n- Communication log\n'' +',
'    ''- Resolution steps\n- Feedback option''',
'  );',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'setTimeout(function() {',
'  var fullName = $(".ora-user-name").text().trim();',
'  if (!fullName || fullName === "") {',
'    $(".ora-user-initials").first().text("U");',
'    return;',
'  }',
'  var parts = fullName.split(" ");',
'  var initials = "";',
'  if (parts.length >= 2) {',
'    initials = parts[0].charAt(0).toUpperCase() +',
'               parts[1].charAt(0).toUpperCase();',
'  } else {',
'    initials = fullName.substring(0, 2).toUpperCase();',
'  }',
'  $(".ora-user-initials").first().text(initials);',
'}, 200);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/* ===== ORACLE HEADER \2014 EXACT MATCH ===== */'),
'.ora-header {',
'  background-color: #3a3a3a;',
'  height: 80px;',
'  display: flex;',
'  align-items: center;',
'  justify-content: space-between;',
'  padding: 0 24px;',
'  position: fixed;',
'  top: 0; left: 0; right: 0;',
'  z-index: 1000;',
'}',
'.ora-header-left {',
'  display: flex;',
'  align-items: center;',
'}',
'.ora-logo-sub {',
'  font-family: ''Open Sans'', Arial, sans-serif;',
'  font-weight: 400;',
'  font-size: 18px;',
'  color: #ffffff;',
'  letter-spacing: 0.2px;',
'  white-space: nowrap;',
'}',
'.ora-user-badge {',
'  display: flex;',
'  align-items: center;',
'  gap: 8px;',
'  background-color: #ffffff;',
'  border-radius: 20px;',
'  padding: 5px 14px 5px 6px;',
'  cursor: pointer;',
'}',
'.ora-user-initials {',
'  width: 30px;',
'  height: 30px;',
'  border-radius: 50%;',
'  background-color: #C74634;',
'  color: #ffffff;',
'  font-family: ''Open Sans'', Arial, sans-serif;',
'  font-weight: 700;',
'  font-size: 11px;',
'  display: flex;',
'  align-items: center;',
'  justify-content: center;',
'  letter-spacing: 0.5px;',
'  flex-shrink: 0;',
'}',
'.ora-user-name {',
'  font-family: ''Open Sans'', Arial, sans-serif;',
'  font-weight: 400;',
'  font-size: 13.5px;',
'  color: #333333;',
'  white-space: nowrap;',
'}',
'',
'/* ===================== LAYOUT ===================== */',
'.two-col-layout {',
'  display: flex !important;',
'  flex-direction: row !important;',
'  gap: 24px;',
'  align-items: flex-start;',
'  padding: 24px;',
'  width: 100%;',
'  max-width: 1400px;',
'  margin: 0 auto;',
'  box-sizing: border-box;',
'}',
'',
'/* ===================== LEFT COLUMN ===================== */',
'.form-title {',
'  font-size: x-large;',
'  font-weight: 700;',
'  color: #1a1a1a;',
'  margin-bottom: 6px;',
'  flex: 0 0 520px !important;',
'  width: 720px !important;',
'  min-height: 600px;',
'  background: #ffffff;',
'  border-radius: 10px;',
'  padding: 32px !important;',
'  box-shadow: 0 1px 6px rgba(0,0,0,0.10);',
'  box-sizing: border-box;',
'}',
'.form-divider {',
'  border: none;',
'  border-top: 1px solid #e5e5e5;',
'  margin-bottom: 24px;',
'}',
'',
'/* ===================== RIGHT COLUMN ===================== */',
'.solution-col {',
'  flex: 1 !important;',
'  min-width: 0;',
'  min-height: 500px;',
'  box-sizing: border-box;',
'}',
'',
'/* ===================== HIDDEN / VISIBLE ===================== */',
'.hidden { display: none !important; }',
'.visible {',
'  display: block !important;',
'  animation: slideIn 0.35s ease;',
'}',
'@keyframes slideIn {',
'  from { opacity: 0; transform: translateX(30px); }',
'  to   { opacity: 1; transform: translateX(0); }',
'}',
'',
'/* ===== BANNER ===== */',
'.ai-banner {',
'  background: linear-gradient(135deg, #7b5ea7, #5b8dee);',
'  border-radius: 10px 10px 0 0;',
'  padding: 18px 20px;',
'  display: flex;',
'  align-items: center;',
'  gap: 14px;',
'  position: relative;',
'}',
'.ai-banner-text h2 {',
'  color: #ffffff;',
'  font-size: 1.15rem;',
'  font-weight: 700;',
'  margin: 0 0 4px 0;',
'}',
'.ai-banner-text p {',
'  color: rgba(255,255,255,0.85);',
'  font-size: 0.82rem;',
'  margin: 0;',
'}',
'.ai-close-btn {',
'  position: absolute;',
'  right: 14px; top: 12px;',
'  background: rgba(255,255,255,0.2);',
'  border: none; color: #fff;',
'  border-radius: 50%;',
'  width: 26px; height: 26px;',
'  cursor: pointer;',
'  font-size: 0.9rem;',
'  line-height: 26px;',
'  text-align: center;',
'}',
'.ai-close-btn:hover { background: rgba(255,255,255,0.35); }',
'',
'/* ===== SOLUTION BODY ===== */',
'.ai-body-wrap {',
'  background: #ffffff;',
'  border: none;',
'  padding: 24px 28px !important;',
'}',
'',
'#ai-solution-panel.visible {',
'  border: 1px solid #e0e0e0;',
'  border-radius: 10px;',
'  box-shadow: 0 1px 6px rgba(0,0,0,0.10);',
'  overflow: hidden;',
'}',
'',
'/* =====================================================',
'   KILL ALL APEX ITEM WRAPPERS INSIDE SOLUTION PANEL',
'   ===================================================== */',
'.ai-body-wrap .t-Form-fieldContainer,',
'.ai-body-wrap .t-Form-fieldContainer--stacked,',
'.ai-body-wrap .t-Form-inputContainer,',
'.ai-body-wrap .t-Form-itemWrapper,',
'.ai-body-wrap .t-Form-labelContainer,',
'.ai-body-wrap .apex-form-group,',
'.ai-body-wrap .apex-item-group {',
'  border: none !important;',
'  box-shadow: none !important;',
'  background: transparent !important;',
'  margin: 0 !important;',
'}',
'',
'/* Hide all item labels inside solution panel */',
'.ai-body-wrap .t-Form-label,',
'.ai-body-wrap label {',
'  display: none !important;',
'}',
'',
'/* Kill dotted borders on the actual input/display elements */',
'.ai-body-wrap input[readonly],',
'.ai-body-wrap input[disabled],',
'.ai-body-wrap textarea[readonly],',
'.ai-body-wrap textarea[disabled],',
'.ai-body-wrap .apex-item-display-only,',
'.ai-body-wrap .apex-item-text {',
'  border: none !important;',
'  box-shadow: none !important;',
'  background: transparent !important;',
'  outline: none !important;',
'  resize: none !important;',
'  padding: 0 !important;',
'  margin: 0 !important;',
'  width: 100% !important;',
'}',
'',
'/* ===== P3_AI_ISSUE_TITLE ===== */',
'#P3_AI_ISSUE_TITLE,',
'#P3_AI_ISSUE_TITLE_DISPLAY {',
'  font-size: 1rem !important;',
'  font-weight: 700 !important;',
'  color: #1a1a1a !important;',
'  margin: 0 0 6px 0 !important;',
'  padding: 0 !important;',
'  border: none !important;',
'  background: transparent !important;',
'  box-shadow: none !important;',
'  display: block !important;',
'}',
'',
'/* ===== P3_AI_CONFIDENCE ===== */',
'#P3_AI_CONFIDENCE,',
'#P3_AI_CONFIDENCE_DISPLAY {',
'  font-size: 0.9rem !important;',
'  font-weight: 700 !important;',
'  color: #444 !important;',
'  margin: 0 0 14px 0 !important;',
'  padding: 0 !important;',
'  border: none !important;',
'  background: transparent !important;',
'  box-shadow: none !important;',
'  display: block !important;',
'}',
'',
'/* ===== P3_AI_STEPS ===== */',
'#P3_AI_STEPS,',
'#P3_AI_STEPS_DISPLAY {',
'  font-size: 0.92rem !important;',
'  color: #222 !important;',
'  line-height: 1.7 !important;',
'  white-space: pre-line !important;',
'  margin: 0 0 14px 0 !important;',
'  padding: 0 !important;',
'  border: none !important;',
'  background: transparent !important;',
'  box-shadow: none !important;',
'  display: block !important;',
'}',
'',
'/* ===== P3_AI_ADDITIONAL ===== */',
'#P3_AI_ADDITIONAL,',
'#P3_AI_ADDITIONAL_DISPLAY {',
'  font-size: 0.88rem !important;',
'  color: #555 !important;',
'  line-height: 1.6 !important;',
'  border-top: 1px solid #e5e5e5 !important;',
'  border-left: none !important;',
'  border-right: none !important;',
'  border-bottom: none !important;',
'  box-shadow: none !important;',
'  background: transparent !important;',
'  padding: 12px 0 0 0 !important;',
'  margin: 0 !important;',
'  display: block !important;',
'  white-space: pre-line !important;',
'}',
'',
'/* ===== FEEDBACK BOX ===== */',
'.ai-feedback-wrap {',
'  background: #ddeef8;',
'  border: none;',
'  border-top: 1px solid #e0e0e0;',
'  border-radius: 0 0 10px 10px;',
'  padding: 18px 28px;',
'}',
'.ai-feedback-title {',
'  font-weight: 700;',
'  font-size: 0.95rem;',
'  color: #1a1a1a;',
'  margin: 0 0 12px 0;',
'}',
'.btn-solved {',
'  display: block;',
'  width: 100%;',
'  background: #2d6a3f;',
'  color: #ffffff;',
'  border: none;',
'  border-radius: 6px;',
'  padding: 11px 16px;',
'  margin-bottom: 10px;',
'  cursor: pointer;',
'  font-size: 0.92rem;',
'  font-weight: 600;',
'  text-align: center;',
'}',
'.btn-solved:hover { background: #235232; }',
'.btn-create-sr {',
'  display: block;',
'  width: 100%;',
'  background: #ffffff;',
'  color: #333333;',
'  border: 1px solid #cccccc;',
'  border-radius: 6px;',
'  padding: 11px 16px;',
'  cursor: pointer;',
'  font-size: 0.92rem;',
'  text-align: center;',
'}',
'.btn-create-sr:hover { background: #f5f5f5; }',
'',
'/* ===================== BUTTONS ===================== */',
'.btn-get-ai {',
'  background: #191919 !important;',
'  color: #fffefe !important;',
'  border: none !important;',
'  border-radius: 6px !important;',
'  padding: 10px 22px !important;',
'  font-size: 0.95rem !important;',
'  cursor: pointer;',
'  margin-right: 10px;',
'}',
'.btn-get-ai:hover { background: #a33828 !important; }',
'.btn-clear {',
'  background: #030303 !important;',
'  color: #fffdfd !important;',
'  border: 1px solid #cccccc !important;',
'  border-radius: 6px !important;',
'  padding: 10px 22px !important;',
'  font-size: 0.95rem !important;',
'  cursor: pointer;',
'}',
'.btn-clear:hover { background: #a33828 !important; }',
'.btn-get-ai:focus,.btn-clear:focus { outline: none !important; box-shadow: none !important; }',
'',
'/* ===================== RESPONSIVE ===================== */',
'@media (max-width: 900px) {',
'  .two-col-layout {',
'    flex-direction: column !important;',
'    padding: 12px;',
'  }',
'  .form-col {',
'    flex: unset !important;',
'    width: 100% !important;',
'  }',
'}',
'.ai-solution-body > .container > .row > .col {',
'  padding-left: 20px !important;',
'  padding-right: 20px !important;',
'}',
'#P3_FULLNAME_CONTAINER .display_only {',
'  border: 1px solid #d0d0d0 !important;',
'  border-radius: 4px !important;',
'  padding: 8px !important;',
'  outline: none !important;',
'}',
'#P3_TYPE:focus,',
'#P3_DESC:focus,',
'#P3_FULLNAME:focus {',
'  outline: none !important;',
'  border: 1px solid #7b7b7b !important;',
'  box-shadow: 0 0 3px #7b7b7b !important;',
'}',
'/* ===================== RECOMMENDED ACTIVITIES ===================== */',
'.rec-section {',
'  background: linear-gradient(135deg, #6a5acd, #9b8ec4, #c4b5e0) !important;',
'  border-radius: 16px !important;',
'  padding: 30px 40px !important;',
'  margin-top: 30px !important;',
'}',
'',
'.rec-section .t-Region-header h2.t-Region-title {',
'  color: #ffffff !important;',
'  font-size: 1.5rem !important;',
'  font-weight: 700 !important;',
'}',
'',
'.rec-subtitle {',
'  color: #e0dce8 !important;',
'  font-size: 0.9rem !important;',
'  margin: 4px 0 0 0 !important;',
'}',
'',
'.rec-divider {',
'  border: none !important;',
'  border-top: 1px solid rgba(255, 255, 255, 0.3) !important;',
'  margin: 18px 0 !important;',
'}',
'',
'/* Card grid */',
'.rec-cards-wrapper .t-Cards {',
'  display: flex !important;',
'  gap: 20px !important;',
'}',
'',
'.rec-cards-wrapper .t-Cards-item {',
'  flex: 1 !important;',
'}',
'',
'/* Individual cards */',
'.rec-cards-wrapper .t-Card,',
'.rec-cards-wrapper .t-Card-wrap {',
'  background: rgba(255, 255, 255, 0.15) !important;',
'  border-radius: 12px !important;',
'  border: none !important;',
'  box-shadow: none !important;',
'}',
'',
'.rec-cards-wrapper .t-Card:hover,',
'.rec-cards-wrapper .t-Card-wrap:hover {',
'  background: rgba(255, 255, 255, 0.25) !important;',
'}',
'',
'/* Card icon */',
'.rec-cards-wrapper .t-Card-icon .t-Icon {',
'  color: #ffffff !important;',
'  background: rgba(255, 255, 255, 0.2) !important;',
'  border-radius: 50% !important;',
'  width: 48px !important;',
'  height: 48px !important;',
'  line-height: 48px !important;',
'  font-size: 1.3rem !important;',
'}',
'',
'/* Card text */',
'.rec-cards-wrapper .t-Card-title {',
'  color: #ffffff !important;',
'  font-size: 1rem !important;',
'  font-weight: 600 !important;',
'}',
'',
'.rec-cards-wrapper .t-Card-desc {',
'  color: #ddd8e8 !important;',
'  font-size: 0.85rem !important;',
'  line-height: 1.4 !important;',
'}',
'',
'/* Remove any default backgrounds */',
'.rec-cards-wrapper .t-Region-body {',
'  background: transparent !important;',
'}',
'',
'',
'',
'.ora-ra{--sp-xs:4px;--sp-sm:8px;--sp-md:16px;--sp-lg:24px;--sp-xl:32px;--fs-xs:11px;--fs-sm:12px;--fs-base:14px;--fs-lg:16px;--fs-xl:20px;--fs-h2:20px;--fs-h3:18px;--red:#C74634;--red-dark:#A33A2A;--n0:#FFFFFF;--n50:#FAFAFA;--n100:#F5F5F5;--n200:#EEE'
||'EEE;--n300:#E0E0E0;--n400:#BDBDBD;--n500:#9E9E9E;--n600:#757575;--n700:#616161;--n800:#424242;--n900:#212121;--grad:linear-gradient(135deg,#667eea 0%,#764ba2 100%);--success:#3C763D;--success-light:#DFF0D8;--info:#31708F;--info-light:#D9EDF7;--warnin'
||'g:#8A6D3B;--warning-light:#FCF8E3;--r-sm:4px;--r-md:6px;--r-lg:8px;--sh-sm:0 1px 3px rgba(0,0,0,.12);--sh-md:0 4px 10px rgba(0,0,0,.12);font-family:-apple-system,BlinkMacSystemFont,"Segoe UI","Helvetica Neue",Arial,sans-serif;font-size:var(--fs-base)'
||';color:var(--n800);line-height:1.5;box-sizing:border-box}',
'.ora-ra *,.ora-ra *::before,.ora-ra *::after{box-sizing:border-box}',
'.ora-ra .o-card{background:var(--n0);border:1px solid var(--n200);border-radius:var(--r-lg);box-shadow:var(--sh-md);padding:var(--sp-xl);margin-top:var(--sp-lg)}',
'.ora-ra .o-card-header{padding-bottom:var(--sp-md);border-bottom:2px solid var(--n200);margin-bottom:var(--sp-lg)}',
'.ora-ra .o-card-title{font-size:var(--fs-h2);font-weight:600;color:var(--n900);margin:0 0 4px 0}',
'.ora-ra .o-card-subtitle{font-size:var(--fs-sm);color:var(--n600);margin:0}',
'.ora-ra .o-btn{display:inline-flex;align-items:center;justify-content:center;gap:var(--sp-sm);padding:9px 18px;font-size:var(--fs-base);font-weight:500;font-family:inherit;border-radius:var(--r-md);border:1px solid transparent;cursor:pointer;transiti'
||'on:background .15s,box-shadow .15s,transform .12s;text-decoration:none;line-height:1.4}',
'.ora-ra .o-btn:disabled{opacity:.5;cursor:not-allowed}',
'.ora-ra .o-btn-primary{background:var(--red);color:#fff;border-color:var(--red)}',
'.ora-ra .o-btn-primary:hover:not(:disabled){background:var(--red-dark);transform:translateY(-1px);box-shadow:var(--sh-md)}',
'.ora-ra .o-btn-secondary{background:var(--n0);color:var(--n700);border-color:var(--n300)}',
'.ora-ra .o-btn-secondary:hover:not(:disabled){background:var(--n100);border-color:var(--n400)}',
'.ora-ra .o-btn-success{background:var(--success);color:#fff;border-color:var(--success)}',
'.ora-ra .o-btn-group{display:flex;gap:var(--sp-sm);flex-wrap:wrap}',
'.ora-ra .o-form-group{margin-bottom:var(--sp-lg)}',
'.ora-ra .o-form-label{display:block;font-weight:500;color:var(--n700);margin-bottom:var(--sp-sm);font-size:var(--fs-base)}',
'.ora-ra .o-form-label.req::after{content:" *";color:var(--red)}',
'.ora-ra .o-form-text{font-size:var(--fs-sm);color:var(--n600);margin-top:var(--sp-xs);display:block}',
'.ora-ra .o-form-ctrl{width:100%;padding:9px 12px;font-size:var(--fs-base);font-family:inherit;color:var(--n800);background:var(--n0);border:1px solid var(--n300);border-radius:var(--r-md);transition:border-color .15s,box-shadow .15s;appearance:none}',
'.ora-ra .o-form-ctrl:focus{outline:none;border-color:var(--red);box-shadow:0 0 0 3px rgba(199,70,52,.1)}',
'.ora-ra select.o-form-ctrl{cursor:pointer;background-image:url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' width=''12'' height=''12'' viewBox=''0 0 12 12''%3E%3Cpath fill=''%23616161'' d=''M6 9L1 4h10z''/%3E%3C/svg%3E");background-repeat:no-r'
||'epeat;background-position:right 12px center;padding-right:36px}',
'.ora-ra textarea.o-form-ctrl{min-height:100px;resize:vertical}',
'.ora-ra .o-alert{padding:var(--sp-md);border-radius:var(--r-md);font-size:var(--fs-sm)}',
'.ora-ra .o-alert-info{background:var(--info-light);color:var(--info);border-left:4px solid var(--info)}',
'.ora-ra .o-alert-warning{background:var(--warning-light);color:var(--warning);border-left:4px solid var(--warning)}',
'.ora-ra .o-alert-success{background:var(--success-light);color:var(--success);border-left:4px solid var(--success)}',
'.ora-ra .ra-section{background:var(--grad);border-radius:var(--r-lg);padding:var(--sp-xl)}',
'.ora-ra .ra-inner{border:1px solid rgba(255,255,255,.3);border-radius:var(--r-lg);padding:var(--sp-lg)}',
'.ora-ra .ra-header{padding-bottom:var(--sp-md);border-bottom:1px solid rgba(255,255,255,.25);margin-bottom:var(--sp-lg)}',
'.ora-ra .ra-header h2{font-size:var(--fs-h2);font-weight:700;color:#fff;margin:0 0 4px 0}',
'.ora-ra .ra-header p{font-size:var(--fs-sm);color:rgba(255,255,255,.85);margin:0}',
'.ora-ra .ra-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:var(--sp-md)}',
'.ora-ra .activity-card{background:rgba(255,255,255,.15);backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.12);border-radius:var(--r-lg);padding:var(--sp-lg);cursor:pointer;transition:background .2s,trans'
||'form .15s,box-shadow .15s}',
'.ora-ra .activity-card:hover{background:rgba(255,255,255,.28);transform:translateY(-2px);box-shadow:0 6px 20px rgba(0,0,0,.2)}',
'.ora-ra .activity-card:active{transform:translateY(0)}',
'.ora-ra .ra-card-body{display:flex;align-items:flex-start;gap:var(--sp-md)}',
'.ora-ra .ra-icon{width:48px;height:48px;background:rgba(255,255,255,.2);border-radius:var(--r-md);display:flex;align-items:center;justify-content:center;font-size:22px;flex-shrink:0}',
'.ora-ra .ra-card-text h3{font-size:var(--fs-base);font-weight:600;color:#fff;margin:0 0 6px 0}',
'.ora-ra .ra-card-text p{font-size:var(--fs-sm);color:rgba(255,255,255,.9);margin:0;line-height:1.5}',
'.ora-ra .activity-panel{display:none}',
'.ora-ra .panel-top-row{display:flex;justify-content:space-between;align-items:center}',
'.ora-ra .chat-layout{display:grid;grid-template-columns:1fr 300px;gap:var(--sp-lg);height:560px}',
'.ora-ra .chat-col{display:flex;flex-direction:column;background:var(--n50);border-radius:var(--r-md);overflow:hidden}',
'.ora-ra #chat-messages{flex:1;padding:var(--sp-lg);overflow-y:auto;display:flex;flex-direction:column;gap:var(--sp-md)}',
'.ora-ra .chat-message{animation:ora-slide-in .3s ease-out}',
'@keyframes ora-slide-in{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}',
'.ora-ra #suggested-questions{padding:0 var(--sp-lg) var(--sp-sm);display:flex;gap:var(--sp-sm);flex-wrap:wrap;background:var(--n50)}',
'.ora-ra .sugg-btn{background:var(--n0);border:1px solid var(--n300);border-radius:20px;padding:5px 12px;font-size:var(--fs-sm);color:var(--n700);cursor:pointer;font-family:inherit;transition:border-color .15s,color .15s}',
'.ora-ra .sugg-btn:hover{border-color:var(--red);color:var(--red)}',
'.ora-ra .chat-input-bar{padding:var(--sp-md);background:var(--n0);border-top:1px solid var(--n200)}',
'.ora-ra .chat-input-row{display:flex;gap:var(--sp-sm)}',
'.ora-ra #chat-input{flex:1;padding:9px 12px;font-size:var(--fs-base);font-family:inherit;border:1px solid var(--n300);border-radius:var(--r-md);outline:none;color:var(--n800)}',
'.ora-ra #chat-input:focus{border-color:var(--red);box-shadow:0 0 0 3px rgba(199,70,52,.1)}',
'.ora-ra .chat-status{margin-top:6px;font-size:var(--fs-xs);color:var(--n600)}',
'.ora-ra .chat-sidebar{background:var(--n100);border-radius:var(--r-md);padding:var(--sp-lg);overflow-y:auto;display:flex;flex-direction:column;gap:var(--sp-md)}',
'.ora-ra .chat-sidebar h4{font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0}',
'.ora-ra .qs-item{background:var(--n0);padding:8px 10px;border-radius:var(--r-sm);cursor:pointer;font-size:var(--fs-sm);color:var(--n700);border:1px solid var(--n200);margin-bottom:6px;transition:border-color .15s}',
'.ora-ra .qs-item:hover{border-color:var(--red);color:var(--red)}',
'.ora-ra .sidebar-links{display:flex;flex-direction:column;gap:6px}',
'.ora-ra .sidebar-links a{font-size:var(--fs-sm);color:var(--red);text-decoration:none}',
'.ora-ra .sidebar-links a:hover{text-decoration:underline}',
'.ora-ra .sidebar-info{background:var(--n0);border-radius:var(--r-sm);padding:10px 12px;font-size:var(--fs-sm);color:var(--n700)}',
'.ora-ra .cb-layout{display:grid;grid-template-columns:1fr 400px;gap:var(--sp-xl)}',
'.ora-ra .sr-layout{display:grid;grid-template-columns:1fr 350px;gap:var(--sp-lg)}',
'.ora-ra .sr-filters{display:flex;gap:var(--sp-md);margin-bottom:var(--sp-lg);flex-wrap:wrap}',
'.ora-ra .sr-summary{background:var(--grad);color:#fff;padding:var(--sp-lg);border-radius:var(--r-md);margin-bottom:var(--sp-lg);display:grid;grid-template-columns:repeat(3,1fr);gap:var(--sp-lg)}',
'.ora-ra .sr-summary-num{font-size:22px;font-weight:700}',
'.ora-ra .sr-summary-lbl{font-size:var(--fs-sm);opacity:.9}',
'.ora-ra #sr-list{display:flex;flex-direction:column;gap:var(--sp-md)}',
'.ora-ra .sr-card{background:var(--n0);border:1px solid var(--n200);border-radius:var(--r-md);padding:var(--sp-lg);cursor:pointer;transition:box-shadow .2s,transform .15s}',
'.ora-ra .sr-card:hover{box-shadow:var(--sh-md);transform:translateY(-2px)}',
'.ora-ra .sr-card-top{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--sp-md)}',
'.ora-ra .sr-num{font-weight:600;font-size:var(--fs-lg);margin-bottom:4px}',
'.ora-ra .sr-desc{color:var(--n600);font-size:var(--fs-sm)}',
'.ora-ra .sr-meta{display:grid;grid-template-columns:repeat(3,1fr);gap:var(--sp-md);font-size:var(--fs-sm);color:var(--n600);margin-bottom:var(--sp-md)}',
'.ora-ra .status-badge{padding:4px 12px;border-radius:12px;font-size:var(--fs-xs);font-weight:600;white-space:nowrap}',
'.ora-ra .badge-inprogress{background:var(--warning-light);color:var(--warning)}',
'.ora-ra .badge-open{background:var(--info-light);color:var(--info)}',
'.ora-ra .badge-resolved{background:var(--success-light);color:var(--success)}',
'.ora-ra .badge-closed{background:var(--n200);color:var(--n700)}',
'.ora-ra .sr-sidebar{background:var(--n100);border-radius:var(--r-md);padding:var(--sp-lg);display:flex;flex-direction:column;gap:var(--sp-md)}',
'@media(max-width:900px){.ora-ra .chat-layout,.ora-ra .cb-layout,.ora-ra .sr-layout{grid-template-columns:1fr}.ora-ra .chat-layout{height:auto}}',
'@media(max-width:600px){.ora-ra .ra-grid{grid-template-columns:1fr}.ora-ra .ra-section{padding:var(--sp-md)}}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24607503393415286)
,p_plug_name=>'Recommended activities'
,p_title=>'Recommended Activities'
,p_region_css_classes=>'rec-section'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ora-ra">',
'',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<!--   RECOMMENDED ACTIVITIES                   -->',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<div class="ra-section">',
'  <div class="ra-inner">',
'    <div class="ra-header">',
'      <h2>Recommended Activities</h2>',
'      <p>Quick access to common support options</p>',
'    </div>',
'    <div class="ra-grid">',
'',
unistr('      <!-- Card 1: Live Chat \2192 triggers APEX AI Assistant -->'),
'      <div class="activity-card" id="ra-livechat-card" data-activity="livechat"',
'           role="button" tabindex="0"',
'           onkeypress="if(event.key===''Enter''||event.key==='' '')this.click()">',
'        <div class="ra-card-body">',
unistr('          <div class="ra-icon">\D83D\DCAC</div>'),
'          <div class="ra-card-text">',
'            <h3>Live Chat with an Analyst</h3>',
'            <p>Here you can initiate a chat session with our support analyst</p>',
'          </div>',
'        </div>',
'      </div>',
'',
unistr('      <!-- Card 2: Request Call Back \2192 opens inline panel -->'),
'      <div class="activity-card" data-activity="callback"',
'           role="button" tabindex="0"',
'           onkeypress="if(event.key===''Enter''||event.key==='' '')this.click()">',
'        <div class="ra-card-body">',
unistr('          <div class="ra-icon">\D83D\DCDE</div>'),
'          <div class="ra-card-text">',
'            <h3>Request Call Back</h3>',
'            <p>Enter your details, and we''ll arrange a call from our support team at your convenience</p>',
'          </div>',
'        </div>',
'      </div>',
'',
unistr('      <!-- Card 3: My Support Requests \2192 opens inline panel -->'),
'      <div class="activity-card" data-activity="myrequests"',
'           role="button" tabindex="0"',
'           onkeypress="if(event.key===''Enter''||event.key==='' '')this.click()">',
'        <div class="ra-card-body">',
unistr('          <div class="ra-icon">\D83D\DCCB</div>'),
'          <div class="ra-card-text">',
'            <h3>My Support Requests</h3>',
'            <p>List of service requests submitted by you</p>',
'          </div>',
'        </div>',
'      </div>',
'',
'    </div><!-- /ra-grid -->',
'  </div><!-- /ra-inner -->',
'</div><!-- /ra-section -->',
'',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
unistr('<!--   HIDDEN BUTTON \2014 DO NOT REMOVE            -->'),
'<!--   APEX Dynamic Action "Show AI Assistant"  -->',
'<!--   must be attached to this button          -->',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<button id="btnShowAIAssistant"',
'        style="display:none;visibility:hidden;position:absolute;pointer-events:none;"',
'        aria-hidden="true">',
'  AI Assistant Trigger',
'</button>',
'',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<!--   PANEL: REQUEST CALL BACK                 -->',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<div class="o-card activity-panel" id="callback-panel">',
'  <div class="o-card-header">',
'    <div class="panel-top-row">',
'      <div>',
unistr('        <h2 class="o-card-title">\D83D\DCDE Request a Call Back</h2>'),
'        <p class="o-card-subtitle">AI will suggest the best time based on availability</p>',
'      </div>',
unistr('      <button class="o-btn o-btn-secondary close-panel" data-panel="callback-panel">\2715 Close</button>'),
'    </div>',
'  </div>',
'  <div class="cb-layout">',
'    <div>',
'      <form id="callbackForm">',
'        <div class="o-form-group">',
'          <label class="o-form-label req" for="callback-phone">Phone Number</label>',
'          <input type="tel" id="callback-phone" class="o-form-ctrl" placeholder="+1 (555) 123-4567" required>',
'          <small class="o-form-text">We''ll call you at this number</small>',
'        </div>',
'        <div class="o-form-group">',
'          <label class="o-form-label req" for="callback-issue">What can we help you with?</label>',
'          <select id="callback-issue" class="o-form-ctrl" required onchange="updateCallbackAI(this.value)">',
'            <option value="">-- Select Issue Type --</option>',
'            <option value="login">Login/Password Issues</option>',
'            <option value="performance">Performance Problems</option>',
'            <option value="data">Data or Sync Issues</option>',
'            <option value="billing">Billing Questions</option>',
'            <option value="technical">Technical Support</option>',
'            <option value="other">Other</option>',
'          </select>',
'        </div>',
'        <div class="o-form-group">',
'          <label class="o-form-label" for="callback-details">Additional Details (Optional)</label>',
'          <textarea id="callback-details" class="o-form-ctrl" rows="4"',
'                    placeholder="Provide any additional context that might help us assist you better..."></textarea>',
'          <small class="o-form-text">AI is analyzing your input to suggest relevant specialists</small>',
'        </div>',
'        <div class="o-form-group">',
'          <label class="o-form-label req">Preferred Time (Local Timestamp)</label>',
'          <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">',
'            <div>',
'              <label class="o-form-label" for="callback-date" style="font-size:12px;margin-bottom:4px;">Date</label>',
'              <input type="date" id="callback-date" class="o-form-ctrl" required>',
'            </div>',
'            <div>',
'              <label class="o-form-label" for="callback-time" style="font-size:12px;margin-bottom:4px;">Time</label>',
'              <select id="callback-time" class="o-form-ctrl" required>',
'                <option value="">-- Select Time --</option>',
'                <option value="09:00">9:00 AM - 10:00 AM</option>',
'                <option value="10:00">10:00 AM - 11:00 AM</option>',
'                <option value="11:00">11:00 AM - 12:00 PM</option>',
'                <option value="12:00">12:00 PM - 1:00 PM</option>',
'                <option value="13:00">1:00 PM - 2:00 PM</option>',
'                <option value="14:00">2:00 PM - 3:00 PM</option>',
'                <option value="15:00">3:00 PM - 4:00 PM</option>',
'                <option value="16:00">4:00 PM - 5:00 PM</option>',
'              </select>',
'            </div>',
'          </div>',
'        </div>',
'        <div class="o-form-group">',
'          <label class="o-form-label">Language Preference</label>',
'          <div style="display:flex;gap:16px;">',
'            <label style="display:flex;align-items:center;gap:6px;cursor:pointer;"><input type="radio" name="cb-language" value="english" checked><span>English</span></label>',
'            <label style="display:flex;align-items:center;gap:6px;cursor:pointer;"><input type="radio" name="cb-language" value="spanish"><span>Spanish</span></label>',
'            <label style="display:flex;align-items:center;gap:6px;cursor:pointer;"><input type="radio" name="cb-language" value="french"><span>French</span></label>',
'          </div>',
'        </div>',
'        <div class="o-btn-group">',
unistr('          <button type="submit" class="o-btn o-btn-primary">\D83D\DCDE Schedule Call</button>'),
'          <button type="button" class="o-btn o-btn-secondary"',
'                  onclick="document.getElementById(''callbackForm'').reset();updateCallbackAI('''')">Clear</button>',
'        </div>',
'      </form>',
'    </div>',
'    <!-- AI Recommendations Sidebar -->',
'    <div style="background:var(--n100);border-radius:var(--r-md);padding:var(--sp-lg);">',
unistr('      <h3 style="font-size:var(--fs-lg);font-weight:600;margin:0 0 var(--sp-md) 0;">\D83E\DD16 AI Recommendations</h3>'),
'      <div id="ai-callback-suggestions" style="display:flex;flex-direction:column;gap:var(--sp-md);">',
unistr('        <div class="o-alert o-alert-info"><strong>\D83D\DCA1 Suggestion:</strong> Select an issue type to get AI-powered recommendations</div>'),
'      </div>',
'      <div style="margin-top:var(--sp-lg);padding:var(--sp-md);background:var(--grad);color:#fff;border-radius:var(--r-md);">',
unistr('        <h4 style="font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0;">\D83D\DCCA Best Times to Call</h4>'),
'        <p style="font-size:var(--fs-sm);margin:0;opacity:.9;">Based on current load:</p>',
'        <ul style="margin:8px 0 0 20px;font-size:var(--fs-sm);">',
unistr('          <li>\2705 9:00 AM - Low wait time</li>'),
unistr('          <li>\2705 2:00 PM - Recommended</li>'),
unistr('          <li>\26A0\FE0F 11:00 AM - Moderate wait</li>'),
unistr('          <li>\D83D\DD34 1:00 PM - High volume</li>'),
'        </ul>',
'      </div>',
'      <div style="margin-top:var(--sp-lg);padding:var(--sp-md);background:var(--success-light);border-radius:var(--r-md);font-size:var(--fs-sm);">',
unistr('        <strong>\23F1\FE0F Estimated Callback Time:</strong><br>Within 15 minutes of scheduled time'),
'      </div>',
'      <div style="margin-top:var(--sp-lg);padding:var(--sp-md);background:var(--warning-light);border-radius:var(--r-md);font-size:var(--fs-sm);">',
unistr('        <strong>\D83D\DCA1 Quick Tip:</strong><br>Have your account information ready for faster resolution'),
'      </div>',
'    </div>',
'  </div>',
'</div>',
'',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<!--   PANEL: MY SUPPORT REQUESTS               -->',
unistr('<!-- \2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550\2550 -->'),
'<div class="o-card activity-panel" id="myrequests-panel">',
'  <div class="o-card-header">',
'    <div class="panel-top-row">',
'      <div>',
unistr('        <h2 class="o-card-title">\D83D\DCCB My Support Requests</h2>'),
'        <p class="o-card-subtitle">Track and manage your service requests with AI insights</p>',
'      </div>',
unistr('      <button class="o-btn o-btn-secondary close-panel" data-panel="myrequests-panel">\2715 Close</button>'),
'    </div>',
'  </div>',
'  <div class="sr-layout">',
'    <div>',
'      <div class="sr-filters">',
'        <select class="o-form-ctrl" style="width:180px;" onchange="filterSRs(this.value)">',
'          <option value="all">All Requests</option>',
'          <option value="open">Open</option>',
'          <option value="in-progress">In Progress</option>',
'          <option value="resolved">Resolved</option>',
'          <option value="closed">Closed</option>',
'        </select>',
'        <select class="o-form-ctrl" style="width:180px;">',
'          <option value="recent">Most Recent</option>',
'          <option value="oldest">Oldest First</option>',
'          <option value="priority">By Priority</option>',
'        </select>',
'        <input type="text" class="o-form-ctrl" placeholder="Search by SR number or description..." style="flex:1;min-width:200px;">',
'      </div>',
'      <div class="sr-summary">',
'        <div><div class="sr-summary-num">5</div><div class="sr-summary-lbl">Total Requests</div></div>',
'        <div><div class="sr-summary-num">2</div><div class="sr-summary-lbl">Open</div></div>',
'        <div><div class="sr-summary-num">3</div><div class="sr-summary-lbl">Resolved</div></div>',
'      </div>',
'      <div id="sr-list">',
'        <!-- SR 1 -->',
'        <div class="sr-card" data-status="in-progress" onclick="viewSRDetails(''SR-10000523'')">',
'          <div class="sr-card-top"><div><div class="sr-num">SR-10000523</div><div class="sr-desc">Login Issue - Password Reset</div></div><span class="status-badge badge-inprogress">In Progress</span></div>',
'          <div class="sr-meta"><div><strong>Created:</strong> Feb 10, 2026</div><div><strong>Priority:</strong> Medium</div><div><strong>Assigned to:</strong> Sarah Chen</div></div>',
unistr('          <div class="o-alert o-alert-info" style="margin-bottom:12px;">\D83E\DD16 <strong>AI Prediction:</strong> Expected resolution in 4-6 hours</div>'),
'          <div class="o-btn-group"><button class="o-btn o-btn-secondary" style="font-size:12px;flex:1;">View Details</button><button class="o-btn o-btn-secondary" style="font-size:12px;flex:1;">Update Request</button></div>',
'        </div>',
'        <!-- SR 2 -->',
'        <div class="sr-card" data-status="open" onclick="viewSRDetails(''SR-10000542'')">',
'          <div class="sr-card-top"><div><div class="sr-num">SR-10000542</div><div class="sr-desc">Performance Issue - Slow Loading</div></div><span class="status-badge badge-open">Open</span></div>',
'          <div class="sr-meta"><div><strong>Created:</strong> Feb 11, 2026</div><div><strong>Priority:</strong> High</div><div><strong>Assigned to:</strong> Unassigned</div></div>',
unistr('          <div class="o-alert o-alert-warning" style="margin-bottom:12px;">\26A1 <strong>AI Suggestion:</strong> Clear browser cache (87% success rate for similar issues)</div>'),
'          <div class="o-btn-group"><button class="o-btn o-btn-secondary" style="font-size:12px;flex:1;">View Details</button><button class="o-btn o-btn-secondary" style="font-size:12px;flex:1;">Update Request</button></div>',
'        </div>',
'        <!-- SR 3 -->',
'        <div class="sr-card" data-status="resolved" onclick="viewSRDetails(''SR-10000498'')">',
'          <div class="sr-card-top"><div><div class="sr-num">SR-10000498</div><div class="sr-desc">Data Sync Issue - Export Failed</div></div><span class="status-badge badge-resolved">Resolved</span></div>',
'          <div class="sr-meta"><div><strong>Created:</strong> Feb 8, 2026</div><div><strong>Resolved:</strong> Feb 9, 2026</div><div><strong>Resolution Time:</strong> 18 hrs</div></div>',
'        </div>',
'        <!-- SR 4 -->',
'        <div class="sr-card" data-status="resolved">',
'          <div class="sr-card-top"><div><div class="sr-num">SR-10000476</div><div class="sr-desc">Access Issue - Permission Denied</div></div><span class="status-badge badge-resolved">Resolved</span></div>',
'          <div class="sr-meta"><div><strong>Created:</strong> Feb 5, 2026</div><div><strong>Resolved:</strong> Feb 5, 2026</div><div><strong>Resolution Time:</strong> 4 hrs</div></div>',
'        </div>',
'        <!-- SR 5 -->',
'        <div class="sr-card" data-status="closed">',
'          <div class="sr-card-top"><div><div class="sr-num">SR-10000445</div><div class="sr-desc">Integration Issue - API Connection</div></div><span class="status-badge badge-closed">Closed</span></div>',
'          <div class="sr-meta"><div><strong>Created:</strong> Feb 1, 2026</div><div><strong>Closed:</strong> Feb 2, 2026</div><div><strong>Resolution Time:</strong> 22 hrs</div></div>',
'        </div>',
'      </div>',
'    </div>',
'    <!-- AI Analytics Sidebar -->',
'    <div class="sr-sidebar">',
unistr('      <h3>\D83E\DD16 AI Analytics</h3>'),
'      <div style="background:var(--n0);padding:var(--sp-md);border-radius:var(--r-md);">',
unistr('        <h4 style="font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0;">\D83D\DCCA Your Patterns</h4>'),
'        <ul style="margin:0;padding-left:20px;font-size:var(--fs-sm);line-height:1.8;">',
'          <li>Most common issue: <strong>Login</strong></li>',
'          <li>Avg. resolution: <strong>12 hours</strong></li>',
'          <li>Preferred contact: <strong>Chat</strong></li>',
'        </ul>',
'      </div>',
'      <div style="background:var(--grad);color:#fff;padding:var(--sp-md);border-radius:var(--r-md);">',
unistr('        <h4 style="font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0;">\D83D\DCA1 Proactive Suggestion</h4>'),
'        <p style="margin:0;font-size:var(--fs-sm);opacity:.95;">Based on your recent performance issues, we recommend upgrading your browser to the latest version.</p>',
'      </div>',
'      <div style="background:var(--success-light);padding:var(--sp-md);border-radius:var(--r-md);">',
unistr('        <h4 style="font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0;color:var(--success);">\2713 Recent Wins</h4>'),
'        <p style="margin:0;font-size:var(--fs-sm);">Your last 3 issues were resolved <strong>42% faster</strong> than average!</p>',
'      </div>',
'      <div style="background:var(--n0);padding:var(--sp-md);border-radius:var(--r-md);">',
unistr('        <h4 style="font-size:var(--fs-base);font-weight:600;margin:0 0 8px 0;">\D83D\DCDA Recommended Articles</h4>'),
'        <div class="sidebar-links">',
'          <a href="#" style="color:var(--red);text-decoration:none;font-size:var(--fs-sm);">How to Reset Your Password</a>',
'          <a href="#" style="color:var(--red);text-decoration:none;font-size:var(--fs-sm);">Optimizing Browser Performance</a>',
'          <a href="#" style="color:var(--red);text-decoration:none;font-size:var(--fs-sm);">Understanding API Errors</a>',
'        </div>',
'      </div>',
'      <!-- Start Live Chat from SR sidebar also triggers AI Assistant -->',
'      <button class="o-btn o-btn-primary" style="width:100%;"',
'              onclick="document.getElementById(''btnShowAIAssistant'').click()">',
unistr('        \D83D\DCAC Need Help? Start Live Chat'),
'      </button>',
'    </div>',
'  </div>',
'</div>',
'',
'</div><!-- /ora-ra -->'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57368981010724776)
,p_plug_name=>'SUBMIT YOUR ISSUE'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3 style="font-size: 0.9rem;',
'  color: #888888;',
'  margin-bottom: 16px;">Our AI Assistant will help you resolve issues instantly </h3>'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57370722375724793)
,p_plug_name=>'AI_ANSWER'
,p_region_name=>'ai-solution-panel'
,p_region_css_classes=>'solution-col hidden'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_column=>7
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57371468482724801)
,p_plug_name=>'header'
,p_parent_plug_id=>wwv_flow_imp.id(57370722375724793)
,p_region_css_classes=>'ai-header-banner'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ai-banner">',
'  <div class="ai-banner-icon">',
'    <img src="https://cdn-icons-png.flaticon.com/512/4712/4712109.png" ',
'         alt="bot" style="width:40px;height:40px;border-radius:50%;"/>',
'  </div>',
'  <div class="ai-banner-text">',
'    <h2>AI-Suggested Solution</h2>',
'    <p>Based on 1000+ resolved cases</p>',
'  </div>',
'  <!-- Close button -->',
unistr('  <button class="ai-close-btn" onclick="closeAISolution()">\2715</button>'),
'</div>'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57371531283724802)
,p_plug_name=>'content'
,p_parent_plug_id=>wwv_flow_imp.id(57370722375724793)
,p_region_css_classes=>'ai-solution-body'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(57371626296724803)
,p_plug_name=>'feedback'
,p_parent_plug_id=>wwv_flow_imp.id(57370722375724793)
,p_region_css_classes=>'ai-feedback-box'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ai-feedback-wrap">',
'  <p class="ai-feedback-title">Did this solution help you?</p>',
'  <button class="btn-solved" onclick="markSolved()">',
unistr('    \2714 Yes, Problem Solved!'),
'  </button>',
'  <button class="btn-create-sr" onclick="createServiceRequest()">',
unistr('    \2715 No, Create Service Request'),
'  </button>',
'</div>'))
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12214123554189394)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_button_name=>'Clear_form'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear Form'
,p_button_position=>'CHANGE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'btn-clear'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12214503889189394)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_button_name=>'AI_Response'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'get AI solution'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'btn-get-ai'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36283762293411875)
,p_name=>'P13_REQUEST_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36288573278411881)
,p_name=>'P13_AI_ISSUE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(57371531283724802)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36288683788411882)
,p_name=>'P13_AI_CONFIDENCE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(57371531283724802)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36288713198411883)
,p_name=>'P13_AI_STEPS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(57371531283724802)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(36288845795411884)
,p_name=>'P13_AI_ADDITIONAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(57371531283724802)
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47146574343175518)
,p_name=>'P13_AI_RESPONSE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57375655651724838)
,p_name=>'P13_FULLNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Full Name'
,p_source=>'INITCAP(:APP_USER)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57375755822724839)
,p_name=>'P13_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_prompt=>'Issue Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT bucket_topic AS d,',
'                bucket_topic AS r',
'FROM updated_buckets',
'ORDER BY bucket_topic'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'select '
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57375837170724840)
,p_name=>'P13_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(57368981010724776)
,p_prompt=>'Issue Description'
,p_placeholder=>'please describe your issue in detail'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>300
,p_cHeight=>8
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12220635583189400)
,p_name=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12214123554189394)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12221159838189401)
,p_event_id=>wwv_flow_imp.id(12220635583189400)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_TYPE,P13_DESC'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12221587889189401)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12214503889189394)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12222077046189401)
,p_event_id=>wwv_flow_imp.id(12221587889189401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Clear previous errors',
'apex.message.clearErrors();',
'',
unistr('// EDGE CASE 1: Panel already open \2014 prevent duplicate fetch'),
'if (aiSolutionFetched === 1) {',
'  apex.message.showErrors([{',
'    type:     "error",',
'    location: "page",',
'    message:  "AI Solution is already displayed. Please close it before fetching again.",',
'    unsafe:   false',
'  }]);',
'  throw new Error("stop");',
'}',
'',
'// EDGE CASE 2: Issue Type not selected',
'var issueType = apex.item("P13_TYPE").getValue();',
'if (!issueType || issueType === "") {',
'  apex.message.showErrors([{',
'    type:     "error",',
'    location: "page",',
'    message:  "Please select an Issue Type before getting a solution.",',
'    unsafe:   false',
'  }]);',
'  throw new Error("stop");',
'}',
'',
'// EDGE CASE 3: Description too short',
'var issueDesc = apex.item("P13_DESC").getValue().trim();',
'if (issueDesc.length < 10) {',
'  apex.message.showErrors([{',
'    type:     "error",',
'    location: "page",',
'    message:  "Issue Description must be at least 10 characters.",',
'    unsafe:   false',
'  }]);',
'  throw new Error("stop");',
'}',
'',
unistr('// EDGE CASE 4: Full name empty \2014 soft warning only, does not stop'),
'var fullName = apex.item("P1_FULL_NAME").getValue().trim();',
'if (fullName === "") {',
unistr('  console.warn("Full Name is empty \2014 proceeding anyway.");'),
'}',
'',
unistr('// All passed \2014 set flag so panel can''t be fetched again until closed'),
'aiSolutionFetched = 1;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12222557845189402)
,p_event_id=>wwv_flow_imp.id(12221587889189401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'showAIPanel();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12223073835189402)
,p_event_id=>wwv_flow_imp.id(12221587889189401)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Answer'
,p_action=>'NATIVE_GENERATE_TEXT_AI'
,p_attribute_01=>'ITEM'
,p_attribute_02=>'P13_DESC'
,p_attribute_04=>'ITEM'
,p_attribute_05=>'P13_AI_RESPONSE'
,p_attribute_07=>'N'
,p_wait_for_result=>'Y'
,p_ai_config_id=>wwv_flow_imp.id(33753110725688244)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12223534663189402)
,p_event_id=>wwv_flow_imp.id(12221587889189401)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try {',
'  var raw = apex.item("P13_AI_RESPONSE").getValue().trim();',
'  raw = raw.replace(/```json/gi, "").replace(/```/g, "").trim();',
'',
'  var data = JSON.parse(raw);',
'',
'  // Issue Title',
'  apex.item("P13_AI_ISSUE_TITLE").setValue(',
'    data.issue_title || "AI Suggested Solution"',
'  );',
'',
'  // Confidence Score',
'  apex.item("P13_AI_CONFIDENCE").setValue(',
'    "Confidence Score: " + (data.confidence_score || "N/A")',
'  );',
'',
unistr('  // Steps \2014 plain numbered text, no HTML'),
'  var stepsText = "";',
'  if (data.steps && data.steps.length > 0) {',
'    $.each(data.steps, function(i, step) {',
'      stepsText += (i + 1) + ". " + step + "\n";',
'    });',
'  } else {',
'    stepsText = "No steps available.";',
'  }',
'  apex.item("P13_AI_STEPS").setValue(stepsText.trim());',
'',
'  // Additional Info',
'  apex.item("P13_AI_ADDITIONAL").setValue( "Additional Information : " +',
'    (data.additional_info || "")',
'  );',
'  // Save to database after AI solution is displayed',
'   saveRequest();',
'',
'} catch(e) {',
'  console.error("JSON parse failed:", e);',
'  console.log("Raw response was:", apex.item("P13_AI_RESPONSE").getValue());',
'',
unistr('  // Fallback \2014 dump raw response into steps item'),
'  apex.item("P13_AI_ISSUE_TITLE").setValue("AI Suggested Solution");',
'  apex.item("P13_AI_CONFIDENCE").setValue("");',
'  apex.item("P13_AI_STEPS").setValue(apex.item("P13_AI_RESPONSE").getValue());',
'  apex.item("P13_AI_ADDITIONAL").setValue("");',
'   saveRequest();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12170276178943819)
,p_name=>'New_1'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#btnShowAIAssistant'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12170382552943820)
,p_event_id=>wwv_flow_imp.id(12170276178943819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_attribute_01=>'DIALOG'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12220285246189400)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'CLEAR_SESSION_ON_LOAD'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_internal_uid=>12220285246189400
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12219498496189399)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_SUPPORT_REQUEST'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_id NUMBER;',
'BEGIN',
'    INSERT INTO support_requests_log (',
'        full_name, issue_type, issue_description,',
'        ai_solution, confidence_score',
'    ) VALUES (',
'        apex_application.g_x01,',
'        apex_application.g_x02,',
'        apex_application.g_x03,',
'        apex_application.g_x04,',
'        TO_NUMBER(REGEXP_REPLACE(apex_application.g_x05, ''[^0-9.]'', ''''))',
'    )',
'    RETURNING request_id INTO l_id;',
'',
'    htp.p(l_id);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12219498496189399
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12219822698189400)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_FEEDBACK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE support_requests_log',
'SET feedback   = apex_application.g_x02,',
'    sr_created = CASE WHEN apex_application.g_x02 = ''NO'' THEN ''Y'' ELSE ''N'' END',
'WHERE request_id = TO_NUMBER(apex_application.g_x01);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12219822698189400
);
end;
/
prompt --application/pages/page_00014
begin
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'Human_approval_page'
,p_alias=>'HUMAN-APPROVAL-PAGE'
,p_step_title=>'Human_approval_page'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* =====================================================',
'   FORCE FULL BLACK HEADER',
'===================================================== */',
'body .t-Header,',
'body .t-Header-branding,',
'body .t-Header-navBar {',
'    background-color: #000000 !important;',
'}',
'',
'/* Remove APEX gradient */',
'body .t-Header::before {',
'    background: none !important;',
'}',
'',
'/* =====================================================',
'   HEADER LAYOUT',
'===================================================== */',
'.t-Header-branding {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'}',
'',
'.t-Header-navBar {',
'    flex: 1 !important;',
'    display: flex !important;',
'}',
'',
'.t-Header-navBar--center {',
'    flex: 1 !important;',
'    display: flex !important;',
'    justify-content: flex-start !important;',
'}',
'',
'/* =====================================================',
'   NAVIGATION BAR',
'===================================================== */',
'.t-NavigationBar {',
'    display: flex !important;',
'    align-items: center;',
'    width: 100% !important;',
'    gap: 25px;',
'    padding-left: 20px;',
'}',
'',
'/* MENU ITEMS */',
'.t-NavigationBar-item {',
'    margin: 0;',
'}',
'',
'/* PUSH SIGN OUT TO RIGHT */',
'.t-NavigationBar-item:last-child {',
'    margin-left: auto !important;',
'}',
'',
'/* TEXT + ICON COLOR */',
'.t-NavigationBar .t-Button-label,',
'.t-NavigationBar .t-Icon {',
'    color: #ffffff !important;',
'}',
'',
'/* HOVER EFFECT */',
'.t-NavigationBar .t-Button:hover .t-Button-label {',
'    color: #ffcc00 !important;',
'}',
'',
'/* =====================================================',
'   SIGN OUT ICON BUTTON',
'===================================================== */',
'',
'/* Hide text */',
'.t-NavigationBar-item:last-child .t-Button-label {',
'    display: none !important;',
'}',
'',
'/* Circular button */',
'.t-NavigationBar-item:last-child .t-Button {',
'    width: 42px;',
'    height: 42px;',
'    border-radius: 50%;',
'    background-color: #e53935;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    padding: 0;',
'}',
'',
'/* Icon inside */',
'.t-NavigationBar-item:last-child .t-Icon {',
'    color: #ffffff !important;',
'    font-size: 16px;',
'}',
'',
'/* Hover */',
'.t-NavigationBar-item:last-child .t-Button:hover {',
'    background-color: #c62828;',
'    box-shadow: 0 0 8px rgba(229, 57, 53, 0.6);',
'}',
'',
'/* =====================================================',
'   CUSTOM HEADER (LOGO + TEXT)',
'===================================================== */',
'.custom-header {',
'    display: flex;',
'    align-items: center;',
'    gap: 12px;',
'}',
'',
'/* Logo */',
'.custom-header .logo {',
'    height: 45px;',
'}',
'',
'/* Title */',
'.custom-header h3 {',
'    margin: 0;',
'    font-size: 18px;',
'    font-weight: 600;',
'    color: #ffffff !important;',
'}',
'',
'/* Subtitle */',
'.custom-header p {',
'    margin: 0;',
'    font-size: 13px;',
'    color: #cccccc !important;',
'}',
'',
'/* Optional border */',
'.t-Header {',
'    border-bottom: 1px solid #333;',
'}',
'',
'/* =====================================================',
'   NUMBER COLORINGS',
'===================================================== */',
'#R10396631642171202_Cards .a-CardView-item:nth-child(1) .a-CardView-title {',
'    color: navy !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(2) .a-CardView-title {',
'    color: #C19A6B !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(3) .a-CardView-title {',
'    color: green !important;',
'}',
'',
'#R10396631642171202_Cards .a-CardView-item:nth-child(4) .a-CardView-title {',
'    color: #C94834 !important;',
'}',
'',
'/* =====================================================',
'   ITEM STYLING FOR CARDS REGION',
'===================================================== */',
'',
'/* 1st item background */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView {',
'    background-color: #C94834 !important;',
'}',
'',
'/* 1st item text */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:nth-child(1) .a-CardView-subTitle {',
'    color: #ffffff !important;',
'}',
'',
'/* 2nd item subtitle */',
'#R10398932909171225_Cards .a-CardView-item:nth-child(2) .a-CardView-subTitle {',
'    color: #C94834 !important;',
'}',
'',
'/* Bold text for all */',
'#R10398932909171225_Cards .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-subTitle {',
'    font-weight: bold !important;',
'}',
'',
'/* =====================================================',
'   ROW LAYOUT (INPUT + BUTTON INLINE)',
'===================================================== */',
'#R10398405248171220 .row {',
'    display: flex !important;',
'    align-items: center;',
'    flex-wrap: nowrap;',
'}',
'',
'#R10398405248171220 .col.col-8 {',
'    flex: 1;',
'}',
'',
'#R10398405248171220 .col.col-4 {',
'    flex: 0 0 auto;',
'}',
'',
'#P5_SEARCH_CONTAINER {',
'    width: 100%;',
'}',
'',
'/* =====================================================',
'   ACTIONS CARDS HOVER EFFECT',
'===================================================== */',
'',
'#R10398932909171225_Cards .a-CardView-item .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 4px 12px rgba(0,0,0,0.2);',
'    cursor: pointer;',
'}',
'',
'/* Hover text color */',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10398932909171225_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView-subTitle,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-title,',
'#R10396631642171202_Cards .a-CardView-item:hover .a-CardView-subTitle {',
'    color: #000000 !important;',
'}',
'',
'/* =====================================================',
'   SR LIST HOVER EFFECT',
'===================================================== */',
'#R8944435597811950 .t-Region-body p {',
'    transition: all 0.3s ease-in-out;',
'    padding: 6px;',
'    border-radius: 4px;',
'}',
'',
'#R8944435597811950 .t-Region-body p:hover {',
'    background-color: #E6BBB9 !important;',
'    color: #ffffff !important;',
'    transform: translateX(5px);',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   SERVICE REQUESTS BOTTOM',
'===================================================== */',
'#R10400279058171238_Cards .a-CardView-item .a-CardView {',
'    transition: all 0.3s ease-in-out;',
'}',
'',
'#R10400279058171238_Cards .a-CardView-item:hover .a-CardView {',
'    background-color: #E6BBB9 !important;',
'    cursor: pointer;',
'}',
'',
'/* =====================================================',
'   HEADINGS',
'===================================================== */',
'#R8944184016811947_heading {',
'    color: #444444 !important;',
'    font-weight: normal !important;',
'}',
'',
'/* =====================================================',
'   BADGE EDITABLE',
'===================================================== */',
'.badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* =====================================================',
'   CUSTOM SOLUTION HEADER',
'===================================================== */',
'.custom-solution-header {',
'    display: flex;',
'    align-items: center;',
'    font-family: Arial, sans-serif;',
'    margin-bottom: 8px;',
'}',
'',
'/* MAIN LABEL */',
'.custom-solution-header .main-label {',
'    font-size: 14px;',
'    font-weight: bold;',
'    color: #666;',
'    margin-right: 10px;',
'    text-transform: uppercase;',
'}',
'',
'/* BADGE */',
'.custom-solution-header .badge-editable {',
'    font-size: 11px;',
'    font-weight: bold;',
'    color: #d9534f;',
'    background-color: #f9eaea;',
'    border: 1px solid #f2dede;',
'    border-radius: 4px;',
'    padding: 2px 6px;',
'    text-transform: uppercase;',
'}',
'',
'/* CONTENT BOX */',
'.custom-solution-header + .content-box {',
'    border: 1px solid #e0e0e0;',
'    border-radius: 4px;',
'    padding: 12px;',
'    background-color: #ffffff;',
'}',
'',
'/* =====================================================',
'   HEADER BAR STYLE',
'===================================================== */',
'.header-bar {',
'    display: flex;',
'    justify-content: space-between;',
'    align-items: center;',
'    padding: 12px 16px;',
'    background-color: #fcfcfc;',
'    border-bottom: 1px solid #e0e0e0;',
'    font-family: ''Segoe UI'', Tahoma, Geneva, Verdana, sans-serif;',
'    letter-spacing: 0.5px;',
'}',
'',
'.title {',
'    color: #757575;',
'    font-size: 12px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'.badge {',
'    color: #d32f2f;',
'    font-size: 11px;',
'    font-weight: 700;',
'    text-transform: uppercase;',
'}',
'',
'/* Smooth transition */',
'.a-CardView {',
'    transition: all 0.3s ease;',
'}',
'',
'/* Hover effect */',
'.a-CardView-item:hover .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    transform: translateY(-4px);',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.15);',
'    cursor: pointer;',
'}',
'',
'/* Selected card */',
'.selected-card .a-CardView {',
'    background-color: #e6bbb9 !important;',
'    border: 2px solid #c94f4f;',
'    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.2);',
'}',
'',
'/* Optional: text color */',
'.a-CardView-item:hover .a-CardView-subTitle,',
'.selected-card .a-CardView-subTitle {',
'    color: #000 !important;',
'}',
'',
'',
'/* Approve & Publish button */',
'#B11751328242401628 {',
'    background: #c0392b !important;',
'    color: white !important;',
'    padding: 14px 20px !important;',
'    border: none !important;',
'    border-radius: 8px !important;',
'    font-size: 15px !important;',
'    font-weight: 600 !important;',
'    width: 100% !important;',
'    cursor: pointer;',
'    transition: all 0.3s ease;',
'}',
'',
'#B11751328242401628 .t-Button-label {',
'    color: white !important;',
'}',
'',
'#B11751328242401628:hover {',
'    background: #922b21 !important;',
'    transform: scale(1.02);',
'    box-shadow: 0 4px 12px rgba(192, 57, 43, 0.4);',
'}',
'',
'/* Reject Topic button */',
'#B11751413494401629 {',
'    background: white !important;',
'    color: #c0392b !important;',
'    padding: 14px 20px !important;',
'    border: 1px solid #eee !important;',
'    border-radius: 8px !important;',
'    font-size: 15px !important;',
'    font-weight: 600 !important;',
'    width: 100% !important;',
'    cursor: pointer;',
'    transition: all 0.3s ease;',
'}',
'',
'#B11751413494401629 .t-Button-label {',
'    color: #c0392b !important;',
'}',
'',
'#B11751413494401629:hover {',
'    background: #fdecea !important;',
'    border-color: #c0392b !important;',
'    transform: scale(1.02);',
'    box-shadow: 0 4px 12px rgba(192, 57, 43, 0.2);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12170593073943822)
,p_plug_name=>'content'
,p_title=>'Problem Managment'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12172370263943840)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_button_name=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12170424652943821)
,p_name=>'P14_HIDDEN'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12170653587943823)
,p_name=>'P14_TOPIC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Topic'
,p_source=>'SELECT bucket_topic FROM buckets WHERE bucket_no = :P14_HIDDEN'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12170750652943824)
,p_name=>'P14_ISSUE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Issue description'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12170807891943825)
,p_name=>'P14_SOLUTION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Solution'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12170929224943826)
,p_name=>'P14_SM_FALLBACK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Analyst Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P14_HIDDEN'
,p_display_when2=>'1'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12171155257943828)
,p_name=>'P14_DEV_FEEDBACK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Dev Feedback'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P14_HIDDEN'
,p_display_when2=>'2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12171279053943829)
,p_name=>'P14_MANAGEMENT_SUGGESTIONS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12170593073943822)
,p_prompt=>'Management Suggestions'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_display_when=>'P14_HIDDEN'
,p_display_when2=>'3'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12171530788943832)
,p_name=>'P14_VAR'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12172293533943839)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate Random Value'
,p_process_sql_clob=>':P14_HIDDEN := TRUNC(DBMS_RANDOM.VALUE(1,4));'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12172293533943839
);
end;
/
prompt --application/pages/page_00015
begin
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Non_Agentic_AI'
,p_alias=>'NON-AGENTIC-AI'
,p_step_title=>'Non_Agentic_AI'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16116980169955226)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8922786924801305)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12173105123943848)
,p_button_sequence=>10
,p_button_name=>'New'
,p_button_static_id=>'123'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'click here to call the agent'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12173253910943849)
,p_name=>'New'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12173105123943848)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12173393300943850)
,p_event_id=>wwv_flow_imp.id(12173253910943849)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_AI_ASSISTANT'
,p_attribute_01=>'DIALOG'
,p_ai_config_id=>wwv_flow_imp.id(16118370933967474)
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'PAGE_VIEW - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8928792331801504)
,p_plug_name=>'PAGE_VIEW'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674157997338192145
,p_plug_display_sequence=>10
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8930432398801532)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8928792331801504)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8929232153801521)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8928792331801504)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8929681285801530)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8928792331801504)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8930004828801531)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8928792331801504)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', '',
  'unchecked_value', '',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8932639830801548)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'SEND_LOGIN_USERNAME_COOKIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8932639830801548
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(8933181679801548)
,p_page_process_id=>wwv_flow_imp.id(8932639830801548)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(8933674727801548)
,p_page_process_id=>wwv_flow_imp.id(8932639830801548)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8930758526801537)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8930758526801537
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(8931207461801543)
,p_page_process_id=>wwv_flow_imp.id(8930758526801537)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(8931796769801548)
,p_page_process_id=>wwv_flow_imp.id(8930758526801537)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(8932210248801548)
,p_page_process_id=>wwv_flow_imp.id(8930758526801537)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8934594011801550)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8934594011801550
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8934145697801549)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8934145697801549
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(10546774936526688)
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
