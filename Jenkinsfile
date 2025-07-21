pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')    // Jenkins Credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Rithish24-Cloud/terraform-ec2-deploy.git', branch: 'master'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        success {
            echo '✅ EC2 instance provisioned successfully.'
        }
        failure {
            echo '❌ Build failed.'
        }
    }
}
