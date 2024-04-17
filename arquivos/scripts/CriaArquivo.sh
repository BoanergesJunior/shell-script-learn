#!/bin/bash

read -p "Informe o nome do arquivo a ser criado: " FILENAME
read -p "Informe um conjunto de caracteres que será usado para preencher o arquivo: " CHARSET
read -p "Informe o tamanho final do arquivo (em bytes): " SIZE

if [ -e $FILENAME ]
then
	rm $FILENAME
fi

touch $FILENAME

CURRSIZE=0
SHOWNPERCENT=0

while [ $CURRSIZE -lt $SIZE ]
do
	echo -n "$CHARSET" >> "$FILENAME"

	CURRSIZE=$(stat --printf=%s "$FILENAME")
	
	PERCENT=$((CURRSIZE * 100 / SIZE))
	
	if [ $(($PERCENT % 10)) = 0 -a $SHOWNPERCENT -ne $CURRSIZE ]
	then
		echo "Concluído: $PERCENT% - Tamanho do Arquivo: $CURRSIZE"
		SHOWNPERCENT=$CURRSIZE
	fi
done
