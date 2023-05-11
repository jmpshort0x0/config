if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR vim

function fish_prompt

	if [ $(id -u) -eq 0 ]
		set isRoot "💀"
		set prefix_color "red"
		set suffix "# "
	else
		set isRoot "@"	
		set prefix_color "green"
		set suffix "\$ "
	end


#	printf '%s%s%s %s%s%s > ' (set_color $prefix_col) $USER $isRoot $hostname (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)	

	set_color $prefix_color
	printf '%s%s%s ' $USER $isRoot $hostname

	set_color white
	printf '['

	set_color yellow 
	printf '%s' (prompt_pwd)

	set_color white
	printf ']'
	
	set_color normal
	printf '%s ' $suffix
end

#function fish_right_prompt -d "Write out the right prompt"
function fish_right_prompt 
    date '+%m/%d/%y %H:%M'
end

function ls;     lsd -F $argv;          end
function ll;     lsd -lF $argv;         end
function la;     lsd -aF $argv;         end
function lal;    lsd -laF $argv;        end


function rmrf
    read -p 'set_color red; echo -n "Dude, really? [y|n] "; set_color normal' input
    if [ $input = 'y' -o $input = 'Y' ]
	set_color yellow; echo "OK, you asked for it!"; set_color normal
	set_color green; echo "Blowing away: $argv"; set_color normal
	/bin/rm -rf $argv
    end
end


#utilizing fzf
## https://github.com/SidOfc/dotfiles/tree/e94b96b908479950186e42a3709511a0afe300e4/.config/fish/functions
function kp --description "Kill processes"
  set -l __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  set -l __kp__kc $argv[1]

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end

function kp --description "Kill processes"
  set -l __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  set -l __kp__kc $argv[1]

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end

function ks --description "Kill http server processes"
  set -l __ks__pid (lsof -Pwni tcp | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:tcp]'" | awk '{print $2}')
  set -l __ks__kc $argv[1]

  if test "x$__ks__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__ks__pid | xargs kill $argv[1]
    else
      echo $__ks__pid | xargs kill -9
    end
    ks
  end
end

function reload --description "Reload fish shell"
  if contains -- -f $argv
    set -e __initialized
  end
  source ~/.config/fish/config.fish
end
