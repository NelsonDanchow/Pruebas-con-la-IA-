#!/bin/bash

# Menú Principal de Toma de Stock - Pruebas con la IA
clear
while true; do
    echo "============================================"
    echo "   SISTEMA DE TOMA DE STOCK - MENÚ PRINCIPAL"
    echo "   $(date)"
    echo "============================================"
    echo ""
    echo "1) Toma de Stock Básica"
    echo "2) Toma de Stock Avanzada"
    echo "3) Toma de Stock Profesional"
    echo "4) Toma de Stock con Histórico"
    echo "5) Ver todos los scripts disponibles"
    echo "6) Salir"
    echo ""
    read -p "Seleccione una opción (1-6): " opcion

    case $opcion in
        1) ./toma-stock-basica.sh ;;
        2) ./toma-stock-avanzada.sh ;;
        3) ./toma-stock-pro.sh ;;
        4) ./toma-stock-historico.sh ;;
        5)
            echo -e "\nScripts disponibles en bash:"
            ls -1 *.sh 2>/dev/null || echo "No hay scripts en esta carpeta"
            ;;
        6)
            echo "¡Gracias por usar el Sistema de Toma de Stock!"
            exit 0
            ;;
        *)
            echo "❌ Opción inválida. Intente nuevamente."
            ;;
    esac

    echo -e "\nPresione Enter para continuar..."
    read
    clear
done
