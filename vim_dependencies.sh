#!/usr/bin/env bash
# Requires Vim to be installed first.
echo "Installing vim-plug"
if [ hash curl &>/dev/null ]
  then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo "curl needed to install vim-plug."
fi
