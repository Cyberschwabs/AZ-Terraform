pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh "terraform -chdir=tf-config/ init"
                echo "Terraform Plan Stage Next"
            }
        }
        stage('Azure Login + Terraform Plan') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'JenkinsSP', clientIdVariable: '$CLIENT_ID', clientSecretVariable: '$CLIENT_SECRET', tenantIdVariable: '$TENANT_ID')])
            {
                sh "terraform -chdir=tf-config/ plan -var 'client_secret=$CLIENT_SECRET' -var 'client_id=$CLIENT_ID' -var 'client_tenant=$TENANT_ID'"
            }
        }
    }
}
