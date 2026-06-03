#!/bin/bash

# Toma de Stock Avanzada - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d %H:%M")
ARCHIVO_STOCK="stock_actual.txt"
ARCHIVO_HISTORIAL="historial_stock.txt"

echo "============================================"
echo "       TOMA DE STOCK AVANZADA"
echo "       $FECHA"
echo "============================================"

# Crear archivo si no existe
if [ ! -f "$ARCHIVO_STOCK" ]; then
    echo "Producto,Cantidad,Precio,Fecha" > "$ARCHIVO_STOCK"
    echo "✅ Archivo de stock creado por primera vez."
fi

echo -e "\n1) Ver stock actual"
echo "2) Agregar nuevo producto"
echo "3) Registrar toma de stock"
echo "4) Salir"
read -p "Selecciona una opción (1-4): " opcion

case $opcion in
    1)
        echo -e "\nStock Actual:"
        cat "$ARCHIVO_STOCK" | column -t -s ","
        ;;
    2)
        read -p "Nombre del producto: " producto
        read -p "Cantidad: " cantidad
        read -p "Precio unitario: " precio
        echo "$producto,$cantidad,$precio,$FECHA" >> "$ARCHIVO_STOCK"
        echo "✅ Producto agregado correctamente."
        ;;
    3)
        echo "Registrando nueva toma de stock..."
        cp "$ARCHIVO_STOCK" "$ARCHIVO_HISTORIAL" 2>/dev/null
        echo "📊 Toma de stock guardada en historial."
        ;;
    4)
        echo "Saliendo... ¡Hasta la próxima toma de stock!"
        exit 0
        ;;
    *)
        echo "❌ Opción inválida."
        ;;
esac

echo "============================================"
echo "Script creado por Nelson con Grok 🚀"
