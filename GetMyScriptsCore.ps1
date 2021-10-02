# GetMyScriptsCore.ps1
Function Get-MyScript { Param( [string]$AFile,[switch]$EditFile = $False, 
							   [string]$SPath = "$env:USERPROFILE\Downloads\")
			Invoke-Webrequest -Uri "https://raw.githubusercontent.com/LucDorpmans/My-55039-Repo/main/$AFile"  -Outfile "$SPath$AFile" 
			If ($EditFile) { Notepad  ("$SPath$AFile" )} }
		
Get-MyScript "PowerShell-7.1.4-Core-Download+Install.ps1" 
Get-MyScript "NuGet+PSGallery.ps1" 
Get-MyScript "55039-Install-Modules.ps1" 