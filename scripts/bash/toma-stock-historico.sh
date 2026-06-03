#!/bin/bash

# Toma de Stock con Histórico - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d %H:%M")
STOCK_FILE="stock_actual.txt"
HISTORIAL_FILE="historial_stock.log"

echo "============================================"
echo "   TOMA DE STOCK CON HISTÓRICO"
echo "   $FECHA"
echo "============================================"

# Crear archivos si no existen
if [ ! -f "$STOCK_FILE" ]; then
    echo "Producto,Cantidad,Precio" > "$STOCK_FILE"
fi

echo -e "\nStock Actual:"
cat "$STOCK_FILE" | column -t -s ","

echo -e "\nOpciones:"
echo "1) Agregar producto"
echo "2) Registrar nueva toma (guardar en historial)"
echo "3) Ver historial de tomas"
echo "4) Salir"
read -p "→ " opcion

case $opcion in
    1)
        read -p "Nombre del producto: " prod
        read -p "Cantidad: " cant
        read -p "Precio: " precio
        echo "$prod,$cant,$precio" >> "$STOCK_FILE"
        echo "✅ Producto agregado."
        ;;
    2)
        echo "Registrando nueva toma de stock..."
        echo "=== TOMA - $FECHA ===" >> "$HISTORIAL_FILE"
        cat "$STOCK_FILE" >> "$HISTORIAL_FILE"
        echo "" >> "$HISTORIAL_FILE"
        echo "📊 Toma guardada en historial."
        ;;
    3)
        echo -e "\nHistorial de Tomas:"
        if [ -f "$HISTORIAL_FILE" ]; then
            cat "$HISTORIAL_FILE"
        else
            echo "Aún no hay tomas registradas."
        fi
        ;;
    4)
        echo "¡Hasta la próxima!"
        exit 0
        ;;
    *)
        echo "Opción inválida."
        ;;
esac

echo "============================================"
