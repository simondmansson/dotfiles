#!/usr/bin/env bash
# Requires Vim to be installed first.
echo "Installing Vundle."
if [ hash git &> /dev/null -a hash curl &>/dev/null ]
  then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  else
    echo "Git and curl needed to install Vundle."
fi
