#!/bin/bash
# This script will set up my preferred tools on a ubuntu dist.

set -e

# install
sudo apt update && sudo apt upgrade -y
sudo apt install -y\
  git\
  vim\
  zsh\
  tmux\
  apt-transport-https\
  ca-certificates\
  curl\
  software-properties-common

################zsh setup#####################
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi
#set zsh as default shell
chsh -s `which zsh`
#############################################
# vim setup #
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then 
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
############################################
# docker setup #
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update && sudo apt install -y docker-ce docker-compose
##############################################
if [ ! -d ~/setup-repos ]; then
  # configure
  git clone https://github.com/Kalk88/dotfiles.git setup-repos/dotfiles
  cp setup-repos/dotfiles/.vimrc ~/.vimrc
  cp setup-repos/dotfiles/.zshrc ~/.zshrc
  sudo rm -rf setup-repos
fi
