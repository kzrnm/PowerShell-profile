
$env:LANG = "ja_JP.UTF-8"

Set-Alias ll Get-ChildItem
function which { (Get-Command $args).Definition }
function bd { Set-Location .. }

. "$PSScriptRoot/Scripts/Local/main.ps1"
. "$PSScriptRoot/Scripts/completion.ps1"
. "$PSScriptRoot/Scripts/functions.ps1"

Import-Module posh-git

[System.Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
#chcp 65001 | Out-Null

$env:POSH_GIT_ENABLED = $True
#Import-Module oh-my-posh
if ($env:NO_NERD_FONT) {
    Set-PoshPrompt hotstick.minimal
}
elseif ($env:TERMINAL_EMULATOR -eq "JetBrains-JediTerm") {
    Set-PoshPrompt powerlevel10k_lean
}
else {
    Set-PoshPrompt -Theme $PSScriptRoot\PoshThemes\nerd-git.json
}
