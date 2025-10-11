echo "PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc


cargo install ripdrag

plugin to use drag and drop inside yazi with "md" keybindings
ya pkg add Joao-Queiroga/drag

# install krita and gimp and pixelorama and inkscape
flatpak install flathub org.kde.krita
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.orama_interactive.Pixelorama
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.chatterino.chatterino

# enable networkmanager
sudo systemctl enable --now NetworkManager

# install language servers
sudo npm i -g vscode-langservers-extracted
sudo npm i -g @olrtg/emmet-language-server

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

# this is for nvim package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# open godot this way in your godot project
# nvim --listen ./godothost

 
# this is the exec flag for godot
#  --server ./godothost --remote-send "<C-\><C-N>:n {file}<CR>{line}G{col}|"


# https://github.com/nolanderc/glsl_analyzer get the binary from release and send it to your $PATH
