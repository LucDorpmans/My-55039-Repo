function Export-TDF {
    [CmdletBinding(DefaultParameterSetName='Delimiter', SupportsShouldProcess=$true, ConfirmImpact='Medium', HelpUri='http://go.microsoft.com/fwlink/?LinkID=113299')]
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [psobject]
        ${InputObject},

        [Parameter(Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Alias('PSPath')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LiteralPath},

        [switch]
        ${Force},

        [Alias('NoOverwrite')]
        [switch]
        ${NoClobber},

        [ValidateSet('Unicode','UTF7','UTF8','ASCII','UTF32','BigEndianUnicode','Default','OEM')]
        [string]
        ${Encoding},

        [switch]
        ${Append},

        [Parameter(ParameterSetName='UseCulture')]
        [switch]
        ${UseCulture},

        [Alias('NTI')]
        [switch]
        ${NoTypeInformation})

    begin
    {
        try {
            $outBuffer = $null

            # add this to base proxy function
            # $PSBoundParameters.Add('Delimiter',"`t")
            # end addition

            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Export-Csv', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters -Delimiter "`t"}
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
}

Get-Service | Export-TDF c:\Scripts\services.tdf