#!/bin/bash

# Número d'usuaris connectats
usuaris_connectats=$(who | wc -l)
# who command: mostra informació sobre els usuaris connectats
# wc -l: compta el nombre de línies

# Número de comptes desactivats
comptes_desactivats_awk=$(awk -F: '($7 == "/usr/sbin/nologin" || $7 == "/bin/false") {count++} END {print count}' /etc/passwd)
# -F: separador de camps (:) en aquest cas
# $7: camp 7 del fitxer /etc/passwd
# /usr/sbin/nologin i /bin/false: comptes desactivats
# {count++}: incrementa la variable count
# END {print count}: imprimeix el valor de la variable count
# /etc/passwd: fitxer que conté la informació dels usuaris del sistema

comptes_desactivats_grep=$(grep -E '(/usr/sbin/nologin|/bin/false)' /etc/passwd | wc -l)
# -E: permet l'ús d'expressions regulars
# '(/usr/sbin/nologin|/bin/false)': expressió regular que busca els comptes desactivats
# /etc/passwd: fitxer que conté la informació dels usuaris del sistema
# wc -l: compta el nombre de línies

# Obtenir la darrera versió de Google Chrome
latest_version=$(curl -s https://www.whatismybrowser.com/guides/the-latest-version/chrome | grep -A 1 "Chrome on Linux" | tail -n 1 | awk -F'<|>' '{print $3}')
# s: silent mode (no mostra el progrés ni missatges d'error)
# o: mostra només el que coincideix amb l'expressió regular
# -P: permet l'ús de Perl-compatible regular expressions


echo "Número d'usuaris connectats: $usuaris_connectats"
echo "Número de comptes desactivats amb AWK: $comptes_desactivats_awk"
echo "Número de comptes desactivats amb GREP: $comptes_desactivats_grep"

# Mostrar la darrera versió i guardar-la en un fitxer
echo "The latest chrome version is $latest_version"
# echo "The latest chrome version is $latest_version" > /var/lib/last_chrome

# Mostrar el missatge cada cop que s'obre un nou terminal d'usuari: echo "~/scripts/script-tardor22-23.sh" >> ~/.bashrc

# s’executa cada 4 hores a la hora i 15 minuts per actualitzar les dades
# Command: crontab -e
# 15 */4 * * * ~/scripts/script-tardor22-23.sh