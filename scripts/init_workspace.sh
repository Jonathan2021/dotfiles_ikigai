#!/bin/bash

# https://github.com/yedhink
# Feel free to share with your friends

# install wmctrl. Its a prerequisite to make this script work.

# Launch it in your i3 config file
# exec --no-startup-id ~/.config/i3/init_workspace.sh
#
# obviously, make it executable : # chmod +x init_workspace.sh
# HAVE FUN !
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
# App you want to start :

apps=(
 "i3-sensible-terminal -e $SCRIPTPATH/genericscripttobash $SCRIPTPATH/sysinfo.sh"
 "i3-sensible-terminal -e $SCRIPTPATH/genericscripttobash $SCRIPTPATH/neostart.sh"
 "chromium"
)

# Which workspace to assign your wanted App :
workspaces=(
"1"
"1"
"2: Browser"
)

# counter of opened windows
owNB=0

# add paths of apps to array
#arr=()
#arr+=( '/usr/bin/' )

for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ] # wait before start other programs
    do
        owNB=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done

    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    #${arr[$iwin]}/
    ${apps[$iwin]} & # start the wanted app
done

# APPS with a designated workspace
apps=(
 "spotify"
)

for app in ${apps[@]}; do
   ${app}
done

####### ABSOLUTELY OPTIONAL ########
## inject message(s) into terminal (first one created : /dev/pts/0)


