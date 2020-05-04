function Start-admps
{
    <#
    .SYNOPSIS
      Run a new PowerShell 7 console

    .DESCRIPTION
      Starts a new PowerShell 7 console with elevated permissions

    .PARAMETER PowerShell5
      Run a elevated PowerShell 5.1 prompt

    .NOTES
        Tags: PowerShell
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE
    # Start a new PowerShell 7 console with elevated permissions
    PS C:\>Start-admps

    .EXAMPLE
    # Start a new PowerShell 5.1 console with elevated permissions
    PS C:\>Start-admps -PowerShell5

    #>
    param (
      [switch]$PowerShell5
    )
    if($PowerShell5) {
      Start-Process powershell.exe -Verb runAs
    }
    else {
      Start-Process pwsh.exe -Verb runas
    }
}
