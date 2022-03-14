variable "project" {
  type        = string
  description = "The project where resources being created"
}

variable "zone" {
  type        = string
  description = "The zone where GCE instance being created"
}

variable "subnetwork" {
  type        = string
  description = "The name of the subnetwork being created"
}

variable "firewall_target_tags" {
  type        = list(string)
  description = "The list of firewall target tags"
  default     = []
}

variable "gce_instance_name" {
  type        = string
  description = "The name of GCE instance being created"
  default     = "lab-instance"
}

variable "gce_instance_type" {
  type        = string
  description = "The type of the GCE instance being created"
  default     = "e2-micro"
}

variable "gce_instance_ext_ip" {
  type        = string
  description = "External IP address of the GCE instance"
  default     = null
}

variable "service_account_email" {
  type        = string
  description = "Email of the service account being assigned to the instance"
  default     = null
}
