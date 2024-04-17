#!/bin/bash

##################################
#                                #
# Nome: Resolucao do exercicio 1 #
#                                #
##################################

read -p "Insira o primeiro valor: " PARAM1

read -p "Insira o segundo valor: " PARAM2

RESULT=$(expr $PARAM1 + $PARAM2)

echo -n "Feito com comando read: "
echo "$RESULT"

RESULT2=$(expr $1 + $2)
echo "Feito com parametros: $RESULT2"
