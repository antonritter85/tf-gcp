resource "google_compute_instance" "this" {
  name         = var.gce_instance_name
  machine_type = var.gce_instance_type
  zone         = var.zone

  tags = var.firewall_target_tags

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = var.subnetwork

    access_config {
      nat_ip = var.gce_instance_ext_ip
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
