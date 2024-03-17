output "alb_security_group_id" {
  value = aws_security_group.alb_security_group.id
}

# output "ecs_security_group_id" {
#   value = aws_security_group.ecs_security_group.id
# }


output "ec2_jenkins_security_group_id" {
  value = aws_security_group.ec2_jenkins_security_group.id
}

output "ec2_sonarqube_security_group_id" {
  value = aws_security_group.ec2_sonarqube_security_group.id
}

output "ec2_docker_security_group_id" {
  value = aws_security_group.ec2_docker_security_group.id
}
