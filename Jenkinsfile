pipeline {
    agent any

    environment {
        // Only needed if you are NOT using IAM role. Since you use IAM, this is optional.
        // AWS_ACCESS_KEY_ID = credentials('your-aws-access-key-id')
        // AWS_SECRET_ACCESS_KEY = credentials('your-aws-secret-access-key')
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
        failure {
            echo '❌ Build failed.'
        }
        success {
            echo '✅ Terraform Apply completed successfully.'
        }
    }
}

