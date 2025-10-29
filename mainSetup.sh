
# this will make multilib work to make it possible to install 32bits libraries from steam
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

bash ./installStuff.sh

bash ./structureFolders.sh

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

# install ripdrag
cargo install ripdrag

# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc

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
