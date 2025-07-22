pipeline {
  agent any

  environment {
    AWS_PROFILE = 'default'  // AWS credentials configured via `aws configure`
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Rithish24-cloud/terraform-ec2-deploy.git'
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




