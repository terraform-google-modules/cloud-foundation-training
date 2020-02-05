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

variable "org_id" {
  description = "GCP Organization ID"
}

variable "billing_account" {
  description = "Billing Account ID"
}

variable "region" {
  description = "GCP Region"
  default     = "us-east1"
}

variable "bucket_name" {
  description = "GCS Bucket Name for Terraform states"
  default     = "tf-state"
}

variable group_org_admins {
  description = "Group for Organization Admins"
}

variable group_billing_admins {
  description = "Group for Billing Admins"
}
