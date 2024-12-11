#!/bin/zsh

# Obtener el nombre de usuario
username=$(whoami)

# Obtener el nombre del host
hostname=$(hostname)

# Obtener el nombre completo del usuario (si está disponible)
fullname=$(getent passwd $username | cut -d: -f5 | cut -d, -f1)

# Si el nombre completo está vacío, usa el nombre de usuario
if [ -z "$fullname" ]; then
    fullname=$username
fi

# Mostrar la información
echo "$fullname@$hostname"
