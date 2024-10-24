pipeline {
    agent any
    stages {
         stage('Login to Azure') {
            steps {
                sh 'az login --service-principal -u ${env.appId} -p ${env.appSec} --tenant ${env.tenant}'
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