# this is for arch with x11/i3/polybar config

# update system
sudo pacman -Syu

# long list of installs
sudo pacman -S curl kitty unzip obs-studio go helix tmux npm nodejs npm  python-pip python-certifi discord udisks2 openbsd-netcat nvm nmap  git pacman-contrib scrot pulseaudio noto-fonts noto-fonts-emoji ttf-font-awesome xorg-xsetroot brightnessctl rofi polybar curl pavucontrol  network-manager-applet xorg-xbacklight  lxqt-config networkmanager tlp flatpak mpv fzf arch-wiki-docs libnotify dunst jre-openjdk jq

# file manager
sudo pacman -S thunar tumbler

# brightnessctl needs this
systemctl --user enable pulseaudio --now
sudo usermod -aG video $USER

echo "alias hx='helix'" >> ~/.bashrc
