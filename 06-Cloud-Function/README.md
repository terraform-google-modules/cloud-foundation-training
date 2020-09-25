
# Cloud Foundation Toolkit Lab - 06-Cloud-Function
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=master&cloudshell_open_in_editor=main.tf&cloudshell_tutorial=README.md&cloudshell_working_dir=06-Cloud-Function)

## Prerequisite

Complete previous labs
* [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)
* [01-Getting-Started](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/01-Getting-Started/README.md)
* [02-IAM](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/02-IAM/README.md)
* [03-Networking](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/03-Networking/README.md)
* [04-Instance-Group](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/04-Instance-Group/README.md)
* [05-Load-Balancer](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/05-Load-Balancer/README.md)

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup](https://github.com/terraform-google-modules/cloud-foundation-training/tree/master/00-Setup/README.md)

## Cloud Function (Event Triggered)

This lab helps you create a Serverless image processing pipeline using Cloud Foundation Toolkit.

At the end of this exercise, you'll have a Google Cloud Function and 2 Google Cloud Storage buckets. Images uploaded to the source bucket, will be blurred using ImageMagic

### What You'll Learn

* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-event-function](https://github.com/terraform-google-modules/terraform-google-event-function)
* [Cloud Function](https://cloud.google.com/functions#documentation)


**Note**: This lab is based on the [Cloud Function ImageMagick Tutorial](https://cloud.google.com/functions/docs/tutorials/imagemagick#functions-prepare-environment-python)

## Preparation: Enable APIs
When using any new service for the first time in a GCP project, you'll need to enable the APIs that you'll be using.

Enable the [Cloud Functions API](https://cloud.google.com/functions/docs/reference/rest) using:
```
gcloud services enable cloudfunctions.googleapis.com
```

## Task 1. Create Cloud Function

Use the Cloud Foundation Toolkit [Event Function](https://github.com/terraform-google-modules/terraform-google-event-function)) module in main.tf to create a Cloud Function triggered by GCS file upload event

**GCS Buckets**, **Service Account** and **IAM bindings** provided in `iam.tf` and `resources.tf`

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

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **Cloud Functions**

Verify the **Cloud Function** is deployed successfully

Under **06-Cloud-Function** folder, upload a sampe image to the upload bucket
```
gsutil cp images/zombie.jpg gs://`terraform output storage_bucket_image_upload`
```

On [Google Cloud Console](https://console.cloud.google.com/), navigate to **Storage -> Browser**

Locate the processed image bucket and checked processed image `zombie.jpg`
```bash
gsutil ls gs://`terraform output storage_bucket_image_processed`
```

You can also view the Cloud Function logs from [Google Cloud Console](https://console.cloud.google.com/), navigate to **Logging -> Logs Viewer** and select Cloud Function from the dropdown list

## Task 5. Clean Up

Destroy resources created by Terraform

```bash
terraform destroy
```

## Congratulations

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set! You can now move on to the next lab.
