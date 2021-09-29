# Unattended install of NuGet repository, and set PSGallery to be a Trusted repository
If ((Get-PackageProvider -Name Nuget)) {
    $NuProv = Get-PackageProvider -Name Nuget
    Write-Verbose "NuGet PackageProvider version $($NuProv.Version) installed and approved" 
} 
Else {
    Write-Verbose "Not installed, installing"
    { Install-PackageProvider nuget -Force } 
    Write-Verbose "Installed  (if no errors)"
}

If ( !(Get-PSRepository PSGallery).InstallationPolicy -eq "Trusted" )  {
    Write-Verbose "{PsGallery not yet trusted, trying to approve"
    Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
 } 
Else { Write-Verbose "PsGallery already trusted" }

