pipeline {
    agent any
    stages {
        stage('Login to Azure') {
            steps {
                script {
                    // Install Azure CLI if it's not already installed
                    sh 'az --version || curl -sL https://aka.ms/InstallAzureCLIDeb | bash'

                    // Login using Managed Identity
                    sh 'az login --identity'

                    // Optionally, verify login
                    sh 'az account show'
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