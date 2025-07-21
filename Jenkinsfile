pipeline {
    agent any
    environment {
        AWS_REGION = "ap-south-1"
    }
    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Rithish24-cloud/terraform-ec2-deploy.git'
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
}


