function Set-ServiceAcctCreds
{
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER ComputerName
        Define the ComputerName to target

    .PARAMETER ServiceName
        The Service name

    .PARAMETER NewAccountName
        The new account name

    .PARAMETER NewPass
        The new password

    .NOTES
        Tags:
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE
        PS C:\>Set-ServiceAcctCreds -ComputerName localhost -ServiceName "SQL Server" -NewAccountName "contoso\sqlde" -NewPass "T3st!!"
    #>


    [CmdletBinding()]
    param (
        # Define the ComputerName to target
        [Parameter()]
        [string]$ComputerName,
        # The Service name
        [Parameter()]
        [string]$ServiceName,
        # The new account name
        [Parameter()]
        [string]$NewAccountName,
        # The new password
        [Parameter()]
        [string]$NewPass
    )
    $filter = 'Name=' + "'" + $ServiceName + "'" + ''
    $service = Get-WMIObject -ComputerName $ComputerName -namespace "root\cimv2" -class Win32_Service -Filter $filter
    $service.Change($null, $null, $null, $null, $null, $null, $NewAccountName, $NewPass)
}