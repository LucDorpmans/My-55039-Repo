Write-Output "Clearing PowerShell Histories on:"
Invoke-Command -ComputerName Alpha,Bravo,Charly,Echo -ScriptBlock {
    Write-Output $($ENV:COMPUTERNAME)
    # Clear PowerShell Console History:
    Remove-Item "$ENV:UserProfile\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt" -ErrorAction SilentlyContinue

    # And clear PowerShell ISE MRU list if any
    $configpath = "$ENV:UserProfile\AppData\Local\microsoft_corporation\powershell_ise.exe_StrongName_lw2v2vm3wmtzzpebq33gybmeoxukb04w\3.0.0.0\user.config"
    If (Test-Path $configpath) {
        [xml]$config = Get-Content $configpath
        # (Select-Xml -Xml $config -XPath '//setting[@name="MRU"]').node.Value.ArrayOfString
        $MRUArr = (Select-Xml -Xml $config -XPath '//setting[@name="MRU"]').node.Value.ArrayOfString
        If (!($MRUArr -is "String" )) { $MRUArr.RemoveAll() }
        $config.save($configpath)
    }
} 
Write-Output "Done clearing PowerShell Histories"

