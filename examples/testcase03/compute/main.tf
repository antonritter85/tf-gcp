data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}

data "terraform_remote_state" "iam" {
  backend = "local"

  config = {
    path = "../iam/terraform.tfstate"
  }
}

data "google_compute_zones" "available" {
  project = var.project
  region  = data.terraform_remote_state.network.outputs.region
}

module "compute" {
  source                = "../../../modules/compute/"
  project               = var.project
  zone                  = element(data.google_compute_zones.available.names, 0)
  subnetwork            = data.terraform_remote_state.network.outputs.subnetwork_id
  firewall_target_tags  = data.terraform_remote_state.network.outputs.firewall_target_tags
  gce_instance_name     = "test-instance"
  gce_instance_type     = "e2-small"
  gce_instance_ext_ip   = data.terraform_remote_state.network.outputs.ext_ip
  service_account_email = data.terraform_remote_state.iam.outputs.service_account_email
}
