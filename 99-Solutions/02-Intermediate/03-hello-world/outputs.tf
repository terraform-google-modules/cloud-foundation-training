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
 * Task: Add output for the following resources
 * - VM Instance ID
 * - VM Internal IP
 * - VM External IP
 *
 * See https://www.terraform.io/docs/configuration/outputs.html
 *
 */
output "instance_id" {
  value = "${google_compute_instance.web_server.instance_id}"
}

output "instance_ip" {
  value = "${google_compute_instance.web_server.network_interface.0.network_ip}"
}

output "external_ip" {
  value = "${google_compute_instance.web_server.network_interface.0.access_config.*.nat_ip}"
}
