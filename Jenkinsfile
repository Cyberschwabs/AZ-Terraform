/* groovylint-disable LineLength, NestedBlockDepth */
/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages {
        stage('File Structure') {
            steps {
                sh 'ls -la'
            }
        }
        stage('Azure Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'userInfo', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        // Use the credentials, e.g., in a shell command
                        sh 'az login -u $USERNAME -p $PASSWORD'
                    }
                }
            }
        }
        stage('Terraform Version') {
            steps {
                sh 'terraform -version'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform -chdir=tf-config/ init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform -chdir=tf-config/ plan -out=tfplan'
            }
        }
        stage('Approve Terraform Apply') {
            steps {
                input 'Do you approve the terraform apply?'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }
}
