 locals {
    inputs = yamldecode(file("${path.module}/inputs.yaml"))
 }

module "testcase02" {
  source                 = "../../"
  project                = local.inputs.project
  region                 = local.inputs.region
  zone                   = local.inputs.zone
  network                = local.inputs.network
  subnetwork             = local.inputs.subnetwork
  subnetwork_cidr        = local.inputs.subnetwork_cidr
  firewall_source_ranges = local.inputs.firewall_source_ranges
  gce_instance_name      = local.inputs.gce_instance_name
  gce_instance_type      = local.inputs.gce_instance_type
  service_account_name   = local.inputs.service_account_name
  service_account_roles  = local.inputs.service_account_roles
}
