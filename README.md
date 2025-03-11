[![Ngnix](https://img.shields.io/badge/Ngnix%20Task-8A2BE2)]([https://img.shields.io/badge/Ngnix%20Task-8A2BE2) [![GitHub contributors](https://img.shields.io/github/contributors/mendelsontal/ngnix_tool)](https://github.com/mendelsontal/ngnix_tool/graphs/contributors) [![GitHub issues](https://img.shields.io/github/issues/mendelsontal/ngnix_tool)](https://github.com/mendelsontal/ngnix_tool/issues)
# Ngnix Task
<!-- ABOUT THE PROJECT -->
## 📌 Project Overview
    ✅ Check if Nginx is installed and install it if missing.
    ✅ Verify virtual host configuration and prompt the user to configure one if missing.
    ✅ Ensure dependencies for user directories, authentication, and CGI scripting are installed.
    ✅ Support argument-based configuration, allowing users to selectively enable:
        - User directories (user_dir) – Serve content from user-specific directories.
        - Authentication (auth) – Enable basic authentication.
        - PAM authentication (auth_pam) – Use PAM for authentication.
        - CGI scripting (cgi) – Allow execution of CGI scripts.

The goal is to provide an automated and flexible way to configure Nginx for these features without manual setup.

- [Task](./task.md)

<!-- FOLDER STRACTURE -->
## 📁 Folder Structure
- **📁 <span style="display: inline-block; margin-right: 20px;">[nginx_tool/](./)</span>** Root directory  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[README.md](./README.md)</span> Project overview, usage, installation instructions  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[LICENSE](./LICENSE)</span> Open-source license  
  - 📜 <span style="display: inline-block; margin-right: 20px;">[setup.sh](./setup.sh)</span> Main shell script for Nginx setup  
  - 📄 <span style="display: inline-block; margin-right: 20px;">[task.md](./task.md)</span> Contains the task description  
  - **📂 <span style="display: inline-block; margin-right: 20px;">[config/](./config)</span>** Configuration files  
    - 📄 <span style="display: inline-block; margin-right: 20px;">[index.html](./config/index.html)</span> Landing page used by the script as default 
  - **📂 <span style="display: inline-block; margin-right: 20px;">[scripts/](./scripts)</span>** Helper scripts
    - 📜 <span style="display: inline-block; margin-right: 20px;">[check_ngnix.sh](./check_ngnix.sh)</span> Holds required functions for running
    - 📜 <span style="display: inline-block; margin-right: 20px;">[check_version.sh](./scripts/check_version.sh)</span> Checks for script and Ngnix versions
    - 📜 <span style="display: inline-block; margin-right: 20px;">[help_function.sh](./scripts/help_function.sh)</span> Prints the Help section to the user
    - 📜 <span style="display: inline-block; margin-right: 20px;">[check_ngnix.sh](./scripts/check_ngnix.sh)</span> Holds required functions for running
    - 📜 <span style="display: inline-block; margin-right: 20px;">[configure_logit.sh](./scripts/configure_logit.sh)</span> Script for setting Logit for logs
    - 📜 <span style="display: inline-block; margin-right: 20px;">[configure_virtual_host.sh](./scripts/configure_virtual_host.sh)</span> Script for configuring Virtual Hosts  
    - 📜 <span style="display: inline-block; margin-right: 20px;">[printf_styles.sh](./scripts/printf_styles.sh)</span> Script for managing printf styles and colors
  - **📂 <span style="display: inline-block; margin-right: 20px;">[docs/](./docs)</span>** Documentation   
    - 📄 <span style="display: inline-block; margin-right: 20px;">[USAGE.md](./docs/USAGE.md)</span> Usage instructions  

<!-- GETTING STARTED -->
## Getting Started

### 1. Pre-Requisites:
Before you begin, ensure that your system meets the following requirements:
- Bash and wget installed
- Linux based system (Debian)

### 2. Cloning the Repository:
- How to clone the repository:
```bash
git clone https://github.com/mendelsontal/ngnix_tool.git
cd ngnix_tool
```

### 3. Running the Setup Script:
- Steps to run the setup.sh:
```bash
chmod +x setup.sh
./setup.sh
```
  
<!-- USAGE -->
## Usage
- [Usage](./docs/USAGE.md)

<!-- CONTRIBUTERS -->
## 👥 Contributers
- [Tal](https://github.com/mendelsontal)

## 🚀 Roadmap
Here’s a list of features planned for future releases:

v0.0.5
- Add returns 0/1 for all functions.
- Create template for the configuration, to replace the EOF inside configure_virtual_host.sh
- update argument to check for ngnix & dependency updates (--update)

v0.0.6
- pass arguments to configure
 - enable user-specific directories (--user_dir)
 - enable basic authentication (--auth)
 - enable CGI scripting (--cgi)
- test argument to check configurations etc (--test)
- add other distribution compatibility, starting with ubuntu

<!-- LICENSE -->
## License
- [License](./LICENSE)
