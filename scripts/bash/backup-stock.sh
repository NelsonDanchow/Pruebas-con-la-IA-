#!/bin/bash

# Backup + Stock - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d_%H-%M")
BACKUP_DIR="$HOME/Backups/Stock"
STOCK_DIR="$HOME/Pruebas-con-la-IA"

echo "============================================"
echo "   BACKUP + TOMA DE STOCK"
echo "   $FECHA"
echo "============================================"

# Crear carpeta de backups
mkdir -p "$BACKUP_DIR"

echo "→ Realizando backup del sistema de stock..."

tar -czf "$BACKUP_DIR/stock_backup_$FECHA.tar.gz" \
    "$STOCK_DIR/stock_actual.txt" \
    "$STOCK_DIR/historial_tomas.log" \
    "$STOCK_DIR/historial_stock.log" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ Backup completado exitosamente!"
    echo "   Archivo: stock_backup_$FECHA.tar.gz"
    ls -lh "$BACKUP_DIR" | tail -n 3
else
    echo "⚠️  No se encontraron todos los archivos de stock."
fi

echo -e "\n¿Desea realizar una nueva Toma de Stock ahora? (s/n)"
read -p "→ " respuesta

if [[ $respuesta == "s" || $respuesta == "S" ]]; then
    echo -e "\nIniciando Toma de Stock Profesional...\n"
    "$STOCK_DIR/scripts/bash/toma-stock-pro.sh"
fi

echo "============================================"
echo "Operación finalizada. ¡Buen trabajo! 🚀"
