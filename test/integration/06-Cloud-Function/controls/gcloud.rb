# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cloud_function_name = attribute("cloud_function_name")
storage_bucket_image_processed = attribute("storage_bucket_image_processed")
storage_bucket_image_upload = attribute("storage_bucket_image_upload")
project_id = attribute("project_id")

control "gcloud" do
  title "Check 06-Cloud-Function"
  describe google_cloudfunctions_cloud_function(project: project_id, location: "us-central1", name: cloud_function_name ) do
    it { should exist }
  end
  describe google_storage_bucket(project: project_id, name: storage_bucket_image_processed) do
    it { should exist }
  end
  describe google_storage_bucket(project: project_id, name: storage_bucket_image_upload) do
    it { should exist }
  end
end
