#!/bin/bash

#Config_git
#echo -n "Enter your email: "
#read email
git config --global user.email "hmanhng@icloud.com" #"$email"
#echo -n "Enter your name: "
#read name
git config --global user.name "hmanhng"  #"$name"

#Bamboo
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['xkb:us::eng', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

cp -r Wallpapers $HOME/Pictures/ #Wallpaper

sudo systemctl enable bluetooth
sudo sed -i 's/#AutoEnable=false/AutoEnable=true/g' /etc/bluetooth/main.conf #Bluetooth alway enable
sudo sed -i 's/Logo=1/Logo=0/g' /etc/libreoffice/sofficerc #Disable startup logo

cat bin/bamboo.txt | sudo tee -a /etc/profile
#Warp
#sudo systemctl enable warp-svc.service
#sudo systemctl start warp-svc.service
