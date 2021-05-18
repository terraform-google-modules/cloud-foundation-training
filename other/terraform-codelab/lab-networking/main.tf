# This handles making sure the Cloud Resource Manager API is activated
resource "google_project_service" "resource_manager" {
  service = "cloudresourcemanager.googleapis.com"
  project = "${var.project_id}"
}

# This handles making sure the compute API is activated
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  project = "${var.project_id}"
}
