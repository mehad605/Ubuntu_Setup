# Set aliases
alias ls='exa'
alias vdown='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --write-sub --write-auto-sub --sub-lang en --merge-output-format mp4 --embed-thumbnail'
alias move_themes='sudo mv -n ~/.themes/* /usr/share/themes/ && sudo mv -n ~/.icons/* /usr/share/icons/ && sudo mv -n ~/.local/share/icons/* /usr/share/icons/ && sudo mv -n ~/.local/share/fonts/* /usr/share/fonts/'
alias update='sudo nala update'
alias upgrade='sudo nala upgrade'
alias install='sudo nala install'
alias arc='sudo apt autoremove && sudo apt autoclean'
alias studio='/opt/android-studio/bin/studio.sh'
alias gttheme='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias cpu="auto-cpufreq --stats"
alias mkxz='tar -cJf'
alias mkgz='tar -czf'
alias unxz='tar -xf'
alias ungz='tar -xzf'
alias mkdir="mkdir -p"
alias cp="cp -i"
alias ktheme="kitty +kitten themes --reload-in=all"
alias kup="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias unkitty="rm -r ~/.local/kitty.app/"
alias gtheme='cd ~/Scripts/Grub-Themes/ && sudo ./install.sh'

