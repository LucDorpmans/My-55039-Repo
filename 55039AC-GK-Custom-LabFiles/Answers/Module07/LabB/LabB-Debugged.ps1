Function Export-EventLogSource {

    [cmdletbinding()]
    Param (
    [Parameter(Position=0,Mandatory=$True,Helpmessage="Enter a computername",
    ValueFromPipeline=$True)]
    [string]$Computername,
    [Parameter(Position=1,Mandatory=$True,Helpmessage="Enter a classic event log name like System")]
    [string]$Log,
    [int]$Newest=100
    )

    Begin {
        Write-Verbose "Starting export event source function"
        #the date format is case-sensitive"
        $datestring=Get-Date -Format "yyyyMMdd"
        $logpath=Join-path -Path "C:\Scripts\Work" -ChildPath $datestring
        if (! (Test-Path -path $logpath)) {
            Write-Verbose "Creating $logpath"
            mkdir $logpath 
        }
        Write-Verbose "Logging results to $logpath"
    } #begin
    
    Process {
        Write-Verbose "Getting newest $newest $log event log entries from $computername"
        Try {
            Write-Host $computername.ToUpper() -ForegroundColor Green
            $logs=Get-EventLog -LogName $log -Newest $Newest -ComputerName $Computername -ErrorAction Stop
            if ($logs) {
                Write-Verbose "Sorting $($logs.count) entries"
                $logs | sort Source | foreach {
                   $logfile=Join-Path -Path $logpath -ChildPath "$computername-$($_.Source).txt"
                   $_ | Format-List TimeWritten,MachineName,EventID,EntryType,Message | Out-File -FilePath $logfile -append
                }           
                      
                #clear variables for next time
                Remove-Variable -Name logs,logfile
                
            } #if $logs
            else {
                Write-Warning "No logged events found for $log on $Computername"
            } #else no $logs
       } #Try
       Catch {
            Write-Warning $_.Exception.Message
       } #Catch
    } #close Process
    
    End {
        dir $logpath
        Write-Verbose "Finished export event source function"
    }
    
} #close Function