output "gce_instance_ext_ip" {
  value       = module.testcase01.gce_instance_ext_ip
  description = "External IP address of the GCE instance"
}

output "service_account_json_key" {
  value       = module.testcase01.service_account_json_key
  description = "The service account json key"
  sensitive   = true
}
