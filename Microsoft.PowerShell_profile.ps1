Set-Alias vim nvim

# We can't use "exit" as an alias, so we need to create
# our own 'quit' function as a workaround
function quit
{
  Invoke-command -ScriptBlock {exit}
}

Set-Alias e quit

function openInExplorer
{
  Invoke-command -ScriptBlock {explorer .}
}

Set-Alias o openInExplorer
Set-Alias open openInExplorer

Set-Alias grep rg
