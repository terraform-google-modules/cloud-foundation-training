
# Cloud Foundation Toolkit Lab - 01-Getting-Started
Clone this repository and run locally, or use Cloud Shell to walk through the steps:

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fterraform-google-modules%2Fcloud-foundation-training&cloudshell_git_branch=master&cloudshell_open_in_editor=main.tf&cloudshell_working_dir=terraform&cloudshell_tutorial=..%2Ftutorials%2F01-setup-backend.md)

## Prerequisites
* Google Cloud Platform project with valid billing account
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
* [Google Cloud SDK](https://cloud.google.com/sdk/install)

## Setup
This lab helps you initiate Terraform to work with Google Cloud Platform.

At the end of the exercise, you will have a GCS bucket for Remote State.

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

## Preparation: Enable APIs
When using any new service for the first time in a GCP project, you'll need to enable the APIs that you'll be using.

Enable the [Storage API](https://cloud.google.com/storage/docs/reference/rest) using:
```
gcloud services enable storage-api.googleapis.com
```

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

Uncomment the `provider` block in `main.tf`, and fill it in to include your Project ID and a Region. Save file.

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

## Task 3. Create and assign variables
1. In `variables.tf`, create input variables for `project_id` and `region` that you selected in the previous task. This doesn't mean your variables are set yet, this just declares them.
2. In `terraform.tfvars`, set your variables by assigning the values you used in Task 1.

We can now use these variables in our file and avoid repeating the Project ID every time.

Run `terraform plan` to make sure your variables were created and assigned correctly.
```bash
terraform plan
```

## Task 4. Create GCS Bucket

### Terraform Configuration
1. In `main.tf`, uncomment the [random_id](https://www.terraform.io/docs/providers/random/r/id.html) resource block, which will generate a random character string that you can append to our bucket to help ensure uniqueness.

2. In `main.tf`, uncomment and fill in the [google_storage_bucket](https://www.terraform.io/docs/providers/google/r/storage_bucket.html) that you'll create to store Terraform state.

3. In `output.tf` uncomment the [output block](https://www.terraform.io/docs/configuration/outputs.html) that produces the storage bucket information after it's applied.

*Note the use of the random_id output in our bucket name. We can re-use this string in other Terraform resources*.

### Terraform Init
Re-run `terraform init` to download the plugin that allows us to use the `random` resource.

```bash
terraform init
```

### Terraform Plan
Validate execution plan will create 1 GCS bucket with Random Suffix

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

Outputs:

remote_state_bucket = gs://cft-lab-state-<YOUR_NAME>-${random_id.suffix.hex}
```

### Verify
[gsutil](https://cloud.google.com/storage/docs/gsutil) is a Python application that lets you access Cloud Storage from the command line. It is installed as part of Google Cloud SDK.

Run the following to review your new Google Cloud Storage buckets Note the random string that was appended to your bucket name.

```bash
gsutil ls
```

You will see the newly created GCS bucket listed as `gs://BUCKET_NAME`

Look inside the folder `.terraform/plugins/<YOUR_OS>/` you will see there are now 2 providers, for Google and Random

Inspect `terraform.tfstate` to see resources managed the local Terraform state file

## Task 5. Setup Remote Backend
In the future, you'll want to store state in a GCS bucket instead of the local repository directory, so in this task you'll point Terraform state to the GCS bucket you've created.

In `backend.tf`, uncomment and fill in the [terraform backend](https://www.terraform.io/docs/backends/types/gcs.html) block so that state is stored in the GCS bucket instead of the local directory.

You'll repeat this step through a number of the labs.

### Terraform Init
Run `terraform init` to migrate state to your new remote backend.

```bash
terraform init
```

When prompted, enter `yes` to indicate you'd like to migrate state to the new remote backend.

When successful, the output should indicate the following:
```
Successfully configured the backend "gcs"! Terraform will automatically
use this backend unless the backend configuration changes.
```
