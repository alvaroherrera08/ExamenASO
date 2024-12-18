#!/bin/bash

# Extreure les línies rellevants sobre Actualització
actualitzacions=$(w3m -dump "https://www.ac.upc.edu/ca/nosaltres/serveis-tic/blog" | grep -A 5 "Actualització")

# Mostrar les línies extretes
echo "Actualització de les novetats:"
echo "$actualitzacions"

#!/bin/bash
latest_kernel=$(curl -s https://www.kernel.org/ | grep -A1 '<td>mainline:</td>' | grep -oP '(?<=<strong>)[^<]+')
echo "The latest mainline kernel version is $latest_kernel"
echo "$latest_kernel" | sudo tee /var/lib/last.kernel > /dev/null

