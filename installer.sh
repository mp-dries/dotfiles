#!/usr/bin/env bash

# Variables
RED=1 GRE=2 WHI=7 CYA=6
GOLANGVERSION="1.9.2"

### Go to home directory
cd $HOME
git clone https://github.com/drieshooghe/tomes.git $HOME/.tomes

### Check requirements

echo
echo "Checking requirements..."
echo

# TPUT
if [[ ! $(which tput) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "CURL must be installed"
    exit 1
fi

# CURL
if [[ ! $(which curl) ]]; then
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

# TMUX
if [[ ! $(which tmux) ]]; then
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "TMUX must be installed"
    exit 1
fi


### Make symlinks

echo
echo "Creating the necessary symlinks..."
echo

# ZSH
ln -s $(pwd)/.tomes/conf/zshrc.conf $HOME/.zshrc
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created ZSHRC symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create ZSHRC symlink! Aborting..."
    exit 1
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
    rm -R $HOME/.vimrc
    rm -R $HOME/.vim/
    exit 1
fi
ln -s $(pwd)/.tomes/conf/gitignore.conf $HOME/.gitignore_global
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created GITIGNORE symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create GITIGNORE symlink! Aborting..."
    rm $HOME/.zshrc
    rm -R $HOME/.vimrc
    rm -R $HOME/.vim/
    rm -R $HOME/.gitconfig
    exit 1
fi

# TMUX
ln -s $(pwd)/.tomes/conf/tmux.conf $HOME/.tmux.conf
if [ $? -eq 0 ]; then
    echo $(tput setaf ${GRE}) " -> Created TMUX.CONF symlink"
else
    echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not create TMUX.CONF symlink! Aborting..."
    rm $HOME/.zshrc
    rm -R $HOME/.vimrc
    rm -R $HOME/.vim/
    rm -R $HOME/.gitconfig
    rm -R $HOME/.gitignore
    exit 1
fi


### Install GOLANG

if [[ ! $(which go) ]]; then

    echo "A lot of the scripts included in this package require Go, which doesn't seem to be installed."

    read -p "Do you wish to install Go? (y/n) " INSTALLGO

    if [[ ! ${INSTALLGO} == "y" ]]; then
      exit 1
    fi

    # Check which go installer is required
    MACHINE_TYPE=$(uname -m)
    KERNEL=$(uname -s)
    if [[ ${MACHINE_TYPE} == 'x86_64' ]]; then
            if [[ ${KERNEL} == 'Linux' ]]; then
                DFILE="go${GOLANGVERSION}.linux-amd64.tar.gz"
            elif [[ ${KERNEL} == 'Darwin' ]]; then
                DFILE="go${GOLANGVERSION}.darwin-amd64.tar.gz"
            fi
    elif [[ ${MACHINE_TYPE} == 'i386' ]]; then
        DFILE="go${GOLANGVERSION}.linux-386.tar.gz"
    elif [[ ${MACHINE_TYPE} == 'arm7l' ]]; then
        DFILE="go${GOLANGVERSION}.linux-armv6l.tar.gz"
    fi

    if [ -d "$HOME/.go" ] || [ -d "$HOME/go" ]; then
        echo "A 'go' or '.go' directory already exist. Aborting..."
        exit 1
    fi

    # Download and install Go
    echo
    echo "Downloading GOLANG installer..."
    echo

    curl -SL https://storage.googleapis.com/golang/$DFILE -o /tmp/go.tar.gz
    if [ $? -ne 0 ]; then
        echo "Download failed! Aborting..."
        exit 1
    fi

    echo
    echo "Extracting GOLANG..."
    echo
    
    tar -C "$HOME" -xzf /tmp/go.tar.gz
    if [ $? -ne 0 ]; then
        echo "Extracting /tmp/go.tar.gz failed! Aborting..."
        exit 1
    fi

    sudo mv "$HOME/go" "/usr/local/go"
    if [ $? -ne 0 ]; then
        echo "Could not move Go directory! Aborting..."
        exit 1
    fi

    # make go directories 
    mkdir -p $HOME/go/{bin,src,pkg}
    if [ $? -ne 0 ]; then
        echo "Making Go directories failed! Aborting..."
        exit 1
    fi

    echo
    echo "Installing additional go tools (godoc, etc)..."
    echo

    # install additional go tools
    go get golang.org/x/tools/cmd/...
    if [ $? -ne 0 ]; then
        echo "Installing additional go tools failed! Aborting..."
        exit 1
    fi

    echo $(tput setaf ${GRE}) " -> Installed Go"

fi

echo $(tput setaf ${CYA}) "You've successfully installed the tomes script core, a marble of modern development! Now let's boogie..."
