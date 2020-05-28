# Importing modules
if (-not (Get-Module -ListAvailable -Name PSReadline))
{
    Install-Module -Name PSReadline -Scope CurrentUser
}
if (-not (Get-Module -ListAvailable -Name posh-git))
{
    Install-Module -Name posh-git -Scope CurrentUser
}
if (-not (Get-Module -ListAvailable -Name Posh-SSH))
{
    Install-Module -Name Posh-SSH -Scope CurrentUser
}
<#if (-not (Get-Module -ListAvailable -Name powerline))
{
    Install-Module -Name powerline -Scope CurrentUser
}#>
if (-not (Get-Module -ListAvailable -Name oh-my-posh))
{
    Install-Module -Name oh-my-posh -Scope CurrentUser
}
Import-Module PSReadline
Import-Module posh-git
#Import-Module powerline
Import-Module oh-my-posh
#Set-Theme Paradox

# Start Apps and set Location
Start-SshAgent -Quiet

Set-Location C:\GitHub
# Loading all functions
#Get public and private function definition files.
$functions = @( Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach ($import in $functions)
{
    Try
    {
        . $import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}

function Save-History
{
    Get-History | Where-Object ExecutionStatus -eq "Completed" | Export-Clixml -Path "$(split-path $profile)\History.clixml"
}
Invoke-Expression "function $([char]4) { Exit-Me }"
# Vim setup
$VIMPATH = "C:\Program Files (x86)\vim\vim80\vim.exe"

Set-Alias -Name vi -Value $VIMPATH
Set-Alias -Name vim -Value $VIMPATH
Set-Alias -Name v -Value $VIMPATH
Set-Alias -Name cdG -Value Set-LocationGit

# Shell
if (Test-Path -path "$(Split-Path $profile)\History.clixml")
{
    $history = Import-Clixml -Path "$(Split-Path $profile)\History.clixml"
    $history | Add-History
}