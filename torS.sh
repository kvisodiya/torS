#!/bin/bash

# Simple Tor News & Legal Directory
# Requires: tor, torsocks, w3m

set -e

clear

echo "=================================="
echo "        TOR LEGAL DIRECTORY       "
echo "=================================="

# Check if tor is running
if ! systemctl is-active --quiet tor; then
    echo "[!] Tor service not running."
    echo "Starting Tor..."
    systemctl start tor
    sleep 3
fi

if ! systemctl is-active --quiet tor; then
    echo "[X] Failed to start Tor."
    exit 1
fi

echo "[✓] Tor is running"
echo ""

main_menu() {
    echo "Select Category:"
    echo "1) News"
    echo "2) Privacy & Digital Rights"
    echo "3) Human Rights"
    echo "4) Knowledge & Archives"
    echo "5) Cybersecurity News"
    echo "6) Exit"
    echo ""
    read -p "Enter choice: " choice

    case $choice in
        1) news_menu ;;
        2) privacy_menu ;;
        3) human_menu ;;
        4) knowledge_menu ;;
        5) cyber_menu ;;
        6) exit 0 ;;
        *) echo "Invalid option"; sleep 1; main_menu ;;
    esac
}

open_site() {
    url=$1
    echo "Opening $url ..."
    torsocks w3m "$url"
}

# -------- NEWS --------
news_menu() {
    clear
    echo "NEWS:"
    echo "1) BBC"
    echo "2) ProPublica"
    echo "3) NYTimes"
    echo "4) Back"
    read -p "Select: " n

    case $n in
        1) open_site "http://bbcnewsv2vjtpsuy.onion" ;;        # replace if needed
        2) open_site "http://propublicaexample.onion" ;;       # replace
        3) open_site "http://nytimesexample.onion" ;;          # replace
        4) main_menu ;;
        *) news_menu ;;
    esac
}

# -------- PRIVACY --------
privacy_menu() {
    clear
    echo "PRIVACY:"
    echo "1) Tor Project"
    echo "2) EFF"
    echo "3) Privacy International"
    echo "4) Back"
    read -p "Select: " p

    case $p in
        1) open_site "http://torprojectexample.onion" ;;
        2) open_site "http://effexample.onion" ;;
        3) open_site "http://privacyexample.onion" ;;
        4) main_menu ;;
        *) privacy_menu ;;
    esac
}

# -------- HUMAN RIGHTS --------
human_menu() {
    clear
    echo "HUMAN RIGHTS:"
    echo "1) Amnesty"
    echo "2) Human Rights Watch"
    echo "3) Back"
    read -p "Select: " h

    case $h in
        1) open_site "http://amnestyexample.onion" ;;
        2) open_site "http://hrwexample.onion" ;;
        3) main_menu ;;
        *) human_menu ;;
    esac
}

# -------- KNOWLEDGE --------
knowledge_menu() {
    clear
    echo "KNOWLEDGE:"
    echo "1) Internet Archive"
    echo "2) Project Gutenberg"
    echo "3) Back"
    read -p "Select: " k

    case $k in
        1) open_site "http://archiveexample.onion" ;;
        2) open_site "http://gutenbergexample.onion" ;;
        3) main_menu ;;
        *) knowledge_menu ;;
    esac
}

# -------- CYBERSECURITY --------
cyber_menu() {
    clear
    echo "CYBERSECURITY:"
    echo "1) OWASP"
    echo "2) Krebs on Security"
    echo "3) Back"
    read -p "Select: " c

    case $c in
        1) open_site "http://owaspexample.onion" ;;
        2) open_site "http://krebsexample.onion" ;;
        3) main_menu ;;
        *) cyber_menu ;;
    esac
}

main_menu
