data "google_compute_image" "apache" {
  family  = "my-apache-webserver"
  project = "${var.project_id}"
}

resource "google_compute_instance" "app" {
  name         = "my-app-instance"
  project      = "${var.project_id}"
  machine_type = "n1-standard-2"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.apache.self_link}"
    }
  }

  network_interface {
    subnetwork         = data.terraform_remote_state.network.outputs.my_subnet_name
    subnetwork_project = "${var.project_id}"

    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = "echo '<!doctype html><html><body><h1>Hello Google!</h1></body></html>' | sudo tee /var/www/html/index.html" # Edit this line

  tags = ["allow-ping", "allow-http", "allow-ssh"]
}
