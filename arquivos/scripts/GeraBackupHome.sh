#!/bin/bash

PATHTOCOMPACT="/home/bo/github_projects/shell_script_learn"
HOMEPATH="/home/bo"

BACKUPFOLDER="/home/bo/Backup"

FILENAME="backup_home_$(date "+%Y%m%d%H%M")"

EXISTINGFOLDER="$(ls $BACKUPFOLDER > /dev/null 2>&1)"

if [ $? != 0 ]
then
	cd "/home/bo"
	mkdir "Backup"
fi

CREATEDAT=$(cd "$BACKUPFOLDER" | ls -t --full-time | tail -n +2 | head -n 1 | cut -d " " -f 6)

SEVENDAYSAGO=$(date -d "7 days ago" "+%Y-%m-%d")

if [ -n "$CREATEDAT" ] || [[ "$CREATEDAT" > "$SEVENDAYSAGO" ]]
then
	echo "Já foi gerado um backup do diretório $HOMEPATH nos últimos 7 dias."
	read -p "Deseja continuar? (N/s): " COMMAND

	if [ "$COMMAND" != "s" ] || [ -z "$COMMAND" ]
	then
		exit 0
	fi
fi

tar -czvf "$FILENAME.tar.gz" "$PATHTOCOMPACT"

mv "$FILENAME.tar.gz" "$BACKUPFOLDER"
