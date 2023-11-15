#!/bin/bash

chmod +x *.sh

#creating directories
mkdir -p ~/Scripts ~/.themes ~/.icons ~/.local/share/icons ~/Pictures/Wallpapers 
mkdir -p ~/.local/share/fonts ~/.cache/zsh/
touch ~/.cache/zsh/history

#purge the snap version of firefox
sudo snap remove --purge firefox

flatpak_packages=(
com.usebottles.bottles
com.discordapp.Discord
)



#install nala
    echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.listd/volian-archive-scar-unstable.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87015F3DA22D980
    sudo apt-key export DA22D980 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/slack.gpg
    sudo apt update && sudo apt install nala -y
{

echo "Which browser(s) would you like to install?"
echo "1. Thorium"
echo "2. Brave"
echo "3. Chrome"
echo "4. Firefox"

read -p "Enter your choice(s) (space-separated): " choices

choices_array=($choices)  # Convert space-separated input to an array

# Handle the case when only one browser is selected
if [ ${#choices_array[@]} -eq 1 ]; then
    case ${choices_array[0]} in
        1)
            # Thorium browser
            wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
            sudo mv thorium.list /etc/apt/sources.list.d/
            sudo nala update && sudo nala install thorium-browser -y
            highest_priority="thorium-browser"
            ;;
        2)
            # Brave browser
            sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            sudo nala update && sudo nala install brave-browser -y
            highest_priority="brave-browser"
            ;;
        3)
            # Chrome browser
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo nala install ./google-chrome-stable_current_amd64.deb
            rm -f google-chrome-stable_current_amd64.deb
            highest_priority="google-chrome"
            ;;
        4)
            # Firefox browser
            sudo nala install firefox -y
            highest_priority="firefox"
            ;;
        *)
            echo "Invalid choice: ${choices_array[0]}"
            ;;
    esac


        xdg-settings set default-web-browser ${highest_priority}.desktop
        echo "${highest_priority} has been set as the default browser."
        
else
    # Handle the case when multiple browsers are selected
    highest_priority="firefox"  # Set a default highest priority

    # Determine the highest priority among the selected browsers
    for choice in "${choices_array[@]}"; do
        case $choice in
            1)
                highest_priority="thorium-browser"
                ;;
            2)
                highest_priority="brave-browser"
                ;;
            3)
                highest_priority="google-chrome"
                ;;
            4)
                highest_priority="firefox"
                ;;
            *)
                echo "Invalid choice: $choice"
                ;;
        esac
    done

    # Install the selected browsers
    for choice in "${choices_array[@]}"; do
        case $choice in
            1)
                # Thorium browser
                wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
                sudo mv thorium.list /etc/apt/sources.list.d/
                sudo nala update && sudo nala install thorium-browser -y
                ;;
            2)
                # Brave browser
                sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
                echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
                sudo nala update && sudo nala install brave-browser -y
                ;;
            3)
                # Chrome browser
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo nala install ./google-chrome-stable_current_amd64.deb
                rm -f google-chrome-stable_current_amd64.deb
                ;;
            4)
                # Firefox browser
                sudo nala install firefox -y
                ;;
            *)
                echo "Invalid choice: $choice"
                ;;
        esac
    done

    
        xdg-settings set default-web-browser ${highest_priority}.desktop
        echo "${highest_priority} has been set as the default browser."
fi

}
sudo nala install git curl apt-transport-https chrome-gnome-shell gnome-tweaks gnome-shell-extensions gdm3 policykit-1 libadwaita-1-dev libglib2.0-dev python-gi-dev gettext meson gobject-introspection dconf-cli uuid-runtime appstream-util -y

links=(
        "https://extensions.gnome.org/extension/1634/resource-monitor/"
        "https://extensions.gnome.org/extension/5237/rounded-window-corners/"
        "https://extensions.gnome.org/extension/3193/blur-my-shell/"
        "https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/"
        "https://extensions.gnome.org/extension/517/caffeine/"
        "https://extensions.gnome.org/extension/19/user-themes/"
        "https://extensions.gnome.org/extension/5338/aylurs-widgets/"
        "https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep"
        "https://extensions.gnome.org/extension/3396/color-picker/"
        "https://www.virtualbox.org/wiki/Downloads"
        "https://github.com"
)

