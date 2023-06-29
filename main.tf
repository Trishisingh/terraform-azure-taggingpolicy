

resource "azurerm_subscription_policy_assignment" "requiredTag" {
  for_each             = var.requiredtags
  name                 = "Deny-RequiredTag-${each.key}"
  display_name         = "Mandatory tag'${each.key}'"
  description          = "Tags policy assignment required for '${each.key}'"
  policy_definition_id = azurerm_policy_definition.requiredTag.id
  subscription_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  parameters           = <<PARAMETERS
  {
    "tagName": {
        "value": "${each.key}"
    }
   
}
PARAMETERS
}


#TODO Latest new $$wewecdcdc

resource "azurerm_subscription_policy_assignment" "appendTag" {
  for_each             = var.requiredtags
  name                 = "append-Tags-for-${each.key}"
  display_name         = "append tags when created updated '${each.key}'"
  description          = "Appends the specified tag and value when any resource which is missing this tag is created or updated. Does not modify the tags of resources created before this policy was applied until those resources are changed for'${each.key}'"
  policy_definition_id = azurerm_policy_definition.appendTag.id
  subscription_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  parameters           = <<PARAMETERS
  {
  	"tagName": {
  		"value": "${each.key}"
  	},

  	"tagValue": {
  		"value": "${each.value}"

  	}
  }
PARAMETERS
}

resource "azurerm_policy_definition" "requiredTag" {
  name         = "Deny-Resources-without-RequiredTag"
  display_name = "Deny Resources without required tags"
  description  = "Deny all resources which doesnt have require tags"
  policy_type  = "Custom"
  mode         = "All"
  policy_rule  = <<POLICY_RULE
  {
"if": {
        "field": "[concat('tags[', parameters('tagName'), ']')]",
        "exists": "false"
      },
      "then": {
        "effect": "deny"
      }
    }

POLICY_RULE

  parameters = <<PARAMETERS
  {
    "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Name",
          "description": "Name of the tag, such as 'environment'"
        }
      }
    
}
PARAMETERS

}

resource "azurerm_policy_definition" "appendTag" {
  name         = "Appends-tags-onResources-missingtags"
  display_name = "Appends the specified tag and value "
  description  = "Appends the specified tag and value when any resource which is missing this tag is created or updated. Does not modify the tags of resources created before this policy was applied until those resources are changed. Does not apply to resource groups."
  policy_type  = "Custom"
  mode         = "All"
  policy_rule  = <<POLICY_RULE
  {
      "if": {
        "field": "[concat('tags[', parameters('tagName'), ']')]",
        "exists": "false"
      },
      "then": {
        "effect": "append",
        "details": [
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "value": "[parameters('tagValue')]"
          }
        ]
      }
    }
POLICY_RULE

  parameters = <<PARAMETERS
  {
 "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Name",
          "description": "Name of the tag, such as 'environment'"
        }
      },
      "tagValue": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Value",
          "description": "Value of the tag, such as 'production'"
        }
      }
    }
PARAMETERS

}
