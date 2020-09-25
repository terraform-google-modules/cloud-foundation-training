
# Cloud Foundation Toolkit Lab - 03-Networking
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=master&cloudshell_open_in_editor=main.tf&cloudshell_tutorial=README.md&cloudshell_working_dir=03-Networking)

## Prerequisite

Complete previous labs:

* [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)
* [01-Getting-Started](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/01-Getting-Started/README.md)
* [02-IAM](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/02-IAM/README.md)

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

## Networking

This lab helps you create VPC network and Cloud NAT using Cloud Foundation Toolkit.

At the end of the exercise, you will have a VPC network with 1 subnet and 1 Cloud NAT in your project.

### What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-vpc](https://github.com/terraform-google-modules/terraform-google-vpc)
* [VPC](https://cloud.google.com/vpc/docs/overview)
* [terraform-google-cloud-nat](https://github.com/terraform-google-modules/terraform-google-vpc)
* [Cloud NAT](https://cloud.google.com/nat/docs/overview)

## Preparation: Enable APIs

When using any new service for the first time in a GCP project, you'll need to enable the APIs that you'll be using.

Enable the [Compute API](https://cloud.google.com/compute/docs/reference/rest/v1/) using:
```
gcloud services enable compute.googleapis.com
```

## IAM dependencies for Service Account
You may notice in `main.tf` that `project_id` is [referenced](https://github.com/terraform-google-modules/cloud-foundation-training/blob/master/03-Networking/main.tf#L27) through `module.project_iam_bindings.projects[0]` although it could be done by using `var.project_id`. This is done so as to create dependency on IAM module, which sets up permissions for Service Account used to provision resources. This way, it's guaranteed that IAM permissions will be provisioned before the resource/module referencing IAM module.

In real-life situations, you will most likely have setup all the permissions needed for the Terraform Service Account in a separate [seed project](https://github.com/terraform-google-modules/terraform-google-bootstrap#features).

## Task 1. Create Networking

Use the Cloud Foundation Toolkit [Network module](https://github.com/terraform-google-modules/terraform-google-network) in `main.tf` to setup VPC network.

## Task 2. Create Cloud NAT instance

Use the Cloud Foundation Toolkit [Cloud NAT module](https://github.com/terraform-google-modules/terraform-google-cloud-nat) in `main.tf` to create a Cloud NAT instance and a Cloud Router.

## Task 3. Configurations

### backend.tf

Fill in backend.tf the bucket name created from [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

### terraform.tfvars

Make a copy of the example `.tfvar` file and populate details.
```bash
cp terraform.example.tfvars terraform.tfvars
```

**Note**: You can have input variables as

* **default** in variables.tf
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

## Task 4. Terraform

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

## Task 5. Verify

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **VPC network -> VPC networks**

Review the new **VPC network**.

Next navigate to **Network services -> Cloud NAT**

Review the new **Cloud NAT** and **Cloud Router**

## Task 6. Clean Up

Destroy resources created by Terraform

```bash
terraform destroy
```

## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set! You can now move on to the next lab.