# Loop through the links and open each one in a new tab
for link in "${links[@]}"
do
    xdg-open "$link"
done

# Wait for the user to close the browser before moving forward
read -p "Press enter after you have closed the browser to continue..."




#---------------------------------from now on run concurrently----------------------------------
#installing obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.4.16/obsidian_1.4.16_amd64.snap
sudo snap install obsidian_1.4.16_amd64.snap --dangerous --classic
rm obsidian_1.4.16_amd64.snap

#installing protonvpn
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-2_all.deb
sudo nala install ./protonvpn-stable-release_1.0.3-2_all.deb -y
sudo nala update 
sudo nala install proton-vpn-gnome-desktop -y
sudo nala install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator -y
rm protonvpn-stable-release_1.0.3-2_all.deb 

#installing gdm-settings
git clone --depth=1 https://github.com/gdm-settings/gdm-settings
cd gdm-settings
meson setup build
yes | meson install -C build
cd ..
sudo rm -r gdm-settings

#installing auto-cpu-freq
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq
echo "i" | sudo ./auto-cpufreq-installer
cd ..
sudo rm -r auto-cpufreq
sudo cp auto-cpufreq.conf /etc/
sudo auto-cpufreq --install

#addign repositories 
    #vscode:
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg

    #android studio
        sudo add-apt-repository ppa:maarten-fonville/android-studio -y

    #yt-dlp
    	sudo add-apt-repository ppa:tomtomtom/yt-dlp -y
    
    #syncthing
        sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
        echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list    

    #virtualbox: 
        # wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
        # #problem:
        # sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian Jammy contrib" -y
        # # sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" -y
        # sudo apt-key export 2980AECF | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/virutalbox.gpg
    


#Enable the i386 architecture repository for steam installation:
sudo dpkg --add-architecture i386
sudo add-apt-repository -y multiverse && sudo nala update


#installing packages
packages=$(cat $HOME/Linux_Setup/packages.txt | tr '\n' ' ')
sudo nala install -y $packages

#start syncthing
sudo systemctl enable syncthing@$USER.service
sudo systemctl start syncthing@$USER.service


#something to do with kvm
sudo adduser `id -un` kvm
sudo adduser `id -un` libvirt
systemctl enable libvirtd
systemctl start libvirtd



#copying zsh files
cp -r .zsh ~
cp .zshrc ~
cd ~/.zsh/autojump/
./install.py
cd ~/Linux_Setup 




#Configuring the programs to my liking
#keyboard shortcut for xkill:
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/pluginschsh -s $(which zsh)/media-keys/custom-keybindings/custom0/ name "Xkill"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "xkill"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary>Escape"

#Ctrl+F launches Nautilus
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Launch Nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Ctrl>F'


#flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#adb for linux:
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d $HOME/Scripts/
rm platform-tools-latest-linux.zip

# isntall starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y


#copy grub-themes folder to Scripts folder
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1k7k3fuuXZ5ubh5dAiFySEJlbk1DLeUay' -O Grub-Themes.tar.xz
tar -xf Grub-Themes.tar.xz
rm Grub-Themes.tar.xz
cp -r Grub-Themes ~/Scripts

#change to zsh
chsh -s $(which zsh)



#install flutter:
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.9-stable.tar.xz
tar -xf flutter_linux_3.13.9-stable.tar.xz
cp -r flutter/ ~/Scripts/
sudo rm flutter_linux_3.13.9-stable.tar.xz
source .zshrc
flutter precache
yes | flutter doctor --android-licenses

gnome-terminal --tab -- bash -c 'code; exec bash'
gnome-terminal --tab -- bash -c '/opt/android-studio/bin/studio.sh; exec bash'
gnome-terminal -- bash -c './customize.sh; exec bash'
gnome-terminal -- bash -c './visit_sites.sh; exec bash'
gnome-terminal -- bash -c 'cd ~/Scripts/Grub-Themes/ && sudo ./install.sh; exec bash'



flutter doctor



