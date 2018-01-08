#!/usr/bin/env bash

# Color variables
RED=1 GRE=2 WHI=7

### Go to current directory
cd $HOME

git clone https://github.com/drieshooghe/tomes.git $HOME/.tomes


### Check requirements

# TPUT
if [[ ! $(which tput) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "TPUT must be installed"
    exit 1
fi

# ZSH
if [[ ! $(which zsh) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "ZSH must be installed"
    exit 1
fi

# VIM
if [[ ! $(which vim) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "VIM must be installed"
    exit 1
fi

# GIT
if [[ ! $(which git) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "GIT must be installed"
    exit 1
fi


### Make symlinks

# ZSH
ln -s $(pwd)/.tomes/conf/zshrc.conf $HOME/.zshrc
if [ $? -eq 0 ]; then
     "\xE2\x9C\x94 Created ZSH symlink"
else
    echo "Could not create ZSH symlink! Aborting..."
fi

# VIM
ln -s $(pwd)/.tomes/conf/vimrc.conf $HOME/.vimrc
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created VIMRC symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create VIMRC symlink! Aborting..."
    rm $HOME/.zshrc
    exit 1
fi
ln -s $(pwd)/.tomes/conf/vim/ $HOME/.vim
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created VIM symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create VIM symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    exit 1
fi

# GIT
ln -s $(pwd)/.tomes/conf/gitconfig.conf $HOME/.gitconfig
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created GITCONFIG symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create GITCONFIG symlink! Aborting..."
    rm $HOME/.zshrc
    rm $HOME/.vimrc
    rm -R $HOME/.vim
fi
