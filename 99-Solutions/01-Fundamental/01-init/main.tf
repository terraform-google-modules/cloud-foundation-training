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
 * Bonus Task: Use locals to reduce repeatition
 *
 * See https://www.terraform.io/docs/configuration/locals.html
 *
 */
locals {
  suffix     = random_id.suffix.hex
  versioning = true
}

/**
 * Task 3.1: Add random_id resource named suffix
 * - byte_length = 4
 *
 * The resource random_id generates random numbers that are intended
 * to be used as unique identifiers for other resources.
 *
 * https://www.terraform.io/docs/providers/random/r/id.html
 *
 */
resource "random_id" "suffix" {
  byte_length = "4"
}

/**
 * Task 3.2: Add a GCS Bucket
 * - Name: "terraform-kata-logs-<YOUR_NAME>-${random_id.suffix.hex}"
 * - Storage Class: Regional
 * - Location: Singapore
 * - Force Destroy: True
 * - Versioning: Enabled
 *
 * https://www.terraform.io/docs/providers/google/r/storage_bucket.html
 *
 */
resource "google_storage_bucket" "terraform_kata_logs" {
  name          = "terraform-kata-logs-aaron-${local.suffix}"
  storage_class = var.storage_class
  location      = var.region
  force_destroy = true

  versioning {
    enabled = local.versioning
  }
}

/**
 * Task 4: Add a GCS Bucket for remote state
 * - Name: "terraform-kata-state-<YOUR_NAME>-${random_id.suffix.hex}"
 * - Storage Class: Regional
 * - Location: Singapore
 * - Versioning: Enabled
 *
 * https://www.terraform.io/docs/providers/google/r/storage_bucket.html
 *
 */
resource "google_storage_bucket" "terraform_kata_state" {
  name          = "terraform-kata-state-aaron-${local.suffix}"
  storage_class = var.storage_class
  location      = var.region

  versioning {
    enabled = local.versioning
  }
}

/**
 * Task 5.1: Add a Cloud KMS Key Ring
 * - Name: "gcs-keyring"
 * - Location: Singapore
 *
 * https://www.terraform.io/docs/providers/google/r/kms_key_ring.html
 *
 */
resource "google_kms_key_ring" "gcs_keyring" {
  name     = "gcs-keyring"
  location = var.region
}

/**
 * Task 5.1: Add a Cloud KMS Key
 * - Name: "gcs-key"
 * - lifecycle.prevent_destroy: true
 *
 * https://www.terraform.io/docs/providers/google/r/kms_crypto_key.html
 *
 */
resource "google_kms_crypto_key" "gcs_key" {
  name            = "gcs-crypto-key"
  key_ring        = google_kms_key_ring.gcs_keyring.self_link
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}
