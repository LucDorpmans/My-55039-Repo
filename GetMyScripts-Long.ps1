# GetMyScripts-Long.ps1
Function Get-MyScript 
{    [CmdletBinding()]
    Param    ( 
        [Parameter(Mandatory=$true,Position=0)]
        [string]$AFile,
        [string]$SaveLocation = "$env:USERPROFILE\Downloads\", 
		[switch]$EditFile = $False )
        Invoke-Webrequest -Uri "https://raw.githubusercontent.com/LucDorpmans/My-55039-Repo/main/$AFile"  -Outfile "$SaveLocation$AFile" 
		If ($EditFile) { PSEdit  ("$SaveLocation$AFile" )} }

Get-MyScript "EdgeMSI-Download-Only-Complete.ps1"
Get-MyScript "Edge-InstallOnly.ps1"
Get-MyScript "Chrome-Download+Run-Installer.ps1"
Get-MyScript "PowerShell-Core-7.1.4-Download+Install.ps1" -EditFile
Get-MyScript "NuGet+PSGallery.ps1" -EditFile