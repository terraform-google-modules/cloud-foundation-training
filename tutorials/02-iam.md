# Cloud Foundation Toolkit Lab - Setup
Clone this repository and run locally, or use Cloud Shell to walk through the steps:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=new-templates&cloudshell_open_in_editor=iam.tf&cloudshell_working_dir=terraform&cloudshell_tutorial=..%2Ftutorials%2F02-iam.md)

## Prerequisites
* Google Cloud Platform project with valid billing account
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
* [Google Cloud SDK](https://cloud.google.com/sdk/install)

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

## Task 5. Create IAM Role Bindings
In <walkthrough-editor-open-file filePath="iam.tf">iam.tf</walkthrough-editor-open-file>, use the Cloud Foundation Toolkit [IAM module](https://github.com/terraform-google-modules/terraform-google-iam/tree/master/modules/projects_iam) in `iam.tf` to setup role bindings for a *user* and a *group*.

Be sure to review the difference between Additive and Authoritative bindings to determine which to use.

### Terraform Init
Re-run `terraform init` to download any additional plugins that the new module uses.

```bash
terraform init
```

### Terraform Plan
Validate execution plan will create expected IAM bindings.

```bash
terraform plan -out=plan.out
```

Review the Terraform plan that was generated.

### Terraform Apply
Execute previous generated execution plan

```bash
terraform apply plan.out
```

If your resources were created successfully, you should see the following message:
```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.
State path: terraform.tfstate
```

### Verify
Run `gcloud iam roles list` or visit the IAM page in the Google Cloud Console to review the new IAM bindings.
