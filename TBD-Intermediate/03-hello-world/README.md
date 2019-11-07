
# GCP IaC - Terraform and Cloud Foundation Toolkit

## **Prerequisite**

Complete **Fundamental** Labs

You should have [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-interactive) installed and configured before continuing, otherwise refer to [00-Setup/README.md](../../00-Setup/README.md)


## **Intermediate 03-hello-world**

In this lab we will create [Google Compute Engine](https://cloud.google.com/compute/docs/instances/) instance with startup script to install Apache webserver and modify the default `index.html` using template file

**Note**: You can have input variables as

* **default** in `variables.tf`
* using [terraform.tfvars](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* command line argument `-var='key=value'`

### What You’ll Learn

*   [Template File](https://www.terraform.io/docs/providers/template/d/file.html)
*   [Provisioner local-exec](https://www.terraform.io/docs/provisioners/local-exec.html)


## Terraform


### Template File

Add data source `template_file` reading from `templates/startup_script.sh.tpl`.

Add the following variables to template
* project_id
* region
* subnet


### Compute Engine

Create an instance of Google Compute Engine following documentation [google_compute_instance](https://www.terraform.io/docs/providers/google/r/compute_instance.html)

* Name: `Web Server`
* Zone: Choose a [zone](https://cloud.google.com/compute/docs/regions-zones/#locations) based your region
* Machine Type = `n1-standard-1`
* Tag: webserver
* Startup Script = Use `template_file` defined ealier
* Boot disk image = `debian-cloud/debian-9`
* Network interface in `subnet-application`
* Provisioner `local-exec` to output `instance_id` to `instance_id.txt`


### Verify

Copy `external_ip` from output and open in a browser to check if the `index.html` is showing correct values


