$subscriptionId = "68561d79-60fb-4d83-9688-16314efefe17"
$blueprintName = "webapp-blueprint"
$blueprintFolder = "C:\src\Github\AzureBlueprints\webApp\Blueprint"

# Import blueprint files and create blueprint
Import-AzBlueprintWithArtifact -Name $blueprintName -SubscriptionId $subscriptionId -InputPath $blueprintFolder -Force

# Get imported blueprint
$importedBp = Get-AzBlueprint -SubscriptionId $subscriptionId -Name $blueprintName 

# Publish blueprint 
Publish-AzBlueprint -Blueprint $importedBp -Version "1"

