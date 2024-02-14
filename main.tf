provider "aws" {
region = "us-east-1"
access_key = "AKIAUH5AW5XT2SVKMKD3"
secret_key = "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"
}

variable "sg" {
  description = "pem Key pair"
  type = string
  default = "sg-0208ba1e169d84283"
}

resource "aws_instance" "one" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.medium"
   key_name = "WebServerKeyPair"
   vpc_security_group_ids = var.sg
   availability_zone = "us-east-1a"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd 
sudo chkconfig httpd on
sudo echo "Hai All This is My flipkart-1 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "flipkart-1"
}
}

resource "aws_instance" "two" {
ami = "ami-0e731c8a588258d0d"
instance_type = "t2.micro"
   key_name = "WebServerKeyPair"
   vpc_security_group_ids = var.sg
   availability_zone = "us-east-1b"
   user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo chkconfig httpd on
sudo echo "Hai All This is My flipkart-2 Web-Application Created by Terraform Infrastructute By Java Home Cloud Server-1" > /var/www/html/index.html
EOF
tags = {
Name = "flipkart-2"
}
}

