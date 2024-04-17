#!/bin/bash

HOSTNAME=$(hostname)
DATETIME=$(date +%c)
ACTIVATED=$(uptime -s)
KERNELVERSION=$(uname -r)
PROCESSORQTT=$(cat /proc/cpuinfo | grep siblings | uniq | cut -d":" -f 2- | tr -d " ")
PROCESSORMODEL="$(cat /proc/cpuinfo | grep "model name" | uniq | cut -d':' -f 2-)"
MEMTOTAL=$(expr $(cat /proc/meminfo | grep MemTotal | cut -d':' -f 2- | tr -d ' ' | tr -d 'kB') / 1024)
PARTITIONS=$(df -h | egrep -v '(none|tmpfs)')

echo "Nome da Maquina: $HOSTNAME"
echo "Data e hora atual: $DATETIME"
echo "Maquina ativa desde: $ACTIVATED"
echo "Versao do kernel: $KERNELVERSION"
echo ""
echo "CPUs"
echo "Quantidade de CPUs/Core: $PROCESSORQTT"
echo "Modelo da CPU: $PROCESSORMODEL"
echo ""
echo "Memoria total: $MEMTOTAL MB"
echo ""
echo "Particoes: "
echo "$PARTITIONS"
