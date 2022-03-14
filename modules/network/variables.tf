variable "project" {
  type        = string
  description = "The project where resources being created"
}

variable "region" {
  type        = string
  description = "The region where resources being created"
  default     = "europe-west4"
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
