pipeline {
    agent any
    stages {
        stage('Login to Azure') {
            steps {
                script {
                    sh '''
                        az login --service-principal -u "${appId}" -p "${appSec}" --tenant "${tenant} --allow-no-subscriptions"
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