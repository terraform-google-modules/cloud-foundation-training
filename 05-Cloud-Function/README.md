
# Cloud Foundation Toolkit Lab - 05-Cloud-Function

## Prerequisite

Complete previous labs
* **[00-Setup](../00-Setup/README.md)**
* **[01-IAM](../01-IAM/README.md)**
* **[02-Networking](../02-Networking/README.md)**
* **[03-Instance-Group](../03-Instance-Group/README.md)**
* **[04-Load-Balancer](../04-Load-Balancer/README.md)**

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](../00-Setup/README.md)

## What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-event-function](https://github.com/terraform-google-modules/terraform-google-event-function)
* [Cloud Function](https://cloud.google.com/functions#documentation)

## Cloud Function (Event Triggered)

This lab helps you create a Serverless image processing pipeline using Cloud Foundation Toolkit.

At the end of this exercise, you'll have a Google Cloud Function and 2 Google Cloud Storage buckets. Images uploaded to the source bucket, will be blurred using ImageMagic

**Note**: This lab is based on the [Cloud Function ImageMagick Tutorial](https://cloud.google.com/functions/docs/tutorials/imagemagick#functions-prepare-environment-python)

## Task 1. Create Cloud Function

Use the Cloud Foundation Toolkit [Event Function](https://github.com/terraform-google-modules/terraform-google-event-function)) module in `main.tf` to create a Cloud Function triggered by GCS file upload event

**GCS Buckets**, **Service Account** and **IAM bindings** provided in `iam.tf` and `resources.tf`

## Task 2. Configurations

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

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **Cloud Functions**

Verify the **Cloud Function** is deployed successfully

Under **05-Cloud-Function** folder, upload a sampe image to the upload bucket
```
gsutil cp images/zombie.jpg gs://`terraform output storage_bucket_image_upload`
```

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **Storage -> Browser**

Locate the processed image bucket and checked processed image `zombie.jpg`
```
gsutil ls gs://`terraform output storage_bucket_image_processed`
```

You can also view the Cloud Function logs from [Google Cloud Console](https://console.cloud.google.com/), navigate to **Logging -> Logs Viewer** and select Cloud Function from the dropdown list

## Task 5. Clean Up

Destroy resources created by Terraform

```
terraform destroy
```
