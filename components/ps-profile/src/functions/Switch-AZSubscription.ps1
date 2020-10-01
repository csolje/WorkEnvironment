function Switch-AZSubscription {
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateSet('Prod', 'Test','Dev')]
        [string]$Subscription
    )
    if ($Subscription -eq 'Prod'){
        Select-AzSubscription -SubscriptionId 'ff0ee4f9-bf7b-44c0-8bd3-eeb16c1eebea'
    }
    if ($Subscription -eq 'Test') {
        Select-AzSubscription -SubscriptionId '7336106d-3254-498c-8fc6-0da086acc9d9'
    }
    if ($Subscription -eq 'Dev') {
        Select-AzSubscription -SubscriptionId '9fefd134-d3c0-4745-909a-128a6ad3f5ba'
    }
}
