$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot
$root = Resolve-Path "$dir/../"

# jump into the script root
"Running scripts from root $root"
Push-Location $root

"Running terraform bootstrap init"
terraform -chdir=bootstrap init

"Running terraform bootstrap apply"
terraform -chdir-bootstrap apply -auto-approve

"generating remote state input variables"

azd env set TERRAFORM_STATE_STORAGE_ACCOUNT $(terraform -chdir=bootstrap output -raw storage_account)
azd env set TERRAFORM_STATE_CONTAINER_NAME $(terraform -chdir=bootstrap output -raw container_name)
azd env set TERRAFORM_STATE_RESOURCE_GROUP $(terraform -chdir=bootstrap output -raw resource_group)

# go back to where we were
Pop-Location
"Current directory changed back to $pwd"