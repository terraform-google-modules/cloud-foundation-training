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
 * Task 4.2, 5.2: Add output for the following resources
 * - Logs GCS bucket name
 * - Remote State GCS bucket name
 * - KMS Key Ring link
 * - KMS Key link
 *
 * See https://www.terraform.io/docs/configuration/outputs.html
 *
 */

output "logs_bucket" {
  value = "google_storage_bucket.terraform_kata_logs.name"
}

output "remote_state_bucket" {
  value = "google_storage_bucket.terraform_kata_state.name"
}

output "kms_keyring" {
  value = "google_kms_key_ring.gcs_keyring.self_link"
}

output "kms_key" {
  value = "google_kms_crypto_key.gcs_key.self_link"
}
