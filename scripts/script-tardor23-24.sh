#!/bin/bash

# Funció per mostrar el procés que consumeix més memòria
mostrar_proces_max_memoria() {
    ps -eo pmem,comm --sort=-pmem | head -n 2 | tail -n 1 | awk '{printf "%.1f %s\n", $1, $2}'
    # ps -eo pmem,comm --sort=-pmem: llista els processos ordenats per memòria consumida --sort=-pmem (de més a menys)
    # head -n 2: mostra els dos primers processos (el que consumeix més memòria i el segon)
    # tail -n 1: mostra l'últim procés (el que consumeix més memòria)
    # awk: mostra el percentatge de memòria i el nom del procés en un format concret (1 decimal) 
}

# Funció per llistar processos que consumeixen més d'un N% de memòria
llistar_procesos_limit() {
    local limit=$1
    ps -eo pmem,comm --sort=-pmem | awk -v lim=$limit '$1 > lim {printf "%.1f %s\n", $1, $2}'
    # ps -eo pmem,comm --sort=-pmem: llista els processos ordenats per memòria consumida --sort
    # awk -v lim=$limit '$1 > lim {printf "%.1f %s\n", $1, $2}': mostra els processos que consumeixen més memòria que el límit
    # $1 > lim: compara el percentatge de memòria amb el límit
    # printf "%.1f %s\n": mostra el percentatge de memòria i el nom del procés en un format concret (1 decimal)
}

# Comprova si s'ha passat el flag -l
if [ "$1" == "-l" ]; then
    if [ -z "$2" ]; then
        echo "Error: Has de proporcionar un valor per al límit."
        exit 1
    fi

    # Comprova que el valor estigui entre 0 i 1
    # Utilitzem bc per a fer càlculs amb decimals (comparar si el valor és més petit que 0 o més gran que 1) 
    # bc stands for basic calculator (-l is the option for the standard math library)
    if (( $(echo "$2 < 0" | bc -l) )) || (( $(echo "$2 > 1" | bc -l) )); then
        echo "Error: El valor del límit ha de ser entre 0 i 1."
        exit 1
    fi

    llistar_procesos_limit $2
else
    mostrar_proces_max_memoria
fi