output "gce_instance_ext_ip" {
  value = module.compute.gce_instance_ext_ip
}

output "service_account_json_key" {
  value     = data.terraform_remote_state.iam.outputs.service_account_json_key
  sensitive = true
}
