#!/bin/bash

#Punto_B (Particionamiento y Montaje)#

#DISCO="/dev/sdb"
DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')


echo "Particionamiento del DISCO"
#Se crean las particiones en el DISCO#

sudo fdisk $DISCO << EOF
n
e
1


n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M
n
l

+1000M

w
EOF

echo
echo "Particiones en Disco de 10GiB: "
echo 

#Corroborar las particiones
sudo fdisk -l $DISCO

#Formateo de las particiones del DISCO#
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10
sudo mkfs.ext4 ${DISCO}11
sudo mkfs.ext4 ${DISCO}12
sudo mkfs.ext4 ${DISCO}13
sudo mkfs.ext4 ${DISCO}14

#Agregue en /etc/fstab las rutas para el montaje persistente#
# <dispositivo>   <dir>        <tipo>        <opciones>       <dump> <fsck>
echo "${DISCO}5  /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}6  /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}7  /Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "${DISCO}8  /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}9  /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}10 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "${DISCO}11 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}12 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}13 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "${DISCO}14 /Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo systemctl daemon-reload
#Montaje en fstab
sudo mount -a
