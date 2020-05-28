{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "artifactsSASToken": {
      "type": "securestring",
      "metadata": {
        "description": "Value of the secret from Key Vault."
      }
    },
    "secretArtifactsLocation": {
      "type": "string",
      "defaultValue": ""
    },
    "aacLocation": {
      "type": "string",
      "defaultValue": ""
    },
    "runbookName": {
      "type": "string",
      "defaultValue": ""
    },
    "runbookDescriptionName": {
      "type": "string",
      "defaultValue": ""
    },
    "powershellScriptFileName": {
      "type": "string",
      "defaultValue": ""
    }
  },
  "variables": {

  },
  "resources": [
    {
      "type": "runbooks",
      "apiVersion": "2015-01-01-preview",
      "name": "[parameters('runbookName')]",
      "location": "[parameters('aacLocation')]",
      "dependsOn": [
      ],
      "tags": {},
      "properties": {
        "runbookType": "PowerShell",
        "logProgress": "false",
        "logVerbose": "false",
        "description": "[parameters('runbookDescriptionName')]",
        "publishContentLink": {
          "uri": "[uri(parameters('secretArtifactsLocation'), concat(parameters('powershellScriptFileName'), parameters('artifactsSASToken')))]",
          "version": "1.0.0.0"
        }
      }
    }
  ],
  "outputs": {
  }
}