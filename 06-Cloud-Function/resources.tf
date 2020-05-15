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

// Enable Cloud Functions API: cloudfunctions.googleapis.com
resource "google_project_service" "cloudfunctions_api" {
  project            = var.project_id
  service            = "cloudfunctions.googleapis.com"
  disable_on_destroy = false

  depends_on = [module.project_iam_bindings]
}

// Enable Cloud Storage API: storage-component.googleapis.com
resource "google_project_service" "storage_component_api" {
  project            = var.project_id
  service            = "storage-component.googleapis.com"
  disable_on_destroy = false

  depends_on = [module.project_iam_bindings]
}

// GCS Bucket to upload images
resource "google_storage_bucket" "image_upload" {
  name               = "lab06-image-upload-${var.project_id}-${random_id.suffix.hex}"
  project            = var.project_id
  location           = var.region
  storage_class      = "REGIONAL"
  force_destroy      = true
  bucket_policy_only = true

  depends_on = [
    google_project_service.cloudfunctions_api,
    google_project_service.storage_component_api
  ]
}

// GCS Bucket to output processed images
resource "google_storage_bucket" "image_processed" {
  name               = "lab06-image-processed-${var.project_id}-${random_id.suffix.hex}"
  project            = var.project_id
  location           = var.region
  storage_class      = "REGIONAL"
  force_destroy      = true
  bucket_policy_only = true

  depends_on = [
    google_project_service.cloudfunctions_api,
    google_project_service.storage_component_api,
    google_service_account_iam_member.service_account_user
  ]
}

// Service Account for Cloud Function Runtime
resource "google_service_account" "image_processing_gcf_sa" {
  project      = var.project_id
  account_id   = "image-processing-gcf"
  display_name = "Image Processing Cloud Function Service Account"

  depends_on = [module.project_iam_bindings]
}

resource "google_service_account_iam_member" "service_account_user" {
  service_account_id = google_service_account.image_processing_gcf_sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:sa-cft-training@${var.project_id}.iam.gserviceaccount.com"
}

// Grant Storage Admin role for Cloud Function Runtime Service Account
resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.image_processing_gcf_sa.email}"

  depends_on = [google_service_account_iam_member.service_account_user]
}

// Wait for Cloud Function deployment to finish
resource "null_resource" "wait_for_function" {
  provisioner "local-exec" {
    command = "sleep 60"
  }

  depends_on = [module.image_processing_function]
}
