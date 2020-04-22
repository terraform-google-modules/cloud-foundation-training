
# Cloud Foundation Toolkit Lab - 02-IAM
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=master&cloudshell_open_in_editor=main.tf&cloudshell_tutorial=README.md&cloudshell_working_dir=02-IAM)

## Prerequisite

Complete previous labs:

* [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)
* [01-Getting-Started](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/01-Getting-Started/README.md)

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

## Identity and Access Management

This lab helps you create IAM role bindings using Cloud Foundation Toolkit.

At the end of the exercise, you will have user(s) in your project that have been granted access to resources within GCP.

### What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-iam](https://github.com/terraform-google-modules/terraform-google-iam)
* [IAM](https://cloud.google.com/iam/docs/overview)

## Task 1. Create IAM Role Bindings

Use the Cloud Foundation Toolkit [IAM module](https://github.com/terraform-google-modules/terraform-google-iam) in `main.tf` to setup role bindings for a *user* or *group*. You can pick any user here for the demonstration: another account that belongs to you or someone you know. These permissions will be removed at the end of the lab.

## Task 2. Configurations

### backend.tf

Fill in `backend.tf` the bucket name created from [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

### terraform.tfvars

Make a copy of the example `.tfvar` file and populate details.
```bash
cp terraform.example.tfvars terraform.tfvars
```

**Note**: You can have input variables as

* **default** in variables.tf
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

## Task 3. Terraform

### Terraform Init & Plan
Initialize Terraform
```bash
terraform init
```

Review Terraform execution plan
```bash
terraform plan -out=plan.out
```

### Terraform Apply

Execute previous generated execution plan
```bash
terraform apply plan.out
```

## Task 4. Verify

On [Google Cloud Console](https://console.cloud.google.com/), under the project specified, nagivate to **IAM & admin -> IAM**

Review the user permissions under **Members** and confirm **Compute Network Admin** is added

## Task 5. Clean Up

Destroy resources created by Terraform

```bash
terraform destroy
```

## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set! You can now move on to the next lab.
