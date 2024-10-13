#!/bin/bash 



echo "==============================" > Filtro_Avanzado.txt
echo "          Filtro Avanzado" >> Filtro_Avanzado.txt
echo "==============================" >> Filtro_Avanzado.txt
echo "" >> Filtro_Avanzado.txt

echo -n "Mi IP Pública: " >> Filtro_Avanzado.txt
curl -s ifconfig.me >> Filtro_Avanzado.txt

echo "" >> Filtro_Avanzado.txt

echo -n "Mi usuario es: " >> Filtro_Avanzado.txt
whoami >> Filtro_Avanzado.txt


echo -n "El Hash de mi usuario es: " >> Filtro_Avanzado.txt
HASH=$(sudo grep "^$(whoami):" /etc/shadow | awk -F ':' '{print $2}')
echo "$HASH" >> Filtro_Avanzado.txt


echo -n "La URL de mi repositorio es: " >> Filtro_Avanzado.txt
git remote get-url origin >> Filtro_Avanzado.txt


echo "" >> Filtro_Avanzado.txt
echo "==============================" >> Filtro_Avanzado.txt

