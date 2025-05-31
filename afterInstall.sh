# install tlp-ui
flatpak install flathub com.github.d4nj1.tlpui

# install krita and gimp and pixelorama and inkscape
flatpak install flathub org.kde.krita
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.orama_interactive.Pixelorama
flatpak install flathub org.inkscape.Inkscape

# enable networkmanager
sudo systemctl enable --now NetworkManager

# install language servers
npm i -g vscode-langservers-extracted
npm i -g @olrtg/emmet-language-server

# make folders I always use
mkdir ~/Pictures
mkdir ~/Videos

# tmux plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


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

# godot format needs this
pip3 install "gdtoolkit==4.*"

# for go
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
