# creates folder for games
mkdir -p ~/games

# Create desktop directory if it doesn't exist for custom apps
mkdir -p ~/.local/share/applications


# copy the configs
cp .config/* ~/.config/ -r

# make directory to mount pendrive
sudo mkdir -p /mnt/usb


# make directory to my machine so I can use it with software
sudo mkdir -p ~/Videos/Me
sudo mkdir -p ~/Pictures

mkdir ~/Downloads -p

mkdir ~/projects -p



# this is for keyboard stuff
sudo mkdir -p /etc/keyd/
sudo cp ~/publicConfig/etc/keyd/default.conf /etc/keyd/
