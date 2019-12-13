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
 * Task 1: Enable 2 APIs
 * - compute.googleapis.com (Compute Engine API)
 * - container.googleapis.com (Kubernetes Engine API)
 *
 * https://www.terraform.io/docs/providers/google/r/google_project_service.html
 *
 */

locals {
  services_list = [
    "compute.googleapis.com",
    "container.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  count              = "${length(local.services_list)}"
  project            = "${var.project_id}"
  service            = "${local.services_list[count.index]}"
  disable_on_destroy = "false"
}


/**
 * Task 2: Add a GKE cluster using CFT module
 * - Name: gke-cluster-1
 * - Private Cluster
 * - Private Master Endpoint
 * - Region: Read from variable
 * - Network: custom-vpc (from previous exercise)
 * - Subnetwork: subnet-application (from previous exercise)
 * - IP Range for Pods: Read from variable
 * - IP Range for Services: Read from variable
 * - Node Pool
 *   - Machine Type: n1-standard-1
 *.  - Min/Max: 1
 *
 * https://github.com/terraform-google-modules/terraform-google-kubernetes-engine
 * https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/master/modules/private-cluster
 *
 */
module "gke" {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id              = "${var.project_id}"
  name                    = "gke-cluster-1"
  region                  = "${var.region}"
  network                 = "${var.network}"
  subnetwork              = "${var.subnetwork}"
  ip_range_pods           = "${var.ip_range_pods}"
  ip_range_services       = "${var.ip_range_services}"
  network_policy          = true
  enable_private_endpoint = true
  enable_private_nodes    = true
  master_ipv4_cidr_block  = "10.0.0.0/28"
  service_account         = "${var.service_account}"

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "n1-standard-1"
      min_count          = 1
      max_count          = 1
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
      initial_node_count = 1
    },
  ]
}

/**
 * Task 3a: Create Cloud Router
 * - Region: Read from variable
 * - Network: custom-vpc (from previous exercise)
 *
 * https://www.terraform.io/docs/providers/google/r/compute_router.html
 *
 */
resource "google_compute_router" "cloud_nat_router" {
  name    = "cloud-nat-router"
  region  = "${var.region}"
  network = "${var.network}"
}

/**
 * Task 3b: Create Cloud NAT
 * - Region: Read from variable
 * - Router: Task 3a
 * - IP Allocation: AUTO_ONLY
 * - Subnet Configuration: ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES
 *
 * https://www.terraform.io/docs/providers/google/r/compute_router_nat.html
 *
 */
resource "google_compute_router_nat" "cloud_nat" {
  name                               = "cloud-nat"
  router                             = "${google_compute_router.cloud_nat_router.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

