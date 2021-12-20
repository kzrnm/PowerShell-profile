$env:LANG = "ja_JP.UTF-8"
. "$PSScriptRoot/Scripts/completion.ps1"
. "$PSScriptRoot/Scripts/functions.ps1"
. "$PSScriptRoot/Scripts/local_alias.ps1"


Set-Alias sleep Start-SleepKurukuru -Force
Set-Alias ll Get-ChildItem
function which { (Get-Command $args).Definition }
function bd { Set-Location .. }


$env:POSH_GIT_ENABLED = $True
#Import-Module oh-my-posh
if ($env:NO_NERD_FONT) {
    Set-PoshPrompt hotstick.minimal
    Remove-Module oh-my-posh
}
elseif ($env:TERMINAL_EMULATOR -eq "JetBrains-JediTerm") {
    # Set-PoshPrompt powerlevel10k_lean
    Remove-Module oh-my-posh
}
else {
    Set-PoshPrompt -Theme $PSScriptRoot\PoshThemes\nerd-git.json
}
