#!/bin/bash

echo
echo "Para ejecutar: ./Punto_B.sh Listado_Punto_C.txt"
echo

LISTA=$1

# Verificar si se ingresó un archivo como parámetro
if [[ -z $LISTA ]]; then
    echo "ERROR: Por favor, ingrese el listado de usuarios y grupos."
    exit 1
fi

# Obtener el hash del usuario actual
HOME_USUARIO=$(whoami)
HASH=$(sudo grep "^$HOME_USUARIO:" /etc/shadow | awk -F ':' '{print $2}')

# Cambiar el delimitador de IFS
ANT_IFS=$IFS
IFS=$'\n'

# Leer el archivo y procesar cada línea
for LINEA in $(cat "$LISTA" | grep -v ^#); do
    # Guardar variables
    USUARIO=$(echo "$LINEA" | awk -F ',' '{print $1}')
    GRUPO=$(echo "$LINEA" | awk -F ',' '{print $2}')
    DIRECTORIO=$(echo "$LINEA" | awk -F ',' '{print $3}')

    # Crear grupo
    echo "Creando grupo: $GRUPO"
    sudo groupadd -f "$GRUPO"

    # Crear usuario
    echo "Creando usuario: $USUARIO"
    sudo useradd -m -s /bin/bash -G "$GRUPO" -p "$HASH" "$USUARIO"

    # Asignar permisos y propiedad según el usuario
    echo "Asignando permisos y propiedad"
    case "$USUARIO" in
        p1c2_2024_A1)
            sudo chmod 750 "$DIRECTORIO"
            sudo chown "$USUARIO:$USUARIO" "$DIRECTORIO"
            sudo su - "$USUARIO" -c "whoami > $DIRECTORIO/validar.txt"
            ;;
        p1c2_2024_A2)
            sudo chmod 760 "$DIRECTORIO"
            sudo chown "$USUARIO:$USUARIO" "$DIRECTORIO"
            sudo su - "$USUARIO" -c "whoami > $DIRECTORIO/validar.txt"
            ;;
        p1c2_2024_A3)
            sudo chmod 700 "$DIRECTORIO"
            sudo chown "$USUARIO:$USUARIO" "$DIRECTORIO"
            sudo su - "$USUARIO" -c "whoami > $DIRECTORIO/validar.txt"
            ;;
        p1c2_2024_P1)
            sudo chmod 775 "$DIRECTORIO"
            sudo chown "$USUARIO:$USUARIO" "$DIRECTORIO"
            sudo su - "$USUARIO" -c "whoami > $DIRECTORIO/validar.txt"
            ;;
    esac
done

# Restaurar el delimitador de IFS
IFS=$ANT_IFS

