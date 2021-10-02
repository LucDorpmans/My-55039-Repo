# Unattended install of NuGet repository, and set PSGallery to be a Trusted repository
<<<<<<< HEAD
$OrgVerbosePreference = $VerbosePreference
=======
$OrgVerbosePreference = $VerbosePreference 
>>>>>>> b4e7dc781b18c14e3cbcec9d125ba7e67f4a22e3
$VerbosePreference = "Continue"

If ((Get-PackageProvider -Name PowerShellGet -ListAvailable)) {
    $NuProv = Get-PackageProvider -Name Nuget
    Write-Verbose "NuGet PackageProvider version $($NuProv.Version) installed" 
} 
Else {
    Write-Verbose "Not installed, installing"
    { Install-PackageProvider nuget -Force } 
    Write-Verbose "Installed  (if no errors)"
}

If ( (Get-PSRepository PSGallery).InstallationPolicy -eq "Trusted" )  {
    Write-Verbose "PsGallery already trusted" } 
Else { 
    Write-Verbose "{PsGallery not yet trusted, trying to approve"
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
 }

<<<<<<< HEAD
$VerbosePreference = $OrgVerbosePreference
=======
 $VerbosePreference = $OrgVerbosePreference 
>>>>>>> b4e7dc781b18c14e3cbcec9d125ba7e67f4a22e3
