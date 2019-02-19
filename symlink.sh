#!/usr/bin/env bash
# Set symlink to dotfiles if the files don't already exist in the home directory.
dotfiles=(".vimrc" ".zshrc" ".tmux.conf")
echo "Setting up symlinks for ${dotfiles[@]} to home dir."
for file in ${dotfiles[@]}; do
	if [ -f $file -a ! -f $HOME/$file ]
    then
      ln -s $(pwd)/$file $HOME/$file
    else 
      echo "Skipping $file. Already exist in $HOME."
    fi
done
echo "Done."
