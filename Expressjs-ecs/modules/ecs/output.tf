output "repository_url" {
  value = aws_ecr_repository.web-app.repository_url
}

output "service_name" {
  value = aws_ecs_service.web-api.name
}

output "app_sg_id" {
  value = aws_security_group.elb_sg
}

output "alb_sg_id" {
  value = aws_security_group.elb_sg
}

output "ecs_sg_id" {
  value = aws_security_group.elb_sg
}

output "cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.web-app.arn
}


