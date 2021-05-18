resource "google_compute_firewall" "allow-ping" {
  name    = "allow-ping"
  network = "${module.vpc.network_name}"
  project = "${google_project_service.compute.project}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ping"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = "${module.vpc.network_name}"
  project = "${google_project_service.compute.project}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = "${module.vpc.network_name}"
  project = "${google_project_service.compute.project}"

  allow {
    protocol = "tcp"
    ports    = ["80"]  # Edit this line
  }

  # Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}
