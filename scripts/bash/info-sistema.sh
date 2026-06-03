#!/bin/bash

# Info Sistema - Pruebas con la IA
echo "============================================"
echo "       INFORMACIÓN DEL SISTEMA"
echo "============================================"
echo "Usuario: Nelson Danchow"
echo "Hostname: Nelson Danchow"
echo "Fecha y hora: $(date)"
echo "Uptime: $(uptime -p)"
echo "--------------------------------------------"
echo "Memoria RAM:"
free -h
echo "--------------------------------------------"
echo "Uso de Disco:"
df -h / 
echo "--------------------------------------------"
echo "Versión del Kernel: $(uname -r)"
echo "Distribución: $(cat /etc/os-release | grep PRETTY_NAME)"
echo "============================================"
echo "Script hecho por Nelson con ayuda de Grok 🚀"
