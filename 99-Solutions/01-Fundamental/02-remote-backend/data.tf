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
 * Task 2: Add Data source to read following resources created from previous exercise
 * - KMS Key Ring
 * - KMS Key
 *
 * https://www.terraform.io/docs/providers/google/d/google_kms_crypto_key.html
 *
 */
data "google_kms_key_ring" "gcs_key_ring" {
  name     = "gcs-keyring"
  location = "${var.default_region}"
}

data "google_kms_crypto_key" "gcs_crypto_key" {
  name     = "gcs-crypto-key"
  key_ring = "${data.google_kms_key_ring.gcs_key_ring.self_link}"
}