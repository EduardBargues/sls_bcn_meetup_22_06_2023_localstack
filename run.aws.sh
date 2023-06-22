#!/usr/bin/env sh

terraform init

export TF_VAR_access_key="AKIAWAXTX..."
export TF_VAR_secret_key="C/dRSpYNdvTo..."
# terraform apply --auto-approve
terraform destroy --auto-approve