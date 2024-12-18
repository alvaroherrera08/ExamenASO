#!/bin/bash
mostrar_mas_consumo() {
    ps -eo %mem,comm --sort=-%mem | awk 'NR==2 {print $1, $2}'
}
listar_procesos_limite() {
    ps -eo %mem,comm --sort=-%mem | awk -v lim="$1" 'NR>1 && $1 >= lim {print $1, $2}'
}
if [[ "$1" == "-l" ]]; then
    listar_procesos_limite "$2"
else
    mostrar_mas_consumo
fi

