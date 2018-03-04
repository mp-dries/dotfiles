#!/usr/bin/env bash

# Env
CURRENT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Source variables and functions required for installer
for f in "$CURRENT_DIR/local/zsh/configs/pre/"*; do
  source "$f"
done

# Go to home directory
cd $HOME
git clone https://github.com/drieshooghe/tomes.git $DOTFILES

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
