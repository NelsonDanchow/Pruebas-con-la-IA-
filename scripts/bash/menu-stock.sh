#!/bin/bash

# Menú Principal Profesional - Sistema de Toma de Stock
BASE_DIR="../../"  # Subir dos niveles para llegar a la raíz del proyecto

clear

while true; do
    echo "============================================"
    echo "   SISTEMA DE GESTIÓN DE STOCK"
    echo "   Desarrollado por Nelson Danchow"
    echo "   $(date)"
    echo "============================================"
    echo ""
    echo "1) Toma de Stock Básica"
    echo "2) Toma de Stock Avanzada"
    echo "3) Toma de Stock Profesional"
    echo "4) Toma de Stock con Histórico"
    echo "5) Backup Rápido del Proyecto"
    echo "6) Ver todos los scripts"
    echo "7) Salir"
    echo "----------------------------------------"
    read -p "→ Seleccione una opción: " opcion

    case $opcion in
        1) $BASE_DIR/scripts/bash/toma-stock-basica.sh ;;
        2) $BASE_DIR/scripts/bash/toma-stock-avanzada.sh ;;
        3) $BASE_DIR/scripts/bash/toma-stock-pro.sh ;;
        4) $BASE_DIR/scripts/bash/toma-stock-historico.sh ;;
        5) $BASE_DIR/backup-rapido.sh ;;
        6)
            echo -e "\n📜 Scripts disponibles en bash:"
            ls -1 $BASE_DIR/scripts/bash/*.sh | xargs -n 1 basename | cat -n
            ;;
        7)
            echo "¡Gracias por usar el Sistema de Gestión de Stock!"
            echo "Hasta la próxima 🚀"
            exit 0
            ;;
        *)
            echo "❌ Opción inválida. Inténtelo nuevamente."
            ;;
    esac

    echo -e "\nPresione [Enter] para volver al menú..."
    read
    clear
done
