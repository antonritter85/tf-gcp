data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

module "testcase01" {
  source                 = "../../"
  project                = var.project
  region                 = var.region
  zone                   = element(data.google_compute_zones.available.names, 0)
  network                = "test-network"
  subnetwork             = "test-subnetwork"
  subnetwork_cidr        = "10.2.0.0/16"
  firewall_source_ranges = ["0.0.0.0/0"]
  gce_instance_name      = "test-instance"
  gce_instance_type      = "e2-small"
  service_account_name   = "test-instance-sa"
  service_account_roles  = ["viewer", "storage.admin"]
}
