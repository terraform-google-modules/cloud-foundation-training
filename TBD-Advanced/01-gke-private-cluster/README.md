
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

Complete **Fundamental** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Advanced 01-gke-private-cluster**

This lab helps you set up a GKE private cluster using Cloud Foundation Toolkit.

At the end of the exercise, you will have 1 new GKE private cluster.

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

### What You’ll Learn

* [GKE Private Cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters)
* [Cloud Foundation Toolkit](https://cloud.google.com/foundation-toolkit/)
* [terraform-google-kubernetes-engine module](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine)


## Task 1. Enable APIs

Fill in `main.tf` with [Google Project Service](https://www.terraform.io/docs/providers/google/r/google_project_service.html) to enable 2 APIs
 * compute.googleapis.com (Compute Engine API)
 * container.googleapis.com (Kubernetes Engine API)


## Task 2. Create a GKE private cluster

Use the Cloud Foundation Toolkit [GKE module](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/master/modules/private-cluster) in `main.tf` to setup a private cluster


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

On Google Cloud Console, nagivate to `Kubernetes -> Clusters`

Click `gke-cluster-1` and verify the parameters matches what you specify in `main.tf`.

