#!/usr/bin/env bash

#wal -i ~/Pictures/wallpapers/newyork.jpg -n -R
feh --bg-fill ~/Pictures/wallpapers/newyork.jpg

xrdb -merge ~/.Xresources

~/.config/rofi/rofi.sh &
~/.config/polybar/polybar.sh &
dunst -config $HOME/.config/dunst/dunstrc &
~/.config/dunst/dunst.sh &
