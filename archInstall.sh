# this is for arch with x11/i3/polybar config

# update system
sudo pacman -Syu

# long list of installs
sudo pacman -S curl kitty unzip obs-studio go helix tmux npm nodejs npm  python-pip python-certifi discord udisks2 openbsd-netcat nvm nmap  git pacman-contrib  pulseaudio noto-fonts noto-fonts-emoji ttf-font-awesome xorg-xsetroot brightnessctl rofi polybar curl pavucontrol  network-manager-applet xorg-xbacklight  lxqt-config networkmanager tlp flatpak mpv fzf arch-wiki-docs libnotify dunst jre-openjdk jq feh ffmpeg openssh flameshot


# dependencie for private stuff
sudo pacman -S uberzugpp

# for c++ and godot
sudo pacman -S clang scons python3

# for assembly stuff
sudo pacman -S nasm gdb gcc make

# for other monitor stuff
sudo pacman -S autorandr arandr

# file manager
sudo pacman -S thunar tumbler

# to install ripdrag
sudo pacman -Sy --needed rust gtk4 base-devel

# best terminal file manager and dependencies
sudo pacman -S yazi  7zip  poppler fd ripgrep  zoxide resvg imagemagick ttf-nerd-fonts-symbols

# brightnessctl needs this
systemctl --user enable pulseaudio --now
sudo usermod -aG video $USER

cp .config/kitty ~/.config/ 

echo "alias hx='helix'" >> ~/.bashrc
echo "export EDITOR=\"helix\"" >> ~/.bashrc

echo "function y() {
	local tmp=\"\$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"\$@\" --cwd-file=\"\$tmp\"
	IFS= read -r -d '' cwd < \"\$tmp\"
	[ -n \"\$cwd\" ] && [ \"\$cwd\" != \"\$PWD\" ] && builtin cd -- \"\$cwd\"
	rm -f -- \"\$tmp\"
}" >> ~/.bashrc
