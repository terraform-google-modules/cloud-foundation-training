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
 * - region
 * - project_id
 * - network
 * - subnetworks = List of subnetwork names ("application" and "database")
 *.- ip_ranges = List of IP ranges (10.10.1.0/24", "10.10.2.0/24)
 * - ip_range_pods = List of secondary IP range for Kubernetes Pods ("10.20.0.0/21", "10.20.8.0/21")
 * - ip_range_services = List of secondary IP range for Kubernetes Services ("10.30.1.0/24", "10.30.2.0/24")
 *
 * See https://www.terraform.io/docs/configuration/variables.html
 *
 */
variable "region" {
  description = "GCP Region"
  default     = "us-west1"
}

variable "project_id" {
  description = "Project ID"
  default     = "<YOUR_PROJECT_ID>"
}

variable "network" {
  description = "The VPC network name"
  default     = "custom-vpc"
}

variable "subnetworks" {
  type        = list(string)
  description = "List of subnetworks"
  default     = ["application", "database"]
}

variable "ip_ranges" {
  type        = list(string)
  description = "The IP range to use for subnet"
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "ip_range_pods" {
  type        = list(string)
  description = "The secondary IP range to use for pods"
  default     = ["10.20.0.0/21", "10.20.8.0/21"]
}

variable "ip_range_services" {
  type        = list(string)
  description = "The secondary IP range to use for services"
  default     = ["10.30.1.0/24", "10.30.2.0/24"]
}
