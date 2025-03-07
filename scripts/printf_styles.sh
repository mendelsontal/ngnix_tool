#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used to allow printf styles and colors with ease.
#Date:07/03/2025
#Version: 0.0.1
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

# ============================
# ANSI Color and Style Variables
# ============================
# Text Colors
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

# Background Colors
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

# Text Styles
BOLD="\e[1m"
DIM="\e[2m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
REVERSE="\e[7m"
HIDDEN="\e[8m"

# Reset Formatting
RESET="\e[0m"