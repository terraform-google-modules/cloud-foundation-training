
# Cloud Foundation Toolkit Lab - 02-Networking

## Prerequisite

Complete **00-Setup** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../00-Setup/README.md)

## Networking

This lab helps you create VPC network and Cloud NAT using Cloud Foundation Toolkit.

At the end of the exercise, you will have a VPC network with 1 subnet and 1 Cloud NAT in your project.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

### What You’ll Learn

* [VPC](https://cloud.google.com/vpc/docs/overview)
* [Cloud NAT](https://cloud.google.com/nat/docs/overview)
* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-vpc](https://github.com/terraform-google-modules/terraform-google-vpc)
* [terraform-google-cloud-nat](https://github.com/terraform-google-modules/terraform-google-vpc)


## Task 1. Create Networking

Use the Cloud Foundation Toolkit [Network module](https://github.com/terraform-google-modules/terraform-google-network) in `network.tf` to setup VPC network.

## Task 2. Create Cloud NAT instance

Use the Cloud Foundation Toolkit [Cloud NAT module](https://github.com/terraform-google-modules/terraform-google-cloud-nat) in `network.tf` to create a Cloud NAT instance and a Cloud Router.

## Task 3. Configurations

### `backend.tf`

Fill in `backend.tf` the bucket name created from 00-Setup

### `terraform.tfvars`

Make a copy of the example `.tfvar` file and populate details.
```
cp terraform.example.tfvars terraform.tfvars
```

## Task 4. Terraform

### Terraform Init & Plan

Init and validate Terraform execution plan

```
terraform init
terraform plan -out=plan.out
```

### Terraform Apply

Execute previous generated execution plan

```
terraform apply plan.out
```

## Task 5. Verify
On Google Cloud Console, navigate to **VPC network --> VPC networks**

Review the new network.

On Google Cloud Console, navigate to **Network services --> Cloud NAT**

Review the new Cloud NAT and Cloud Router.