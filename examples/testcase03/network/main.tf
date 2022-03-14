module "network" {
  source                 = "../../../modules/network/"
  project                = var.project
  region                 = var.region
  network                = "test-network"
  subnetwork             = "test-subnetwork"
  subnetwork_cidr        = "10.2.0.0/16"
  firewall_source_ranges = ["0.0.0.0/0"]
}
