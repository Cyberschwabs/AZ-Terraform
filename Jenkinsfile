pipeline {
    agent any
    stages {
        stage('TF Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('TF Plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}