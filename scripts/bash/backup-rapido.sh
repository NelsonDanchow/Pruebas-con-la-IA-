#!/bin/bash

# Backup Rápido - Pruebas con la IA
FECHA=$(date +"%Y-%m-%d_%H-%M")
BACKUP_DIR="$HOME/Backups"
CARPETA_A_RESPALDAR="$HOME/Pruebas-con-la-IA"

echo "============================================"
echo "       BACKUP RÁPIDO - $(date)"
echo "============================================"

# Crear carpeta de backups si no existe
mkdir -p "$BACKUP_DIR"

echo "Respaldando carpeta: $CARPETA_A_RESPALDAR"
tar -czf "$BACKUP_DIR/backup_pruebas_$FECHA.tar.gz" "$CARPETA_A_RESPALDAR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ Backup creado exitosamente:"
    echo "   → $BACKUP_DIR/backup_pruebas_$FECHA.tar.gz"
    ls -lh "$BACKUP_DIR" | tail -n 3
else
    echo "❌ Error al crear el backup"
fi

echo "============================================"
echo "Backup hecho por Nelson con Grok 🔥"
