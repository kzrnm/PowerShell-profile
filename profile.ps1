Set-PSReadlineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Chord Ctrl+w -Function ShellBackwardKillWord
Set-PSReadLineOption -WordDelimiters ((Get-PSReadLineOption).WordDelimiters.Replace("-",""))

Set-PSReadLineKeyHandler  -Chord Tab -Function MenuComplete
