pipeline {
    agent any
    stages {
        stage('Login to Azure CLI') {
            steps {
                script {
                    sh '''
                        az login --service-principal -u "$appId" -p "$appSec" --tenant "$tenant"
                        az account set --subscription="1024008c-c2d6-4d84-ade6-c1af7bee2bae"
                    '''
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