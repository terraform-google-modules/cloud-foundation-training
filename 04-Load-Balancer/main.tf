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

data "local_file" "instance_startup_script" {
  filename = "${path.module}/templates/startup.sh"
}

resource "google_service_account" "instance-group" {
  account_id = "instance-group"
}

module "instance_template" {
  source               = "terraform-google-modules/vm/google//modules/instance_template"
  version              = "~> 1.0.0"
  subnetwork           = module.network.subnets_names[0]
  source_image_family  = "debian-9"
  source_image_project = "debian-cloud"
  startup_script       = data.local_file.instance_startup_script.content
  tags                 = ["allow-load-balancer"]
  service_account = {
    email  = google_service_account.instance-group.email
    scopes = ["cloud-platform"]
  }
}

module "managed_instance_group" {
  source            = "terraform-google-modules/vm/google//modules/mig"
  version           = "~> 1.1.1"
  project_id        = var.project_id
  region            = var.region
  target_size       = 2
  hostname          = "lab-managed-instance"
  instance_template = module.instance_template.self_link
  named_ports = [{
    name = "http"
    port = 80
  }]
}

#TODO: Add Load Balancer module
