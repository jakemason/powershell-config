# rbenv for Windows
$env:RBENV_ROOT = "e:\tools\rbenv"
# Not easy to download on Github?
# Use a custom mirror!
# $env:RBENV_USE_MIRROR = "https://abc.com/abc-<version>"

& "$env:RBENV_ROOT\rbenv\bin\rbenv.ps1" init

$Global:SITES = "E:\DevApps\Sites"

# Prefer Neovim over regular vim
Set-Alias vim nvim

# We can't use "exit" as an alias, so we need to create
# our own 'quit' function as a workaround.
function quit
{
  Invoke-command -ScriptBlock {exit}
}

Set-Alias e quit

# Not sure if this can be a one-liner. Not sure how to pass
# a command to Set-Alias that is more than a single word and 
# I can't be bothered to figure it out when this works.
function openInExplorer
{
  Invoke-command -ScriptBlock {explorer .}
}

# Another convenient OS adaptation
Set-Alias o openInExplorer
Set-Alias open openInExplorer

# Alias grep to ripgrep which I _should_ always have 
# installed on Windows. :)

function do_ripgrep_search
{
  rg -M 250 @args; # -M 250 limits the output for a single line to 250 bytes... this prevents minified results from destroying the terminal output with hundreds of lines of junk
}
Set-Alias grep do_ripgrep_search

Set-Alias hexdump Format-Hex

function cmake64Bit
{
  cmake -DCMAKE_GENERATOR_PLATFORM=x64 @args
}
Set-Alias cmake64 cmake64Bit

function t {
  bash -c "/mnt/e/Tools/todotxt/todo.sh $args"
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
