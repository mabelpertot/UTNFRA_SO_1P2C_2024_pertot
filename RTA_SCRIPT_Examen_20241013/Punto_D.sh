#!/bin/bash



mkdir -p $HOME/Estructura_Asimetrica/{{correo,cliente}/cartas_{1..100},correo/carteros{1..10}}


echo "Estructura_Asimetrica"
echo "Punto_D ok"


#validar con el siguiente comando
tree $HOME/Estructura_Asimetrica/ --noreport | pr -T -s'' -w 80 --column 4
