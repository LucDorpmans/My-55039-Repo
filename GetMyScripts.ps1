# GetMyScripts.ps1
Function Get-MyScript { Param( [string]$AFile,[switch]$EditFile = $False, 
							   [string]$SPath = "$env:USERPROFILE\Downloads\")
			Invoke-Webrequest -Uri "https://raw.githubusercontent.com/LucDorpmans/My-55039-Repo/main/$AFile"  -Outfile "$SPath$AFile" 
			If ($EditFile) { PSEdit  ("$SPath$AFile" )} }
		
Get-MyScript "EdgeMSI-Download-Only-Complete.ps1"
Get-MyScript "Edge-InstallOnly.ps1"
Get-MyScript "Chrome-Download+Run-Installer.ps1"
Get-MyScript "PowerShell-Core-7.1.4-Download+Install.ps1" -EditFile
Get-MyScript "NuGet+PSGallery.ps1" -EditFile


# Get Install-VSCode script"
Invoke-Webrequest -Uri "https://raw.githubusercontent.com/PowerShell/vscode-powershell/master/scripts/Install-VSCode.ps1" -Outfile "$env:USERPROFILE\Downloads\Install-VSCode.ps1"
PSEdit  ("$env:USERPROFILE\Downloads\Install-VSCode.ps1")
