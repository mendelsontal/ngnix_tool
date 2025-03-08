# Usage Manual for setup.sh

## Overview

The setup.sh script is designed to automate the installation and configuration of Nginx and Logit. It provides an easy and flexible way to set up and manage a web server environment.

## Usage
```bash
./setup.sh [OPTION]
```
Note
- The script requires to run with sudo, if missing it will restart with sudo asking for password.

## Options
### --version
Displays the versions of setup.sh and Ngnix.

### --help
Displays the help message.

### --logit
Allows the user to download and install Logit for log management.

### install
Installs Nginx on the machine if it is not already installed.

### configure
Configures a new Virtual Host while checking for Nginx on the machine.

#### Configuration Options
(Optional) If options not provided as arguments, the user will be asked to provide them.

```bash
./setup.sh configure <HOSTNAME> <PORTNUMBER> <-y>
```
- `<HOSTNAME>`: The name of the virtual host.
- `<PORTNUMBER>`: The port on which the virtual host will run.
- `-y`: Optional. Skips validation when providing both hostname and port number.

## Description
This script automates the setup of Nginx, making it easier to configure and manage web hosting environments without manual intervention.

## Example Usage

### Install Nginx
```bash
./setup.sh install
```
Checks if Nginx is installed and installs it if necessary.

### Configure a Virtual Host (Semi-Manual Mode)
```bash
./setup.sh configure
```
Prompts for hostname and port details interactively.

### Configure a Virtual Host with Parameters
```bash
./setup.sh configure Test 1337 -y
```
Sets up a virtual host with:
- Hostname: `Test`
- Port: `1337`
- `-y` option to skip validation.

## Notes
- The script checks for existing installations before proceeding.
- The `-y` option is only valid if both hostname and port number are provided.

---

This USAGE provides the necessary details to efficiently use `setup.sh`.