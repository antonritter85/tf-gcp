resource "google_compute_network" "this" {
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = var.subnetwork
  ip_cidr_range = var.subnetwork_cidr
  network       = google_compute_network.this.id
}

resource "google_compute_address" "this" {
  name = "ext-ipv4-address"
}

resource "google_compute_firewall" "this" {
  name    = "${google_compute_network.this.name}-allow-rules"
  network = google_compute_network.this.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = var.firewall_source_ranges
  target_tags   = ["allow-ports"]
}

resource "google_service_account" "this" {
  account_id   = var.service_account_name
  display_name = var.service_account_name
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.id
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.service_account_roles)
  project  = var.project
  role     = "roles/${each.key}"
  member   = "serviceAccount:${google_service_account.this.email}"
}

resource "google_compute_instance" "this" {
  name         = var.gce_instance_name
  machine_type = var.gce_instance_type
  zone         = var.zone

  tags = google_compute_firewall.this.target_tags

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.this.id

    access_config {
      nat_ip = google_compute_address.this.address
    }
  }

  service_account {
    email  = google_service_account.this.email
    scopes = ["cloud-platform"]
  }
}
