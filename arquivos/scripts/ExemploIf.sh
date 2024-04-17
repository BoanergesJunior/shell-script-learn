#!/bin/bash

USER=$(grep "$1" /etc/passwd)

if [ -n "$USER" ] 
then
		echo "O usuario existe"
else
		echo "O usuario nao existe"
fi
