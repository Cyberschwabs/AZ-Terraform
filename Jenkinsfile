pipeline {
    agent any
    stages {
        stage('Login to Azure') {
            steps {
                script {
                    withCredentials([azureServicePrincipal(credentialsId: 'az-sp-cred')]) {
                        powershell '''
                            # Connect to Azure using Service Principal
                            Connect-AzAccount -ServicePrincipal -ApplicationId $AZURE_CLIENT_ID -TenantId $AZURE_TENANT_ID -CertificateThumbprint $AZURE_CLIENT_SECRET
                        '''
                    }
                }
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=tf-config/ init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform -chdir=tf-config/ plan'

            }
        }
    }
}