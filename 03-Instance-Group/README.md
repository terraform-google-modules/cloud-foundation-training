
# Cloud Foundation Toolkit Lab - 03-Instance-Group

## Prerequisite

Complete previous labs
* **[00-Setup](../00-Setup/README.md)**
* **[01-IAM](../01-IAM/README.md)**
* **[02-Networking](../02-Networking/README.md)**

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](../00-Setup/README.md)

## What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-vm](https://github.com/terraform-google-modules/terraform-google-vm)
* [Instance Template](https://cloud.google.com/compute/docs/instance-templates/)
* [Managed Instance Group](https://cloud.google.com/compute/docs/instance-groups/)

## Managed Instance Group

This lab helps you create a Google Compute Engine Managed Instance Group using Cloud Foundation Toolkit.

At the end of this exercise, you'll have a set of VM instances provisioned on the networks you've created in the [02-Networking](../02-Networking/README.md) labs.

## Task 1. Create Instance Template

Use the Cloud Foundation Toolkit [Instance Template](https://github.com/terraform-google-modules/terraform-google-vm/modules/instance_template) module in `main.tf` to create an Instance Template

## Task 2. Create Managed Instance Group

Use the Cloud Foundation Toolkit [Managed Instance Group](https://github.com/terraform-google-modules/terraform-google-vm/modules/mig) module in `main.tf` to create a Managed Instance Group

## Task 3. Configurations

### `backend.tf`

Fill in `backend.tf` the bucket name created from [00-Setup](../00-Setup/README.md)

### `terraform.tfvars`

Make a copy of the example `.tfvar` file and populate details.
```
cp terraform.example.tfvars terraform.tfvars
```

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

## Task 4. Terraform

### Terraform Init & Plan

Init and review Terraform execution plan

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

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **Compute Engine -> Instance groups**

Review the new **Instance Group**

## Task 6. Clean Up

Destroy resources created by Terraform

```
terraform destroy
```
