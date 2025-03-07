#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used by setup.sh script to print help manual to the user.
#Date:07/03/2025
#Version: 0.0.2
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

function FUNC_HELP(){
    printf "${BOLD}${CYAN}\n\nHelp:${RESET}"
    printf "\nUsage: ./setup.sh [OPTION]\n"
    printf "\nOptions:\n"
    printf "  --version      Set up and activate Logit (only if not already installed).\n"
    printf "  --help         Display this help message and exit.\n"
    printf "  --logit        Allows the user to download and install Logit.\n"
    printf "  install        Installs Ngnix on the machine if not already installed.\n"
    printf "  configure      Configures a new Virtual Host, while checking for Ngnix on the machine.\n"
    printf "         Options:\n <HOSTNAME> <PORTNUMBER> <-y>\nPlease note the <-y> option will only work if you provide the first two arguments."
    printf "\nDescription:\n"
    printf " This script will provide an automated and flexible way to configure Nginx for these features without manual setup.\n\n"
    printf "  Example usage:\n"
    printf "    ./setup.sh --logit    # To install Logit for logs.\n"
    printf "    ./setup.sh --help     # To display this help message.\n\n"
    printf "    ./setup.sh install    # To install Ngnix on the system.\n\n"
    printf "    ./setup.sh configure  # To configure a new Virtual Host semi-manual.\n\n"
    printf "    ./setup.sh configure Test 1337 -y # To configure a new Virtual Host with the Hostname of "Test", on Port "1337" and "-y" to skil validation.\n\n"
}