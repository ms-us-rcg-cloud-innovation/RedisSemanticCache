#!/bin/bash

# exit on error
set -e

# requires terraform and azd
# terraform https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
# azd https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd?tabs=winget-windows%2Cbrew-mac%2Cscript-linux&pivots=os-linux

# get the directory of the script
# get the directory of the root which is parent to the current directory
DIR=$(realpath $(dirname "$0"))
ROOT=$(realpath $DIR/../)

# run the scripts relative to the root
echo "Running scripts from root $ROOT"
pushd $ROOT

echo "Running terraform bootstrap init"
terraform -chdir=bootstrap init

echo "Running terraform bootstrap apply"
terraform -chdir=bootstrap apply -auto-approve 

echo "Generating remote state input variables"
azd env set TERRAFORM_STATE_STORAGE_ACCOUNT $(terraform -chdir=bootstrap output -raw storage_account)
azd env set TERRAFORM_STATE_CONTAINER_NAME $(terraform -chdir=bootstrap output -raw container_name)
azd env set TERRAFORM_STATE_RESOURCE_GROUP $(terraform -chdir=bootstrap output -raw resource_group)

# go back to where we were
popd
echo "Current directory changed back to $(pwd)"