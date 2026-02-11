#!/bin/bash

# ==============================
# Tor News & Legal Sites Browser
# ==============================

clear

# ---- Check Tor Service ----
if ! systemctl is-active --quiet tor; then
    echo "[*] Tor is not running. Starting Tor..."
    systemctl start tor
    sleep 3
fi

if ! systemctl is-active --quiet tor; then
    echo "[!] Tor failed to start. Exiting."
    exit 1
fi

echo "======================================="
echo "        TOR LEGAL SITE BROWSER"
echo "======================================="
echo ""
echo "1) BBC News"
echo "2) ProPublica"
echo "3) New York Times"
echo "4) Tor Project"
echo "5) Electronic Frontier Foundation"
echo "6) DuckDuckGo Search"
echo "7) Internet Archive"
echo "8) Exit"
echo ""
read -p "Select option: " choice

case $choice in
    1)
        torsocks w3m http://www.bbcnewsv2vjtpsuy.onion
        ;;
    2)
        torsocks w3m http://www.propub3r6espa33w.onion
        ;;
    3)
        torsocks w3m http://www.nytimes3xbfgragh.onion
        ;;
    4)
        torsocks w3m http://expyuzz4wqqyqhjn.onion
        ;;
    5)
        torsocks w3m http://efforgp4gj7onc.onion
        ;;
    6)
        torsocks w3m http://duckduckgogg42xjoc72x3sjasowoarfbgcmvfimaftt6twagswzczad.onion
        ;;
    7)
        torsocks w3m http://archivep75mbjunhxc.onion
        ;;
    8)
        echo "Goodbye."
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac
