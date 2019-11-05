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

/**
 * Task 2: Add Google provider configuration
 * - version     = "~> 2.0"
 * - project     = "<YOUR_PROJECT_ID>"
 * - region      = "asia-southeast1"
 *
 * See https://www.terraform.io/docs/providers/google/index.html
 *
 */

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

/**
 * Task 5.1: Add a Cloud KMS Key Ring
 * - Name: "gcs-keyring"
 * - Location: Singapore
 *
 * https://www.terraform.io/docs/providers/google/r/kms_key_ring.html
 *
 */

/**
 * Task 5.1: Add a Cloud KMS Key
 * - Name: "gcs-key"
 * - lifecycle.prevent_destroy: true
 *
 * https://www.terraform.io/docs/providers/google/r/kms_crypto_key.html
 *
 */
