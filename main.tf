resource "aws_instance" "this_aws_ec2" {
    ami                  = var.ec2_ami
  instance_type          = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.this_aws_sg.id]
#   availability_zone      = "us-east-1a"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install firewalld -y
    sudo systemctl start firewalld
    sudo systemctl enable firewalld
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --permanent --add-service=https
    sudo firewall-cmd --reload
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -a -G docker ec2-user
    sudo docker pull httpd
    sudo docker run --name apache_web -p 80:80 -d httpd
    EOF


  tags = {
    Name = "Webserver"
  }
}

resource "aws_security_group" "this_aws_sg" {
  vpc_id = var.vpc_id
  ingress {
    description = "ssh protocol"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http protocol"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https protocol"
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}