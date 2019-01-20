# Kubernetes on Scaleway

This repository is used to setup a k8s cluster on scaleway with all infrastructure under source control.
Terraform creates the infrastructure and chef provisions the servers.

## Prerequisites

* You need to have terraform installed on you local machine.
* You need to have the ssh key of your current machine registered in Scaleway.
* During provisioning, a user is created. You need to update the SHA-512 hash of the password in `chef/master.json`, see [this thread](https://unix.stackexchange.com/questions/52108/how-to-create-sha512-password-hashes-on-command-line#76337) on how to generate the hash.
* You need to set your Scaleway credentials:

```bash
    export SCALEWAY_ORGANIZATION="<ORGANIZATION-ID>"
    export SCALEWAY_TOKEN="<SECRET-KEY>"
```

## What happens when you run this
