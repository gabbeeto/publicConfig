sudo apt install brightnessctl pavucontrol rofi i3 polybar flatpak npm tmux kitty

# installs helix
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix


# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22
