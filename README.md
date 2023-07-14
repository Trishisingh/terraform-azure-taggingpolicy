# terraform-azure-tagging-policy
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_policy_definition.appendTag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition) | resource |
| [azurerm_policy_definition.requiredTag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/policy_definition) | resource |
| [azurerm_subscription_policy_assignment.appendTag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_policy_assignment) | resource |
| [azurerm_subscription_policy_assignment.requiredTag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_policy_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appendtags"></a> [appendtags](#input\_appendtags) | n/a | `map(string)` | <pre>{<br>  "app-name": "data",<br>  "business-unit": "digital",<br>  "cost-centre": "1111",<br>  "created-By": "user",<br>  "environment": "dev"<br>}</pre> | no |
| <a name="input_requiredtags"></a> [requiredtags](#input\_requiredtags) | n/a | `map(string)` | <pre>{<br>  "app-name": "data",<br>  "business-unit": "digital",<br>  "cost-centre": "1111",<br>  "created-By": "user",<br>  "environment": "dev"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->