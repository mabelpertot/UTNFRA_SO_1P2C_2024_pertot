#!/bin/bash

echo -e "Mi IP Pública: $(curl -s ifconfig.me)\n" > Filtro_Avanzado.txt

echo -e "Mi usuario es: $(whoami)\n" >> Filtro_Avanzado.txt

echo -e "El Hash de mi usuario es: $(sudo grep $(whoami) /etc/shadow)\n" >> Filtro_Avanzado.txt

echo -e "La URL de mi repositorio es: $(git remote get-url origin)\n" >> Filtro_Avanzado.txt

