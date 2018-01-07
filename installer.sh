#!/usr/bin/env bash

### Go to current directory
cd $HOME

git clone https://github.com/drieshooghe/dotfiles.git $HOME/.dotfiles


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


### Make symlinks

# ZSH
ln -s $(pwd)/.dotfiles/conf/zshrc.conf $HOME/.zshrc
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created ZSH symlink"
else
    echo "Could not create ZSH symlink! Aborting..."
fi

# VIM
ln -s $(pwd)/.dotfiles/conf/vimrc.conf $HOME/.vimrc
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created VIMRC symlink"
else
    echo "Could not create VIMRC symlink! Aborting..."
    rm $HOME/.zshrc
    exit 1
fi
ln -s $(pwd)/.dotfiles/conf/vim/ $HOME/.vim
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created VIM symlink"
else
    echo "Could not create VIM symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    exit 1
fi

# GIT
ln -s $(pwd)/.dotfiles/conf/gitconfig.conf $HOME/.gitconfig
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created GIT symlink"
else
    echo "Could not create GIT symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    rm -R $HOME/.vim
fi

# ALIASES
ln -s $(pwd)/.dotfiles/conf/aliases.conf $HOME/.aliases
if [ $? -eq 0 ]; then
    /usr/bin/printf "\xE2\x9C\x94 Created aliases symlink"
else
    echo "Could not create aliases symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    rm $HOME/.gitconfig
    rm -R $HOME/.vim
fi
