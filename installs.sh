# long list of installs
sudo pacman -S kitty unzip obs-studio go helix tmux npm nodejs npm  certifi pip python-pip python-xyz python-certifi python-brotili python-brotili discord udisks2 openbsd-netcat nvm nmap  git pacman-contrib scrot pulseaudio noto-fonts noto-fonts-emoji ttf-font-awesome xorg-xsetroot brightnessctl rofi polybar curl pavucontrol
npm i -g vscode-langservers-extracted
npm i -g @olrtg/emmet-language-server

# make folders I always use
mkdir ~/Pictures
mkdir ~/Videos

# tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# brightnessctl needs this
systemctl --user enable pulseaudio --now
sudo usermod -aG video $USER

# set keyboard to the variant I like
setxkbmap us -variant altgr-intl

# installs cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
# installs twitch with cargo
cargo install twitch-tui

# copy the configs
cp .config/* ~/.config/ -r
cp .local ~ -r
cp .tmux.conf ~
