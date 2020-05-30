function Start-Banen
{
    if ($(Get-Service -Name vmms).Status -eq "Running" -or $(Get-Service -Name vmms).Status -eq "Stopped") {
        Restart-Service -Name vmms
    }
    Start-Sleep -Seconds 10
    $VM=Get-VM -VMName BaneJumpVM
    if ($VM)
    {
        Start-VM -Name BaneJumpVM
        Start-Sleep -Seconds 10
        $BnVM = Get-VM -Name BaneJumpVM
        $VMIp = Get-VMIpAddress -VMName BaneJumpVM
        $IP=$VMIp.IPAddresses[0]
        Write-Host "BaneJumpVM is"$BnVM.State"on IP:"$IP""
    }
    else
    {
        Write-Error "Hyper-V is not Running, please restart the Hyper-V service"
    }
}