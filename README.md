# Genlab ansible controller

This is repo for configure our ansible controller.

## Local test

```
$ molecule test
```
WARNING: configure molecule by youself.

It will create docker container and run playbook (main.yml) with roles (requirements.yml).

```
$ molecule login
```
Login into container.

## Yandex Cloud with Terraform and ansible

### Get API keys

Go to yandex wiki... Install `yc` and make it work.
https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart

Change main.tf values (for ex. folder-id, see in yandex cloud webui).

### Run terraform

```
$ tf plan
$ tf apply
```

Now hardware (and even network) is alive.

By default it using key ~/.ssh/tf_key (change it, it need or create link)

### Change inventory

Now you need to change inventory file with actual ip (see in yandex cloud webui).

```
$ nano inventory.yml
```

### Apply ansible role

```
$ ansible-playbook main.yml --private-key=~/.ssh/tf_key
```

### Time to dead

When work done (mostly not) do:
```
$ tf destroy
```
