#!/usr/bin/env bash

# Set the project directory
# If you wish to change this directory, also alter the declaration in /local/zsh/configs/pre/env.sh
$DOTFILES=$HOME/.tomes

# Clone the project
git clone https://github.com/drieshooghe/tomes.git $DOTFILES

# Source variables and functions required for installer
for f in "$DOTFILES/local/zsh/configs/pre/"*; do
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
