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

module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 1.4.3"
  project_id   = var.project_id
  network_name = "lab-vpc"
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    }
  ]
}

module "cloud_nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.1.0"
  project_id    = var.project_id
  region        = "us-west1"
  name          = "load-balancer-module-nat"
  create_router = "true"
  router        = "lab-router"
  network       = module.network.network_name
}
