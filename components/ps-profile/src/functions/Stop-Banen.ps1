function Stop-Banen
{
    Write-Output "Shutting down BaneJumpVM"
    Stop-VM -VMName BaneJumpVM
}