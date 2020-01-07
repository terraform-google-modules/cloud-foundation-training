# Cloud Foundation Toolkit Lab - Setup
Clone this repository and run locally, or use Cloud Shell to walk through the steps:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=new-templates&cloudshell_open_in_editor=backend.tf&cloudshell_working_dir=terraform&cloudshell_tutorial=..%2Ftutorials%2F01-setup-backend.md)

## Prerequisites
* Google Cloud Platform project with valid billing account
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
* [Google Cloud SDK](https://cloud.google.com/sdk/install)

## Setup
This lab helps you initiate Terraform to work with Google Cloud Platform.

At the end of the exercise, you will have 2 GCS buckets, (**Logs** and **Remote State**) with 4 lines of output value.

### What You'll Learn
* Using Terraform
* [Provider](https://www.terraform.io/docs/configuration/providers.html) block
* [Resource](https://www.terraform.io/docs/configuration/resources.html) block
* [Output](https://www.terraform.io/docs/configuration/outputs.html) block
* [Local](https://www.terraform.io/docs/configuration/locals.html) values
* Initialize Terraform with local state
* Grant IAM Role (**Storage Admin**)
* Random ID generation
* Create and Destroy GCS Bucket
* Create another GCS Bucket for remote state for following exercises

## Task 1. Set Project
Determine your Google Cloud [Project ID](https://cloud.google.com/sdk/gcloud/reference/projects/list), and select a [Region](https://cloud.google.com/compute/docs/regions-zones/#available) to provision resources.

Replace the quoted text with your Project ID and set your Project
```bash
PROJECT_ID="my-project-id"
```
```bash
gcloud config set project $PROJECT_ID
```

## Task 2. Initialize Terraform

### Google Cloud Provider
Determine your Google Cloud [Project ID](https://cloud.google.com/sdk/gcloud/reference/projects/list), and select a [Region](https://cloud.google.com/compute/docs/regions-zones/#available) to provision resources.

Uncomment the `provider` block in <walkthrough-editor-open-file filePath="main.tf">main.tf</walkthrough-editor-open-file>`, and fill it in to include your Project ID and a Region. Save file.

### Initialize Terraform
[terraform init](https://www.terraform.io/docs/commands/init.html) command is used to initialize a working directory containing Terraform configuration files.

```bash
terraform init
```

A successful `terraform init` will output the following:
```
Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.
```

###  Terraform Plan
[terraform plan](https://www.terraform.io/docs/commands/plan.html) command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

Run the following to see what Terraform attempts to create.
```bash
terraform plan
```

Because no resources have been created in your `main.tf` file (all resources are commented out), your successful `terraform plan` output will look like the following:
```

No changes. Infrastructure is up-to-date.
This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, no
actions need to be performed.
```

## Task 3. Create a GCS Bucket

### Terraform Configuration
1. In <walkthrough-editor-open-file filePath="variables.tf">variables.tf</walkthrough-editor-open-file>, create input variables for `project_id` and `region` that you selected in the previous task.

2. In <walkthrough-editor-open-file filePath="main.tf">main.tf</walkthrough-editor-open-file>, uncomment the [random_id](https://www.terraform.io/docs/providers/random/r/id.html) resource block, which will generate a random character string that you can append to our bucket to help ensure uniqueness.

3. In <walkthrough-editor-open-file filePath="main.tf">main.tf</walkthrough-editor-open-file>, uncomment and fill in the [google_storage_bucket](https://www.terraform.io/docs/providers/google/r/storage_bucket.html) which you'll create to store logs.

*Note the use of the random_id output in our bucket name. We can re-use this string in other Terraform resources*.

#### Terraform Plan

Update Project ID in `variables.tf`

Validate execution plan will create 1 GCS bucket with Random Suffix

```
terraform plan -out=plan.out
```

![image](./images/gcs_bucket_plan.png "Plan Execution")

#### Terraform Apply

Execute previous generated execution plan

```
terraform apply plan.out
```
![image](./images/gcs_bucket_apply.png "Create GCS Bucket")

#### Verify

[gsutil](https://cloud.google.com/storage/docs/gsutil) is a Python application that lets you access Cloud Storage from the command line.

It is installed as part of Google Cloud SDK.

```
gsutil ls
```

You will see the newly created GCS bucket listed as `gs://BUCKET_NAME`

Look inside the folder `.terraform/plugins/<YOUR_OS>/` you will see there are now 2 providers, for Google and Random

Inspect `terraform.tfstate` to see resources managed the local Terraform state file


#### Terraform Destroy

Destroy the resources (random_id, google_storage_bucket)

```
terraform destroy
```

![image](./images/gcs_bucket_destroy.png "Destroy GCS Bucket")


## Task 4. GCS Bucket for Remote State

### Terraform Configuration

1. Fill in Task 4 resource block in `main.tf` to create a Remote State GCS bucket
2. Fill in `outputs.tf` and output name of the 2 GCS bucket


## Task 5. Cloud KMS Key Ring & Key

### Terraform Configuration

1. Fill in Task 5.1 resource blocks in `main.tf` to create a Cloud KMS Key Ring & Key
2. Fill in `outputs.tf` and output link to Key Ring & Key


## Bonus Task. Use local value to reduce repeatition

Find values that are repeating and use local variables instead so it's easier to change in a single place
