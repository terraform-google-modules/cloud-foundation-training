
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

Complete **Fundamental** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Intermediate 02-network**

In this lab we will create custom VPC and Subnetwork(s) with Private Google Access and Firewall Rules.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`


### What You’ll Learn

*   [Count](https://www.terraform.io/docs/configuration/resources.html#count-multiple-resource-instances-by-count)
*   [Splat Expressions](https://www.terraform.io/docs/configuration/expressions.html#splat-expressions)
*   [List](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
*   [VPC](https://www.terraform.io/docs/providers/google/r/compute_network.html)
*   [Subnet](https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html)
*   [Firewall](https://www.terraform.io/docs/providers/google/r/compute_firewall.html)


## Terraform


### Add a custom VPC Network

Create a custom VPC following documentation [google_compute_network](https://www.terraform.io/docs/providers/google/r/compute_network.html)

* Name: Read from input variable
* Routing Mode: Global
* Auto Create Subnetwork: false


### Add Subnets based on the input List

Create subnets following documentation [google_compute_subnetwork](https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html)

* Name: Read from input variable
* Network: VPC Network created above
* Region: Read from input variable
* Enable Private Google Access
* IPV4 Range = Read from input variable
* Secondary Ranges = Read from input variable for Pod/Service


### Add Firewall Rules

Create 3 Firewall Rules following documentation [google_compute_firewall](https://www.terraform.io/docs/providers/google/r/compute_firewall.html)

#### Allow Ingress ICMP/SSH

* Allow TCP:22 for SSH
* Allow ICMP
* From Source Range 0.0.0.0/0

#### Allow Ingress to Web Servers

* Allow TCP:80,443 for Web Server
* Target Tag: webserver
* From Source Range 0.0.0.0/0

#### Allow Ingress [Google Cloud Health Check](https://cloud.google.com/load-balancing/docs/health-checks)

* Allow TCP
* Allow from Source Ranges for Google Cloud Health Check
  * 130.211.0.0/22
  * 209.85.152.0/22
  * 209.85.204.0/22
  * 35.191.0.0/16
