[CmdletBinding()]
param()

Write-Verbose 'Loading tasks'
foreach ($task in (Get-ChildItem -Filter 'task.ps1' -Recurse))
{
    Write-Verbose "Found task at: $($task.FullName)"
    try
    {
        Write-Host "========== STARTING NEW TASK: $($task.Directory.Name) ==========" -ForegroundColor Green
        . $($task.FullName)
    }
    catch
    {
        Write-Error -Message "Error on task: $($task.FullName)"
        $Error[0].InnerException
    }
}