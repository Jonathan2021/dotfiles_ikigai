#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
#feh --bg-fill ~/Pictures/.wall/1.jpg
#nohup bash ~/dotfiles/scripts/traverse_wall.sh 2> nohup.err < /dev/null &
nohup bash ~/dotfiles/scripts/lockscreen.sh 2> nohup.err < /dev/null &
# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

exec i3
amixer sset Master unmute
xrandr --dpi 72
#exec --no-startup-id betterlockscreen -u ~/Pictures/coconut_trees.jpg -r 1366x768 -b 0.5
#exec --no-startup-id betterlockscreen -w
#exec --no-startup-id ~/.config/i3/init_workspace.sh
