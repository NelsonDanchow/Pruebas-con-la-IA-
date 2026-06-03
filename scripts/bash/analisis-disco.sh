#!/bin/bash

# Análisis de Disco - Pruebas con la IA
echo "============================================"
echo "       ANÁLISIS DE USO DE DISCO"
echo "============================================"

echo "Uso general del disco:"
df -h | grep -E 'Filesystem|/dev/sda|/dev/nvme'

echo -e "\nDirectorios que más ocupan espacio en /home:"
du -sh /home/* 2>/dev/null | sort -hr | head -10

echo -e "\nTop 10 archivos más grandes en el home:"
find ~/ -type f -exec du -h {} + 2>/dev/null | sort -hr | head -10

echo -e "\nEspacio disponible: $(df -h / | awk 'NR==2 {print $4}')"
echo "============================================"
echo "Script creado por Nelson con Grok 🚀"
