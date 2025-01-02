#!/bin/zsh

wallpaper="$1"


# Obtener la ruta completa del wallpaper usando find
full_path=$(readlink -f "$1")

echo " Path completo de la imagen seleccionada $full_path";


# Modificar el contenido de active_background por path completo del fondo seleccionado
echo "\$active-background = $full_path" > ~/.config/hypr/active-bg.conf

# Cambiar el fondo con swww y generar esquema de colores con pywal
swww img "$full_path" && wal -i "$full_path"



# Reload all
~/.config/hypr/scripts/reload-all.sh
