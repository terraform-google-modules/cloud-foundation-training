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

members = attribute("members")
roles = attribute("roles")
project_id = attribute("project_id")
expected_roles = ["roles/cloudfunctions.admin", "roles/compute.admin", "roles/compute.networkAdmin", "roles/iam.serviceAccountAdmin", "roles/serviceusage.serviceUsageAdmin"]

control "gcloud" do
  title "Check 02-IAM"
  describe command ("gcloud projects get-iam-policy #{project_id} --format=json") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }

    let!(:data) do
      if subject.exit_status == 0
        JSON.parse(subject.stdout)
      else
        {}
      end
    end
    describe "members" do
      it "are bound" do
        role_members = {}
        data["bindings"].each do |binding|
          role_members.store(binding["role"], binding["members"])
        end
        expected_roles.each do |expected_role|
          expect(role_members[expected_role]).to include("serviceAccount:sa-cft-training@#{project_id}.iam.gserviceaccount.com")
        end
      end
    end
  end
end
