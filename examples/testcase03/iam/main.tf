module "iam" {
  source                = "../../../modules/iam/"
  project               = var.project
  service_account_name  = "test-instance-sa"
  service_account_roles = ["viewer", "storage.admin"]
}
