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

data "google_compute_subnetwork" "application-subnet" {
  name   = "subnet-application"
  region = var.region
}

/**
 * Add template_file data source
 * - Template = templates/startup_script.sh.tpl
 * - Variables
 *.  - Project ID (from input variable)
 *.  - Region (from input variable)
 *.  - Subnet (from data source)
 *
 * https://www.terraform.io/docs/providers/template/d/file.html
 *
 */

/**
 * Add 1 Google Compute Engine
 * - Name = terraform-kata-hello-world-{$var.project_id}
 * - Zone = Choose a zone from region
 * - Machine Type = n1-standard-1
 * - Startup Script = Use template_file
 * - Boot disk image = debian-cloud/debian-9
 * - Network interface in subnet-application
 * - Provisioner local-exec to output instance_id to instance_id.txt
 *
 * https://www.terraform.io/docs/providers/google/r/compute_instance.html
 *
 */
