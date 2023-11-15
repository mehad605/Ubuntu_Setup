#!/bin/bash

#if nala is not installed install nala:
if ! dpkg-query -W "nala" >/dev/null 2>&1; then
    echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015F3DA22D980
    sudo apt-key export DA22D980 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/slack.gpg
    sudo apt install nala -y 
else
    echo "nala is already installed."
fi

#installation:
packages=(
gnome-tweaks
gnome-shell-extensions
dconf-editor
libsass1 
sassc
git
chrome-gnome-shell)
for package in "${packages[@]}"
do
    sudo nala install $package -y
done


#directory creation
mkdir -p ~/.themes ~/.local/share/icons ~/.local/share/fonts ~/.local/share/gnome-shell/extensions ~/Scripts

git clone https://github.com/linuxdotexe/nordic-wallpapers $HOME/Pictures/Wallpapers/Nordic_Wallpapers
git clone https://github.com/EliverLara/Nordic
#cp Nordic/gtk-4.0/gtk.css ~/.config/gtk-4.0/ 
sudo cp -r Nordic/kde/cursors/Nordic-cursors /usr/share/icons
sudo mv Nordic /usr/share/themes/
git clone https://github.com/zayronxio/Zafiro-Nord-Dark
sudo mv Zafiro-Nord-Dark /usr/share/icons/
mv $HOME/Ubuntu_Setup/Cappuccin_Wallpapers $HOME/Pictures/Wallpapers/
mv $HOME/Ubuntu_Setup/Fonts/* $HOME/.local/share/fonts

dconf load /org/gnome/ < $HOME/Ubuntu_Setup/gnome_settings.txt


