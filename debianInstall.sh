# updates
sudo apt update
sudo apt upgrade


sudo apt install brightnessctl pavucontrol rofi i3 polybar flatpak npm tmux kitty mpv fzf python3-pip python3

# to show images with super + f1 and super + f2
sudo apt install feh


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

# dependencies for bashscript to make chat switch to different workspace
sudo apt install  jq  # Debian/Ubuntu

