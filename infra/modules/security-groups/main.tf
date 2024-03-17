# create security group for the application load balancer
resource "aws_security_group" "alb_security_group" {
  name        = "alb security group"
  description = "enable http/https access on port 80/443"
  vpc_id      = var.vpc_id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb security group"
  }
}



resource "aws_security_group" "ec2_jenkins_security_group" {
  name        = "ec2 jenkins security group"
  description = "enable port 8080 for jenkins"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow port 8080 to access jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2 jenkins security group"
  }
}



resource "aws_security_group" "ec2_sonarqube_security_group" {
  name        = "ec2 sonarqube security group"
  description = "enable port 9000 for sonar"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow port 9000 to access sonar"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2 sonarqube group"
  }
}




resource "aws_security_group" "ec2_docker_security_group" {
  name        = "ec2 docker security group"
  description = "enable port 9000 for sonar"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow port 8085 to access application"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8085
    to_port     = 8085
    protocol    = "tcp"
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2 docker app group"
  }
}
