#!/usr/bin/env bash

# remove symlinks to the dotfiles package

# .ZSHRC
if [ "$(readlink -- "$HOME/.zshrc")" = ${HOME}/.dotfiles/conf/zshrc.conf ]; then
    rm -R $HOME/.zshrc
fi

# .VIMRC
if [ "$(readlink -- "$HOME/.vimrc")" = ${HOME}/.dotfiles/conf/vimrc.conf ]; then
    rm -R $HOME/.vimrc
fi

# .ALIASES
if [ "$(readlink -- "$HOME/.aliases")" = ${HOME}/.dotfiles/conf/aliases.conf ]; then
    rm -R $HOME/.aliases
fi

# .GITCONFIG
if [ "$(readlink -- "$HOME/.gitconfig")" = ${HOME}/.dotfiles/conf/gitconfig.conf ]; then
    rm -R $HOME/.gitconfig
fi

# .VIM
if [ "$(readlink -- "$HOME/.vim")" = ${HOME}/.dotfiles/conf/gitconfig.conf ]; then
    rm -R $HOME/.vim/
fi

# Remove this script and directory
if [[ -d $HOME/.dotfiles ]]; then
    rm -rf $HOME/.dotfiles
fi
