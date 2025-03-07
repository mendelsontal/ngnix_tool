#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used by setup.sh script to check for Ngnix, and install of missing and checks for 
# user_dir, auth, and CGI Scripting
#Date:07/03/2025
#Version: 0.0.3 of check_ngnix.sh
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

# =================================
# Tests Nginx Configuration
# =================================
function TEST_NGNIX(){
    nginx -t
}

# =================================
# Makes sure the system has the
# latest info on available packages
# =================================
function UPDAPT(){
    apt update
}

# ==================================
# Checks for fcgiwrap and spawn-fcgi
# ==================================
function CHECK_FCGI_APT(){
    # Check fcgiwrap
    if ! which fcgiwrap > /dev/null; then
        printf "\nInstalling afcgiwrap\n"
        apt install fcgiwrap
    fi
    # Check spawn-fcgi
    if ! which spawn-fcgi > /dev/null; then
        printf "\nspawn-fcgi\n"
        apt install spawn-fcgi
        systemctl enable fcgiwrap
    fi
}

# ============================
# Checks for apache2-utils
# ============================
function CHECK_APACHE2_UTILS(){
     # Checks if apache2-utils is installed, if not tries to install
    if ! which htpasswd > /dev/null; then
    printf "\nInstalling apache2-utils to generate .htpasswd\n"
    apt-get install apache2-utils
    fi
}

# ============================
# Check for nginx-extras
# ============================
function CHECK_NGINX_EXTRAS(){
    # Checks if nginx-extras is installed, if not tries to install
    if ! which nginx-extras > /dev/null; then
    printf "\nInstalling nginx-extras\n"
    apt-get install nginx-extras
    fi
}

# =============================
# Checks for Ngnix and installs
# =============================
function CHECK_NGINX(){
    # Checks if not already installed
    if ! command -v nginx &> /dev/null; then
        printf "\n${BOLD}Do you wish to install Nginx on this machine?${RESET}\n\n"
        # Choices - Intall Ngnix
        printf "# ============================= #\n"
        printf "1) ${BLUE}Install Ngnix.${RESET}\n"
        printf "2) ${BLUE}Cancel.${RESET}\n"
        printf "# ============================= #\n\n"

        # User selection
        printf "${BOLD}Do you wish to install Nginx and dependencies?${RESET} (1 = Yes / 2 = No ) " && read ngnix_install_choice
        case "$ngnix_install_choice" in
            1) 
                # Install.
                apt install -y nginx
                CHECK_APACHE2_UTILS # Checks for apache2-utils
                CHECK_NGINX_EXTRAS # Check for nginx-extras
                CHECK_FCGI_APT # Checks for fcgiwrap and spawn-fcgi

                ## Check status
                    if command -v nginx > /dev/null 2>&1; then
                        printf "\n${BOLD}${GREEN}Nginx installation completed successfully.${RESET}\n\n"
                        nginx -v
                    else
                        printf "\n${BOLD}${RED}ERROR - Something went wrong.${RESET}\n\n"
                    fi
            ;;
            2)
                # Cancel.
                printf "Ngnix installation canceled, exiting script.\n\n"
                exit 0
            ;;
            *)
                # Invalid option.
                printf "\n${RED}${BOLD}Invalid option.${RESET}\n"
                exit 1
            ;;
        esac

    else # Installed
        printf "\n${BOLD}${GREEN}Ngnix installation detected:${RESET}\n"
        nginx -v
    fi
}

# ============================
# Checks for .htpasswd file,
# and adds a user +
# fcgi checks and set
# ============================
function CHECK_HTPPASSWD_FCGI(){
    # Checks if apache2-utils is installed, if not tries to install
    CHECK_APACHE2_UTILS # Checks for apache2-utils

    # Create .htpasswd file
    printf "\nEnter username for authentication:\n" && read USERNAME

    # Ensures username is not empty
    if [[ -z "$USERNAME" ]]; then
        printf "\n${RED}Username cannot be empty. Exiting.${RESET}\n"
        exit 1
    fi

    # Checks if .htpasswd file already exists
    if [ ! -f "/etc/nginx/.htpasswd" ]; then
        printf "\nCreating .htpasswd and adding user...\n"
        htpasswd -c /etc/nginx/.htpasswd $USERNAME
    else
        printf "\nAdding user to existing .htpasswd file...\n"
        htpasswd /etc/nginx/.htpasswd $USERNAME
    fi

        CHECK_FCGI_APT # Checks for fcgiwrap and spawn-fcgi
    if [ ! "/home/$USERNAME/public_html/cgi-bin/myscript.cgi" ]; then
        mkdir -p "/home/$USERNAME/public_html/cgi-bin/myscript.cgi"
        chmod +x "/home/$USERNAME/public_html/cgi-bin/myscript.cgi"
    fi
}

# ============================
# User directory support
# ============================
function CHECK_USER_DIR_SUPPORT(){
# Get current permissions
    # Required permissions and ownership
    REQUIRED_PERMISSIONS="755"
    REQUIRED_OWNERGROUP="www-data"

    # Directory to check (replace $1 with the username)
    DIR="/home/$1/public_html"

    # Check if directory exists and create if not
    if [ ! -d  "$DIR" ]; then
        printf "\n$DIR is missing, attempting to create...\n"
        # Creates the directory with the needed permissions
        mkdir -m 755 "$DIR"

        # Checks if the directory creation was successful
        if [ $? -eq 0 ]; then
            printf "\n${GREEN}${BOLD}Directory created successfully.${RESET}\n"
        else
            printf "\n${Red}${BOLD}Directory creation failed.${RESET}\n"
        fi

        # Sets the needed group and owner
        chown "$REQUIRED_OWNERGROUP":"$REQUIRED_OWNERGROUP" "$DIR"

        # Checks if the permissions were set successfully
        if [ $? -eq 0 ]; then
            printf "\n${GREEN}${BOLD}Directory owner and group were set successfully.${RESET}\n"
        else
            printf "\n${Red}${BOLD}Directory owner and group set has failed.${RESET}\n"
        fi
    fi

    # Get current permissions, owner, and group
    CURRENT_PERMISSIONS=$(stat -c "%a" "$DIR")
    CURRENT_OWNER=$(stat -c "%U" "$DIR")
    CURRENT_GROUP=$(stat -c "%G" "$DIR")

    # Check if permissions, owner, group match and fix if not
    # Permissions
    if [ ! "$CURRENT_PERMISSIONS" == "$REQUIRED_PERMISSIONS" ]; then
        printf "\nAttempting to set needed permissions on $DIR\n"
        chmod -R 755 "$DIR"
        if [ $? -eq 0 ]; then
            printf "\n${GREEN}${BOLD}Directory permission set successfully.${RESET}\n"
        else
            printf "\n${Red}${BOLD}Directory permission set has failed.${RESET}\n"
        fi
    fi

    # Group and Owner
    if [ ! "$CURRENT_OWNER" == "$REQUIRED_OWNERGROUP" ] || [ ! "$CURRENT_GROUP" == "$REQUIRED_OWNERGROUP" ]; then
        chown -R www-data:www-data "$DIR"
        if [ $? -eq 0 ]; then
            printf "\n${GREEN}${BOLD}Directory group and owner set successfully.${RESET}\n"
        else
            printf "\n${Red}${BOLD}Directory group and owner set has failed.${RESET}\n"
        fi
    fi

}