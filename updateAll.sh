#!/bin/zsh

packages=(
  kitty
  neofetch
  nvim
  wal
  yay
  sway
  wlroots
  wmenu
  i3status
  emacs
)

packages_unused=(
  awesome
  rofi
  hypr
  waybar
  wlogout
  wofi
  helix
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

for element in "${packages_unused[@]}"
do
   if [ -d "/home/$USER/.config/$element" ]; then
    rm -rf "/home/$USER/.config/$element"
    echo "Eliminado $element de .config porque ya no se usa"
   fi
done
