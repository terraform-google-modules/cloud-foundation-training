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

# Task 2: Initialize Terraform
# https://www.terraform.io/docs/providers/google/index.html

/**
provider "google" {
  project     = "" # Replace with Project ID
  region      = "" # Replace with selected Region
  version     = "~>3.9.0"
}
*/

# Task 4.1: Add random_id resource named suffix
# https://www.terraform.io/docs/providers/random/r/id.html

/**
resource "random_id" "suffix" {
  byte_length = 4
}
*/

# Task 4.2: Add GCS bucket for remote state
# https://www.terraform.io/docs/providers/google/r/storage_bucket.html

/**
resource "google_storage_bucket" "remote-state" {
  name          = "cft-lab-state-<YOUR_NAME>-${random_id.suffix.hex}" # Note the reference to the random_id block
  location      = "US"
  force_destroy = true
  versioning {
    enabled = "true"
  }
}
*/
