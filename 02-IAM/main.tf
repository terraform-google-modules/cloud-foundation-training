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
  version = "~> 3.53"
}

/**
 * Task 1: Add IAM Role Bindings (project_iam_bindings)
 * - source: "terraform-google-modules/iam/google//modules/projects_iam"
 * - version: "~> 7.1.0"
 * - projects: [var.project_id]
 * - mode: "additive"
 * - bindings:
 *   - Members: "serviceAccount:sa-cft-training@${var.project_id}.iam.gserviceaccount.com"
 *   - Role:
 *     - "roles/cloudfunctions.admin"
 *     - "roles/compute.admin"
 *     - "roles/compute.networkAdmin"
 *     - "roles/iam.serviceAccountAdmin"
 *     - "roles/serviceusage.serviceUsageAdmin"
 *     - "roles/storage.admin"
 *
 * Reference - https://github.com/terraform-google-modules/terraform-google-iam
 *
 */
module "project_iam_bindings" {

}
