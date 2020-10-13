[cmdletBinding()]
param
(
    # Packages YAML file path
    [Parameter()]
    [string] $PackagesPath,

    # path to the src folder
    [Parameter()]
    [string] $srcPath = "$PSScriptRoot/components/ps-profile/src",

    # Name of the Profile file.
    [Parameter()]
    [string] $ProfileName = (Split-Path -Path $Profile -leaf),

    # Profile root path
    [Parameter()]
    [string] $ProfilePath = (Split-Path -Path $Profile -Parent),

    # Profile template name
    [Parameter()]
    [string] $ProfileTemplateName = 'profile.ps1'
)

if (-not(Test-Path -Path $profile))
{
    if (-not(Test-Path -Path $ProfilePath)) { New-Item -Path $ProfilePath -Type Directory }

    Copy-Item -Path "$srcPath\functions" -Destination $ProfilePath -Recurse -Force
    Copy-Item -Path "$srcPath\History.clixml" -Destination $ProfilePath -Force
    Copy-Item -Path "$srcPath\$profileTemplateName" -Destination $ProfilePath -Force
    Rename-Item -Path "$ProfilePath\$profileTemplateName" -NewName $ProfileName -Force
}
else
{
    Write-Warning -Message "Cannot replace profile. Profile already exists at: $profile"
}