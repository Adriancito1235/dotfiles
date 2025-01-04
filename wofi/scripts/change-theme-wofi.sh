#!/bin/bash

wallpaper_dir="$HOME/Pictures/wallpapers"

preview_and_select() {
    selected=$(ls "$wallpaper_dir" | wofi --dmenu -p "Select wallpaper")
    
    if [ -n "$selected" ]; then
        full_path="$wallpaper_dir/$selected"
        feh --scale-down --auto-zoom --geometry 800x600 --title "Preview - Close this window when ready" "$full_path" &
        feh_pid=$!
        
        zenity_text="<span font='14' weight='bold'>¿Deseas aplicar este wallpaper?</span>\n\n<i>Nombre del archivo:</i> <span color='#3498db'>$selected</span>"
        
        if zenity --question \
                  --text="${zenity_text}" \
                  --title="Confirmar Cambio de Wallpaper" \
                  --ok-label="Aplicar" \
                  --cancel-label="Cancelar" \
                  --width=400 \
                  --height=150 \
                  --window-icon="preferences-desktop-wallpaper" \
                  --no-wrap; then
            kill $feh_pid 2>/dev/null
            echo "$full_path"
            return 0
        else
            kill $feh_pid 2>/dev/null
            preview_and_select
            return
        fi
    else
        echo ""
        return 1
    fi
}

full_path=$(preview_and_select)

if [ -n "$full_path" ]; then
    echo "Path completo de la imagen seleccionada: $full_path"
    
    # Modificar el contenido de active_background
    echo "\$active-background = $full_path" > ~/.config/hypr/active-bg.conf
        
    # Cambiar el fondo con swww y generar esquema de colores con pywal
    swww img "$full_path" && wal -i "$full_path"
    
    # Reload all
    ~/.config/hypr/scripts/reload-all.sh
else
    echo "No se seleccionó ningún wallpaper."
    exit 1
fi
