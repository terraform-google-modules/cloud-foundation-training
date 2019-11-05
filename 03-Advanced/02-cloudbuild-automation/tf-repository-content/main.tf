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
  suffix     = "${random_id.suffix.hex}"
  versioning = "true"
}

provider "google" {
  version = "~> 2.0"
  project = "${var.project_id}"
  region  = "${var.default_region}"
}

resource "random_id" "suffix" {
  byte_length = "4"
}

resource "google_storage_bucket" "bucket_from_cloudbuild" {
  name          = "bucket-created-by-cloudbuild-${local.suffix}"
  storage_class = "${var.storage_class}"
  location      = "${var.default_region}"
  force_destroy = "true"
}
