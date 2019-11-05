
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Fundamental 02-remote-backend**

We will learn to use GCS remote backend to store Terraform state.

You can have input variables in as **default** in `variables.tf` or using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`


### What You’ll Learn

*   [GCS Remote Backend](https://www.terraform.io/docs/backends/types/gcs.html)
*   [Data](https://www.terraform.io/docs/configuration/data-sources.html) sources
*   Create GCS bucket with [Access Logs](https://cloud.google.com/storage/docs/access-logs) exported to Logs bucket
*   Use [Cloud KMS Key](https://cloud.google.com/kms/docs/object-hierarchy) to encrypt the GCS bucket

## Prerequisite

Completed Lab **01-init**

## Task 1. Remote Backend

### GCS Backend

Fill in `backend.tf` with Remote State GCS bucket name from 01-init


## Task 2. Data source for Cloud KMS Key Ring & Key

### Data

Fill in `data.tf` 2 data sources to read from [Cloud KMS Key Ring & Key](https://www.terraform.io/docs/providers/google/d/google_kms_crypto_key.html)


## Task 3. GCS bucket

### Terraform Configuration

Create in `main.tf` a new GCS bucket following documentation [google_storage_bucket](https://www.terraform.io/docs/providers/google/r/storage_bucket.html) with **Access Logging** exported to Logs bucket from previous exercise

#### Terraform Init & Plan

Validate execution plan will create 1 GCS bucket with Random Suffix.

```
terraform init
terraform plan -out=plan.out
```

#### Terraform Apply

Execute previous generated execution plan

```
terraform apply plan.out
```

#### Verify

```
gsutil ls
```

You will see the newly created GCS bucket listed as `gs://terraform-kata-usage-<Unique Identitifer>`

```
gsutil logging get gs://terraform-kata-usage-<Unique Identitifer>
```

Will show Access Log enabled to Logs bucket `gs://terraform-kata-logs-<Unique Identitifer>`

