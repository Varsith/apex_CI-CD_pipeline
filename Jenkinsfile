pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }

    environment {
        APEX_SQL_FILE = 'apex/f100.sql'
        DEV_CONFIG_FILE = 'config/dev.json'
        GENERATED_TEST_FILE = 'tests/generated/generated_apex_test.spec.ts'
        DOC_CONFIG_FILE = 'documentation/documentation_config.json'
        DOC_OUTPUT_DIR = 'documentation/generated'
        GENERATED_DOC_TXT = 'documentation/generated/application_documentation.txt'
        GENERATED_DOC_MD = 'documentation/generated/application_documentation.md'
        GENERATED_DOC_ZIP = 'documentation/generated/application_documentation_bundle.zip'
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                checkout scm
                sh '''
                    echo "Current branch: ${BRANCH_NAME}"
                    echo "Workspace: ${WORKSPACE}"
                    ls -la
                '''
            }
        }

        stage('Validate Repository Structure') {
            steps {
                sh '''
                    echo "Validating repository structure..."

                    if [ ! -f "${APEX_SQL_FILE}" ]; then
                        echo "ERROR: Missing APEX SQL file: ${APEX_SQL_FILE}"
                        exit 1
                    fi

                    if [ ! -f "scripts/generate_playwright_tests.py" ]; then
                        echo "ERROR: Missing scripts/generate_playwright_tests.py"
                        exit 1
                    fi

                    if [ "${BRANCH_NAME}" = "deployment" ]; then
                        if [ ! -f "scripts/generate_apex_documentation.py" ]; then
                            echo "ERROR: deployment branch requires scripts/generate_apex_documentation.py"
                            exit 1
                        fi
                    fi

                    if [ ! -f "package.json" ]; then
                        echo "ERROR: Missing package.json"
                        exit 1
                    fi

                    if [ ! -f "playwright.config.ts" ]; then
                        echo "ERROR: Missing playwright.config.ts"
                        exit 1
                    fi

                    if [ "${BRANCH_NAME}" = "dev" ]; then
                        if [ ! -f "${DEV_CONFIG_FILE}" ]; then
                            echo "ERROR: dev branch requires ${DEV_CONFIG_FILE}"
                            exit 1
                        fi
                    fi

                    echo "Repository structure validation completed."
                '''
            }
        }

        stage('Check Required Tools') {
            steps {
                sh '''
                    echo "Checking required tools..."

                    sql -version || {
                        echo "ERROR: SQLcl is not installed or not available in PATH."
                        exit 1
                    }

                    java -version || {
                        echo "ERROR: Java is required for SQLcl."
                        exit 1
                    }

                    python3 --version || {
                        echo "ERROR: Python3 is not installed."
                        exit 1
                    }

                    pip3 --version || {
                        echo "ERROR: pip3 is not installed."
                        exit 1
                    }

                    node -v || {
                        echo "ERROR: Node.js is not installed."
                        exit 1
                    }

                    npm -v || {
                        echo "ERROR: npm is not installed."
                        exit 1
                    }

                    unzip -v || {
                        echo "ERROR: unzip is not installed."
                        exit 1
                    }

                    zip -v || {
                        echo "ERROR: zip is not installed."
                        exit 1
                    }

                    echo "Tool validation completed."
                '''
            }
        }

        stage('Deploy to DEV') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([
                    string(credentialsId: 'DEV_DB_USER', variable: 'DB_USER'),
                    string(credentialsId: 'DEV_DB_PASSWORD', variable: 'DB_PASSWORD'),
                    string(credentialsId: 'DEV_DB_CONNECT', variable: 'DB_CONNECT'),
                    file(credentialsId: 'DEV_WALLET_FILE', variable: 'WALLET_FILE'),
                    string(credentialsId: 'DEV_APEX_WORKSPACE', variable: 'APEX_WORKSPACE'),
                    string(credentialsId: 'DEV_APEX_SCHEMA', variable: 'APEX_SCHEMA'),
                    string(credentialsId: 'DEV_APEX_APP_ID', variable: 'APEX_APP_ID')
                ]) {
                    sh '''
                        set +x

                        echo "Deploying APEX application to DEV..."

                        if [ -z "$APEX_WORKSPACE" ]; then
                            echo "ERROR: DEV_APEX_WORKSPACE is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_SCHEMA" ]; then
                            echo "ERROR: DEV_APEX_SCHEMA is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_APP_ID" ]; then
                            echo "ERROR: DEV_APEX_APP_ID is empty or not bound."
                            exit 1
                        fi

                        rm -rf wallet
                        mkdir -p wallet

                        cp "$WALLET_FILE" wallet.zip
                        unzip -o wallet.zip -d wallet > /dev/null

                        export TNS_ADMIN="$PWD/wallet"

                        echo "Using TNS_ADMIN=$TNS_ADMIN"
                        echo "Deploying SQL file: ${APEX_SQL_FILE}"
                        echo "Target APEX workspace: $APEX_WORKSPACE"
                        echo "Target APEX schema: $APEX_SCHEMA"
                        echo "Target APEX app ID: $APEX_APP_ID"

                        sql -L -S /nolog <<EOF
connect ${DB_USER}/"${DB_PASSWORD}"@${DB_CONNECT}
whenever sqlerror exit sql.sqlcode
set define off
set sqlblanklines on
set serveroutput on

declare
    l_workspace_id number;
begin
    l_workspace_id := apex_util.find_security_group_id(
        p_workspace => upper('${APEX_WORKSPACE}')
    );

    dbms_output.put_line('Resolved workspace id = ' || l_workspace_id);
    dbms_output.put_line('Target schema = ${APEX_SCHEMA}');
    dbms_output.put_line('Target app id = ${APEX_APP_ID}');

    apex_application_install.set_workspace_id(l_workspace_id);
    apex_application_install.set_schema(upper('${APEX_SCHEMA}'));
    apex_application_install.set_application_id(${APEX_APP_ID});
    apex_application_install.set_application_alias('PAGE_VIEW');
apex_application_install.generate_offset;
end;
/

@${APEX_SQL_FILE}
exit
EOF

                        echo "DEV deployment completed successfully."
                    '''
                }
            }
        }

        stage('Deploy to STAGE') {
            when {
                branch 'stage'
            }
            steps {
                withCredentials([
                    string(credentialsId: 'STAGE_DB_USER', variable: 'DB_USER'),
                    string(credentialsId: 'STAGE_DB_PASSWORD', variable: 'DB_PASSWORD'),
                    string(credentialsId: 'STAGE_DB_CONNECT', variable: 'DB_CONNECT'),
                    file(credentialsId: 'STAGE_WALLET_FILE', variable: 'WALLET_FILE'),
                    string(credentialsId: 'STAGE_APEX_WORKSPACE', variable: 'APEX_WORKSPACE'),
                    string(credentialsId: 'STAGE_APEX_SCHEMA', variable: 'APEX_SCHEMA'),
                    string(credentialsId: 'STAGE_APEX_APP_ID', variable: 'APEX_APP_ID')
                ]) {
                    sh '''
                        set +x

                        echo "Deploying APEX application to STAGE..."

                        if [ -z "$APEX_WORKSPACE" ]; then
                            echo "ERROR: STAGE_APEX_WORKSPACE is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_SCHEMA" ]; then
                            echo "ERROR: STAGE_APEX_SCHEMA is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_APP_ID" ]; then
                            echo "ERROR: STAGE_APEX_APP_ID is empty or not bound."
                            exit 1
                        fi

                        rm -rf wallet
                        mkdir -p wallet

                        cp "$WALLET_FILE" wallet.zip
                        unzip -o wallet.zip -d wallet > /dev/null

                        export TNS_ADMIN="$PWD/wallet"

                        echo "Using TNS_ADMIN=$TNS_ADMIN"
                        echo "Deploying SQL file: ${APEX_SQL_FILE}"
                        echo "Target APEX workspace: $APEX_WORKSPACE"
                        echo "Target APEX schema: $APEX_SCHEMA"
                        echo "Target APEX app ID: $APEX_APP_ID"

                        sql -L -S /nolog <<EOF
connect ${DB_USER}/"${DB_PASSWORD}"@${DB_CONNECT}
whenever sqlerror exit sql.sqlcode
set define off
set sqlblanklines on
set serveroutput on

declare
    l_workspace_id number;
begin
    l_workspace_id := apex_util.find_security_group_id(
        p_workspace => upper('${APEX_WORKSPACE}')
    );

    dbms_output.put_line('Resolved workspace id = ' || l_workspace_id);
    dbms_output.put_line('Target schema = ${APEX_SCHEMA}');
    dbms_output.put_line('Target app id = ${APEX_APP_ID}');

    apex_application_install.set_workspace_id(l_workspace_id);
    apex_application_install.set_schema(upper('${APEX_SCHEMA}'));
    apex_application_install.set_application_id(${APEX_APP_ID});
    apex_application_install.set_application_alias('PAGE_VIEW_' || '${APEX_APP_ID}');
apex_application_install.generate_offset;
end;
/

@${APEX_SQL_FILE}
exit
EOF

                        echo "STAGE deployment completed successfully."
                    '''
                }
            }
        }

        stage('Deploy to DEPLOYMENT') {
            when {
                branch 'deployment'
            }
            steps {
                withCredentials([
                    string(credentialsId: 'PROD_DB_USER', variable: 'DB_USER'),
                    string(credentialsId: 'PROD_DB_PASSWORD', variable: 'DB_PASSWORD'),
                    string(credentialsId: 'PROD_DB_CONNECT', variable: 'DB_CONNECT'),
                    file(credentialsId: 'PROD_WALLET_FILE', variable: 'WALLET_FILE'),
                    string(credentialsId: 'PROD_APEX_WORKSPACE', variable: 'APEX_WORKSPACE'),
                    string(credentialsId: 'PROD_APEX_SCHEMA', variable: 'APEX_SCHEMA'),
                    string(credentialsId: 'PROD_APEX_APP_ID', variable: 'APEX_APP_ID')
                ]) {
                    sh '''
                        set +x

                        echo "Deploying APEX application to DEPLOYMENT..."

                        if [ -z "$APEX_WORKSPACE" ]; then
                            echo "ERROR: PROD_APEX_WORKSPACE is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_SCHEMA" ]; then
                            echo "ERROR: PROD_APEX_SCHEMA is empty or not bound."
                            exit 1
                        fi

                        if [ -z "$APEX_APP_ID" ]; then
                            echo "ERROR: PROD_APEX_APP_ID is empty or not bound."
                            exit 1
                        fi

                        rm -rf wallet
                        mkdir -p wallet

                        cp "$WALLET_FILE" wallet.zip
                        unzip -o wallet.zip -d wallet > /dev/null

                        export TNS_ADMIN="$PWD/wallet"

                        echo "Using TNS_ADMIN=$TNS_ADMIN"
                        echo "Deploying SQL file: ${APEX_SQL_FILE}"
                        echo "Target APEX workspace: $APEX_WORKSPACE"
                        echo "Target APEX schema: $APEX_SCHEMA"
                        echo "Target APEX app ID: $APEX_APP_ID"

                        sql -L -S /nolog <<EOF
connect ${DB_USER}/"${DB_PASSWORD}"@${DB_CONNECT}
whenever sqlerror exit sql.sqlcode
set define off
set sqlblanklines on
set serveroutput on

declare
    l_workspace_id number;
begin
    l_workspace_id := apex_util.find_security_group_id(
        p_workspace => upper('${APEX_WORKSPACE}')
    );

    dbms_output.put_line('Resolved workspace id = ' || l_workspace_id);
    dbms_output.put_line('Target schema = ${APEX_SCHEMA}');
    dbms_output.put_line('Target app id = ${APEX_APP_ID}');

    apex_application_install.set_workspace_id(l_workspace_id);
    apex_application_install.set_schema(upper('${APEX_SCHEMA}'));
    apex_application_install.set_application_id(${APEX_APP_ID});
    apex_application_install.set_application_alias('PAGE_VIEW_' || '${APEX_APP_ID}');
apex_application_install.generate_offset;
end;
/

@${APEX_SQL_FILE}
exit
EOF

                        echo "DEPLOYMENT deployment completed successfully."
                    '''
                }
            }
        }

        stage('Install Python Dependencies') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'deployment'
                }
            }
            steps {
                sh '''
                    echo "Creating Python virtual environment..."

                    rm -rf .venv
                    python3 -m venv .venv

                    echo "Activating virtual environment..."
                    . .venv/bin/activate

                    echo "Upgrading pip..."
                    python -m pip install --upgrade pip

                    echo "Installing Python dependencies..."
                    python -m pip install -r requirements.txt

                    echo "Python dependencies installed inside virtual environment."
                '''
            }
        }

        stage('Generate Playwright Tests using OCI GenAI') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([
                    file(credentialsId: 'OCI_CONFIG_FILE', variable: 'OCI_CONFIG_FILE_SECRET'),
                    file(credentialsId: 'OCI_PRIVATE_KEY_FILE', variable: 'OCI_PRIVATE_KEY_SECRET'),
                    string(credentialsId: 'OCI_COMPARTMENT_ID', variable: 'OCI_COMPARTMENT_ID'),
                    string(credentialsId: 'OCI_GENAI_ENDPOINT', variable: 'OCI_GENAI_ENDPOINT'),
                    string(credentialsId: 'OCI_CHAT_MODEL_ID', variable: 'OCI_CHAT_MODEL_ID')
                ]) {
                    sh '''
                        set +x

                        echo "Preparing OCI config for Python GenAI script..."

                        rm -rf .oci
                        mkdir -p .oci

                        cp "$OCI_CONFIG_FILE_SECRET" .oci/config
                        cp "$OCI_PRIVATE_KEY_SECRET" .oci/oci_api_key.pem

                        chmod 600 .oci/config
                        chmod 600 .oci/oci_api_key.pem

                        export OCI_CONFIG_FILE_PATH="$PWD/.oci/config"
                        export OCI_CONFIG_PROFILE="DEFAULT"
                        export OCI_COMPARTMENT_ID="$OCI_COMPARTMENT_ID"
                        export OCI_GENAI_ENDPOINT="$OCI_GENAI_ENDPOINT"
                        export OCI_CHAT_MODEL_ID="$OCI_CHAT_MODEL_ID"

                        echo "Generating Playwright tests..."

                        . .venv/bin/activate
                        python scripts/generate_playwright_tests.py

                        if [ ! -f "${GENERATED_TEST_FILE}" ]; then
                            echo "ERROR: Playwright test was not generated."
                            exit 1
                        fi

                        echo "Generated Playwright test file:"
                        ls -la tests/generated/
                    '''
                }
            }
        }



        stage('Generate Deployment Documentation using OCI GenAI') {
            when {
                branch 'deployment'
            }
            steps {
                withCredentials([
                    file(credentialsId: 'OCI_CONFIG_FILE', variable: 'OCI_CONFIG_FILE_SECRET'),
                    file(credentialsId: 'OCI_PRIVATE_KEY_FILE', variable: 'OCI_PRIVATE_KEY_SECRET'),
                    string(credentialsId: 'OCI_COMPARTMENT_ID', variable: 'OCI_COMPARTMENT_ID'),
                    string(credentialsId: 'OCI_GENAI_ENDPOINT', variable: 'OCI_GENAI_ENDPOINT'),
                    string(credentialsId: 'OCI_CHAT_MODEL_ID', variable: 'OCI_CHAT_MODEL_ID')
                ]) {
                    sh '''
                        set +x

                        echo "Preparing OCI config for documentation GenAI script..."

                        rm -rf .oci
                        mkdir -p .oci

                        cp "$OCI_CONFIG_FILE_SECRET" .oci/config
                        cp "$OCI_PRIVATE_KEY_SECRET" .oci/oci_api_key.pem

                        chmod 600 .oci/config
                        chmod 600 .oci/oci_api_key.pem

                        export OCI_CONFIG_FILE_PATH="$PWD/.oci/config"
                        export OCI_CONFIG_PROFILE="DEFAULT"
                        export OCI_COMPARTMENT_ID="$OCI_COMPARTMENT_ID"
                        export OCI_GENAI_ENDPOINT="$OCI_GENAI_ENDPOINT"
                        export OCI_CHAT_MODEL_ID="$OCI_CHAT_MODEL_ID"

                        export APEX_SQL_FILE="$PWD/${APEX_SQL_FILE}"
                        export DOC_CONFIG_FILE="$PWD/${DOC_CONFIG_FILE}"
                        export DOC_OUTPUT_DIR="$PWD/${DOC_OUTPUT_DIR}"

                        echo "Generating deployment documentation..."

                        . .venv/bin/activate
                        python scripts/generate_apex_documentation.py

                        if [ ! -f "${GENERATED_DOC_TXT}" ]; then
                            echo "ERROR: Documentation TXT was not generated: ${GENERATED_DOC_TXT}"
                            exit 1
                        fi

                        if [ ! -f "${GENERATED_DOC_MD}" ]; then
                            echo "ERROR: Documentation Markdown was not generated: ${GENERATED_DOC_MD}"
                            exit 1
                        fi

                        if [ ! -f "${GENERATED_DOC_ZIP}" ]; then
                            echo "ERROR: Documentation ZIP bundle was not generated: ${GENERATED_DOC_ZIP}"
                            exit 1
                        fi

                        echo "Generated documentation artifacts:"
                        ls -la "${DOC_OUTPUT_DIR}"
                    '''
                }
            }
        }

        stage('Install Playwright Dependencies') {
            when {
                branch 'dev'
            }
            steps {
                sh '''
                    echo "Installing Node dependencies..."
                    npm install

                    echo "Installing Playwright Chromium browser..."
                    npx playwright install chromium

                    echo "Playwright dependencies installed."
                '''
            }
        }

        stage('Run Playwright Tests on DEV') {
            when {
                branch 'dev'
            }
            steps {
                withCredentials([
                    string(credentialsId: 'APEX_DEV_USERNAME', variable: 'APEX_USERNAME'),
                    string(credentialsId: 'APEX_DEV_PASSWORD', variable: 'APEX_PASSWORD')
                ]) {
                    sh '''
                        set +x

                        echo "Running Playwright tests against DEV..."

                        export APEX_USERNAME="$APEX_USERNAME"
                        export APEX_PASSWORD="$APEX_PASSWORD"

                        npm run test:dev
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline completed for branch: ${BRANCH_NAME}"

            archiveArtifacts artifacts: 'tests/generated/*.ts', allowEmptyArchive: true
            archiveArtifacts artifacts: 'documentation/generated/**', allowEmptyArchive: true
            archiveArtifacts artifacts: 'playwright-report/**', allowEmptyArchive: true
            archiveArtifacts artifacts: 'test-results/**', allowEmptyArchive: true

            cleanWs()
        }

        success {
            echo "Pipeline completed successfully."
        }

        failure {
            echo "Pipeline failed. Check Jenkins console logs."
        }
    }
}