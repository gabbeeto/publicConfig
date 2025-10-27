
# niri and wayland
sudo pacman -S niri --noconfirm
sudo pacman -S wayland --noconfirm
sudo pacman -S wayland-utils wayland-protocols --noconfirm
sudo pacman -S libinput mesa vulkan-icd-loader --noconfirm

# bar on top
sudo pacman -S waybar --noconfirm

# waybar fonts
sudo pacman -S ttf-font-awesome --noconfirm
sudo pacman -S ttf-nerd-fonts-symbols --noconfirm
sudo pacman -S ttf-roboto-mono noto-fonts --noconfirm
sudo pacman -S otf-font-awesome --noconfirm

# app to search on niri
sudo pacman -S fuzzel --noconfirm


# manage x11 apps
sudo pacman -S xwayland-satellite --noconfirm

mkdir ~/games
wget https://launcher.mojang.com/download/Minecraft.tar.gz ~/games



# notification
sudo pacman -S mako --noconfirm

# lock screen
sudo pacman -S swaylock --noconfirm

# to install ripdrag
sudo pacman -Sy --needed rust gtk4 base-devel --noconfirm


# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc
source ~/.bashrc


# install ripdrag
cargo install ripdrag

# best terminal file manager and dependencies
sudo pacman -S yazi  7zip  poppler fd ripgrep  zoxide resvg imagemagick ttf-nerd-fonts-symbols wf-recorder --noconfirm


# for c++ and godot
sudo pacman -S clang scons python3 --noconfirm


# apps for that I use daily
sudo pacman -S curl kitty unzip obs-studio go helix tmux zellij npm nodejs python-pip python discord flatpak fzf arch-wiki-docs jre-openjdk mpv blender --noconfirm


# I use hx to enter helix
echo "alias hx='helix'" >> ~/.bashrc


# helix is my default editor
echo "export EDITOR=\"helix\"" >> ~/.bashrc

# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc

# I use the y command to navegate through yazi
echo "function y() {
	local tmp=\"\$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"\$@\" --cwd-file=\"\$tmp\"
	IFS= read -r -d '' cwd < \"\$tmp\"
	[ -n \"\$cwd\" ] && [ \"\$cwd\" != \"\$PWD\" ] && builtin cd -- \"\$cwd\"
	rm -f -- \"\$tmp\"
}" >> ~/.bashrc


# flatpak apps I use every single time
flatpak install flathub org.kde.krita --assumeyes
flatpak install flathub org.gimp.GIMP --assumeyes
flatpak install flathub com.orama_interactive.Pixelorama --assumeyes
flatpak install flathub org.inkscape.Inkscape --assumeyes
flatpak install flathub com.chatterino.chatterino --assumeyes
flatpak install flathub org.kde.kdenlive --assumeyes
flatpak install https://flathub.org/repo/appstream/io.github.jliljebl.Flowblade.flatpakref --assumeyes
flatpak install flathub org.libreoffice.LibreOffice --assumeyes
flatpak install flathub org.luanti.luanti --assumeyes
flatpak install flathub org.vinegarhq.Vinegar --assumeyes
flatpak install flathub org.vinegarhq.Sober --assumeyes
flatpak install flathub org.libretro.RetroArch --assumeyes

 # install language servers for helix
sudo npm i -g vscode-langservers-extracted
sudo npm i -g @olrtg/emmet-language-server
sudo npm install -g typescript typescript-language-server

# copy the configs
cp .config/* ~/.config/ -r

sudo mkdir -p ~/scripts
cp scripts ~/scripts

# make directory to mount pendrive
sudo mkdir -p /mnt/usb


# make directory to my machine so I can use it with software
sudo mkdir -p ~/Videos/Me
sudo mkdir -p ~/Pictures

# to copy key ssh key
sudo pacman -S wl-clipboard


 # -- git section --
# got this on the odin project set up section
git config --global user.name "gabbeeto"
git config --global user.email "124828006+gabbeeto@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "hx"

# generate key for github
ssh-keygen -t ed25519



# shows key
cat ~/.ssh/id_ed25519.pub | wl-copy
# opens firefox in this website so I can add my key
firefox https://github.com/settings/keys

# only for my private configs lol
# git clone git@github.com:gabbeeto/privateConfig.git

