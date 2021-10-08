#!/bin/bash

############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
DIR=~/dotfiles                    # dotfiles directory
OLD_DIR=~/dotfiles_old             # old dotfiles backup directory
DOTS=".vim .zshrc .gitconfig .vimrc"

echo "Install powerline fonts"
cd fonts
./install.sh
cd ..

echo "Install oh-my-zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

########## Create dotfiles_old in homedir

echo -n "> Creating $OLD_DIR for backup of any existing dotfiles"
mkdir -p $OLD_DIR

######### Change to the dotfiles directory
echo -n "> Changing to the $DIR directory"
cd $DIR
######### ZSH-PLUGINS

######### Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
######### from the homedir to any files in the ~/dotfiles directory specified in $DOTS
for file in $DOTS; do
    echo "> Backup file ~/$file to $OLD_DIR"
    mv ~/$file $OLD_DIR
    echo "> Creating symlink to $file"
    ln -s $DIR/$file ~/$file
done

defaults write -g ApplePressAndHoldEnabled 0
