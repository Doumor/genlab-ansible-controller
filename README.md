# Genlab ansible controller

This is repo for deploying our Ansible controller.

## Test locally

```bash
molecule test
```

WARNING: configure molecule by youself.

This will create a Docker container and run the playbook (`main.yml`) with roles (`requirements.yml`).

```bash
molecule login
```
Log into container and have a look around.

## Yandex Cloud with Terraform and Ansible

### Get API keys

Install the `yc` tool from Yandex and configure it properly. Visit Yandex Cloud documentation for exact steps
[here](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart).

Set variables in `main.tf` to correct values (e.g., set `folder-id` to the string ID deisplay in the Cloud's  web UI).

### Configure the SSH key

In order to be able to log into the host, we need to push an SSH public key. The default path is set to `~/.ssh/tf_key`, change this as needed.

### Run Terraform

Take a look at the output of a dry run:

```bash
terraform plan
```

Notice which resources are going to be created. Make sure nothing gets modified or destroyed unless you are re-creating a pre-existing setup.

```bash
terraform apply
```

This deploys virtual network and the host machine.

### Change inventory

Now set the external IP address of the node in `inventory.yml`.

### Apply Ansible role

```bash
ansible-playbook main.yml --private-key=~/.ssh/tf_key
```

### Destroy

Removing the setup is as simple as (review carefully):

```bash
terraform plan
```

...followed by:

```bash
terraform destroy
```
