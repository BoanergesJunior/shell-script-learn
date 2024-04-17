#!/bin/bash

########################################################
#
# PrimeiroScript.sh - Script de exemplo do curso
#
# Autor - Boanerges Junior
#
# Data Criacao: DD/MM/YY
#
# Descricao: mostra a data atual e exibe lista de alunos
#
# Exemplo de uso: ./PrimeiroScript.sh
#
# Alteracoes:
#	Dia X - Inclusao da funcao
#	Dia Y - Correcao da funcao
#
#########################################################

DATAHORA=$(date +%H:%M)
ARQUIVOALUNOS="$(pwd)/../alunos2.txt"
clear
echo "======= Meu Primeiro Script"
echo ""
echo "Exibir data e hora atual: $DATAHORA"
echo "Listagem dos alunos: "
sort $ARQUIVOALUNOS
