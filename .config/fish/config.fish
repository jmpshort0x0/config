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

