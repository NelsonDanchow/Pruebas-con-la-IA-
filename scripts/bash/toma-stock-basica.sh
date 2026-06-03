#!/bin/bash

# Toma de Stock Básica - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d %H:%M")
ARCHIVO_STOCK="stock_actual.txt"

echo "============================================"
echo "       TOMA DE STOCK - $(date)"
echo "============================================"

# Si no existe el archivo, creamos uno de ejemplo
if [ ! -f "$ARCHIVO_STOCK" ]; then
    echo "Producto,Cantidad,Precio" > "$ARCHIVO_STOCK"
    echo "Mouse,15,25.50" >> "$ARCHIVO_STOCK"
    echo "Teclado,8,45.00" >> "$ARCHIVO_STOCK"
    echo "Monitor,5,180.00" >> "$ARCHIVO_STOCK"
    echo "✅ Archivo de stock inicial creado."
fi

echo -e "\nStock actual:"
cat "$ARCHIVO_STOCK" | column -t -s ","

echo -e "\nResumen:"
TOTAL_PRODUCTOS=$(wc -l < "$ARCHIVO_STOCK")
TOTAL_PRODUCTOS=$((TOTAL_PRODUCTOS-1))
echo "Productos registrados: $TOTAL_PRODUCTOS"

echo "============================================"
echo "Toma de stock guardada: $ARCHIVO_STOCK"
echo "Script hecho por Nelson con Grok 🚀"
