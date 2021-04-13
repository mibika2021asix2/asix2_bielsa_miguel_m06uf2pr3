#!/bin/bash

sudo cat /etc/fstab | grep '^[^#]' >> mount.txt

if [[ -e mountpoint.txt ]]
then
	sudo mv -i mount.txt mountpoint.txt
	
	else 
	sudo mv mount.txt mountpoint.txt
fi

if [[ ! -d FitxConfBackup ]]
then
		sudo mkdir FitxConfBackup
fi

sudo mv -i mountpoint.txt FitxConfBackup/
