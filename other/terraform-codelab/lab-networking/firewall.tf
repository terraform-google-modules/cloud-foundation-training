/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_compute_firewall" "allow-ping" {
  name    = "allow-ping"
  network = module.vpc.network_name
  project = google_project_service.compute.project

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ping"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = module.vpc.network_name
  project = google_project_service.compute.project

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = module.vpc.network_name
  project = google_project_service.compute.project

  allow {
    protocol = "tcp"
    ports    = ["80"] # Edit this line
  }

  # Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}
