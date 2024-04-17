#!/bin/bash

case "$1" in
	[0-9])
		echo "O parametro e um numero"
		;;
	[A-Z])
		echo "O parametro e uma letra maiuscula"
		;;
	[a-z])
		echo "O parametro e uma letra minuscula"
		;;
	*)
		echo "Parametro nao informado"
esac
