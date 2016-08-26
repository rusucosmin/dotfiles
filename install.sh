#!/bin/bash

############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".i3 .oh-my-zsh .vim .wallpapers .bash_aliases .bash_profile .bashrc .gitconfig .vimrc .zshrc"

########## Create dotfiles_old in homedir

echo -n "> Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir

######### Change to the dotfiles directory
echo -n "> Changing to the $dir directory"
cd $dir

######### Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
######### from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "> Backup file ~/$file to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "> Creating symlink to $file"
    ln -s $dir/$file ~/$file
done

######## Set ZSH as default shell
echo "> Setting zsh as default shell"
echo "> May require password"
chsh -s /bin/zsh
