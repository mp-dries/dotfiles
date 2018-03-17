#!/usr/bin/env bash

# Clone the project to the current directory
DOTFILE_DIR="$( cd "$(dirname "$0")" ; pwd -P )/dotfiles"
git clone https://github.com/drieshooghe/tomes.git $DOTFILE_DIR
echo "export DOTFILES=\"$DOTFILE_DIR\"" >> $DOTFILE_DIR/local/zsh/configs/pre/dotfile-dir.sh

# Source variables and functions required for installer
for f in "$DOTFILE_DIR/local/zsh/configs/pre/"*; do
  source "$f"
done

# Check requirements
source "$DOTFILE_DIR/install/check_requirements.sh"

# ZSH setup
source "$DOTFILE_DIR/install/zsh.sh"

# Thoughtbot dotfiles setup
source "$DOTFILE_DIR/install/thoughtbot.sh"

# VIM setup
source "$DOTFILE_DIR/install/vim.sh"

echo
