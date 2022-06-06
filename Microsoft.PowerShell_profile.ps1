$env:LANG = "ja_JP.UTF-8"
. "$PSScriptRoot/Scripts/local_alias.ps1"
. "$PSScriptRoot/Scripts/completion.ps1"
. "$PSScriptRoot/Scripts/functions.ps1"

Set-Alias sleep Start-SleepKurukuru -Force
Set-Alias ll Get-ChildItem
Set-Alias clip Set-Clipboard
function which { (Get-Command $args).Definition }
function bd { Set-Location .. }

$env:POSH_GIT_ENABLED = $True

if ($env:NO_NERD_FONT) {
    Set-PoshPrompt hotstick.minimal
    Remove-Module oh-my-posh
}
elseif ($env:TERMINAL_EMULATOR -eq "JetBrains-JediTerm") {
    #    $GitPromptSettings.EnableFileStatus = $false
    $GitPromptSettings.BranchGoneStatusSymbol.Text = '*'
    $GitPromptSettings.BranchIdenticalStatusSymbol.Text = '_'
    $GitPromptSettings.BranchAheadStatusSymbol.Text = 'L'
    $GitPromptSettings.BranchBehindStatusSymbol.Text = 'D'
    $GitPromptSettings.BranchBehindAndAheadStatusSymbol.Text = 'B'
}
else {
    oh-my-posh init pwsh --config $PSScriptRoot\PoshThemes\nerd-git.json | Invoke-Expression
}
