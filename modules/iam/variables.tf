variable "project" {
  type        = string
  description = "The project where resources being created"
}

variable "service_account_name" {
  type        = string
  description = "The name of the service account being created"
  default     = "lab-instance-sa"
}

variable "service_account_roles" {
  type        = list(string)
  description = "List of the service account roles being created"
  default     = []
}
