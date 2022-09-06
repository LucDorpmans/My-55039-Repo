#[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls" # For older Windows versions
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Install-PackageProvider nuget -Force
If (!(Get-PackageProvider -Name Nuget -ListAvailable )) {
   Write-Output "NuGet Not installed, installing"
   Install-PackageProvider nuget -Force
}
Get-PackageProvider -Name Nuget
