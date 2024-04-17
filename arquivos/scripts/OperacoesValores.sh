#!/bin/bash

read -p "Informe o Valor 1: " VAL1
read -p "Informe o Valor 2: " VAL2

echo

echo "Escolha uma operacao:"
echo "1 = Soma"
echo "2 = Subtracao"
echo "3 = Multiplicacao"
echo "4 = Divisao"
echo "Q = Sair"

echo

read -p "Opcao: " OPTION 

echo

if [ -z $VAL1 -o -z $VAL2 ]
then
	exit 55
fi

case "$OPTION" in
	1)
		echo -n "Soma: $VAL1 + $VAL2 = "
		echo "$(expr $VAL1 + $VAL2 )"
		;;
	
	2)
		echo -n "Subtracao: $VAL1 - $VAL2 = "
		echo "$(expr $VAL1 - $VAL2 )"
		;;
	
	3)
		if [ $VAL1 -eq 0 -o $VAL2 -eq 0 ]
		then
			echo "Nenhum dos parametros pode ser 0"
			exit 12
		fi

		echo -n "Multiplicacao: $VAL1 * $VAL2 = "
                echo "$(expr $VAL1 \* $VAL2 )"
                ;;
	
	4)
		if [ $VAL1 -eq 0 -o $VAL2 -eq 0 ]
                then
                        echo "Nenhum dos parametros pode ser 0"
                        exit 1
		fi

		echo -n "Divisao: $VAL1 / $VAL2 = "
                echo "$(expr $VAL1 / $VAL2 )"

		echo -n "Divisao com resto: "
		echo "$(expr $VAL1 % $VAL2 )"
                ;;

	Q)
		exit 0
		;;

	*)
		exit 33
		;;
esac
