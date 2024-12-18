#!/bin/bash

# Ordenar segons User ID o Group ID
case "$1" in
    -userid)
        echo "Contingut de /etc/passwd ordenat per User ID:"
        sort -t: -k3 -n /etc/passwd
        ;;
    -groupid)
        echo "Contingut de /etc/passwd ordenat per Group ID:"
        sort -t: -k4 -n /etc/passwd
        ;;
esac

#!/bin/bash
# Llistar grups primaris dels usuaris no del sistema (UID >= 1000)
echo "Grups primaris d'usuaris no del sistema:"
awk -F: '$3 >= 1000 {print $4}' /etc/passwd | sort -u | while read gid; do
    getent group "$gid" | awk -F: '{print $1}'
done | sort

