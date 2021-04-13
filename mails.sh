#!/bin/bash

if [[ ! -e mails.tmp ]]
then
	 sudo wget http://www.collados.org/asix2/m06/uf2/mails.tmp
fi

Cmail="^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$"
correo=`sudo cat mails.tmp`

for LINEA in $correo
do
if [[ $LINEA =~ $Cmail ]] ; then

    echo "$LINEA" >> mails_ok.txt
fi
done
exit 0
