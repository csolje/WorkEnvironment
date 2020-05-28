function Get-Uptime
{
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER p

    .NOTES
        Tags: SystemInfo, Uptime
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE
        PS C:\>Get-Uptime
    #>
    Get-CimInstance -ClassName win32_operatingsystem | Select-Object csname, lastbootuptime
}