function Start-SleepKurukuru {
    [CmdletBinding(DefaultParameterSetName = "Second")]
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "Second",
            HelpMessage = "No time specified")]
        [int]$Seconds,
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "Time",
            HelpMessage = "No time specified")]
        [datetime]$EndTime
    )
    $now = [datetime]::Now
    $StartTime = $now
    switch ($PSCmdlet.ParameterSetName) {
        'Second' { $EndTime = $StartTime.AddSeconds($Seconds) }
        'Time' { $Seconds = [int]($EndTime - $StartTime).TotalSeconds }
        Default { throw "Invalid ParameterSetName" }
    }

    while ($now -lt $EndTime) {
        if ($now -gt $EndTime) { $now = $EndTime }
        $leftSecond = [int]($EndTime - $now).TotalSeconds
        $elapsedSecond = [int]($now - $StartTime).TotalSeconds
        Write-Progress -Activity "Waiting until $($EndTime.ToString()) ($Seconds seconds)..."`
            -PercentComplete (100 * ($now - $StartTime).TotalSeconds / ($EndTime - $StartTime).TotalSeconds)`
            -CurrentOperation "$leftSecond sec left ($elapsedSecond sec elapsed)"`
            -Status "Please wait"
        Start-Sleep -Seconds 1
        $now = [datetime]::Now
    } 
    Write-Progress -Completed $true -Status "Please wait"
}
