#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used by setup.sh script to configure a new virtual host machine.
#Date:06/03/2025
#Version: 0.0.2
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

### Functions

# Function to check if a port is in use
function is_port_free() {
    ss -tuln | grep :$1 &> /dev/null
    return $?
}

# Function to validate if a port if within the valid port ranges
function is_valid_port() {
    local PORT_NUMBER=$1
    if [[ $PORT_NUMBER -ge 1 && $PORT_NUMBER -le 65535 ]]; then
        return 0
    else
        return 1
    fi
}

function CONFIGURE_VHOST(){
     # Welcome
    printf "${BOLD}\nWelcome to Tool_Ngnix${RESET}\n"
    printf "You have selected the ${YELLOW}configure${RESET} option\n"

    if [ -z "$1" ]; then
    # Asks the user for the virtual host name 
        printf "\nPlease provide the virtual-host name:\n" && read VHOST_NAME
    else
        VHOST_NAME="$1"
    fi

    # Checks if VHOST_NAME is not empty and that the config file doesnt exist
    if [ ! -f "/etc/nginx/sites-available/$VHOST_NAME" ] && [[ -n $VHOST_NAME ]]; then
        printf "\nVirtual host ${BOLD}${BLUE}$VHOST_NAME${RESET} not configured. Creating..."

        # Asks user for the port for use
        while true; do
            if [ -z "$2" ]; then
                printf "\n${BOLD}\nEnter port number for use:${RESET} " && read PORT_NUMBER
            else
                PORT_NUMBER="$2"
            fi
            
            # Validate if the provided port is within ports scope
            if ! is_valid_port "$PORT_NUMBER";then
                printf "\n${BOLD}${RED}Invalid port number.${RESET}\n" && printf "Please enter a number between 1-65535 \n"
                # Clears $2 port var
                unset "$2"
                continue
            fi

            # Check if the port is actualyl free
            if is_port_free $PORT_NUMBER; then
                printf "\nPort $PORT_NUMBER is already in use. Please choose another port.\n"
                continue
            fi

            if [ "$3" != '-y' ] && [ "$3" != '-Y' ]; then
                # If valid and port is free, display virtual host and port info
                printf "\nVirtual Host Name: $VHOST_NAME\n"
                printf "Virtual Host Port: $PORT_NUMBER\n"
                printf "\n${BOLD}Please confirm${RESET} ${YELLOW}\n(Yes to confirm, No to retry, Cancel to exit)${RESET}:\n" && read USER_CONFIRMATION
                case "$USER_CONFIRMATION" in
                    y |  yes | Yes | YES)
                        # Confirmed
                        break
                    ;;
                    n | no | No | NO)
                        # If user chooses No, re-ask for the port and confirmation
                        printf "\nYou chose No. Let's try again.\n"
                        continue
                    ;;
                    cancel | Cancel | CANCEL | Exit | exit)
                        # Cancel
                        printf "Virtual Host creation canceled, exiting script.\n\n"
                        exit 0
                    ;;
                    *)
                        # Invalid input
                        printf "\n${RED}${BOLD}Invalid input.${RESET}  Please enter Yes, No, or Cancel.\n"
                        continue
                    ;;
                esac
            else
                break
            fi
        done
    # Param
    VHOST_ROOT="/var/www/$VHOST_NAME/html"
    NGINX_CONF="/etc/nginx/sites-available/$VHOST_NAME"
    NGINX_ENABLED="/etc/nginx/sites-enabled/$VHOST_NAME"

    # Create the vhost root directory
    mkdir -p "$VHOST_ROOT"

    tee "$NGINX_CONF" > /dev/null <<EOL
server {
    listen $PORT_NUMBER;
    server_name $VHOST_NAME www.$VHOST_NAME;

    root $VHOST_ROOT;
    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/${VHOST_NAME}_access.log;
    error_log /var/log/nginx/${VHOST_NAME}_error.log;
}
EOL

        if [ ! -f "$VHOST_ROOT/html/index.html" ]; then
            if [ ! -f "./config/index.html" ]; then
            wget -P $VHOST_ROOT https://raw.githubusercontent.com/mendelsontal/ngnix_tool/refs/heads/main/config/index.html
            fi
            ln -s /etc/nginx/sites-available/$VHOST_NAME /etc/nginx/sites-enabled/
            systemctl restart nginx
        fi   
    else
        printf "Name ${RED}$VHOST_NAME${RESET} is already in use.\n"
    fi
}