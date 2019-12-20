
# Cloud Foundation Toolkit Lab

## Prerequisite

Complete **Setup** and **Networking** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../00-Setup/README.md)

## Managed Instance Group
This lab helps you create a managed group of Google Compute Engine instances using Cloud Foundation Toolkit.

At the end of this exercise, you'll have a set of instances provisioned on the networks you've created in the [../02-Networking/README.md] labs.

Note: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

### What You'll Learn
* [Instance Template](https://cloud.google.com/compute/docs/instance-templates/)
* [Managed Instance Group](https://cloud.google.com/compute/docs/instance-groups/)
* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-vm](https://github.com/terraform-google-modules/terraform-google-vm)

## Task 1. Create Instance Template
Use the Cloud Foundation Toolkit [Instance Template](https://github.com/terraform-google-modules/terraform-google-vm/modules/instance_template) module in `main.tf` to create an Instance Template

## Task 2. Create Managed Instance Group
Use the Cloud Foundation Toolkit [Managed Instance Group](https://github.com/terraform-google-modules/terraform-google-vm/modules/mig) module in `main.tf` to create a Managed Instance Group

## Task 3. Terraform
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

## Task 4. Verify
On Google Cloud Console, navigate to **Compute Engine --> Instance groups**

Review the new Instance Group
