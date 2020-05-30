function Start-Docker
{
    <#
    .SYNOPSIS
    Start Docker for desktop

    .DESCRIPTION
    Starts Docker for desktop from PowerShell

    .NOTES
        Tags: Docker
        Author:  Christian Solje (csolje@gmail.com)
        Copyright: (c) 2018, licensed under MIT
        License: MIT https://opensource.org/licenses/MIT

    .EXAMPLE
    PS C:\>Start-Docker
    #>

    & "C:\Program Files\Docker\Docker\Docker Desktop.exe"
}