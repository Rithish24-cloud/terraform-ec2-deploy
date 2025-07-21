provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-0f58b397bc5c1f2e8" # Amazon Linux 2023 for ap-south-1
  instance_type = "t2.micro"
  tags = {
    Name = "jenkins-terraform-ec2"
  }
}

