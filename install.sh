#!/bin/bash

# Clone the project to the current directory
DOTFILE_DIR="$( cd "$(dirname '$0')" ; pwd -P )/dotfiles"
git clone https://github.com/drieshooghe/dotfiles.git $DOTFILE_DIR
cp $DOTFILE_DIR/local/zsh/configs/pre/dotfile-dir.temp $DOTFILE_DIR/local/zsh/configs/pre/dotfile-dir.sh
echo 'export DOTFILES="'$DOTFILE_DIR'"' >> $DOTFILE_DIR/local/zsh/configs/pre/dotfile-dir.sh

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

# Install secrets
source "$DOTFILE_DIR/install/secrets.sh"

echo
