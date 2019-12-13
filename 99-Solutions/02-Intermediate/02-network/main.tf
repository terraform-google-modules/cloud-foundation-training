/**
 * Copyright 2019 Google LLC
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

/**
 * Add a custom VPC Network
 * - Name: Read from variable
 * - Routing Mode: Global
 * - Auto Create Subnetwork: false
 *
 * https://www.terraform.io/docs/providers/google/r/compute_network.html
 *
 */
resource "google_compute_network" "vpc_network" {
  name                    = var.network
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

/**
 * Add Subnets based on the length of input List
 * - Name = Use variable
 * - Network = VPC Network created above
 * - Region = Use variable
 * - Enable Private Google Access
 * - IPV4 Range = Use variable
 * - Secondary Ranges = Use variables for Pod/Service
 *
 * https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
 *
 */
resource "google_compute_subnetwork" "subnets" {
  count                    = length(var.subnetworks)
  name                     = "subnet-${var.subnetworks[count.index]}"
  network                  = google_compute_network.vpc_network.self_link
  region                   = var.region
  private_ip_google_access = true

  ip_cidr_range = var.ip_ranges[count.index]

  secondary_ip_range {
    range_name    = "pod"
    ip_cidr_range = var.ip_range_pods[count.index]
  }

  secondary_ip_range {
    range_name    = "service"
    ip_cidr_range = var.ip_range_services[count.index]
  }
}

/**
 * Add 1 Firewall Rule
 * - Ingress from all
 * - Allow ICMP
 * - Allow SSH
 *
 * https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 *
 */
resource "google_compute_firewall" "fw_icmp_ssh" {
  name    = "fw-icmp-ssh"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

/**
 * Add 1 Firewall Rule
 * - Ingress from all
 * - Allow TCP:80,443
 * - Target Tag: webserve
 *
 * https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 *
 */
resource "google_compute_firewall" "fw_webserver" {
  name    = "fw-webserver"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  target_tags = ["webserver"]

  source_ranges = ["0.0.0.0/0"]
}

/**
 * Add 1 Firewall Rule
 * - Allow TCP
 * - Allow from Source Ranges for Google Cloud Health Check
 * - 130.211.0.0/22
 * - 209.85.152.0/22
 * - 209.85.204.0/22
 * - 35.191.0.0/16
 *
 * https://cloud.google.com/load-balancing/docs/health-checks
 * https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 *
 */
resource "google_compute_firewall" "fw_allow_lb_healthcheck" {
  name    = "allow-lb-healthcheck"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
  }

  source_ranges = [
    "130.211.0.0/22",
    "209.85.152.0/22",
    "209.85.204.0/22",
    "35.191.0.0/16",
  ]
}
