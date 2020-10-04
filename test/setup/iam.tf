/**
 * Copyright 2020 Google LLC
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

locals {
  # https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup#33-service-account
  required_roles = toset([
    "roles/resourcemanager.projectIamAdmin",
    "roles/storage.admin",
    "roles/compute.imageUser",
    "roles/compute.networkViewer"
  ])
}

resource "random_id" "random_suffix" {
  byte_length = 2
}

resource "google_service_account" "int_test" {
  project      = module.training-project.project_id
  account_id   = "sa-cft-training"
  display_name = "sa-cft-training"
}

resource "google_project_iam_member" "int_test_iam" {
  for_each = local.required_roles

  project = module.training-project.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.int_test.email}"
}

resource "google_service_account_key" "int_test" {
  service_account_id = google_service_account.int_test.id
}
