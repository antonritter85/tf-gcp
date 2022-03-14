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
