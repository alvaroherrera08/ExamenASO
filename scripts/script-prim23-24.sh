#!/bin/bash
num_procs=${1:-10}
ps -eo pid,user,time,comm --sort=-time --no-header | head -n $((num_procs))

