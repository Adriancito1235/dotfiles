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
  if [ -d "/home/$USER/.config/$element" ]; then
    # Si existe en .config, copiarlo a dotfiles
    rsync -a --delete "/home/$USER/.config/$element/" "/home/$USER/dotfiles/$element/"
    echo "Sincronizado $element de .config a dotfiles"
  elif [ -d "/home/$USER/dotfiles/$element" ]; then
    # Si no existe en .config pero sí en dotfiles, crear un enlace simbólico
    ln -sf "/home/$USER/dotfiles/$element" "/home/$USER/.config/"
    echo "Creado enlace simbólico de $element desde dotfiles a .config"
  else
    echo "No se encontró $element ni en .config ni en dotfiles"
  fi
done
