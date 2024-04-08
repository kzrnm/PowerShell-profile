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

    $untilText = "Waiting until $($EndTime.ToString())..."
    Start-Kurukuru -Pattern Dots12 -Text $untilText -SucceedText "Finish" {
        param([Kurukuru.Spinner]$spinner)
        while ($now -lt $EndTime) {
            if ($now -gt $EndTime) { $now = $EndTime }
            $leftSecond = [int]($EndTime - $now).TotalSeconds
            $spinner.Text = "$untilText $leftSecond sec left"
            Start-Sleep -Seconds 1
            $now = [datetime]::Now
        }
    }
}
