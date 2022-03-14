output "region" {
  value = var.region
}

output "subnetwork_id" {
  value = google_compute_subnetwork.this.id
}

output "ext_ip" {
  value = google_compute_address.this.address
}

output "firewall_target_tags" {
  value = google_compute_firewall.this.target_tags
}
