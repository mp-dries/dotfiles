#!/usr/bin/env bash

### Set directory to repo path
DOTDIR="$(pwd)"
# TODO: add absolute dotdir to beginning of zshrc

### Check requirements

# ZSH
if [[ ! $(which zsh) ]]; then
    echo "ZSH must be installed"
    exit 1
fi

# VIM
if [[ ! $(which vim) ]]; then
    echo "VIM must be installed"
    exit 1
fi

# GIT
if [[ ! $(which git) ]]; then
    echo "GIT must be installed"
    exit 1
fi

# .ENV
if [[ ! -f ./.env ]]; then
    echo ".env file not found!"
    echo "run \"cp .env.default .env\""
    exit 1
fi

### Make symlinks

# ZSH
ln -s ${BASEDIR}/conf/zshrc.conf $HOME/.zshrc
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created ZSH symlink"
else
    echo "Could not create ZSH symlink! Aborting..."
fi

# VIM
ln -s ${BASEDIR}/conf/vimrc.conf $HOME/.vimrc
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created VIMRC symlink"
else
    echo "Could not create VIMRC symlink! Aborting..."
    rm $HOME/.zshrc
    exit 1
fi
ln -s ${BASEDIR}/conf/vim/ $HOME/.vim
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created VIM symlink"
else
    echo "Could not create VIM symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    exit 1
fi

# GIT
ln -s ${BASEDIR}/conf/gitconfig.conf $HOME/.gitconfig
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created GIT symlink"
else
    echo "Could not create GIT symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    rm -R $HOME/.vim
fi
