#!/usr/bin/env bash

# Clone the project
git clone https://github.com/drieshooghe/tomes.git $HOME/.tomes

# Source variables and functions required for installer
for f in "$HOME/.tomes/local/zsh/configs/pre/"; do
  source "$f"
done

# Check requirements
source "$DOTFILES/install/check_requirements"

# ZSH setup
source "$DOTFILES/install/zsh.sh"

# Thoughtbot dotfiles setup
source "$DOTFILES/install/thoughtbot.sh"

# VIM setup
source "$DOTFILES/install/vim.sh"

# (optional) GO installer
source "$DOTFILES/install/go-installer.sh"

# (optional) GO archivist
source "$DOTFILES/install/go-archivist.sh"
