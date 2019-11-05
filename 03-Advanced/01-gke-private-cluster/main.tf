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

provider "google" {
  version = "~> 2.0"
  project = "${var.project_id}"
  region  = "${var.region}"
}

/**
 * Task 1: Enable 2 APIs
 * - compute.googleapis.com (Compute Engine API)
 * - container.googleapis.com (Kubernetes Engine API)
 *
 * https://www.terraform.io/docs/providers/google/r/google_project_service.html
 *
 */

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

/**
 * Task 3a: Create Cloud Router
 * - Region: Read from variable
 * - Network: custom-vpc (from previous exercise)
 *
 * https://www.terraform.io/docs/providers/google/r/compute_router.html
 *
 */

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
