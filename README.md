# RedisSemanticCache

Two Jupyter notebooks are included. `normalcache` shows how to use standard caching in LangChain, where exact text match is required. `semanticcache` uses semantic caching, where non-exact matches can be used.

# Setup

## Requirements

Install azue developer cli (azd) and terraform

* [azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd?tabs=winget-windows%2Cbrew-mac%2Cscript-linux&pivots=os-linux)
* [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Make sure to login to azd using 

```bash
azd auth login
```

You will also want to set the default azd subscription using

```bash
# replace 00000000-0000-0000-0000-000000000000 with the actual subscription id
azd env set AZURE_SUBSCRIPTION_ID 00000000-0000-0000-0000-000000000000
azd env set AZURE_LOCATION eastus
```

## Usage

Run the developer cli

```bash
azd up
```