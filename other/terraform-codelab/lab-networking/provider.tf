provider "google" {
  version = "~> 2.5"
  project = "${var.project_id}"
  credentials = "${file("credentials.json")}"
}
