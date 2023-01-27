shopt -s histappend                                                     " append to history instead of overwriting
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"                             " append on each command
HISTSIZE=100000                                                         " max 100,000 lines in history list
HISTFILESIZE=200000                                                     " max 200,000 lines in history
`PS1='\D{%D} \t \[\e[31m\]\u\[\e[m\]@\h:[\[\e[32m\]\W\[\e[m\]]\\$ '`    " custom prompt format
