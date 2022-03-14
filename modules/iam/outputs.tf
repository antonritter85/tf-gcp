output "service_account_email" {
  value = google_service_account.this.email
}

output "service_account_json_key" {
  value       = base64decode(google_service_account_key.this.private_key)
  description = "The service account json key"
  sensitive   = true
}
