pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform.exe -chdir=tf-config/ init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform.exe -chdir=tf-config/ plan'
            }
        }
    }
}