function Test-Administrator
{
    <#
    .SYNOPSIS

    .DESCRIPTION

    .PARAMETER p

    .NOTES
        Tags: Permissions, Elavation
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE
    PS C:\>Test-Administrator
    #>
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}