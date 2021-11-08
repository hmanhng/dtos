#!/bin/bash

#Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/.vim/.vimrc ~/.vimrc

vim +PlugInstall +qall
