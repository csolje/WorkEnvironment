function Get-VMIpAddress
{
    param (
        [string]$VMName
    )
    Get-VM -Name $VMName | Select-Object -ExpandProperty Networkadapters | Select-Object vmname, ipaddresses
}