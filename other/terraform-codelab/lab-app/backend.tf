terraform {
  backend "gcs" {
    bucket = "<my-project-id>-state-bucket" # Edit this this line to match your lab-networking/networking backend.tf file
    prefix = "terraform/lab/vm"
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket  = "<my-project-id>-state-bucket" # Update this too
    prefix  = "terraform/lab/network"
  }
}
