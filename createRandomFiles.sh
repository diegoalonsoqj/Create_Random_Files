#!/bin/bash

# Pregunta al usuario cuántos archivos quiere crear
echo "¿Cuántos archivos te gustaría crear?"
read file_count

# Pregunta al usuario cuál sería el tamaño máximo de los archivos en kilobytes
echo "¿Cuál es el tamaño máximo de los archivos en kilobytes?"
read max_size

# Pregunta al usuario la ruta donde se crearán los archivos
echo "¿Dónde te gustaría crear los archivos?"
read dir_path

# Lista de posibles extensiones de archivo
ext_list=("txt" "doc" "pdf" "jpg" "png")

# Itera la cantidad de veces solicitada por el usuario
for ((i=1; i<=file_count; i++))
do
    # Elige una extensión de archivo aleatoria de la lista
    ext=${ext_list[$RANDOM % ${#ext_list[@]}]}

    # Crea un archivo con la extensión seleccionada y con el formato de nombre indicado
    filename="fileTest-$(date +%Y%m%d_%H%M%S)"
    touch "$dir_path/$filename.$ext"

    # Genera un tamaño aleatorio de archivo en kilobytes no mayor al tamaño máximo proporcionado por el usuario
    size=$(shuf -i 1-$max_size -n 1)

    # Aumenta el tamaño del archivo a la cantidad especificada
    dd if=/dev/zero of="$dir_path/$filename.$ext" bs=1024 count=$size >/dev/null 2>&1

    # Espera 1 segundo antes de crear el próximo archivo
    sleep 1
done

echo "Archivos creados con éxito en $dir_path."
