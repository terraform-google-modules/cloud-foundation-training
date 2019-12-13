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
 * Task: Add a custom VPC Network
 * - Name: ""
 *
 * https://www.terraform.io/docs/providers/google/r/compute_network.html
 *
 */


/**
 * Task: Add 1 Subnet
 * - Singapore region
 *
 * https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
 *
 */


/**
 * Task: Add 1 Firewall Rule
 * - Ingress from all
 * - Allow ICMP
 * - Allow SSH
 *
 * https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 *
 */


/**
 * Task: Add 1 Firewall Rule
 * - Allow TCP
 * - Allow from Source Ranges for Google Cloud Health Check
 * - 130.211.0.0/22
 * - 209.85.152.0/22
 * - 209.85.204.0/22
 * - 35.191.0.0/16
 *
 * https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 *
 */
# https://cloud.google.com/load-balancing/docs/health-checks

