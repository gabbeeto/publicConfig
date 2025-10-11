# updates
sudo apt update
sudo apt upgrade


sudo apt install brightnessctl pavucontrol rofi i3 polybar flatpak npm tmux kitty mpv fzf python3-pip python3 curl

# to show images with super + f1 and super + f2
sudo apt install feh


# Manual method for downloading fonts that work on yazi
cd ~/Downloads
wget -O nerd-symbols.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip"
mkdir -p ~/.local/share/fonts
unzip -o nerd-symbols.zip -d ~/.local/share/fonts/
fc-cache -fv
rm nerd-symbols.zip


# dependencies for bashscript to make chat switch to different workspace and for yazi
sudo apt install  jq  # Debian/Ubuntu

# dependencies for yazi
sudo apt install ffmpeg 7zip  poppler-utils fd-find ripgrep  zoxide imagemagick


# stuff so we can install ripdrag to drag files
sudo apt install libgtk-4-dev build-essential curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

git clone https://github.com/sxyazi/yazi.git
cd yazi
cargo build --release --locked

mv target/release/yazi target/release/ya /usr/local/bin/


# install clang for c++
sudo apt install clangd

# install ssh
sudo apt install openssh-server -y
sudo systemctl enable --now ssh

# enables flatpak(you have to reboot though)
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# installs helix
# sudo add-apt-repository ppa:maveonair/helix-editor
# sudo apt update
# sudo apt install helix
sudo snap install helix --classic

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22


echo "alias hx='helix'" >> ~/.bashrc

# to record and streamc
sudo add-apt-repository ppa:jonathonf/ffmpeg-4
sudo apt update
sudo apt install ffmpeg

# this is so I can execute java programs like chatty
sudo apt install default-jre # Debian/Ubuntu


echo "export EDITOR=\"helix\"" >> ~/.bashrc

echo "function y() {
	local tmp=\"\$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"\$@\" --cwd-file=\"\$tmp\"
	IFS= read -r -d '' cwd < \"\$tmp\"
	[ -n \"\$cwd\" ] && [ \"\$cwd\" != \"\$PWD\" ] && builtin cd -- \"\$cwd\"
	rm -f -- \"\$tmp\"
}" >> ~/.bashrc


# this is for ubuntu 24.04 version of linux mint:
# https://software.opensuse.org/download.html?project=home%3Ajustkidding&package=ueberzugpp
echo 'deb http://download.opensuse.org/repositories/home:/justkidding/xUbuntu_24.04/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
sudo apt update
sudo apt install ueberzugpp
