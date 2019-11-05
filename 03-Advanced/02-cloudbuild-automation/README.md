
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

Complete **Fundamental** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Advanced 02-cloudbuild-automation**

This lab helps you set up an end-to-end CI/CD pipeline with Cloud Build and Terraform.

At the end of the exercise, you will have 1 Cloud Source Repository, 1 Cloud Build Trigger, 1 GCS bucket, 1 image in Cloud Container Registry.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`


### What You’ll Learn

*   [Cloud Build](https://cloud.google.com/cloud-build/)

## Prerequisite

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## Task 1. Setup Terraform Cloud Builder

### Download cloud-builders-community repo and build the terraform builder.

```
git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
cd cloud-builders-community/terraform
gcloud builds submit --config=cloudbuild.yaml
```


## Task 2. Create Cloud Source Repository

Fill in `main.tf` a [Cloud Source Repository](https://www.terraform.io/docs/providers/google/r/source_repo_repository.html)


## Task 3. Create a Cloud Build Trigger

Fill in `main.tf` a [Cloud Build Trigger](https://www.terraform.io/docs/providers/google/r/cloud_build_trigger.html)


## Task 4. Terraform

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


## Task 5. Verify

### List Cloud Source Repos

```
gcloud source repos list
```

You should see one repo with name `tf-manifest-repository`

### View Cloud Build triggers

On Cloud Console, nagivate to `Cloud Build -> Triggers`, you should see one trigger with description `Push to master branch`.


## Task 7. Populate the tf-manifest-repository repo

### Clone the empty repo

```
gcloud source repos clone tf-manifest-repository ~/tf-manifest-repository --project=${PROJECT_ID}
```

### Copy contents into repo

```
cp -p tf-repository-content/* ~/tf-manifest-repository
```

### Review and update files in tf-manifest-repository repo

```
cd ~/tf-manifest-repository
```

Update backend bucket name in `backend.tf`

Update Project ID in `variables.tf`

### Commit files to master branch tf-manifest-repository repo

```
git add .
git commit -m 'initial commit' .
git push
```


## Task 8. Verify that Cloud Build is triggered to apply the changes

### Verify Cloud Build logs

On Google Cloud Console, nagivate to `Cloud Build -> History`, you should see one build being triggered.

Click the build, expand each step under Build Steps, and inspect the logs.

### Verify

```
gsutil ls
```

You should see one bucket whose name starts with `bucket-created-by-cloudbuild`

