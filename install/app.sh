#!/bin/bash
#Xdm
wget --no-check-certificate https://github.com/hmanhng/xdm/raw/main/xdm.sh && sudo sh ./xdm.sh && rm -f xdm.sh

#End
sudo pacman -R --noconfirm gobject-introspection && yay -Yc --noconfirm
