$env:LANG = "ja_JP.UTF-8"
. "$PSScriptRoot/Scripts/local_alias.ps1"
. "$PSScriptRoot/Scripts/completion.ps1"
. "$PSScriptRoot/Scripts/functions.ps1"

[System.Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
Set-Alias sleep Start-SleepKurukuru -Force
Set-Alias ll Get-ChildItem
Set-Alias clip Set-Clipboard
function which { (Get-Command $args).Definition }
function bd { Set-Location .. }


if ($env:NO_NERD_FONT) {
    oh-my-posh init pwsh --config $PSScriptRoot\PoshThemes\minimal.omp.json | Invoke-Expression
}
elseif ($env:TERMINAL_EMULATOR -eq "JetBrains-JediTerm") {
    # Import-Module posh-git
    # $GitPromptSettings.BranchGoneStatusSymbol.Text = '*'
    # $GitPromptSettings.BranchIdenticalStatusSymbol.Text = '_'
    # $GitPromptSettings.BranchAheadStatusSymbol.Text = 'L'
    # $GitPromptSettings.BranchBehindStatusSymbol.Text = 'D'
    # $GitPromptSettings.BranchBehindAndAheadStatusSymbol.Text = 'B'
    oh-my-posh init pwsh --config $PSScriptRoot\PoshThemes\minimal.omp.json | Invoke-Expression
}
else {
    oh-my-posh init pwsh --config $PSScriptRoot\PoshThemes\nerd-git.json | Invoke-Expression
}
$env:POSH_GIT_ENABLED = $True
