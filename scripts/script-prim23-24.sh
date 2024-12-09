#!/bin/bash

# Nombre de processos a mostrar (per defecte 10)
num_procs=${1:-10}

# Mostra els processos que acumulen més temps consumit de CPU
ps -eo pid,user,time,comm --sort=-time --no-header | head -n $((num_procs))

