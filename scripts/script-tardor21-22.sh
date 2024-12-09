#!/bin/bash

# Extreure les línies en referència a Actualització de les novetats
actualitzacions=$(curl -s https://www.ac.upc.edu/ca/nosaltres/serveis-tic/blog | grep -A 5 "Actualització de les novetats")

# Obtenir la darrera versió del kernel de Linux
latest_kernel=$(curl -s https://www.kernel.org/ | grep -oP '(?<=<strong>mainline:</strong> ).*?(?=</td>)')

# Mostrar les línies extretes
echo "Actualització de les novetats:"
echo "$actualitzacions"

# Mostrar els logs dels usuaris al sistema
last

# Mostrar la darrera versió i guardar-la en un fitxer
echo "The latest mainline kernel version is $latest_kernel"
# echo "The latest mainline kernel version is $latest_kernel" > /var/lib/last.kernel