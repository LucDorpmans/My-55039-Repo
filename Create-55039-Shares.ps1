Get-SmbShare MyRepo -ErrorAction SilentlyContinue | Remove-SmbShare -Confirm:$false 
Get-SmbShare GK-Custom-LabFiles  -ErrorAction SilentlyContinue | Remove-SmbShare -Confirm:$false

$MyRepo = "My-55039-Repo-main"
New-SmbShare -Name MyRepo -Path "C:\$MyRepo" -FullAccess "Adatum.int\Administrator"
New-SmbShare -Name GK-Custom-LabFiles -Path "C:\$MyRepo\55039AC-GK-Custom-LabFiles" -FullAccess "Adatum.int\Administrator"
# New-SmbShare -Name MyLabFiles -Path "C:\$MyRepo\My-55039-LabFiles" -FullAccess "Adatum.int\Administrator"