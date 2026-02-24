$VM = Get-VMIntegrationService -VMName "VM NAME HERE" -Name Heartbeat
if ($VM.PrimaryStatusDescription -ne "OK") {
    Write-Host "Heartbeat lost, restarting VM..."
    Stop-VM -VMName "VM NAME HERE" -Force -TurnOff
    Start-VM -VMName "VM NAME HERE"
}
if ($VM.PrimaryStatusDescription -le "OK") {
    Write-Host "Heartbeat OK!"
}