#!/bin/bash

ls /home/$1 > /dev/null 2>&1

USERID=$(cat /etc/passwd | grep "^$1" | cut -d: -f3)


echo "Relatorio do Usuario: $1"
echo ""
echo "UID: $USERID"
echo "Nome ou Descricao: $1 "
echo ""
echo "Total Usado no /home/$1: $(du -sh /home/bo 2> /dev/null)"
echo ""
echo "Ultimo Login: $(date)"
