#!/usr/bin/env bash

# Check requirements

# Check if the specified dotfiles directoryname is not $HOME/dotfiles
if [ "$DOTFILES" == "$HOME/dotfiles" ]; then
  cprint error "Thoughtbot's dotfiles directory is already named dotfiles, specify a different directory"
fi

# zsh
if ! which zsh > /dev/null; then
  cprint error "ZSH  must be installed"
fi

# git
if ! which git > /dev/null; then
  cprint error "GIT must be installed"
fi

# vim
if ! which vim > /dev/null; then
  cprint error "VIM must be installed"
fi

# tmux
if ! which tmux > /dev/null; then
  cprint error "TMUX must be installed"
fi

# rcm
if ! which rcup > /dev/null; then
  cprint error "RCM must be installed (see https://github.com/thoughtbot/rcm)"
fi

# cmake
if ! which cmake > /dev/null; then
  cprint error "CMAKE must be installed"
fi
