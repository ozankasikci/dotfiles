#!/bin/bash

DIR=~/dotfiles                    # dotfiles directory
OLD_DIR=~/dotfiles_old             # old dotfiles backup directory
FILES="zshrc tmux.conf ideavimrc oh-my-zsh vimrc.bundles.local"    # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo -n "Creating $OLD_DIR for backup of any existing dotfiles in ~ ..."
mkdir -p $OLD_DIR
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $DIR directory ..."
cd $DIR
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $FILES
for FILE in $FILES; do
echo "Moving any existing dotfiles from ~ to $OLD_DIR"
mv ~/.$FILE $OLD_DIR/
echo "Creating symlink to $FILE in home directory."
ln -s $DIR/$FILE ~/.$FILE
done
