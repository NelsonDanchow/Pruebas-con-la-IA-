#!/bin/bash

# Monitor de Recursos del Sistema - Pruebas con la IA
echo "============================================"
echo "       MONITOR DE RECURSOS EN TIEMPO REAL"
echo "============================================"

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

echo -e "\nMemoria RAM:"
free -h | grep Mem

echo -e "\nProcesos más pesados (Top 5):"
ps aux --sort=-%cpu | head -n 6

echo -e "\nTemperatura (si está disponible):"
if command -v sensors &> /dev/null; then
    sensors | grep -E "Core|temp"
else
    echo "Temperatura no disponible (instala lm-sensors)"
fi

echo -e "\nFecha: $(date)"
echo "============================================"
echo "Monitor creado por Nelson con Grok"
