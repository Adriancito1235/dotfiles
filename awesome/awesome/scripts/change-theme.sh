#!/bin/zsh

wallpaper="$1"

# Obtener la ruta completa del wallpaper usando find
full_path=$(readlink -f "$1")

echo " Path completo de la imagen seleccionada $full_path";

# Modificar el contenido de active_background por path completo del fondo seleccionado
echo "$full_path" > ~/.config/awesome/active-bg.conf

# Cambiar el fondo con swww y generar esquema de colores con pywal
wal -i "$full_path"

# Emitir señal para actualizar el fondo en Awesome WM
awesome-client "awesome.emit_signal('wallpaper::update')"

# Mostrar notificación
awesome-client << EOF
local naughty = require("naughty")
naughty.notify({
    title = "Tema cambiado",
    text = "El fondo de escritorio y los colores han sido actualizados",
    timeout = 5
})
EOF
