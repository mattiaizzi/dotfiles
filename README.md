# 🐧 Dotfiles

My personal configuration for Linux environments, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## 📋 Overview

This repository contains all the configurations for the programs I use daily on my Linux system. Using Stow allows easy dotfiles management through symlinks, making it simple to synchronize configurations across different machines.

## 🛠️ Configured Components

- **Hyprland** - Dynamic Wayland compositor
- **Neovim** - Text editor configured for development
- **Waybar** - Status bar for Wayland
- **Kitty** - GPU-accelerated terminal emulator
- **Rofi** - Application launcher
- **Dunst** - Notification daemon
- Other tools and utilities

## 📦 Prerequisites

Before installing the dotfiles, make sure you have installed:

```bash
# Arch Linux / Manjaro
sudo pacman -S stow git

# Ubuntu / Debian
sudo apt install stow git

# Fedora
sudo dnf install stow git
```

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/mattiaizzi/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Use Stow to create symlinks

To install all configurations:

```bash
stow */
```

To install only specific configurations:

```bash
# Example: install only hyprland and nvim
stow hyprland
stow nvim
```

### 3. Remove configurations

If you want to remove a configuration:

```bash
stow -D config-name
```

## 📁 Structure

```
dotfiles/
├── hyprland/
│   └── .config/hyprland/
├── nvim/
│   └── .config/nvim/
├── waybar/
│   └── .config/waybar/
├── kitty/
│   └── .config/kitty/
└── ...
```

Each directory represents a "package" managed by Stow and contains the directory structure that will be recreated in the home directory via symlinks.

## 🔄 Updates

To update configurations:

```bash
cd ~/dotfiles
git pull
stow */  # or stow specific packages
```

## ⚙️ Customization

Feel free to fork this repository and modify the configurations according to your needs. Each component can be customized by editing the files in its respective directory.

## 📝 Notes

- Make sure to backup your existing configurations before using these dotfiles
- Some configurations may require specific packages installed on the system
- Configurations are primarily tested on Arch Linux

## 🤝 Contributing

Suggestions and improvements are always welcome! Feel free to open issues or pull requests.

## 📄 License

MIT License - Feel free to use and modify these configurations as you prefer.

---

**Made with ❤️ for the Linux community**
