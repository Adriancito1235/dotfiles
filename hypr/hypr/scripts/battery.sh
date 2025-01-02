#!/bin/zsh

# Asegúrate de que acpi está instalado
if ! command -v acpi &> /dev/null; then
    echo "Error: acpi no está instalado"
    exit 1
fi

# Obtener información de la batería
battery_info=$(acpi -b)

# Extraer el porcentaje de batería
percentage=$(echo $battery_info | grep -P -o '[0-9]+(?=%)')

# Determinar el estado de carga
charging=$(echo $battery_info | grep -c "Charging")

# Función para mostrar el icono apropiado
get_icon() {
    if [ $charging -eq 1 ]; then
        echo ""  # Icono de carga
    elif [ $percentage -ge 90 ]; then
        echo ""
    elif [ $percentage -ge 75 ]; then
        echo ""
    elif [ $percentage -ge 50 ]; then
        echo ""
    elif [ $percentage -ge 25 ]; then
        echo ""
    else
        echo ""
    fi
}

# Mostrar el icono y el porcentaje
echo "$(get_icon)  $percentage%"
