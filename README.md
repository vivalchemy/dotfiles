# 🖥️ Dotfiles and System Setup with Ansible  

This repository contains my personal system configuration managed using [Ansible](https://www.ansible.com/). The configurations and dotfiles are designed specifically for **Arch Linux** and aim to provide a modular, automated setup for a consistent and efficient development environment.  

## 📋 Table of Contents  
- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Available Roles](#available-roles)  
- [Tags for Role Management](#tags-for-role-management)  
- [TODOs](#todos)  
- [Contributing](#contributing)  
- [License](#license)  

---

## ✨ Features  
- **Automated System Configuration:** Configure tools like `neovim`, `tmux`, `zsh`, and more.  
- **Symlinking Dotfiles:** Dotfiles are symlinked rather than copied for easier updates.  
- **Tag-Based Role Management:** Organize roles for different environments using tags.  

---

## ⚙️ Prerequisites  
1. **Operating System:** Arch Linux or an Arch-based distro.  
2. **Ansible Installed:**  
   Install Ansible with:  
   ```bash  
   sudo pacman -S ansible  
   ```  
3. **Python Environment:** Ensure Python is installed on your system.  

---

## 🚀 Installation  
1. Clone this repository:  
   ```bash  
   git clone https://github.com/vivalchemy/dotfiles.git
   cd <repository-folder>  
   ```  

2. Install the required Ansible collections:  
   ```bash  
   ansible-galaxy install -r requirements.yaml  
   ```  

3. Edit the inventory file to include your local machine:  
   ```yaml
    this_pc:
      hosts:
        localhost 
   ```  

4. Run the playbook:  
   ```bash  
   ansible-playbook main.yaml --ask-become-pass  
   ```  
   > **Note:** Add `--tags <tag-name>` to limit roles to specific tags during execution.  

---

## 🛠️ Available Roles  
The following roles are included in the repository:  
| **Role**       | **Activating Tags**            | **Description**                                                                 |
|----------------|---------------------------------|---------------------------------------------------------------------------------|
| `alacritty`    | `always`, `alacritty`           | A modern terminal emulator that focuses on performance and simplicity.           |
| `applications` | `always`, `applications`        | A collection of essential applications and tools for productivity and development. |
| `bat`          | `always`, `bat`                 | A modern alternative to `cat` that adds syntax highlighting and Git integration. |
| `fastfetch`    | `always`, `fastfetch`           | A fast system information display tool designed to be lightweight and customizable. |
| `git`          | `always`, `git`                 | A distributed version control system designed to handle everything from small to very large projects. |
| `hyprland`     | `always`, `hyprland`            | A dynamic tiling Wayland compositor, offering a customizable and efficient desktop environment. |
| `keyd`         | `always`, `keyd`                | A tool to remap and customize keyboard keybindings, layouts, and macros.        |
| `lazygit`      | `always`, `lazygit`             | A simple terminal UI for Git that allows users to interact with repositories more efficiently. |
| `mako`         | `always`, `mako`                | A lightweight and fast notification daemon for Wayland-based systems.           |
| `neovim`       | `always`, `neovim`              | A highly extensible and customizable text editor, often used for programming.   |
| `nodejs`       | `always`, `nodejs`              | A JavaScript runtime built on Chrome's V8 engine, used for building scalable applications. |
| `rofi`         | `always`, `rofi`                | A window switcher and application launcher that is lightweight and highly customizable. |
| `scripts`      | `always`, `scripts`             | A set of personal shell scripts for automating various tasks and processes.     |
| `starship`     | `always`, `starship`            | A fast, customizable, and feature-rich prompt for any shell.                    |
| `tmux`         | `always`, `tmux`                | A terminal multiplexer that allows users to manage multiple terminal sessions from a single window. |
| `vivaldi`      | `always`, `vivaldi`             | A highly customizable web browser with advanced features for power users.       |
| `wallpapers`   | `always`, `wallpapers`          | A role to manage and symlink system wallpapers to predefined directories.        |
| `xfce4`        | `always`, `xfce4`               | A lightweight and fast desktop environment for Unix-like operating systems.     |
| `yazi`         | `always`, `yazi`                | A tool for managing and syncing personal settings and configurations across systems. |
| `zathura`      | `always`, `zathura`             | A lightweight, vim-like document viewer for PDF and other formats.              |
| `zellij`       | `always`, `zellij`              | A terminal workspace and multiplexer with a focus on usability and performance. |
| `zen`          | `always`, `zen`                 | A minimalist and distraction-free user interface theme and visual enhancements. |
| `zsh`          | `always`, `zsh`                 | A powerful shell that extends the capabilities of the traditional Bash shell.    |

---

Run specific tags with:  
```bash  
ansible-playbook main.yaml --ask-become-pass --tags "<comma-seperated-app-name>"
```

---

## ✅ TODOs  
- [ ] Add `zen userChrome.css` configuration.  
- [ ] Install additional fonts.  
- [ ] Install remaining aur and non config packages via Ansible.  

---

## 📝 Notes  
- **Arch Linux Only:** This configuration is tailored specifically for Arch Linux and may not work on other distros.  
- **Modular Setup:** You can customize the roles and tags based on your requirements.  

---

## 🤝 Contributing  
Feel free to submit issues or pull requests. Contributions are always welcome!  

---

## 📜 License  
This project is licensed under the [MIT License](LICENSE).  
