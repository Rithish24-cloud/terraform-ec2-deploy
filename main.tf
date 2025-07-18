provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 22.04 in us-east-1
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "Terraform-DevOps-EC2"
  }
}
