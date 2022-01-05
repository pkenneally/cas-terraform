provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_security_group" "ubuntu" {
  name        = "${var.hostname}-security-group"
  description = "Allow HTTP, HTTPS and SSH traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform"
  }
}


resource "aws_instance" "ubuntu" {
  key_name = var.ssh_key_name
  ami           = "ami-0033f08ef49b71cb4"
  instance_type = "t2.micro"
 
  tags = {
    Name = "${var.hostname}"
  }

  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]

  ebs_block_device {
    device_name = "/dev/sda2"
    volume_type = "gp2"
    volume_size = 3
    encrypted = true
  }

  root_block_device {
    encrypted = true 
    volume_size = 2 
    volume_type = "gp2" 
  }
}
