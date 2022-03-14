# testcase03

The example describes how to use `terraform_remote_state` datasources with local backends

## Prerequisites

Initially define correct project id and region

```
export TF_VAR_project=project-id-here
export TF_VAR_region=region-here
```

## Roll out environment

```
terraform -chdir=network init
terraform -chdir=network plan
terraform -chdir=network apply -auto-approve

terraform -chdir=iam init
terraform -chdir=iam plan
terraform -chdir=iam apply -auto-approve

terraform -chdir=compute init
terraform -chdir=compute plan
terraform -chdir=compute apply -auto-approve
```

## Roll up environment

```
terraform -chdir=compute destroy -auto-approve
terraform -chdir=iam destroy -auto-approve
terraform -chdir=network destroy -auto-approve
```
