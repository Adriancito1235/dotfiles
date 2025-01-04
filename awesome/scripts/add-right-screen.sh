#!/bin/zsh

# Detecta y configura la pantalla automáticamente
xrandr --output HDMI-1 --auto --right-of eDP-1

# Recarga AwesomeWM para que reconozca los cambios
awesome-client << EOF
awesome.restart()
EOF
