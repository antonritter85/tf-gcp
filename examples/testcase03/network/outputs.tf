output "region" {
  value = module.network.region
}

output "subnetwork_id" {
  value = module.network.subnetwork_id
}

output "ext_ip" {
  value = module.network.ext_ip
}

output "firewall_target_tags" {
  value = module.network.firewall_target_tags
}
