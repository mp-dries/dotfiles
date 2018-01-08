#!/usr/bin/env bash

# remove symlinks to the tomes package

# Color variables
RED=1 GRE=2 WHI=7

echo
echo "Deleting symlinks..."
echo

# .ZSHRC
if [ "$(readlink -- "$HOME/.zshrc")" = ${HOME}/.tomes/conf/zshrc.conf ]; then
    rm -R $HOME/.zshrc
    if [ $? -eq 0 ]; then
        echo $(tput setaf ${GRE}) " -> Deleted ZSHRC symlink"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not delete ZSHRC symlink!"
    fi
fi

# .VIMRC
if [ "$(readlink -- "$HOME/.vimrc")" = ${HOME}/.tomes/conf/vimrc.conf ]; then
    rm -R $HOME/.vimrc
    if [ $? -eq 0 ]; then
        echo $(tput setaf ${GRE}) " -> Deleted VIMRC symlink"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not delete VIMRC symlink!"
    fi
fi

# .VIM
if [[ "$(readlink -- "$HOME/.vim")" = ${HOME}/.tomes/conf/vim/ ]]; then
    rm -R $HOME/.vim
    if [ $? -eq 0 ]; then
        echo $(tput setaf ${GRE}) " -> Deleted VIM symlink"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not delete VIM symlink!"
    fi
fi

# .GITCONFIG
if [[ "$(readlink -- "$HOME/.gitconfig")" = ${HOME}/.tomes/conf/gitconfig.conf ]]; then
    rm -R $HOME/.gitconfig
    if [ $? -eq 0 ]; then
        echo $(tput setaf ${GRE}) " -> Deleted GITCONFIG symlink"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not delete GITCONFIG symlink!"
    fi
fi

# Ask if Go must be removed
tput setaf ${WHI}
read -p "Do you wish to uninstall Go? (y/n) " UNINSTALLGO

if [[ ${UNINSTALLGO} == "y" ]]; then
    KERNEL=$(uname -s)
    rm -rf "$HOME/.go/"
    sudo rm -rf "/usr/local/go"

    if [[ ${KERNEL} == 'Darwin' ]]; then
        rm -f /etc/paths.d/go
    fi

    if [[ $? -eq 0 ]]; then
        echo $(tput setaf ${GRE}) " -> Uninstalled Go"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not remove $HOME/.go/!"
    fi
fi


# Remove this script and directory
if [[ -d $HOME/.tomes ]]; then
    rm -rf $HOME/.tomes
    if [[ $? -eq 0 ]]; then
        echo $(tput setaf ${GRE}) " -> Deleted tomes directory"
    else
        echo $(tput setaf ${RED}) "ERROR:" $(tput setaf ${WHI}) "Could not delete the tomes directory!"
    fi
    cd $HOME
fi
