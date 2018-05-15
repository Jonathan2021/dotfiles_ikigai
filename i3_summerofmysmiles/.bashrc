#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# set dafault TE
export VISUAL=vim
export EDITOR="$VISUAL"
# pip path
export PATH="${PATH}:${HOME}/.local/bin/"
# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# pywal
(cat ~/.cache/wal/sequences &)

# execute my terminal script
#. ~/dotfiles/scripts/work.sh
#qbitrunning=$(ps aux | grep -w 'qbittorrent' | grep -v grep | awk '{print $2}')
#if [ ! -z "$qbitrunning" ]; then
#fi
#PS1='[\u@\h \W]\$ '

function _update_ps1() {
	# X Terminal titles
	case "$TERM" in
		xterm*|rxvt*)
			#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"
			#PS1="\n\[\e[0;37m\]┌─[\[\e[1;32m\u\e[0;37m\]]──[\e[1;33m\w\e[0;34m]\[\e[0;34m\]\[\e[1;36m\]: \$\[\e[0;37m\]\n|\n\[\e[0;37m\]└────╼ \[\e[1;36m\]>>> \[\e[00;00m\]"
			#PROMPT() {
				_EXIT_STATUS=$?
				[ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR=" \[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]$_EXIT_STATUS\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]"

				_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
				if [ ! $_BRANCH == "" ]
				then
					_BRANCH_STR="[\[$(tput sgr0)\]\[\033[38;5;1m\]$_BRANCH\[$(tput sgr0)\]\[\033[38;5;14m\]]"
				else
					_BRANCH_STR=""
				fi
			#PS1="\n\[\e[0;37m\]┌─[\[\e[1;32m\u\e[0;37m\]]──[\e[1;33m\w\e[0;34m]\[\e[0;34m\]\[\e[1;36m\] $_BRANCH_STR: \$ \[\e[0;37m\]\n|\n\[\e[0;37m\]└────╼ \[\e[1;36m\]>>> \[\e[00;00m\]"

				#PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]╺─╸\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]$_BRANCH_STR\[$(tput sgr0)\]\[\033[38;5;15m\] \n\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR \[$(tput sgr0)\]\[\033[38;5;7m\]>>\[$(tput sgr0)\] "
				PS1='\[\e[1;34m♥ \e[1;33m\w \[\e[1;36m\]\$ '
				unset _EXIT_STATUS_STR
				unset _EXIT_STATUS
				unset _BRANCH_STR
				unset _BRANCH
			#}

			#PROMPT_COMMAND=PROMPT
			;;
		st*)	
			PS1=$(powerline-shell $?)
			;;
		*)
			;;
	esac
    
}

# Function to move to windows partition for work
function movetoworkplace() {
	cd /mnt/work/lz/java_tests/
	cd "$1"
}

# Function to copy pic(s) to wall 
function yp() {
	cp -r "$@" ~/Pictures/.wall
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
	
fi

PATH="/home/ikigai/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ikigai/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ikigai/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ikigai/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ikigai/perl5"; export PERL_MM_OPT;

# go back to previous dir
b() {
    str=""
    count=0
    while [ "$count" -lt "$1" ];
    do
        str=$str"../"
        let count=count+1
    done
    cd $str
}
