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

exists lsd && LS=lsd && LSC=

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

alias du1='du -h -d 1'
alias publicip='curl ifconfig.me'
alias today='date +"%A, %B %d, %Y"'
alias jsonpretty='function _jsonpretty() { python -m json.tool $1; }; _jsonpretty'
alias encrypt='function _encrypt() { openssl enc -aes-256-cbc -pbkdf2 -a -salt -in $1 -out $2; }; _encrypt'
alias decrypt='function _decrypt() { openssl enc -d -aes-256-cbc -pbkdf2 -a -in $1 -out $2; }; _decrypt'


if [[ $OSTYPE =~ solaris ]]; then
  alias grep="ggrep --color=always"
else
  alias grep="grep --color=always"
fi
