#!/bin/bash

OLDIFS=$IFS
IFS=$'\n'

AUX_UID_MAX=$( cat /etc/login.defs | grep "^UID_MAX" | awk '{print $2}' )
AUX_UID_MIN=$( cat /etc/login.defs | grep "^UID_MIN" | awk '{print $2}' )

echo -e "USUARIO\t\tUID\t\tDIRHOME\t\tNOME OU DESCRICAO"

for user in $(cat /etc/passwd)
do
        CURR_USER=$(echo $user | cut -d ":" -f 3)

	if [ $CURR_USER -ge $AUX_UID_MIN -a $CURR_USER -le $AUX_UID_MAX ]
	then
		USERNAME=$(echo $user | cut -d ":" -f 1)
		AUX_UID=$(echo $user | cut -d ":" -f 3)
		AUX_DIRHOME=$(echo $user | cut -d ":" -f 6)
		DESCRIPTION=$USERNAME

		echo -e "$USERNAME\\t\t$AUX_UID\\t\\t$AUX_DIRHOME\\t$DESCRIPTION"
	fi
done

IFS=$OLDIFS
