#!/bin/zsh

packages=(
  hypr
  kitty
  neofetch
  nvim
  wal
  waybar
  wlogout
  wofi
  yay
  awesome
  rofi
)

for element in "${packages[@]}"
do
  cp -r "/home/$USER/.config/$element" "/home/$USER/dotfiles/$element"
done
