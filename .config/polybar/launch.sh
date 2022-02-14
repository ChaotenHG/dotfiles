#!/bin/bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set theme for polybar (folder name)
theme="blury"

$HOME/.config/polybar/theme/$theme/launch.sh &
