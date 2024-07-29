output "vpc_id" {
  value       = var.vpc_id
  description = "vpc id."
}

output "vpc_public_subnet_ids" {
  value       = var.public_subnets
  description = "List of IDs of VPC public subnets."
}

output "ecs_repository_url" {
  value       = module.ecs.repository_url
  description = "URL of ECR with build artifacts."
}

output "app_sg_id" {
  value       = module.ecs.app_sg_id
  description = "ID of application security group. (ALB and ECS adapted)"
}

output "alb_sg_id" {
  value       = module.ecs.alb_sg_id
  description = "ID of ALB security group."
}

output "ecs_sg_id" {
  value       = module.ecs.ecs_sg_id
  description = "ID of ECS security group."
}

output "cloudwatch_log_group_arn" {
  value       = module.ecs.cloudwatch_log_group_arn
  description = "ARN of ecs cloudwatch log group."
}

output code_pipeline_artifact_s3_id {
  value       = module.pipeline.pipeline_s3_id
  description = "ID of s3 bucket for code pipeline artifact store."
}

output code_pipeline_id {
  value       = module.pipeline.pipeline_id
  description = "ID of code pipeline."
}


