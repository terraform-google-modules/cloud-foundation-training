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

network = attribute("network")
subnets = attribute("subnets")
cloud_nat = attribute("cloud_nat")
cloud_nat_router = attribute("cloud_nat_router")
project_id = attribute("project_id")

control "gcloud" do
  title "Check 03-Networking"
  describe google_compute_network(
    project: project_id,
    name: network,
  ) do
    it { should exist }
  end
  describe google_compute_subnetwork(
    project: project_id,
    name: subnets[0],
    region: "us-central1",
  ) do
    it { should exist }
  end
  describe google_compute_router_nat(
    project: project_id,
    router: cloud_nat_router,
    name: cloud_nat,
    region: "us-central1",
  ) do
    it { should exist }
  end
end
