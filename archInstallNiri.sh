# update system
sudo pacman -Syu

# niri and wayland
sudo pacman -S niri --noconfirm
sudo pacman -S wayland --noconfirm
sudo pacman -S wayland-utils wayland-protocols --noconfirm
sudo pacman -S libinput mesa vulkan-icd-loader --noconfirm
# download firefox
sudo pacman -S firefox chromium  --noconfirm

# I like this window manager lol
sudo pacman -S nautilus


# for when firefox cannot handle 360p and you're in a very old devie
sudo pacman -S yt-dlp --noconfirm

# bar on top
sudo pacman -S waybar --noconfirm

# waybar fonts
sudo pacman -S ttf-font-awesome --noconfirm
sudo pacman -S ttf-nerd-fonts-symbols --noconfirm
sudo pacman -S ttf-roboto-mono noto-fonts --noconfirm
sudo pacman -S otf-font-awesome --noconfirm

sudo pacman -S noto-fonts-emoji --noconfirm

# app to search on niri
sudo pacman -S fuzzel --noconfirm


# manage x11 apps
sudo pacman -S xwayland-satellite --noconfirm

# creates folder
mkdir -p ~/games
# downloads minecraft
curl -L --retry 3 -o ~/games/minecraft.tar.gz "https://launcher.mojang.com/download/Minecraft.tar.gz"
# extract minecraft file
tar -xzf ~/games/minecraft.tar.gz -C ~/games/
# rm tar file
rm ~/games/*.tar*
# move executable
mv ~/games/m*r/m*r ~/games/minecraft
# remove empty folder
rmdir ~/games/m*r
echo "export PATH=\$PATH:~/games" >> ~/.bashrc

# Create desktop directory if it doesn't exist
mkdir -p ~/.local/share/applications

# Create Minecraft desktop file
cat > ~/.local/share/applications/minecraft.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Minecraft
Comment=Official Minecraft Launcher
Exec=/home/$USER/games/minecraft
Icon=minecraft
Categories=Game;
Keywords=minecraft;game;
StartupNotify=false
Terminal=false
EOF


# notification
sudo pacman -S mako --noconfirm

# lock screen
sudo pacman -S swaylock  --noconfirm

# to install ripdrag
sudo pacman -Sy --needed rust gtk4 base-devel --noconfirm


# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc


# install ripdrag
cargo install ripdrag

# best terminal file manager and dependencies
sudo pacman -S yazi  7zip  poppler fd ripgrep  zoxide resvg imagemagick ttf-nerd-fonts-symbols  --noconfirm


# for c++ and godot
sudo pacman -S clang scons python3 --noconfirm


# apps for that I use daily
sudo pacman -S curl kitty unzip obs-studio go helix tmux zellij npm nodejs python-pip python discord flatpak fzf arch-wiki-docs jre-openjdk mpv blender pavucontrol wf-recorder man-db man-pages less --noconfirm



# uncomment [multilib] section so you can install other libraries
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
# install gaming stuff
sudo pacman -S lutris wine-staging winetricks steam gamemode lib32-gamemode --noconfirm
# install retroarch
sudo pacman -S retroarch --noconfirm



# dependencies for raylib
sudo pacman -S alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama libxkbcommon lib32-wayland lib32-libxkbcommon --noconfirm

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

 # install language servers for helix
sudo npm i -g vscode-langservers-extracted
sudo npm i -g @olrtg/emmet-language-server
sudo npm install -g typescript typescript-language-server
sudo pacman -S python-lsp-server
pip3 install eel --break-system-packages

pip install git+https://github.com/psf/black --break-system-packages
# for godot language server
sudo pacman -S nmap
pip3 install "gdtoolkit==4.*" --break-system-packages
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
ls ~/.local/lib | grep python3.*

# for gdshaders and glsl
curl -L --retry 3 -o ~/x86_64-linux-musl.zip "https://github.com/nolanderc/glsl_analyzer/releases/download/v1.7.1/x86_64-linux-musl.zip" \
     --retry 3 \
     --progress-bar

unzip ~/x86_64-linux-musl.zip -d ~/Downloads/

mv ~/Downloads/x86_64-linux-musl/bin/glsl_analyzer ~/.local/bin/glsl_analyzer
rm ~/Downloads/x86_64-linux-musl.zip -f
rm ~/Downloads/x86_64-linux-musl -rf

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
sudo pacman -S wl-clipboard --noconfirm



 # -- git section --
# got this on the odin project set up section
git config --global user.name "gabbeeto"
git config --global user.email "124828006+gabbeeto@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "helix"

# generate key for github
ssh-keygen -t ed25519


# shows key
cat ~/.ssh/id_ed25519.pub | wl-copy
# opens firefox in this website so I can add my key
firefox https://github.com/settings/keys

# only for my private configs lol
mkdir -p ~/private/config
mkdir -p ~/private/avatar

# my private configs
# git clone git@github.com:gabbeeto/privateConfig.git ~/private/config

# download godot
mkdir ~/Downloads -p
curl -L --retry 3 -o ~/godot-4.5.1-linux.zip "https://downloads.godotengine.org/?version=4.5.1&flavor=stable&slug=linux.x86_64.zip&platform=linux.64"
unzip ~/godot-4.5.1-linux.zip -d ~/
mv ~/Godot_v4.5.1-stable_linux.x86_64 ~/Godot.x86_64
rm ~/godot-4.5.1-linux.zip
chmod +x ~/Godot.x86_64


# Create godot desktop file for fuzzel
cat > ~/.local/share/applications/godot.desktop << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Godot
Comment=Godot 4.5.1
Exec=/home/$USER/Godot.x86_64
Icon=godot
Categories=Development;IDE;
Keywords=godot;engine;godot engine;
StartupNotify=false
Terminal=false
MimeType=application/x-godot-project;
EOF


source ~/.bashrc
