#!/bin/bash

#Punto c (Estructura Asimetrica en el $HOME del usuario#

mkdir -p $HOME/Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros_{1..10}}

echo "Se crea Estructura Asimetrica en el $HOME del usuario"
echo "Punto C ok"


#Se puede validar con#
tree $HOME/Estructura_Asimetrica/ --noreport | pr -T -s'' -w 80 --column 4
