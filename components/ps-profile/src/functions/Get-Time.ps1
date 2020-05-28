function Get-Time
{
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER p

    .NOTES
        Tags: Time
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE

    #>
    return $(Get-Date | ForEach-Object { $_.ToLongTimeString() })
}