
# Cloud Foundation Toolkit Lab - 01-IAM

## Prerequisite

Complete previous labs
* **[00-Setup](../00-Setup/README.md)**

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](../00-Setup/README.md)

## Identity and Access Management

This lab helps you create IAM role bindings using Cloud Foundation Toolkit.

At the end of the exercise, you will have user(s) in your project that have been granted access to resources within GCP.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

### What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-iam](https://github.com/terraform-google-modules/terraform-google-iam)
* [IAM](https://cloud.google.com/iam/docs/overview)

## Task 1. Create IAM Role Bindings

Use the Cloud Foundation Toolkit [IAM module](https://github.com/terraform-google-modules/terraform-google-iam) in `main.tf` to setup role bindings for a *user* and a *group*.

## Task 2. Configurations

### `backend.tf`

Fill in `backend.tf` the bucket name created from [00-Setup](../00-Setup/README.md)

### `terraform.tfvars`

Make a copy of the example `.tfvar` file and populate details.
```
cp terraform.example.tfvars terraform.tfvars
```

## Task 3. Terraform

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

## Task 4. Verify

On [Google Cloud Console](https://console.cloud.google.com/), under the project specified, nagivate to **IAM & admin -> IAM**

Review the user permissions under **Members** and confirm **Compute Network Admin** is added

## Task 5. Clean Up

Destroy resources created by Terraform

```
terraform destroy
```