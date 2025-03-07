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
    - 📄 <span style="display: inline-block; margin-right: 20px;">[index.html](./config/index.html)</span> Landing page used by the script  
  - **📂 <span style="display: inline-block; margin-right: 20px;">[scripts/](./scripts)</span>** Helper scripts  
  - **📂 <span style="display: inline-block; margin-right: 20px;">[docs/](./docs)</span>** Documentation  
    - 📄 <span style="display: inline-block; margin-right: 20px;">[INSTALLATION.md](./docs/INSTALLATION.md)</span> Installation guide  
    - 📄 <span style="display: inline-block; margin-right: 20px;">[USAGE.md](./docs/USAGE.md)</span> Usage instructions  

<!-- GETTING STARTED -->
## Getting Started


<!-- Installation -->
## Installation
- [Installation](./docs/INSTALLATION.md)
  
<!-- USAGE -->
## Usage
- [Usage](./docs/USAGE.md)

<!-- CONTRIBUTERS -->
## 👥 Contributers
- [Tal](https://github.com/mendelsontal)

<!-- LICENSE -->
## License
- [License](./LICENSE)