#!/usr/bin/env bash

wal -i ~/Pictures/wallpapers/space.jpg -n -R
feh --bg-fill ~/Pictures/wallpapers/mountain.jpg

xrdb -merge ~/.Xresources

~/.config/rofi/rofi.sh &
~/.config/polybar/polybar.sh &
dunst -config $HOME/.config/dunst/dunstrc &
~/.config/dunst/dunst.sh &
