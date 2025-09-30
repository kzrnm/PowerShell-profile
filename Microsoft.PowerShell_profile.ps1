$env:LANG = "ja_JP.UTF-8"
. "$PSScriptRoot/Scripts/completion.ps1"
. "$PSScriptRoot/Scripts/functions.ps1"
if (Test-Path "$PSScriptRoot/Scripts/Local/main.ps1" -PathType Leaf) {
    . "$PSScriptRoot/Scripts/Local/main.ps1"
}

[System.Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
Set-Alias sleep Start-SleepKurukuru -Force
Set-Alias ll Get-ChildItem
Set-Alias clip Set-Clipboard
function which { (Get-Command $args).Definition }
function bd { Set-Location .. }


if ($env:NO_NERD_FONT) {
    oh-my-posh init pwsh --eval --config $PSScriptRoot/PoshThemes/minimal.omp.json | Invoke-Expression
}
#elseif ($env:TERMINAL_EMULATOR -eq "JetBrains-JediTerm") {
#    oh-my-posh init pwsh --eval --config $PSScriptRoot/PoshThemes/minimal.omp.json | Invoke-Expression
#}
else {
    oh-my-posh init pwsh --eval --config $PSScriptRoot/PoshThemes/nerd-git.json | Invoke-Expression
    $env:VIRTUAL_ENV_DISABLE_PROMPT = "true"
}

