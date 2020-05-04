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
if (-not (Get-Module -ListAvailable -Name powerline))
{
    Install-Module -Name powerline -Scope CurrentUser
}
if (-not (Get-Module -ListAvailable -Name oh-my-posh))
{
    Install-Module -Name oh-my-posh -Scope CurrentUser
}
Import-Module PSReadline
Import-Module posh-git
Import-Module powerline
Import-Module oh-my-posh
Set-Theme Paradox

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
function Exit-Me
{
    #Stop-Transcript
    Get-History | Where ExecutionStatus -eq "Completed" | Export-Clixml -Path "$(split-path $profile)\History.clixml"
    Exit
}
function Save-History
{
    Get-History | Where ExecutionStatus -eq "Completed" | Export-Clixml -Path "$(split-path $profile)\History.clixml"
}
Invoke-Expression "function $([char]4) { Exit-Me }"
# Vim setup
$VIMPATH = "C:\Program Files (x86)\vim\vim80\vim.exe"

Set-Alias vi    $VIMPATH
Set-Alias vim   $VIMPATH
Set-Alias v     $VIMPATH

# for editing your PowerShell profile
Function Edit-Profile
{
    vim $profile
}
# for editing your vim settings
Function Edit-Vimrc
{
    vim $home\.vimrc
}
# Shell
if (Test-Path -path "$(Split-Path $profile)\History.clixml")
{
    $history = Import-Clixml -Path "$(Split-Path $profile)\History.clixml"
    $history | Add-History
}