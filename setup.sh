#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script ensures Nginx is installed,
#         verifies and configures a virtual host if needed,
#         checks and installs dependencies for user directories,
#         authentication, and CGI, while providing an argument-based system for selective installation and configuration.
#Date:07/03/2025
#Version: 0.0.2
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

# ============================
# Checks if running with sudo
# ============================
if [[ $EUID -ne 0 ]]; then
printf "\n${BOLD}${YELLOW}This script requires root privileges.${RESET}\n"
printf "Re-launching with sudo.\n"
exec sudo "$0" "$@"  # Restart script with sudo
exit 1
fi

# ============================
# Load the external scripts
# ============================
source ./scripts/printf_styles.sh               # Script for printf styles and colors.
source ./scripts/check_version.sh               # Script for printing the script & Ngnix version.
source ./scripts/help_function.sh               # Script for printing help to the user.
source ./scripts/configure_logit.sh                # Logit setup script, requires user approval.
source ./scripts/check_ngnix_sh                 # Checks for Ngnix presence on the machine, asks user if he wishes to install.
source ./scripts/configure_virtual_host.sh      # Configure a virtual host script


# ============================
# Nginx setup.sh start
# ============================

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    printf "${BOLD}Usage: $0 {--help | --version}${RESET}\n\n"
fi

# Help sectionvi
if [[ "$1" == "--help" ]]; then
    FUNC_HELP
fi

# Version section
if [[ "$1" == "--version" ]]; then
    CHECK_VERSION
fi

# Configure a Virtual Host
if [[ "$1" == "configure" ]]; then
    CONFIGURE_LOGIT
    CHECK_NGINX
    # Check if both parameters $2 and $3 are provided.
    if [ -n "$2" ] && [ -n "$3" ]; then
        # If both parameters are provided, pass them to the function.
        CONFIGURE_VHOST "$2" "$3" "$4"
    else
        # If parameters are missing, just call the function without them.
        CONFIGURE_VHOST
    fi
fi

# Check for Ngnix & Install
if [[ "$1" == "install" ]]; then
    CONFIGURE_LOGIT
    CHECK_NGINX
fi