shopt -s histappend                                                     # append to history instead of overwriting
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"                             # append on each command
HISTTIMEFORMAT="%F %T "                                                 # add timestamp to history
HISTSIZE=100000                                                         # max 100,000 lines in history list
HISTFILESIZE=200000                                                     # max 200,000 lines in history

# change user prompt if root
if [ $(id -u) -eq 0 ]; then
	PS1='\D{%D} \t \e[31m\u\e[m💀\h:[\e[33m\W\e[m]\e[31m#\e[m '
else
	PS1='\D{%D} \t \e[32m\u\e[m@\h:[\e[33m\W\e[m]\e[32m\$\e[m '
fi
