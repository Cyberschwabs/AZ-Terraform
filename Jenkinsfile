pipeline {
    agent any
    stages {
        stage('File Structure') {
            steps {
                sh "ls -la"
            }
        }
        stage('Azure Login') {
            steps {
                azureCLI principalCredentialId: 'JenkinsSP', commands: [
                    sh "az login --service-principal --username $AZURE_CLIENT_ID --password $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID"
            ]}
        }
        stage('Terraform Version') {
            steps {
                sh "terraform -version"
            }
        }
        stage('Terraform Init') {
            steps {
                sh "terraform -chdir=tf-config/ init"
            }
        }
        stage('Terraform Plan ') {
            steps {
                sh "terraform -chdir=tf-config/ plan"
            }
        }
    }
}
//                 withCredentials([azureServicePrincipal(credentialsId: 'JenkinsSP', clientIdVariable: '$CLIENT_ID', clientSecretVariable: '$CLIENT_SECRET', tenantIdVariable: '$TENANT_ID')])
//                 {
//                     sh "terraform -chdir=tf-config/ plan -var 'client_id=$CLIENT_ID' -var 'client_secret=$CLIENT_SECRET' -var 'client_tenant=$TENANT_ID'"
//                 }