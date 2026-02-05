variable "Env" {
  type = string
  default = "qa"
}

variable "subscription_id" {
  description = "The xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx subcription id"
  type        = string
  default     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "org_service_url" {
  type = string
  default = "https://dev.azure.com/XXXXXXXXXXXXX/"
}
