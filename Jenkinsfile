pipeline {
    agent any
    stages {
         stage('Login to Azure') {
            steps {
                script {
//                     withCredentials([azureServicePrincipal(credentialsId: 'az-sp-cred')]) {
//                         sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'
//                     }
                       sh 'az login --use-device-code'
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