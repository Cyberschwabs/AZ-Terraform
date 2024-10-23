pipeline {
    agent any
    stages {
        stage('AZ Login') {
            steps {
                sh 'echo $appId'
                sh 'echo $appSec'
                sh 'echo $tenant'
                sh 'az login --service-principal -u $appId -p $appSec --tenant $tenant'
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