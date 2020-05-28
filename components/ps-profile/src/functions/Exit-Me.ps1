function Exit-Me
{
    #Stop-Transcript
    Get-History | Where-Object ExecutionStatus -eq "Completed" | Export-Clixml -Path "$(split-path $profile)\History.clixml"
    Exit
}