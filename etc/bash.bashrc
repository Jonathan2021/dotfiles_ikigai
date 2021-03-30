#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt for the legends
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
	export PS1='mighty ϟϟϟ root ⟶'
fi

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|i3-sensible-terminal)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac
if (( $UID == 0 )); then
	if [[ $TERM == rxvt* ]]; then
		clear;
		cat /home/jonathan/dotfiles_ikigai/text/suTXT | figlet -f /home/jonathan/dotfiles_ikigai/figlet-fonts/3d.flf -t -W | nms | lolcat 
		echo
	else
		clear;
		cat /home/jonathan/dotfiles_ikigai/text/suTXT | figlet -f /home/jonathan/dotfiles_ikigai/figlet-fonts/3d.flf -t -W | nms | lolcat 
		echo
	fi	
fi
