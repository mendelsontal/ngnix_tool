#!/usr/bin/env bash
############################################################ /ᐠ｡ꞈ｡ᐟ\############################################################
#Developed by: Tal Mendelson
#Purpose: This script is used by setup.sh script to allow Logit setup & actication.
#Date:06/03/2025
#Version: 0.0.1
############################################################ /ᐠ｡ꞈ｡ᐟ\ ############################################################

# Function for Logs - Logit
function CONFIGURE_LOGIT() {
# Var that will be used to switch disable\enable the download Logit on the next run.
ASK_TO_DOWNLOAD="Enabled"

# Checks if Logit is already present
if [ -f "/usr/local/bin/logit.sh" ]; then
    # Calls for logit.sh as it's not automatically sourced at the moment.
    source "/usr/local/bin/logit.sh"
    # Sets Logit to silent so it won't spam the terminal gui.
    export LOGIT_SILENT=true
    # Starts Logit
    logit start
else
    if [ $ASK_TO_DOWNLOAD == "Enabled" ]
        printf "\n Logit not detected on your machine, would you like to download it?\n(Yes / Skip / No ) - If you select No, this message will not show on the next run." && read downloadlogit
        case "$USER_CONFIRMATION" in
            y |  yes | Yes | YES)
                # If user chooses Yes
            wget -P /usr/local/bin/ "https://github.com/mendelsontal/devops_course/blob/main/bash/logit/logit.sh"
            ;;
            n | no | No | NO)
                # If user chooses No, continues
                printf "\nYou selected No. continuing.\n"
                sed -i 's/ASK_TO_DOWNLOAD="Enabled"/ASK_TO_DOWNLOAD="Disabled"/' "$0"

            ;;
            Skip | skip | SKIP)
                # If user chooses No, continues
                printf "\nYou selected No. skipping.\n"
            ;;
            *)
                # Invalid input
                printf "\nInvalid input. skipping.\n"
            ;;
    fi
fi
}