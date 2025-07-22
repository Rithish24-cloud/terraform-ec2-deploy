pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')      // Jenkins secret ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')      // Jenkins secret ID
        AWS_DEFAULT_REGION    = 'ap-south-1'
        REPO_URL              = 'https://github.com/Rithish24-cloud/terraform-ec2-deploy.git'
    }

    stages {
        stage('Clone Repository') {
            steps {
                sh '''
                    echo "📥 Cloning Git repository"
                    rm -rf terraform-ec2-deploy
                    git clone $REPO_URL
                    cd terraform-ec2-deploy
                '''
            }
        }

        stage('Configure AWS CLI') {
            steps {
                sh '''
                    echo "⚙️ Configuring AWS CLI"
                    mkdir -p ~/.aws

                    cat > ~/.aws/credentials <<EOF
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOF

                    cat > ~/.aws/config <<EOF
[default]
region = $AWS_DEFAULT_REGION
output = json
EOF

                    echo "🔍 Verifying AWS Identity"
                    aws sts get-caller-identity
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-ec2-deploy') {
                    sh '''
                        echo "🚀 Initializing Terraform"
                        terraform init
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform-ec2-deploy') {
                    sh '''
                        echo "📋 Terraform Plan Preview"
                        terraform plan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform-ec2-deploy') {
                    sh '''
                        echo "⚙️ Applying Terraform"
                        terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}



