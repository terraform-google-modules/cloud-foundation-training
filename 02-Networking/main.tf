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
 * Task 1: Add Network ("network")
 * - Network Name: network
 * - Project: Name of my project
 * - Routing Mode: Global
 * - Subnets:
 *   - Subnet Name: subnet-01
 *   - Subnet IP: 10.0.10.0/24
 *   - Subnet Region: us-central1
 *
 * https://github.com/terraform-google-modules/terraform-google-network
 *
 */
/**
 * Task 2: Add Cloud NAT Instance ("cloud-nat")
 * - Project: Name of my project
 * - Region: us-west1
 * - Name: Name of Cloud NAT resource
 * - Create Router: true
 * - Router: New name of router
 * - Network: Reference to network resource - module.network.network_name
 *
 * https://github.com/terraform-google-modules/terraform-google-cloud-nat
 *
 */