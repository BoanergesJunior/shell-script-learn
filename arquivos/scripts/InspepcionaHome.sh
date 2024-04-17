#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'

AUX_UID_MAX=$(cat /etc/login.defs | grep "^UID_MAX" | awk '{print $2}')
AUX_UID_MIN=$(cat /etc/login.defs | grep "^UID_MIN" | awk '{print $2}')

for users in $(ps axu | tail -n +2)
do
	USERPID=$(echo $users | tr -s '\t' ' ' | cut -d " " -f 2)
	
	if [ $USERPID -ge $AUX_UID_MIN -a $USERPID -le $AUX_UID_MAX ]
	then
		USERNAME=$(echo $users | tr -s '\t' ' ' | cut -d " " -f 1)

		if [ $USERNAME != "root" ]
		then
			COUNTJPG=$(find /home/$USERNAME -name "*.jpg" | wc -l)
			COUNTMP4=$(find /home/$USERNAME -name "*.mp4" | wc -l)
			COUNTMP3=$(find /home/$USERNAME -name "*.mp3" | wc -l)
			
			echo "Usuario: $USERNAME"
			echo "Arquivos JPG: $COUNTJPG"
			echo "Arquivos MP4: $COUNTMP4"	
			echo "Arquivos MP3: $COUNTMP3"
			echo
		fi
	fi
done

IFS=$OLDIFS
