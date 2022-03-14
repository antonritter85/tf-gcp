data "google_project" "this" {
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
  project  = data.google_project.this.project_id
  role     = "roles/${each.key}"
  member   = "serviceAccount:${google_service_account.this.email}"
}
