pipeline {
    agent any
    stages {
        stage('Terraform Version') {
            steps {
                sh "terraform -version"
            }
        }
        stage('File Structure') {
            steps {
                sh "pwd"
                sh "ls -la"
            }
        }
        stage('Terraform Init') {
            steps {
                sh "cd tf-config && terraform init"
            }
        }
        stage('Azure Login + Terraform Plan ') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: 'JenkinsSP', clientIdVariable: '$CLIENT_ID', clientSecretVariable: '$CLIENT_SECRET', tenantIdVariable: '$TENANT_ID')])
                {
                    sh "terraform -chdir=tf-config/ plan -var 'client_id=$CLIENT_ID' -var 'client_secret=$CLIENT_SECRET' -var 'client_tenant=$TENANT_ID'"
                }
            }
        }
    }
}
