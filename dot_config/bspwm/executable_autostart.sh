#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# run hotkey daemon
run sxhkd &

$HOME/scripts/display.sh &
$HOME/.config/polybar/launch.sh &

# theme
run xsettingsd &

# bluetooth
#blueberry-tray &

#picom --config $HOME/.config/bspwm/picom.conf &
# picom --config ~/.config/picom/blur.conf &
compfy -b &

# auth
if ! pgrep cmd-polkit-agen ;
then
  rofi-polkit-agent &
fi

# start notify deamon
run dunst &

# set wallpaper
nitrogen --restore &
#randomWallpaper &

#run spotify &

#Fix Java gui's
#export AWT_TOOLKIT=MToolkit
#wmname compiz &

#Razer Black widow Macro buttons
run blackwidowcontrol &

# Clipboard history
run greenclip daemon &
