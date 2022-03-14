variable "project" {
  type        = string
  description = "The project where resources being created"
}

variable "region" {
  type        = string
  description = "The region where resources being created"
  default     = "europe-west4"
}
