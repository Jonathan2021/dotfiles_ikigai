#
# ~/.bashrc
#

case $- in
    *i*) ;;
      *) return;;
esac

alias ls='ls --color=auto'

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Store 1k history entries
HISTSIZE=1000
HISTFILESIZE=2000

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__docker_machine_ps1)\$'
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__docker_machine_ps1)\$ '
#fi

unset force_color_prompt

function _update_ps1() {

    _EXIT_STATUS=$?
    if [ "$color_prompt" = yes ]; then
        WHITE=$'\033[38;5;7m'
        CYAN=$'\033[38;5;6m'
        ICYAN=$'\033[38;5;14m'
        RED=$'\033[38;5;1m'
        NORMAL=$'\[$(tput sgr0)\]'
        IGREEN=$'\033[38;5;10m'
        BLUE=$'\033[38;5;4m'
        YELLOW=$'\033[38;5;3m'
        MAGENTA=$'\033[38;5;5m'
        _BLD=$'\033[1m'
    else
        WHITE=""
        CYAN=""
        ICYAN=""
        RED=""
        NORMAL=""
        IGREEN=""
        BLUE=""
        YELLOW=""
        MAGENTA=""
    fi

	# X Terminal titles
	case "$TERM" in
		xterm*|rxvt*)
                                if [ $_EXIT_STATUS -ne 0 ]
                                then
                                    _EXIT_STATUS_STR="$CYAN($RED$_EXIT_STATUS$CYAN)"
                                else
                                    _EXIT_STATUS_STR=""
                                fi
				_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
				if [ ! $_BRANCH == "" ]
				then
					_BRANCH_STR="$CYAN[$RED$_BRANCH$CYAN]"
				else
					_BRANCH_STR=""
				fi
                                if [ ! $CONDA_DEFAULT_ENV == "" ]
                                then
                                    _CONDA_ENV_STR="$CYAN($RED$CONDA_DEFAULT_ENV$CYAN)"
                                else
                                    _CONDA_ENV_STR=""
                                fi
                                if [ ! $VIRTUAL_ENV == "" ]
                                then
                                    _VIRTUALENV_STR="$CYAN($RED${VIRTUAL_ENV##*/}$CYAN)"
                                else
                                    _VIRTUALENV_STR=""
                                fi
                                PS1="$_EXIT_STATUS_STR\n$WHITE┌─${debian_chroot:+($debian_chroot)}$_CONDA_ENV_STR$_VIRTUALENV_STR$WHITE[$_BLD$IGREEN\u$NORMAL$WHITE]──$BLUE[$YELLOW\w$BLUE]$_BRANCH_STR$MAGENTA: \$$WHITE\n|\n└────╼ $ICYAN>>> $NORMAL \[\e[00;00m\]"

				unset _EXIT_STATUS_STR
				unset _EXIT_STATUS
				unset _BRANCH_STR
				unset _BRANCH
                                unset _CONDA_ENV_STR
                                unset WHITE
                                unset CYAN
                                unset ICYAN
                                unset RED
                                unset NORMAL
                                unset IGREEN
                                unset YELLOW
                                unset MAGENTA
                                unset _BLD
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

# Function to copy pic(s) to wall 
#function yp() {
#	cp -r "$@" ~/Pictures/.wall
#}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
	
fi

PATH="/home/${USER}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/${USER}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/${USER}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/${USER}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/${USER}/perl5"; export PERL_MM_OPT;

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


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

set -o vi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jonathan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jonathan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jonathan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jonathan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export LD_LIBRARY_PATH=~/.mujoco/mjpro150/bin/
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

#Kaggle stuff
export KAGGLE_USERNAME=jonathansands
export KAGGLE_KEY=3647800bf76f69ff3e71e3d38f0c049f

# Jena
export JENA_HOME="$HOME/3rdParty/apache-jena-3.17.0"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias protege="~/3rdParty/Protege-5.5.0/run.sh"
