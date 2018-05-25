#!/bin/bash
bgco=`xrdb -query | grep foreground | tail -n 1 | awk '{print $2}'`
tmux set -g status-bg "#f7f7f9"
tmux set -g pane-border-fg "#f7f7f9"
tmux set -g pane-active-border-fg "#f7f7f9"
tmux set -g pane-active-border-bg "#f7f7f9"
