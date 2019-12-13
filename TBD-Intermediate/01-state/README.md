
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

Complete **Fundamental** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Intermediate 01-state**

We will learn about Terraform state management in this lab.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`


### **What You’ll Learn**

*   [Import](https://www.terraform.io/docs/import/usage.html)
*   [List](https://www.terraform.io/docs/commands/state/list.html)
*   [Show](https://www.terraform.io/docs/commands/state/show.html)
*   [Move](https://www.terraform.io/docs/commands/state/mv.html)
*   [Remove](https://www.terraform.io/docs/commands/state/rm.html)


#### Setup

We will start with creating a GCS bucket manually with the settings below
* Name = `terraform-kata-import-<YOUR_NAME>-<RANDOM_SUFFIX>`
* Storage Class = `REGIONAL`
* Location = `us-west1`

Because GCS bucket name is unique across the entire Google Cloud Storage service, to avoid naming conflict we will use add `-<YOUR_NAME>-<RANDOM_SUFFIX>` to bucket name, choose any `RANDOM_SUFFIX` from previous exercises.

For Google Cloud Console, go to `Storage -> Browser` from the Drop down menu, click `Create Bucket` and follow instruction or use `gsutil` command line tool

```
gsutil mb -c regional -l us-west1 gs://terraform-kata-import-<YOUR_NAME>-<RANDOM_SUFFIX>
```

#### Verify

Check you newly created GCS bucket

```
gsutil ls
```


#### Import

1. Fill in `backend.tf` and execute `terraform init` to setup initial state.
2. Add a GCS bucket resource named `manual_created_bucket` in `main.tf`
3. [Import](https://www.terraform.io/docs/providers/google/r/storage_bucket.html#import) the manually create bucket into Terraform state  use the `terraform import` command..

```
terraform import google_storage_bucket.manual_created_bucket terraform-kata-import-<YOUR_NAME>-<RANDOM_SUFFIX>
```


#### State List

To see resources being managed by this Terraform root module.

```
terraform state list
```


#### State Move

To rename a resource without recreating resources use the `terraform state mv` command.

```
terraform state mv google_storage_bucket.manual_created_bucket google_storage_bucket.imported_bucket
```

Rename your GCS bucket resource name to `imported_bucket` and list the state. Also update resource_name in `main.tf` to reflect the change.


#### State Show

To show attributes of a resource use the `terraform state show` command.

```
terraform state show google_storage_bucket.imported_bucket
```


#### State Delete

To delete a resource from Terraform state use the `terraform state rm` command.

```
terraform state rm google_storage_bucket.imported_bucket
```

Try delete your GCS bucket resource named`imported_bucket` and list the state.

If you try `terraform plan -out=plan.out` you will a new GCS bucket set to be created, but if you run `terraform apply plan.out` it will fail because of bucket name conflict.

