#!/bin/zsh

# Función para escribir en el log
_writeLog() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> /tmp/cleanup.log
}

# Crear archivo de plataforma si no existe
platform_file="$HOME/.config/cleanup/settings/platform.sh"
if [ ! -f "$platform_file" ]; then
    mkdir -p "$(dirname "$platform_file")"
    echo "$install_platform" > "$platform_file"
    _writeLog "platform.sh creado con $install_platform"
fi

# Crear archivo de caché de wallpaper si no existe
cache_file="$HOME/.config/cleanup/cache/current_wallpaper"
if [ ! -f "$cache_file" ]; then
    mkdir -p "$(dirname "$cache_file")"
    echo "$HOME/wallpaper/default.jpg" > "$cache_file"
    _writeLog "Archivo de caché de wallpaper creado"
fi

# Activar servicios necesarios
for service in NetworkManager bluetooth; do
    if ! systemctl is-active --quiet $service; then
        sudo systemctl enable --now $service
        _writeLog "$service.service activado"
    fi
done

# Eliminar archivos o directorios obsoletos
obsolete_files=(
    "$HOME/dotfiles/hypr/settings"
    "$HOME/.local/share/applications/cleanup-welcome.desktop"
    "$HOME/.local/share/applications/cleanup-dotfiles-settings.desktop"
    "$HOME/.local/share/applications/cleanup-hyprland-settings.desktop"
)

for file in "${obsolete_files[@]}"; do
    if [ -e "$file" ]; then
        rm -rf "$file"
        _writeLog "Eliminado: $file"
    fi
done

# Actualizar directorios de usuario
xdg-user-dirs-update
_writeLog "Limpieza completada"
