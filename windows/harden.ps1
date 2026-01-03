Write-Host "Applying Windows CIS Level 1 hardening"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name SMB1 -Value 0
net accounts /minpwlen:14
