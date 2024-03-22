shopt -s cmdhist							# save all lines to history													
shopt -s dotglob							# include . in filename
shopt -s checkwinsize							# refresh terminal size for stdout
shopt -s interactive_comments						# ignore comments in interactive shells
shopt -s no_empty_cmd_completion					# don't auto complete during readline operation
shopt -s histappend                                                     # append to history instead of overwriting
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"                             # append on each command
HISTTIMEFORMAT="%F %T "                                                 # add timestamp to history
HISTSIZE=100000                                                         # max 100,000 lines in history list
HISTFILESIZE=200000                                                     # max 200,000 lines in history
HISTCONTROL=ignoredups

# change user prompt if root
if [ $(id -u) -eq 0 ]; then
	PS1='\D{%D} \t \e[31m\u\e[m💀\h:[\e[33m\W\e[m]\e[31m#\e[m '
else
	PS1='\D{%D} \t \e[32m\u\e[m@\h:[\e[33m\W\e[m]\e[32m\$\e[m '
fi


if [[ $OSTYPE =~ solaris ]]; then
  LS=gls
else
  LS=ls
fi

if [[ $OSTYPE =~ freebsd || $OSTYPE =~ darwin ]]; then
  LSC="-G"
else
  LSC="--color=auto"
fi

#exists lsd && LS=lsd && LSC=
if command -v lsd >/dev/null 2>&1; then
    LS=lsd
    LSC=
fi


alias dir="$LS -F $LSC"
alias ls="$LS -F $LSC"
alias ll="$LS -lF $LSC"
alias la="$LS -aF $LSC"
alias lal="$LS -laF $LSC"
alias lr="$LS -ltr $LSC"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias rmrf="/bin/rm -rf"

alias ..="cd .."
alias ..1="cd .."
alias 1..="cd .."
alias ..2="cd ../.."
alias 2..="cd ../.."
alias ..3="cd ../../.."
alias 3..="cd ../../.."
alias ..4="cd ../../../.."
alias 4..="cd ../../../.."
alias ..5="cd ../../../../.."
alias 5..="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias 6..="cd ../../../../../.."

alias du1="du -h -d 1"
alias publicip="curl ifconfig.me"
alias today="date +'%A, %B %d, %Y'"
alias jsonpretty="function _jsonpretty() { python -m json.tool $1; }; _jsonpretty"
alias encrypt="function _encrypt() { openssl enc -aes-256-cbc -pbkdf2 -a -salt -in $1 -out $2; }; _encrypt"
alias decrypt="function _decrypt() { openssl enc -d -aes-256-cbc -pbkdf2 -a -in $1 -out $2; }; _decrypt"

## fzf 
# fzf ctrl-r and alt-c behavior
# requires fdfind/fd, tree/lsd, bat/batcat
export FZF_DEFAULT_COMMAND='fdfind --hidden --exclude ".git"' #requires fd to be installed
#export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
#export FZF_DEFAULT_COMMAND='find . -type f ! -path "*git*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --height=80% --multi --preview-window=:hidden --preview '([[ -f {} ]] && (batcat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (lsd --tree {} | less)) || echo {} 2> /dev/null | head -200' --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008' --prompt='∼ ' --pointer='▶' --marker='✓' --bind '?:toggle-preview' --bind 'ctrl-a:select-all' --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)' --bind 'ctrl-e:execute(echo {+} | xargs -o vim)' --bind 'ctrl-v:execute(code {+})'"
. /usr/share/doc/fzf/examples/key-bindings.bash




# turn on grep color
if [[ $OSTYPE =~ solaris ]]; then
  alias grep="ggrep --color=always"
else
  alias grep="grep --color=always"
fi



