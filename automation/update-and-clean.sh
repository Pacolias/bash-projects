  GNU nano 7.2                                                                   update-and-clean                                                                            
#!/bin/bash

# --- DEFINICIÓN DE COLORES ---
# \e[1;36m = Cyan Negrita (Para los títulos)
# \e[1;32m = Verde Negrita (Para éxito)
# \e[1;31m = Rojo Negrita (Para avisos/errores)
# \e[1;35m = Magenta (Para notas informativas)
# \e[0m    = Reset (Vuelve al color normal)

COLOR_TITULO="\e[1;36m"
COLOR_EXITO="\e[1;32m"
COLOR_AVISO="\e[1;33m" # Amarillo
COLOR_NOTA="\e[1;35m"
RESET="\e[0m"

if [ "$EUID" -ne 0 ]; then
        exec sudo "$0" "$@"
fi

set -e

echo -e "${COLOR_TITULO}--- 1. Actualizando lista de repositorios ---${RESET}"
sudo apt update

echo -e "${COLOR_TITULO}--- 2. Realizando actualizacion completa del sistema ---${RESET}"
sudo apt full-upgrade -y

echo -e "${COLOR_TITULO}--- 3. Eliminando dependencias huerfanas ---${RESET}"
sudo apt autoremove

echo -e "${COLOR_TITULO}--- 4. Limpiando cache de paquetes ---${RESET}"
sudo apt clean

echo -e "${COLOR_TITULO}--- 5. Buscando y purgando configuraciones residuales ---${RESET}"
RESIDUAL_CONFIGS=$(dpkg -l | awk '/^rc/ { print $2}')

if [ -n "$RESIDUAL_CONFIGS" ]; then
        echo -e "${COLOR_AVISO}Purgando: $RESIDUAL_CONFIGS${RESET}"
        sudo apt purge -y $RESIDUAL_CONFIGS
else
        echo -e "${COLOR_NOTA}No hay archivos de configuracion residuales para eliminar${RESET}"
fi

echo -e "${COLOR_EXITO}--- ¡Mantenimiento completado con exito! ---${RESET}"
