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
provider "google" {
  project = var.project_id
  region  = var.region
  version = "~> 2.7.0"
}

module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = ["my-project_one", "my-project_two"]
  mode     = "additive"

  bindings = {
    "roles/compute.networkAdmin" = [
      "group:network-admins@my-org.com",
      "user:sally.@my-org.com",
    ]
  }
}