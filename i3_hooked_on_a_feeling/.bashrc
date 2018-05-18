#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# source the git prompt
if [ -f ~/.git-prompt.sh ]; then
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUNTRACKEDFILES=true
#PROMPT_COMMAND='printf "\\e[38;5;7m%$((COLUMNS - 5))s%(%l:%M)T\\e[0m\\r"'
PROMPT_COMMAND='__git_ps1 "\\e[38;5;2m%$((COLUMNS))s\\e[1m\\r"' 
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
#(cat ~/.cache/wal/sequences &)

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

			#PROMPT_COMMAND=PROMPT
			;;
		st*)	
			PS1=$(powerline-shell $?)
			;;
		*)
			;;
	esac

}

# Prompt
#PROMPT_COMMAND='printf "\\e[38;5;7m%$((COLUMNS - 5))s%(%l:%M)T\\e[0m\\r"'
PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
#PS1='\u@\h:\w (\[\e[32m\]$\[\e[0m\])\$ '
TERM=rxvt-unicode-256color
export PS1
export TERM
# Function to move to windows partition for work
function movetoworkplace() {
	cd /mnt/work/lz/java_tests/
	cd "$1"
}

# Function to gradient wallpaper 
function gw() {
	col1=$(echo "#""$2")
	col2=$(echo "#""$3")
	if [ $# -eq 4 ]
	then
		col3=$(echo "#""$4")
		hsetroot -add "$col1" -add "$col2" -add "$col3" -gradient $1
	else
		hsetroot -add "$col1" -add "$col2" -gradient $1
	fi
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
