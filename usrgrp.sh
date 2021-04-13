#!/bin/bash

if [ $EUID -ne 0 ]
then 
	echo "This script must be run as root"
	exit 1
fi

function menu {
	
while [ "$opcion" != "s" ]
	do
	
	clear

	echo "--------------MENU--------------"
	echo "--------------------------------"
	echo " 1.Crear un usuario"
	echo " 2.Crear grupo"
	echo " 3.Añadir un usuario a un grupo"
	echo " 4.Eliminar usuario de un grupo"
	echo " 0.Pulsa la letra s para salir"
	echo "--------------------------------"
	echo "--------------------------------"
	
	read opcion
	case $opcion in
	
	1)
	echo "Crear usuario"
	echo "Inserta el nombre del usuario nuevo:"
	read user
	sudo adduser $user
	sleep 3
	;;
	
	2)
	echo "Crear grupo"
	echo "Inserta el nombre del grupo nuevo:"
	read group
	sudo groupadd $group
	sleep 3
	;;
	
	3)
	echo "Añadir un usuario a un grupo"
	echo "Inserta el nombre del usuario"
	read user2
	echo "Inserta el nombre del grupo"
	read group2
	sudo addgroup $user2 $group2
	sleep 3
	;;
	
	4)
	echo "Elminar usuario de un grupo"
	echo "Inserta el nombre del usuario"
	read user3
	echo "Inserta el nombre del grupo"
	read group3
	sudo gpasswd -d $user3 $group3
	sleep 3
	;;
	
	esac
	done
	return 0
}

menu


function crusr {
	
	
	clear
	echo "----------------------------"
	echo "Creacion de un usuario nuevo"
	echo "----------------------------"
	echo "Insertar el nombre del usuario:"
	read user4
	echo "Insertar el uid del usuario:"
	read Uid1
	echo "Insertar el nombre del grupo:"
	read group4
	
	sudo useradd -d /home/$user4 -s /bin/bash -u $Uid1 -g $group4 $user4
	sleep 3
	return 0;
}

crusr
	
function cgrp {
	
	clear
	echo "--------------------------"
	echo "Creacion de un grupo nuevo"
	echo "--------------------------"
	echo "Inserta el nombre del grupo nuevo:"
	read group5
	echo "Inserta el Gid del grupo nuevo:"
	read Gid1
	sudo addgroup --gid $Gid1 $group5
	sleep 3
	return 0	
}
cgrp

function afegr {
	
	clear
	echo "---------------------------------------------------------"
	echo "Añadir usuario existente en el grupo creado anteriormente"
	echo "---------------------------------------------------------"
	echo "Inserta el nombre de un usuario:"
	read user6
	
	sudo addgroup $user6 $group5
	sleep 3
	return 0
}
afegr

function esbgr {
	
	clear
	echo "-------------------------------------"
	echo "Eliminar usario de un grupo existente"
	echo "-------------------------------------"
	echo "Inserta el nombre de un usuario:"
	read user7
	echo "Inserta el nombre de un grupo:"
	read group7
	
	sudo gpasswd -d $user7 $group7
	sleep 3
	return 0	
}
esbgr
exit 0

