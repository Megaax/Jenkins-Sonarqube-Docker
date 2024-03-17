provider "aws" {
  region  = var.region
  profile = "terraform-user"
}

module "vpc" {
  source                       = "./modules/vpc"
  region                       = var.region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "jenkins_ec2" {
  source                    = "./modules/jenkins"
  ami_id                    = var.ami_id
  key_name                  = "17_3"
  instance_type             = "t2.medium"
  tag_name                  = "Jenkins:Ubuntu-EC2"
  subnet_id                 = module.vpc.public_subnet_az1_id
  sg_for_jenkins            = [module.security_groups.ec2_jenkins_security_group_id]
  enable_public_ip_address  = true
  user_data_install_jenkins = templatefile("./modules/jenkins-runner-script/jenkins-installer.sh", {})

}

module "sonarqube_ec2" {
  source                      = "./modules/sonarqube"
  ami_id                      = var.ami_id
  key_name                    = "17_3"
  instance_type               = "t2.medium"
  tag_name                    = "Sonarqube:Ubuntu-EC2"
  subnet_id                   = module.vpc.public_subnet_az1_id
  sg_for_sonarqube            = [module.security_groups.ec2_sonarqube_security_group_id]
  enable_public_ip_address    = true
  user_data_install_sonarqube = templatefile("./modules/sonarqube-runner/sonarqube-installer.sh", {})

}


module "docker_ec2" {
  source                   = "./modules/docker"
  ami_id                   = var.ami_id
  key_name                 = "17_3"
  instance_type            = "t2.medium"
  tag_name                 = "Docker:Ubuntu-EC2"
  subnet_id                = module.vpc.public_subnet_az1_id
  sg_for_docker            = [module.security_groups.ec2_docker_security_group_id]
  enable_public_ip_address = true
  user_data_install_docker = templatefile("./modules/docker-runner/docker-installer.sh", {})

}
