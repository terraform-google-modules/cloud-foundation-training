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

locals {
  suffix     = random_id.suffix.hex
  versioning = true
}

/**
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
 * Task 3: Add a GCS Bucket with Access Logs exported to Log bucket
 * - Name: "terraform-kata-usage-<YOUR_NAME>-${random_id.suffix.hex}"
 * - Storage Class: Regional
 * - Location: Singapore
 * - Force Destroy: True
 * - Versioning: Enabled
 * - Logging: Logs Bucket
 * - Encryption with KMS Key from data provider
 *
 * https://www.terraform.io/docs/providers/google/r/storage_bucket.html
 *
 */
resource "google_storage_bucket" "terraform_kata_usage" {
  name          = "terraform-kata-usage-aaron-${local.suffix}"
  storage_class = var.storage_class
  location      = var.region
  force_destroy = true

  versioning {
    enabled = local.versioning
  }

  logging {
    log_bucket = var.logs_bucket
  }

  encryption {
    default_kms_key_name = data.google_kms_crypto_key.gcs_crypto_key.self_link
  }
}
