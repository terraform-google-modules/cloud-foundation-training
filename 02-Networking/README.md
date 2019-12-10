
# Cloud Foundation Toolkit Lab

## Prerequisite

Complete **Setup** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)

## Networking

This lab helps you create IAM role bindings using Cloud Foundation Toolkit.

At the end of the exercise, you will users in your projects that have been granted access to resources within GCP.

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

Use the Cloud Foundation Toolkit [Network module](https://github.com/terraform-google-modules/terraform-google-network) in `main.tf` to setup VPC network.

## Task 2. Create Cloud NAT instance

Use the Cloud Foundation Toolkit [Cloud NAT module](https://github.com/terraform-google-modules/terraform-google-cloud-nat) in `main.tf` to create a Cloud NAT instance and a Cloud Router.

## Task 2. Terraform

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

## Task 3. Verify
On Google Cloud Console, navigate to **VPC network --> VPC networks**

Review the new network.
