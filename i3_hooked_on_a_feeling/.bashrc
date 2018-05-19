#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

 Red='\[\e[0;31m\]';  BRed='\[\e[1;31m\]'
 Gre='\[\e[0;32m\]';  BGre='\[\e[1;32m\]'
 Yel='\[\e[0;33m\]';  BYel='\[\e[1;33m\]'
 Blu='\[\e[0;34m\]';  BBlu='\[\e[1;34m\]'
 Mag='\[\e[0;35m\]';  BMag='\[\e[1;35m\]'
 Cya='\[\e[0;36m\]';  BCya='\[\e[1;36m\]'
 Whi='\[\e[0;37m\]';  BWhi='\[\e[1;37m\]'
 None='\[\e[0m\]' # Return to default colour


alias ls='ls --color=auto'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# source the git prompt
gitprompt(){
	git status &> /dev/null
	if [ "$?" == 0 ];then
		gbranch="master"
		gbranch="$(tput bold)$(tput setaf 7)$gbranch"
		c_but_not_p=`git diff --stat origin/master.. | wc -l`

		if [ c_but_not_p != 1 ];then
			((c_but_not_p = c_but_not_p - 1 ))
		fi

		if [ $c_but_not_p == 0 ];then
			c_but_not_p="$(tput bold)$(tput setaf 2)"
		else
			c_but_not_p="$(tput bold)$(tput setaf 7)$c_but_not_p$(tput bold)$(tput setaf 2)↑"
		fi

		c_but_m_before_p=`git diff --name-status | wc -l`
		if [ $c_but_m_before_p -eq 0 ];then
			c_but_m_before_p=""
		else
			c_but_m_before_p="$(tput bold)$(tput setaf 7)$c_but_m_before_p$(tput bold)$(tput setaf 2)✚"
		fi

		untracked=`git ls-files --others --exclude-standard | wc -l`
		if [ $untracked -eq 0 ];then
			untracked=""
		else
			untracked="$(tput bold)$(tput setaf 7)$untracked$(tput bold)$(tput setaf 2)?"
		fi
		# Create a string 
		printf -v PS1RHS "\e[0m \e[0;1;31m%s %s %s %s\e[0m" "$gbranch" "$c_but_not_p" "$c_but_m_before_p" "$untracked"

		# Strip ANSI commands before counting length
		PS1RHS_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"$PS1RHS")

		local Save='\e[s' # Save cursor position
		local Rest='\e[u' # Restore cursor to save point

		# Save cursor position, jump to right hand edge, then go left N columns where
		# N is the length of the printable RHS string. Print the RHS string, then
		# return to the saved position and print the LHS prompt.

		# Note: "\[" and "\]" are used so that bash can calculate the number of
		# printed characters so that the prompt doesn't do strange things when
		# editing the entered text.
		
		# ensure that this PS1 and corresponding ANSI Seq's are closed properly
		PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		export PS1="\[${Save}\e[${COLUMNS}C\e[${#PS1RHS_stripped}D${PS1RHS}${Rest}\]${PS1}"

	else
		export PS1='\[\e[0;31m\]♥ \e[0;31m\]\W \[\e[1;33m\]\$\[\e[0m\] '
		gbranch=""
	fi
}
#PROMPT_COMMAND='printf "\\e[38;5;7m%$((COLUMNS - 5))s%(%l:%M)T\\e[0m\\r"'
#PROMPT_COMMAND='__git_ps1 \\e[38;5;2m "$c_but_not_p" "$c_but_m_before_p"\\e[1m\\r' 

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

PROMPT_COMMAND="gitprompt"

function _update_ps1() {
	# X Terminal titles
	case "$TERM" in
		xterm*|rxvt*)
			PROMPT_COMMAND="gitprompt"
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
#PS1='\u@\h:\w (\[\e[32m\]$\[\e[0m\])\$ '
TERM=rxvt-unicode-256color
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
