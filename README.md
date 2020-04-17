# Exercice Terraform

## Prérequis

- Installer azure cli https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest
- Installer terraform https://www.terraform.io/downloads.html

## Étape 1

- En cmd faite az login
- Toujours en command line allez dans le working directory de l'exercice (/exercice)
- Effectuez un "terraform init" (si ça fonctionne pas, c'est pas normal)
- Effectuez un "terraform plan"
- Vérifiez s'il y a des erreurs et corrigez les au besoin
- Lorsqu'il n'y a plus d'erreurs, effectuez un "terraform apply"
- À la fin vous devriez avoir un "resource group" dans Azure portal qui ressemble à ça, mais avec votre nom dans la subscription gsoft-training-dev
  https://portal.azure.com/#@gsoft-group.com/resource/subscriptions/5d198d00-f97f-4598-af26-d3e2853d8229/resourceGroups

TODO : Insert picture here

## Étape 2

- La façon dont on définie nos tags est pas très constante
- Modifier les tags environement et owner pour utiliser des variables (Chercher comment ça fonctionne dans le projet ou vous pouvez aller voir la doc: https://www.terraform.io/docs/configuration/variables.html)
- Faire un "terraform plan"
- Lorsqu'il n'y a plus d'erreurs, effectuez un "terraform apply"

## Étape 3

- Ajouter un module storage-ressources qui va permettre de créer, well you guessed it, un storage account
- Vous pouvez vous référez à l'exemple suivant https://www.terraform.io/docs/providers/azurerm/r/storage_account.html
- Contrairement à l'exemple, on veut recevoir nos valeurs en variables d'entrée

## Étape 4

- Là c'est bien beau, on a un module pour créer des storage account, il faudrait donc l'utiliser
- Créer un storage account au même endroit où vous avez créer votre resource group
- Faire un "terraform plan" et corrigez vos erreurs s'il y en a
- Effectuez un "terraform apply" lorsque tout est beau

## Étape 5

- Good job maintenant vous avez un storage account
- Il ne sert pas à grand chose par contre, puisqu'il nous donne accès à aucune information
- On va donc ajouter une valeur de output au module storage-account qui va nous retourner la primary_connection_string

## Étape 6
