#!/bin/bash

PROCESSNAME=$1

if [ -z $PROCESSNAME ]
then
	echo "Processo nao informado"
	exit 0
fi

until ps axu | grep $PROCESSNAME | grep -v grep | grep -v $0 > /dev/null
do
	echo "ATENÇÃO!!!!!!! O processo $PROCESSNAME NÃO está em execução!"
	sleep 3
	echo
done

echo "Processo iniciado (PID): $(pgrep $PROCESSNAME)"
