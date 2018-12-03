Import-Module pure-pwsh

# Tweak colors to look like original Pure
$esc = [char]27
$pure.PwdColor = "$esc[34m"
$pure.BranchColor = "$esc[90m"
$pure.RemoteColor = "$esc[36m"
$pure.PromptColor = "$esc[35m"
