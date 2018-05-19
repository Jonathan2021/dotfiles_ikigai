#!/bin/bash

#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ ikigai 
# ░▓ code   ▓ https://github.com/yedhink/dotfiles_ikigai
# ░▓ 	    ▓ 
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
# THIS IS A CUSTOM PROMPT THAT I MADE. 
# TRIED TO MIMICK THE OH-MY-ZSH TERMINALPARTY THEME
# NOT FULLY FUNCTIONAL. BUT THE BARE NECESSECITIES ARE PRESENT
# I SHALL CALL THIS "BASH-GIT-PARTY-PROMPT"
	gbranch="master"
	gbranch="$(tput bold)$(tput setaf 7)$gbranch"
	c_but_not_p=`git diff --stat origin/master.. | wc -l`

	if [ $c_but_not_p -gt 0 ];then
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
