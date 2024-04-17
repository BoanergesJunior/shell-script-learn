#!/bin/bash

HOURNOW=$(date +%H)

if [ $HOURNOW -ge "06" -a $HOURNOW -lt "12" ]
then
	echo "Bom Dia!"
	echo "A hora atual é $(date +%r)"
elif [ $HOURNOW -ge "12" -a $HOURNOW -lt "18" ]
then
	echo "Boa Tarde!"
        echo "A hora atual é $(date +%r)"
else
	echo "Boa Noite!"
	echo "A hora atual é $(date +%r)"
fi
