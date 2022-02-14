#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# run hotkey daemon
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

$HOME/scripts/display.sh &
$HOME/.config/polybar/launch.sh &

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

xsetroot -cursor_name left_ptr &

#run nm-applet &
#run pamac-tray &
run xfce4-power-manager &
numlockx on &

# bluetooth
blueberry-tray &

picom --config $HOME/.config/bspwm/picom.conf &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# start notify deamon
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# set wallpaper
nitrogen --restore &

#run spotify &

#Fix Java gui's
export AWT_TOOLKIT=MToolkit
#wmname compiz &

#Razer Black widow Macro buttons
run blackwidowcontrol &

# Clipboard history
run greenclip daemon &
