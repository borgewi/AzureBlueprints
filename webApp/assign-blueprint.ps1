# Set parameters
$environment = "DEV"
$subscriptionId = "68561d79-60fb-4d83-9688-16314efefe17"
$blueprintName = "webapp-blueprint"
$assignmentName = $blueprintName + "-ASSIGNMENT-" + $environment 

# Get blueprint definition
$bpDefinition = Get-AzBlueprint -SubscriptionId $subscriptionId -Name $blueprintName -LatestPublished

# Set blueprint resource group parameters
$bpRGParameters = @{"WEB-APP-RG"=@{name= "WEB-APP-RG-" + $environment }}

# Set blueprint parameters
$bpParameters = @{
    BlueprintParameter_AppServicePlan_Name = "app-service-plan-" + $environment
    BlueprintParameter_WebApp_Name = "web-app-" + $environment
}

# Create new assignment
New-AzBlueprintAssignment -Name $assignmentName -Blueprint $bpDefinition -SubscriptionId $subscriptionId -Location "Norway East" -Parameter $bpParameters -ResourceGroupParameter $bpRGParameters 
