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
Set-Alias grep rg
