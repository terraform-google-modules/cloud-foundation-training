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

# This startup script creates a web server application used for testing
data "local_file" "instance_startup_script" {
  filename = "${path.module}/templates/startup.sh"
}

resource "google_service_account" "instance_group" {
  account_id = "instance-group"
  project    = var.project_id
}

/**
 * Task 1: Add Instance Template ("instance_template")
 * - Subnetwork: reference to network created in network.tf (module.network.subnets_self_links[0])
 * - Source Image Family: "debian-9"
 * - Source Image Project: "debian-cloud"
 * - Startup Script: reference to startup script file (data.local_file.instance_startup_script.content)
 * - Service Account:
 *   - Email: reference to service account resource (google_service_account.instance_group.email)
 *   - Scope: ["cloud-platform"]
 * - Tag: "allow-load-balancer"]
 *
 * https://github.com/terraform-google-modules/terraform-google-vm/tree/master/modules/instance_template
 *
 */
module "instance_template" {
  source               = "terraform-google-modules/vm/google//modules/instance_template"
  project_id           = var.project_id
  subnetwork           = module.network.subnets_self_links[0]
  source_image_family  = "debian-9"
  source_image_project = "debian-cloud"
  startup_script       = data.local_file.instance_startup_script.content
  service_account = {
    email  = google_service_account.instance_group.email
    scopes = ["cloud-platform"]
  }
  tags = ["allow-load-balancer"]
}

/**
 * Task 2: Add Managed Instance Group ("managed_instance_group")
 * - Project ID: Name of Project
 * - Region: Name of subnet region
 * - Target Size: 2
 * - Host Name: "lab-managed-instance"
 * - Instance Template: reference to instance template module (module.instance_template.self_link)
 * - Name Ports:
 *   - name: "http"
 *   - port: 80
 *
 * https://github.com/terraform-google-modules/terraform-google-vm/tree/master/modules/mig
 *
 */
module "managed_instance_group" {
  source            = "terraform-google-modules/vm/google//modules/mig"
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
