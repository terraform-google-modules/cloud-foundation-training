terraform {
  backend "gcs" {
    bucket = "my-state-bucket"       # Change this to <my project id>-state-bucket
    prefix = "terraform/lab/network"
  }
}
