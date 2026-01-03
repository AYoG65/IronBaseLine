Write-Host "Auditing Windows CIS Level 1 settings"
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters | Select SMB1
