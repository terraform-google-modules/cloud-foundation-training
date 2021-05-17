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

resource "random_id" "suffix" {
  byte_length = 4
}

/**
 * Task 1: Add Cloud Function ("image_processing_function")
 * - source: "terraform-google-modules/event-function/google"
  * - version: "~> 1.3.0"
 * - name: "lab06-cloud-function-${var.project_id}-${random_id.suffix.hex}"
 * - project_id: module.project_iam_bindings.projects[0]
 * - region: var.region (https://cloud.google.com/functions/docs/locations)
 * - description: "Process image in GCS bucket"
 * - entry_point: "blur_images"
 * - runtime: "python37"
 * - source_directory: "${path.module}/function_source"
 * - bucket_force_destroy: true
 * - service_account_email: google_service_account.gcf_sa.email
 * - environment_variables
 *   - key: BLURRED_BUCKET_NAME
 *   - value: google_storage_bucket.image_processed.name
 * - event_trigger
 *   - event_type: "google.storage.object.finalize"
 *   - resource: google_storage_bucket.image_upload.name
 *
 * Reference - https://github.com/terraform-google-modules/terraform-google-event-function
 *
 * Cloud Function Source Code modified from GCP Python tutorial
 * https://cloud.google.com/functions/docs/tutorials/imagemagick#functions-clone-sample-repository-python
 *
 */
module "image_processing_function" {

}
