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
 * Task: Add variable for the following values and use them in main.tf
 * - default_region
 * - project_id
 * - network
 * - subnetworks = List of subnetwork names
 * - ip_range_pods = List of secondary IP range for Pods
 * - ip_range_services = List of secondary IP range for Services
 *
 * See https://www.terraform.io/docs/configuration/variables.html
 *
 */
variable "default_region" {
  description = "Default Region"
  default     = "asia-southeast1"
}

variable "project_id" {
  description = "Project ID"
  default     = "<YOUR_PROJECT_ID>"
}
