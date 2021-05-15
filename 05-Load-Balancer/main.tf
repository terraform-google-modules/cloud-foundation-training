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
  project = var.project_id
  region  = var.region
  version = "~> 3.53"
}

/**
 * Task 1: Add a Global HTTP Load Balancer ("load_balancer")
 * - source: "GoogleCloudPlatform/lb-http/google"
 * - version: "~> 5.0.0"
 * - project: module.project_iam_bindings.projects[0]
 * - name: "lab05-http-load-balancer"
 * - firewall_networks: module.network.network_self_link
 * - target_tags: var.target_tags
 * - backends: (Set rest of inputs to null)
 *   - default
 *     - port_name: "http"
 *     - protocol: "HTTP"
 *     - port: 80
 *     - description: null
 *     - timeout_sec: null
 *     - connection_draining_timeout_sec: null
 *     - enable_cdn: null
 *     - session_affinity: null
 *     - security_policy: null
 *     - affinity_cookie_ttl_sec: null
 *     - custom_request_headers: null
 *     - log_config:
 *       - enable: false
 *       - sample_rate: null
 *     - iap_config:
 *       - enable: false
 *       - oauth2_client_id: ""
 *       - oauth2_client_secret: ""
 *     - health_check:
 *       - request_path: "/"
 *       - port: 80
 *       - check_interval_sec:  null
 *       - timeout_sec:         null
 *       - healthy_threshold:   null
 *       - unhealthy_threshold: null
 *       - host:                null
  *      - logging:             null
 *   - groups:
 *     - group: module.managed_instance_group.instance_group
 *     - balancing_mode: null
 *     - capacity_scaler: null
 *     - description: null
 *     - max_connections: null
 *     - max_connections_per_instance: null
 *     - max_connections_per_endpoint: null
 *     - max_rate: null
 *     - max_rate_per_instance: null
 *     - max_rate_per_endpoint: null
 *     - max_utilization: null
 *
 * Reference - https://github.com/terraform-google-modules/terraform-google-lb-http
 *
 */
module "load_balancer" {

}
