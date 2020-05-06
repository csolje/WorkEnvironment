function Save-History
{
    Get-History | Where-Object ExecutionStatus -eq "Completed" | Export-Clixml -Path "$(split-path $profile)\History.clixml"
}