variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "github_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "github_owner" {
  description = "GitHub repository owner"
  default     = "xxxxxxx"
}

variable "github_repo" {
  description = "GitHub repository name"
  default     = "laravel"
}

variable "github_token" {
  description = "This is github authentication token"
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  type = string
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "test-react-native-build"
}

variable "project_name" {
  description = "Project Name - will prefex all generated AWS resource names"
  default     = "devops-sg"
}




variable "region" {
  default = "ap-south-1"
}

data "aws_availability_zones" "azs" {
}


#variable "key_name" {}
#variable "AmazonEC2FullAccess_arn" {}
#variable "AmazonS3FullAccess_arn" {}
#variable "AWSCodedeploy_arn" {}