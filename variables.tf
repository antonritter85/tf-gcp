variable "project" {
  type        = string
  description = "The project where resources being created"
}

variable "region" {
  type        = string
  description = "The region where resources being created"
  default     = "europe-west4"
}

variable "zone" {
  type        = string
  description = "The zone where GCE instance being created"
  default     = "europe-west4-a"
}

variable "network" {
  type        = string
  description = "The name of the network being created"
  default     = "lab-network"
}

variable "subnetwork" {
  type        = string
  description = "The name of the subnetwork being created"
  default     = "lab-subnetwork"
}

variable "subnetwork_cidr" {
  type        = string
  description = "The CIDR range of the subnetwork being created"
  default     = "10.1.0.0/16"
}

variable "firewall_source_ranges" {
  type        = list(string)
  description = "List of source IP CIDR ranges for firewall rule"
  default     = ["0.0.0.0/0"]
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
