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

resource "random_id" "random_project_id_suffix" {
  byte_length = 4
}

module "training-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 15.0"

  name              = "ci-training-${random_id.random_project_id_suffix.hex}"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = var.folder_id
  billing_account   = var.billing_account

  auto_create_network = true

  # https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup#31-google-cloud-apis
  # https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/03-Networking#preparation-enable-apis
  activate_apis = [
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
  ]
}
