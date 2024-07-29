variable "cluster_name" {
  description = "mycluster"
}

variable "app_repository_name" {
  description = "expressjs-repo"
}

variable "app_service_name" {
  description = "service"
}

variable "git_repository" {
  type        = string
  description = "ecs task environment variables"
}

variable "vpc_id" {
  description = "vpc-0304096b"
}

variable "repository_url" {
  description = "https://ap-south-1.console.aws.amazon.com/ecr/repositories/private/228431726353/expressjs?region=ap-south-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "this is"
  default = [
    "subnet-fa1e86b6",
    "subnet-6b416b03", 
    "subnet-a472d0df"]
}

variable "region" {
  description = "The region to use"
  default     = "ap-south-1"
}

variable "container_name" {
  description = "Container"
}

variable "build_args" {
  type    = map(string)
  default = {}
}

variable "build_options" {
  type        = string
  default     = ""
  description = "Docker build options. ex: '-f ./build/Dockerfile' "
}

variable "token"{
  type = string
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxx"
}


variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "xxxxxxxxxxxxx"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "expressjs"
}
