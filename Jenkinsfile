pipeline {
    agent any
    stages {
        stage('Install TF') {
            steps {
                sh 'apt-get install -y curl unzip'
                sh 'curl -fsSL -o terraform.zip https://releases.hashicorp.com/terraform/<version>/terraform_<version>_linux_amd64.zip'
                sh 'unzip terraform.zip'
                sh 'mv terraform /usr/local/bin/'
                sh 'chmod +x /usr/local/bin/terraform'
            }
        }
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