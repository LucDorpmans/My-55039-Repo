Get-SmbMapping | Remove-SmbMapping -Force

$MyRepo = "My-55039-Repo-main"
# New-SmbMapping -LocalPath x: -RemotePath \\Alpha\MyRepo\LabFiles.org\LON-CL1 
New-SmbMapping -LocalPath E: -RemotePath \\Alpha\MyRepo\GK-Custom-LabFiles 
New-SmbMapping -LocalPath F: -RemotePath \\Alpha\MyRepo
# New-SmbMapping -LocalPath x: -RemotePath \\Alpha\MyRepo\My-55039-LabFiles

# Get-SmbMapping
