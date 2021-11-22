# Install Modules used in Course 55039 
Install-module PSJsonCredential
Install-Module PlatyPS
Install-Module PSScriptAnalyzer

Get-Module -ListAvailable P*
Get-Command -module PSJsonCredential
Get-Command -module PlatyPS
Get-Command -module PSScriptAnalyzer

# Because Pester 3.4.0 is installed on Windows by default,
# we have to do this to update Pester to the latest version:
# Install-Module Pester -Force -SkipPublisherCheck 

