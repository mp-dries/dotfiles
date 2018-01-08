#!/usr/bin/env bash

# remove symlinks to the tomes package

# .ZSHRC
if [ "$(readlink -- "$HOME/.zshrc")" = ${HOME}/.tomes/conf/zshrc.conf ]; then
    rm -R $HOME/.zshrc
fi

# .VIMRC
if [ "$(readlink -- "$HOME/.vimrc")" = ${HOME}/.tomes/conf/vimrc.conf ]; then
    rm -R $HOME/.vimrc
fi

# .VIM
if [ "$(readlink -- "$HOME/.vim")" = ${HOME}/.tomes/conf/gitconfig.conf ]; then
    rm -R $HOME/.vim/
fi

# .GITCONFIG
if [ "$(readlink -- "$HOME/.gitconfig")" = ${HOME}/.tomes/conf/gitconfig.conf ]; then
    rm -R $HOME/.gitconfig
fi

# Remove this script and directory
if [[ -d $HOME/.tomes ]]; then
    rm -rf $HOME/.tomes
fi
