#!/bin/bash

#Install apt
yay -Sy --needed --noconfirm $(cat bin/apt.txt | egrep -v "^\s*(#|$)")

#Chrome
git clone https://github.com/hmanhng/chrome.git && cd chrome/ && makepkg -si --noconfirm && cd .. && rm -rf chrome/

#Bamboo
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['xkb:us::eng', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

#Xdm
wget --no-check-certificate https://github.com/hmanhng/xdm/raw/main/xdm.sh && sudo sh ./xdm.sh && rm -f xdm.sh

#End
sudo pacman -R --noconfirm gobject-introspection && yay -Yc --noconfirm
