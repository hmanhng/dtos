#!/bin/bash

#Vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mv ~/.config/nvim/coc-settings.json ~/.vim/
nvim +PlugInstall +qall
