#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used by setup.sh script to check for Ngnix & Script version and prints it to the user.
#Date:07/03/2025
#Version: 0.0.2 of check_version.sh
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

# Version Check
function CHECK_VERSION(){
    # Vars
    SCRIPT_VERSION="0.0.3"

    # Prints both script version & Ngnix version if installed.
    printf "${BOLD}${CYAN}Versions:${RESET}"
    NGNIX_VERSION=$(nginx -v 2>&1 | cut -d'/' -f2)
    if [[ -z $NGNIX_VERSION ]]; then
        NGNIX_VERSION='-'
    fi
    printf "\n\nScript version: $SCRIPT_VERSION\n"
    printf "Installed Ngnix version: $NGNIX_VERSION\n\n"
}