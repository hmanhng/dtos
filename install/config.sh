#!/bin/bash

git config --global user.email "hmanhng@icloud.com" #"$email"
git config --global user.name "hmanhng"  #"$name"

#Bamboo
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['xkb:us::eng', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

sudo sed -i 's/#AutoEnable=false/AutoEnable=true/g' /etc/bluetooth/main.conf
sudo sed -i 's/Logo=1/Logo=0/g' /etc/libreoffice/sofficerc

cp -rf dotfiles/. $HOME/
sudo cp -rf $HOME/etc/* /etc && rm -rf $HOME/etc
sudo cp -rf $HOME/usr/* /usr && rm -rf $HOME/usr

# Wallpapers
git clone https://github.com/hmanhng/Wallpapers.git $HOME/Pictures/Wallpapers

# Fonts ms
git clone https://github.com/hmanhng/WindowsFonts.git $HOME/ && rm -rf $HOME/WindowsFonts/.git && sudo mv $HOME/WindowsFonts/ /usr/share/fonts/ && sudo chmod 644 /usr/share/fonts/WindowsFonts/* && fc-cache --force

# Icon for fish
sudo curl -fL https://github.com/ttys3/starship-config/releases/download/v0.2.0/os-icon.linux_amd64  -o /usr/local/bin/os-icon
sudo chmod a+x /usr/local/bin/os-icon

# Lightdm
sudo git clone https://github.com/GabrielTenma/lightdm-gab-gradient.git /usr/share/lightdm-webkit/themes/lightdm-gab-gradient
sudo cp $HOME/Pictures/hmanhng.jpg /var/lib/AccountsService/icons/
cp $HOME/Pictures/hmanhng.jpg $HOME/.face
sudo bash -c 'cat dotfiles/hmanhng > /var/lib/AccountsService/users/hmanhng' && rm $HOME/hmanhng

# Change all scripts in .local/bin to be executable.
find $HOME/.local/bin -type f -print0 | xargs -0 chmod 775
sudo mv $HOME/.xmonad/hooks /etc/pacman.d/
xmonad --recompile

sudo chsh $USER -s "/bin/fish" && \

sudo systemctl enable bluetooth
sudo systemctl enable lightdm
sudo systemctl enable systemd-timesyncd

cat bin/bamboo.txt | sudo tee -a /etc/profile
