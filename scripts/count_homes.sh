#!/bin/bash

#for user in "$@"; do
#    home=$(getent passwd "$user" | cut -d: -f6)
#    [ -d "$home" ] && count=$(find "$home" -type f -user "$user" 2>/dev/null | wc -l) && echo "L’usuari $user #té $count fitxers"
# done

#!/bin/bash
limit=$1; shift
echo "Els usuaris:"
for user in "$@"; do
    home=$(eval echo ~"$user")
    [ -d "$home" ] && count=$(find "$home" -type f -user "$user" 2>/dev/null | wc -l)
    [ "$count" -gt "$limit" ] && echo "$user"
done
echo "Tenen més de $limit fitxers"

