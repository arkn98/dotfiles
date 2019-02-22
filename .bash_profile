if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tdotty1 ]]; then
  startx
fi
