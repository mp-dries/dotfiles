#!/usr/bin/env bash

# Check requirements

# Check if the specified dotfiles directoryname is not $HOME/dotfiles
if [ "$DOTFILES" == "$HOME/dotfiles" ]; then
  cprint error "Thoughtbot's dotfiles directory is already named dotfiles, specify a different directory"
  exit 1
fi

# zsh
if ! which zsh > /dev/null; then
  cprint error "ZSH  must be installed"
  exit 1
fi

# git
if ! which git > /dev/null; then
  cprint error "GIT must be installed"
  exit 1
fi

# vim
if ! which vim > /dev/null; then
  cprint error "VIM must be installed"
  exit 1
fi

# tmux
if ! which tmux > /dev/null; then
  cprint error "TMUX must be installed"
  exit 1
fi

# rcm
if ! which rcup > /dev/null; then
  cprint error "RCM must be installed (see https://github.com/thoughtbot/rcm)"
  exit 1
fi
