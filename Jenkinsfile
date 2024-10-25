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
                script {
                    // Use withCredentials to securely handle Azure credentials
                    // withCredentials([azureServicePrincipal(credentialsId: 'JenkinsSP', clientIdVariable: 'AZURE_CLIENT_ID', clientSecretVariable: 'AZURE_CLIENT_SECRET', tenantIdVariable: 'AZURE_TENANT_ID')]) {
                    //     sh "az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID"
                    
                    // Accessing the credentials
                    def username = credentials('userInfo').username
                    def password = credentials('userInfo').password

                    // Use the credentials, e.g., in a shell command
                    sh "az login -u $username -p $password"
                }
            }
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
        stage('Terraform Plan') {
            steps {
                sh "terraform -chdir=tf-config/ plan"
            }
        }
    }
}