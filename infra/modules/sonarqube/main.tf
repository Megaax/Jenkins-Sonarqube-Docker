resource "aws_instance" "sonarqube_ec2_instance_ip" {
  ami           = var.ami_id
  key_name      = var.key_name
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_sonarqube
  associate_public_ip_address = var.enable_public_ip_address

  user_data = var.user_data_install_sonarqube

  metadata_options {
    http_endpoint = "enabled"  # Enable the IMDSv2 endpoint
    http_tokens   = "required" # Require the use of IMDSv2 tokens
  }
}


