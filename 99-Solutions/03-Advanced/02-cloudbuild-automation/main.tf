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
  version = "~> 2.0"
  project = "${var.project_id}"
  region  = "${var.default_region}"
}

/**
 * Task 3: Add a Cloud Source Repository
 * - Name: "tf-manifest-repository"
 *
 * https://www.terraform.io/docs/providers/google/r/source_repo_repository.html
 *
 */
resource "google_sourcerepo_repository" "tf_manifest_repo" {
  name = "tf-manifest-repository"
}

/**
 * Task 4: Add a Cloud Build Trigger
 * - Branch Name: master
 * - Repo Name: tf-manifest-repository
 * - File Name: cloudbuild.yaml
 * https://www.terraform.io/docs/providers/google/r/cloud_build_trigger.html
 *
 */
resource "google_cloudbuild_trigger" "filename_trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "tf-manifest-repository"
  }

  filename = "cloudbuild.yaml"
}
