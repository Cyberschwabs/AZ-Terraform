pipeline {
    agent any
    environment {
        AZURE_CLIENT_ID = credentials('7e67576a-a69a-4230-8514-03bef8c5f60a')
        AZURE_TENANT_ID = credentials('5c09317f-867e-4c98-827c-f0c3e38753f9')
    }
    stages {
        stage('Login to Azure') {
            steps {
                script {
                    sh '''
                    az login --service-principal -u $AZURE_CLIENT_ID -p ${env.AZURE_CLIENT_SECRET} --tenant $AZURE_TENANT_ID
                    az account show
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