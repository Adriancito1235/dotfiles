#!/bin/bash

# Función para obtener el estado de la conexión y la fuerza de la señal
get_network_status() {
    echo "Iniciando verificación de red..." >&2

    # Obtener el nombre de la interfaz Wi-Fi
    interface=$(iwconfig 2>/dev/null | grep -m 1 "IEEE 802.11" | awk '{print $1}')

    echo "Interfaz Wi-Fi detectada: $interface" >&2

    if [ -z "$interface" ]; then
        echo "No se detectó interfaz Wi-Fi" >&2
        echo " No Wi-Fi"
        return
    fi

    # Obtener la fuerza de la señal
    signal_info=$(iwconfig $interface | grep "Link Quality")
    echo "Información de señal: $signal_info" >&2

    if [[ $signal_info =~ Link\ Quality=([0-9]+)/([0-9]+) ]]; then
        signal=${BASH_REMATCH[1]}
        max_signal=${BASH_REMATCH[2]}
        signal_percent=$((signal * 100 / max_signal)) # Convertir a porcentaje
    else
        echo "No se pudo obtener información sobre la señal." >&2
        signal_percent=0
    fi

    echo "Fuerza de la señal: $signal_percent%" >&2

    # Verificar si hay conexión a Internet
    echo "Verificando conexión a Internet..." >&2
    if nmcli networking connectivity check | grep -q "full"; then
        connected=true
        echo "Conexión a Internet: Activa" >&2
    else
        connected=false
        echo "Conexión a Internet: Inactiva" >&2
    fi

    # Mostrar el resultado final
    if $connected; then
        echo "$signal_percent% Connected"
    else
        echo "$signal_percent% No Internet"
    fi
}

# Mostrar el estado de la red
echo "Ejecutando get_network_status..." >&2
result=$(get_network_status)
echo "Resultado final: $result" >&2
echo "$result"
