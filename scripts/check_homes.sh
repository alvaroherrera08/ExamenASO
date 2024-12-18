#!/bin/bash
#echo "Els usuaris:"
#for user in "$@"; do
 #   home=$(getent passwd "$user" | cut -d: -f6)
  #  [ -d "$home" ] && [ "$(du -sm "$home" | cut -f1)" -gt 10 ] && echo "$user"
#done
#echo "Tenen un home més gran de 10MB"

#!/bin/bash

min_size=$1  # Primer paràmetre: mida mínima en MB
shift      # Elimina el primer paràmetre (mida) de la llista d'arguments
echo "Els usuaris:"
for user in "$@"; do
    home=$(getent passwd "$user" | cut -d: -f6)
    [ -d "$home" ] && [ "$(du -sm "$home" | cut -f1)" -gt "$min_size" ] && echo "$user"
done
echo "Tenen un home més gran de ${min_size}MB"

