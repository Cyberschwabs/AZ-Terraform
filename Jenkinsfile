pipeline {
    agent any
    stages {
        stage('Login to Azure CLI') {
            steps {
                script {
                    sh '''
                        az login --service-principal -u "$appId" -p "$appSec" --tenant "$tenant"
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