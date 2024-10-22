pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh 'cd tf-config'
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}