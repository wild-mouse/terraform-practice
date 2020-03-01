provider "aws" {
  region = "ap-northeast-1"
}

data "aws_ami" "recent_amazon_liux_2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.????????-x86_64-gp2"]
  }

  filter {
    name = "state"
    values = ["available"]
  }
}

resource "aws_instance" "example" {
  ami = data.aws_ami.recent_amazon_liux_2.image_id
  instance_type = "t3.micro"

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}