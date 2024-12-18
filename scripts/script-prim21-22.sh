#!/bin/bash

# Funció per mostrar l'ocupació de disc dels usuaris
mostrar_usuaris() {
    local min_uid=$1
    awk -F: -v min_uid="$min_uid" '{ 
        if ($3 >= min_uid && $6 != "/" && $6 != "" && system("[ -d "$6" ]") == 0) 
            print $1, $6 
    }' /etc/passwd | while read -r user home; do
        blocks=$(du -s "$home" 2>/dev/null | awk '{print $1}')
        [[ -n "$blocks" ]] && echo "$blocks $home $user"
    done | sort -nr
}

# Funció per afegir un avís al .bashrc dels usuaris
afegir_avis() {
    local limit="$1"
    awk -F: '
    $6 != "/" && $6 != "" {print $1, $6}' /etc/passwd | while read user home; do
        if [ -d "$home" ]; then
            blocks=$(du -s "$home" 2>/dev/null | awk "{print \$1}")
            if [ "$blocks" -gt "$limit" ]; then
                echo "Afegint avís a $home/.bashrc per a l'usuari $user"
                echo 'echo "ATENCIÓ: Esteu ocupant massa espai de disc."' | sudo tee -a "$home/.bashrc" > /dev/null
            fi
        fi
    done
}


# Opcions
case $1 in
    -a)
        mostrar_usuaris 0
        ;;
    -w)
        if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
            afegir_avis "$2"
        else
            echo "Ús: $0 -w numblocks"
            exit 1
        fi
        ;;
    *)
        mostrar_usuaris 1000
        ;;
esac

