Get-SmbMapping | Remove-SmbMapping -Force

$MyRepo = "My-55039-Repo-main"
# New-SmbMapping -LocalPath x: -RemotePath \\LON-DC1\MyRepo\LabFiles.org\LON-CL1 
New-SmbMapping -LocalPath E: -RemotePath \\LON-DC1\MyRepo\GK-Custom-LabFiles 
New-SmbMapping -LocalPath F: -RemotePath \\LON-DC1\MyRepo
# New-SmbMapping -LocalPath x: -RemotePath \\LON-DC1\MyRepo\My-55039-LabFiles

# Get-SmbMapping
