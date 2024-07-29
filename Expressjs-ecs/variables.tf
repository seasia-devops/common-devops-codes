variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  type        = string
  description = "expressjs-cluster"
  default     = "mycluster"
}

variable "vpc_id" {
  type        = string
  description = "my default vpc"
  default     = "vpc-0304096b"
}


variable "public_subnets" {
  
  description = "(These three are my subnets)"
  default = [
    "subnet-fa1e86b6",
    "subnet-6b416b03", 
    "subnet-a472d0df"]
  
}

variable "alb_port" {
  type        = string
  description = "origin application load balancer port"
  default = "80"
}

variable "container_port" {
  type        = string
  description = "destination application load balancer port"
  default = "3000"
}

variable "app_repository_name" {
  type        = string
  description = "ecr repository name"
  default     = "expressjs-repo"
}

variable "container_name" {
  type        = string
  description = "container app name"
  default     = "container"
}

variable "git_repository" {
  type        = string
  description = "git repository. It must contain the following key: owner, name, branch"
  default =   "shivani3495/expressjs/main"
}

variable "helth_check_path" {
  type        = string
  description = "target group helth check path"
  default     = "/"
}

variable "desired_tasks" {
  type        = number
  description = "number of containers desired to run app task"
  default     = 2
}

variable "min_tasks" {
  type        = number
  description = "minimum"
  default     = 2
}

variable "max_tasks" {
  type        = number
  description = "maximum"
  default     = 4
}

variable "cpu_to_scale_up" {
  type        = number
  description = "cpu % to scale up the number of containers"
  default     = 80
}

variable "cpu_to_scale_down" {
  type        = number
  description = "cpu % to scale down the number of containers"
  default     = 30
}

variable "desired_task_cpu" {
  type        = string
  description = "desired cpu to run your tasks"
  default     = "256"
}

variable "desired_task_memory" {
  type        = string
  description = "desired memory to run your tasks"
  default     = "512"
}

variable "environment_variables" {
  type        = map(string)
  description = "ecs task environment variables"

  default = {
    KEY = "value"
  }
}

variable "build_options" {
  type        = string
  default     = ""
  description = "Docker build options. ex: '-f ./build/Dockerfile' "
}

variable "build_args" {
  description = "docker build args."
  type        = map(string)
  default     = {}
}



