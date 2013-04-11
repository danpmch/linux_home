#!/bin/sh

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/truetype
xset fp rehash

conky | while read -r; do 
  xsetroot -name "$REPLY"; 
done &

tilda &
feh --no-xinerama --bg-fill ~/pictures/viper.jpg &

exec dwm
