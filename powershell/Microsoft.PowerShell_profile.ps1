$env:POSH_THEMES_PATH = "C:\Users\<username>\AppData\Local\Programs\oh-my-posh\themes\"
$env:FZF_CTRL_T_COMMAND = 'fd --hidden --exclude ".git"'
$env:FZF_ALT_C_COMMAND = 'fd --hidden --type d --exclude ".git"'
$env:FZF_ALT_C_OPTS = "--preview 'tree {}'"
$env:FZF_DEFAULT_OPTS = '--exact --no-sort --reverse --cycle --height 40% --multi --preview-window=:hidden --color="hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008" --bind "?:toggle-preview" --bind "ctrl-a:select-all" --bind "ctrl-y:execute-silent(echo {+} | pbcopy)" --bind "ctrl-e:execute(echo {+} | xargs -o vim)" --bind "ctrl-v:execute(code {+})"'
$env:FZF_CTRL_T_OPTS = '--preview "bat --color=always --line-range=:500 {}"'

if ($host.Name -eq 'ConsoleHost')
{
	    Import-Module PSReadLine

	        # Binding for moving through history by prefix
		Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
		Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
		Set-PSReadLineKeyHandler -Key Ctrl+w -Function BackwardKillWord
		Set-PSReadLineKeyHandler -Key Alt+d -Function KillWord
  		Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar
		Set-PSReadLineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine
		Set-PSReadLineKeyHandler -Key Ctrl+k -Function DeleteToEnd
		Set-PSReadLineKeyHandler -Key Alt+b -Function BackwardWord
		Set-PSReadLineKeyHandler -Key Alt+f -Function NextWord
		Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
		Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine		
  		Set-PSReadLineKeyHandler -Key Ctrl+b -Function BackwardChar
		Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardChar

}

Import-Module PSFzf
#Override PSReadLine's history search
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Override default tab completion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression
