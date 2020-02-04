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
 * Task 1: Add a Global HTTP Load Balancer ("load_balancer")
 * - Name: http-load-balancer
 * - Firewall Network: refer to network created in network.tf (module.network.network_self_link)
 * - Target Tags: var.target_tags
 * - Backend (Set rest of inputs to null)
 *   - Name: default
 *   - Protcol: HTTP
 *   - Port: 80
 *   - Port Name: http
 *   - Health Check
 *     - Requst Path: /
 *     - Port: 80
 *   - Group
 *     - refer to Instance Group created in mig.tf (module.managed_instance_group.instance_group)
 *
 * https://github.com/terraform-google-modules/terraform-google-lb-http
 *
 * Bonus Task: Add HTTPS Load Balancer to the same backend
 *
 */
module "load_balancer" {
  source            = "GoogleCloudPlatform/lb-http/google"
  project           = var.project_id
  name              = "http-load-balancer"
  firewall_networks = [module.network.network_self_link]
  target_tags       = var.target_tags

  backends = {
    default = {
      port_name                       = "http"
      protocol                        = "HTTP"
      port                            = 80
      description                     = null
      timeout_sec                     = null
      connection_draining_timeout_sec = null
      enable_cdn                      = null

      health_check = {
        check_interval_sec  = null
        timeout_sec         = null
        healthy_threshold   = null
        unhealthy_threshold = null
        request_path        = "/"
        port                = 80
        host                = null
      }

      groups = [
        {
          group                        = module.managed_instance_group.instance_group
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = null
        }
      ]
    }
  }
}
