#!/bin/bash

# Funció: Compta processos de /bin/bash
comptar_processos() {
    num_proces=$(pgrep -c -x bash)
    echo "/bin/bash $num_proces"
}

# Funció: Mostra usuaris únics executant /bin/bash
mostrar_usuaris() {
    usuaris=$(ps -eo user,comm | awk '$2 == "bash" {print $1}' | sort | uniq | tr '\n' ' ')
    echo "/bin/bash $num_proces $usuaris"
}

# Executa segons els arguments
if [[ "$1" == "-u" ]]; then
    num_proces=$(pgrep -c -x bash)
    mostrar_usuaris
else
    comptar_processos
fi

