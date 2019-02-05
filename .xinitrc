#!/bin/sh
#             _       _ _
#       __  _(_)_ __ (_) |_ _ __ ___
#       \ \/ / | '_ \| | __| '__/ __|
#        >  <| | | | | | |_| | | (__
#       /_/\_\_|_| |_|_|\__|_|  \___|


# start some nice programs
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# conky -d -c $HOME/.config/polybar/conky_wrapper
dunst -config $HOME/.config/dunst/dunstrc &
#compton -b --config $HOME/.compton.conf
#nitrogen --restore 2> /dev/null &
#source .local/bin/dwm-status &

exec i3
