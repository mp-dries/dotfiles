#!/usr/bin/env bash

# zsh
cprint title "zsh"


# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  run "$VERBOSE" \
    "git clone git://github.com/robbyrussell/oh-my-zsh.git \"$HOME/.oh-my-zsh\"" \
    "Cloning Oh My Zsh in ~/.oh-my-zsh" \
    "true"
else
  run "$VERBOSE" \
    "git --git-dir=\"$HOME/.oh-my-zsh/.git\" --work-tree=\"$HOME/.oh-my-zsh\" pull" \
    "Pulling Oh My ZSH in ~/.oh-my-zsh" \
    "true"
fi

