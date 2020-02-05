
# Cloud Foundation Toolkit Lab - 00-Setup

## Bootstrap a GCP Organization

If you already have a GCP project or completed GCP organization setup, you can stop reading. Continue with the following instruction to setup your base project in a newly created GCP Organization.

[CFT Bootstrap](https://github.com/terraform-google-modules/terraform-google-bootstrap) module is used to

> The purpose of this module is to help bootstrap a GCP organization, creating all the required GCP resources & permissions to start using the Cloud Foundation Toolkit (CFT).
>
> The Organization Bootstrap module will take the following actions:
>
> * Create a new GCP seed project using project_prefix.
> * Enable APIs in the seed project using activate_apis
> * Create a new service account for terraform in seed project
> * Create GCS bucket for Terraform state and grant access to service account
> * Grant IAM permissions required for CFT modules & Organization setup
>     * Overwrite organization wide project creator and billing account creator roles
>     * Grant Organization permissions to service account using sa_org_iam_permissions
>     * Grant access to billing account for service account
>     * Grant Organization permissions to group_org_admins using org_admins_org_iam_permissions
>     * Grant billing permissions to group_billing_admins
>     * (optional) Permissions required for service account impersonation using sa_enable_impersonation

### Permissions

The user account used for bootstrap setup will need the following permissions
* **Billing Account Administrator** (roles/billing.admin) on the biiling account provided.
* **Organization Administrator** (roles/resourcemanager.organizationAdmin) on the organization
* **Project Creator** (roles/resourcemanager.projectCreator) on the organization

### What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-bootstrap](https://github.com/terraform-google-modules/terraform-google-bootstrap)
* [Google Cloud Service Account](https://cloud.google.com/iam/docs/service-accounts)

## Task 1. Setup terraform.tfvars

Make a copy of the example `.tfvar` file and populate details.
```
cp terraform.example.tfvars terraform.tfvars
```

Organization ID can be found using
```gcloud organizations list```

## Task 2. Terraform

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

## Task 3. Verify
On [Google Cloud Console](https://console.cloud.google.com/), confirm new project created with a GCS bucket for storing Terraform states named `terraform output gcs_bucket_tfstate`
