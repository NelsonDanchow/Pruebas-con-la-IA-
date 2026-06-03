#!/bin/bash

# Toma de Stock Profesional - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
STOCK_FILE="stock_actual.txt"
HISTORIAL_FILE="historial_tomas.log"

clear
echo "============================================"
echo "   TOMA DE STOCK PROFESIONAL"
echo "   $FECHA"
echo "============================================"

# Inicializar archivo si no existe
if [ ! -f "$STOCK_FILE" ]; then
    echo "Producto,Cantidad,Precio,Última_Actualización" > "$STOCK_FILE"
    echo "✅ Archivo de stock inicializado."
fi

echo -e "\nStock Actual:"
if [ -s "$STOCK_FILE" ]; then
    cat "$STOCK_FILE" | column -t -s ","
else
    echo "No hay productos registrados aún."
fi

echo -e "\nMenú Principal:"
echo "1) Agregar / Actualizar producto"
echo "2) Registrar Toma de Stock (Guardar Historial)"
echo "3) Ver Historial de Tomas"
echo "4) Salir"
read -p "Seleccione una opción (1-4): " opcion

case $opcion in
    1)
        read -p "Nombre del producto: " producto
        read -p "Cantidad actual: " cantidad
        read -p "Precio unitario: " precio
        
        # Eliminar si ya existe y agregar actualizado
        grep -v "^$producto," "$STOCK_FILE" > temp_stock.txt 2>/dev/null
        echo "$producto,$cantidad,$precio,$FECHA" >> temp_stock.txt
        mv temp_stock.txt "$STOCK_FILE"
        echo "✅ Producto actualizado/agregado correctamente."
        ;;
    2)
        echo "Registrando nueva toma de stock..."
        echo "=== TOMA DE STOCK - $FECHA ===" >> "$HISTORIAL_FILE"
        cat "$STOCK_FILE" >> "$HISTORIAL_FILE"
        echo -e "\n" >> "$HISTORIAL_FILE"
        echo "📊 Toma registrada exitosamente en el historial."
        ;;
    3)
        if [ -f "$HISTORIAL_FILE" ]; then
            echo -e "\nHistorial de Tomas:"
            cat "$HISTORIAL_FILE"
        else
            echo "Aún no hay tomas registradas."
        fi
        ;;
    4)
        echo "¡Gracias por usar el sistema de Toma de Stock!"
        exit 0
        ;;
    *)
        echo "❌ Opción inválida."
        ;;
esac

echo "============================================"
echo "Script creado por Nelson con Grok 🚀"
