
# Cloud Foundation Toolkit Lab - 02-Networking
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_open_in_editor=main.tf&cloudshell_tutorial=README.md&cloudshell_working_dir=02-Networking)

## Prerequisite

Complete previous labs:

* [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)
* [01-IAM](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/01-IAM/README.md)

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

## Task 1. Create Networking

Use the Cloud Foundation Toolkit [Network module](https://github.com/terraform-google-modules/terraform-google-network) in <walkthrough-editor-open-file filePath="main.tf">
main.tf</walkthrough-editor-open-file> to setup VPC network.

## Task 2. Create Cloud NAT instance

Use the Cloud Foundation Toolkit [Cloud NAT module](https://github.com/terraform-google-modules/terraform-google-cloud-nat) in <walkthrough-editor-open-file filePath="main.tf">
main.tf</walkthrough-editor-open-file> to create a Cloud NAT instance and a Cloud Router.

## Task 3. Configurations

### backend.tf

Fill in <walkthrough-editor-open-file filePath="backend.tf">
backend.tf</walkthrough-editor-open-file> the bucket name created from [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

### terraform.tfvars

Make a copy of the example `.tfvar` file and populate details.
```bash
cp terraform.example.tfvars terraform.tfvars
```

**Note**: You can have input variables as

* **default** in <walkthrough-editor-open-file filePath="variables.tf">
variables.tf</walkthrough-editor-open-file>
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