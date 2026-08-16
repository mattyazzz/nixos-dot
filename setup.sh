#!/usr/bin/env bash

# este script esta hecho para crear symlinks, archivos y carpetas necesarias,
# para que el sistema funcione correctamente, ademas de instalar paquetes necesarios

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "creando symlinks y carpetas necesarias..."
echo "quieres continuar? (y/n)"
read answer

if [ "$answer" = "y" ]; then
    echo "creando carpeta ~/.config"

    mkdir -p ~/.config

    echo "eliminando configuraciones viejas/dots viejos para evitar conflictos"

    rm -rf ~/.config/kitty
    echo "kitty eliminado"
    rm -rf ~/.config/nvim
    echo "nvim eliminado"
    rm -rf ~/.config/qtile
    echo "qtile eliminado"
    rm -rf ~/.config/waybar
    echo "waybar eliminado"

    echo "esperando..."
    sleep 0.5

    echo "carpetas eliminadas, creando symlinks..."

    ln -s "${SCRIPT_DIR}/mydots/kitty" ~/.config/
    ln -s "${SCRIPT_DIR}/mydots/nvim" ~/.config/
    ln -s "${SCRIPT_DIR}/mydots/qtile" ~/.config/
    ln -s "${SCRIPT_DIR}/mydots/waybar" ~/.config/

    echo "symlinks creados!"
else
    echo "operacion cancelada."
fi

echo "deseas agregar flathub? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo " agregando repositorio flathub..."

    flatpak add-repo --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    echo "repositorio agregado"

else
    echo "flathub no agregado"
fi

echo "todo listo, puedes continuar"





