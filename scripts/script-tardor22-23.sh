#!/bin/bash

# Número d'usuaris connectats
usuaris_connectats=$(who | wc -l)

# Número de comptes desactivats (AWK)
comptes_desactivats=$(awk -F: '($7 == "/usr/sbin/nologin" || $7 == "/bin/false") {count++} END {print count}' /etc/passwd)

# Mostrar resultats
echo "Número d'usuaris connectats: $usuaris_connectats"
echo "Número de comptes desactivats: $comptes_desactivats"


#!/bin/bash
v=$(curl -s https://www.whatismybrowser.com/guides/the-latest-version/chrome | grep -A1 "Chrome on <strong>Linux</strong>" | tail -n1 | awk -F'<|>' '{print $3}')
echo "The latest chrome version is $v"
echo "$v" | sudo tee /var/lib/last_chrome >/dev/null

