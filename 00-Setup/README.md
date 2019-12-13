
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Lab Setup**

### **Prerequitsite**
* GCP Project with valid biiling account

### **Setup Googel Cloud SDK and environment**

List current configurations

```
gcloud config configurations list
```

Create new configuration for Hands On Lab

```
gcloud config configurations create gcpiac
```

Verify new configuration is Active but not logged in

```
gcloud config configurations list --filter NAME=gcpiac
```

Login using Hands On Lab project credential

```
gcloud auth login
gcloud auth application-default login
```

Set Project ID and Verify

```
export PROJECT_ID=[LABS_PROJECT_ID]
echo ${PROJECT_ID}
```

Set default project

```
gcloud config set project ${PROJECT_ID}
```

(Optional) Set default compute region

```
gcloud config set compute/region us-west1
```

Verify Google Cloud SDK configuration

```
gcloud config list
```
