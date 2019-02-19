#!/usr/bin/env bash
echo "Installing vim with dependencies."
if [ ! hash vim &> /dev/null ]
  then
    sudo apt install -y vim
fi
if [ -f vim_dependencies.sh ]
  then
    source vim_dependencies.sh
fi
echo "Done."
