#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles        # dotfiles directory
olddir=~/.dotfiles_old # old dotfiles backup directory
files=(zshrc config/kitty maketemps lock.sh gitconfig zprofile profile mathenv
       tmux.conf config/nvim p10k.zsh dir_colors)

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $olddir/config
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
for file in ${files[@]}; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
