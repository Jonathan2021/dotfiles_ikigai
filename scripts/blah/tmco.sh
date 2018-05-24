#!/bin/bash
bgco=`xrdb -query | grep background | tail -n 1 | awk '{print $2}'`
tmux set -g status-bg "$bgco"
tmux set -g pane-border-fg "$bgco"
tmux set -g pane-active-border-fg "$bgco"
tmux set -g pane-active-border-bg "$bgco"
