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
 * Add GCS remote backend configuration
 * - bucket = <STATE_BUCKET_FROM_01>
 * - prefix = "03-advanced/02-cloudbuild-automation-tf-repository-content/"
 *
 * See https://www.terraform.io/docs/backends/types/gcs.html
 *
 */
terraform {
  backend "gcs" {
    bucket = "<STATE_BUCKET_FROM_01>"
    prefix = "03-advanced/03-cloudbuild-automation-tf-repository-content/"
  }
}