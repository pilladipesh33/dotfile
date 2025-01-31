# Dotfiles Repository

## Overview

This repository contains the configuration files (dotfiles) for managing my development environment. It includes configurations for various applications which are organized in stow-compatible structures for easy management and deployment.

## Applications

- **Hyprland**: Configuration files for the Hyprland compositor, located in `hypr/.config/hypr`.
- **Alacritty**: Configuration for the Alacritty terminal emulator, located in `alacritty/.config/alacritty`.
- **Neovim**: Neovim configuration, stored in `nvim/.config/nvim`.
- **Zsh**: Zsh configuration, including oh-my-zsh as a submodule, stored in `zsh`.
- **Warp Terminal**:
- **Ghostty**

## Cloning the Repository

To clone this repository along with its submodules, run the following command:

```bash
git clone --recurse-submodules git@github.com:pilladipesh33/dotfile.git
```

## Setting up

After cloning, stow can be used to deploy the configurations into your system:

```bash
cd dotfile
stow hypr alacritty nvim zsh
```

Ensure that stow is installed on your system to use these commands effectively. The configurations will be symlinked to their respective locations.
