output "gce_instance_ext_ip" {
  value       = google_compute_address.this.address
  description = "External IP address of the GCE instance"
}

output "service_account_json_key" {
  value       = base64decode(google_service_account_key.this.private_key)
  description = "The service account json key"
  sensitive   = true
}
