#!/bin/bash

############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
DIR=~/dotfiles                    # dotfiles directory
OLD_DIR=~/dotfiles_old             # old dotfiles backup directory
DOTS=".i3 .oh-my-zsh .vim .wallpapers .bash_aliases .bash_profile .bashrc .gitconfig .vimrc .zshrc"
ZSH_PLUGINS=".zsh-plugins"
ZSH_PLUG_DIR=".oh-my-zsh/custom/plugins"

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

for plug_path in $DIR/$ZSH_PLUGINS/*;
do
    plug_name=`basename $plug_path`
    echo "> Adding plugin $plug_path -> $DIR/$ZSH_PLUG_DIR/$plug_name"
    ln -s $plug_path $DIR/$ZSH_PLUG_DIR/$plug_name
done

######## Set ZSH as default shell
echo ">> Setting zsh as default shell <<"
echo ">> May require password <<"
chsh -s /bin/zsh
