# update system
sudo pacman -Syu --noconfirm

# niri and wayland
sudo pacman -S niri --noconfirm --needed
sudo pacman -S wayland --noconfirm --needed
sudo pacman -S wayland-utils wayland-protocols --noconfirm --needed
sudo pacman -S libinput mesa vulkan-icd-loader --noconfirm --needed
# download firefox
sudo pacman -S firefox chromium qutebrowser --noconfirm --needed

# I like this window manager and imv to display images 
sudo pacman -S nautilus imv --needed --noconfirm
sudo pacman -S gnome-themes-extra --needed --noconfirm
# for when firefox cannot handle 360p and you're in a very old devie
sudo pacman -S yt-dlp --noconfirm --needed

sudo pacman -S discover --noconfirm --needed

# install chinese stuff
sudo pacman -S noto-fonts-cjk  # Google Noto CJK fonts
sudo pacman -S wqy-microhei    # WenQuanYi Micro Hei
sudo pacman -S adobe-source-han-sans-cn-fonts  # Source Han Sans
sudo pacman -S adobe-source-han-serif-cn-fonts # Source Han Serif

# app launcher to search on niri
sudo pacman -S fuzzel --noconfirm --needed



# edit capslock
sudo pacman -S keyd --noconfirm --needed


# to copy key ssh key
sudo pacman -S wl-clipboard --noconfirm --needed



# waybar fonts
sudo pacman -S ttf-font-awesome --noconfirm --needed
sudo pacman -S ttf-nerd-fonts-symbols --noconfirm --needed
sudo pacman -S ttf-roboto-mono noto-fonts --noconfirm --needed
sudo pacman -S otf-font-awesome --noconfirm --needed

sudo pacman -S noto-fonts-emoji --noconfirm --needed



# manage x11 apps
sudo pacman -S xwayland-satellite --noconfirm --needed


# notification
sudo pacman -S mako --noconfirm --needed

# lock screen
sudo pacman -S swaylock  --noconfirm --needed

# to install ripdrag
sudo pacman -Sy  rust gtk4 base-devel --noconfirm --needed


# best terminal file manager and dependencies
sudo pacman -S yazi  7zip  poppler fd ripgrep  zoxide resvg imagemagick   --noconfirm --needed


# for c++ and godot
sudo pacman -S clang scons python3 --noconfirm --needed


# terminals
sudo pacman -S alacritty kitty ghostty --noconfirm --needed

# apps for that I use daily
sudo pacman -S curl unzip obs-studio go helix tmux zellij npm nodejs python-pip python-pipx python discord flatpak fzf arch-wiki-docs jre-openjdk mpv blender pavucontrol wf-recorder man-db man-pages less --noconfirm --needed



# install gaming stuff
sudo pacman -S lutris wine-staging winetricks steam gamemode lib32-gamemode --noconfirm --needed
# install retroarch
sudo pacman -S retroarch --noconfirm --needed



# dependencies for raylib
sudo pacman -S alsa-lib  libx11 libxrandr libxi libxcursor libxinerama libxkbcommon lib32-wayland lib32-libxkbcommon --noconfirm --needed

# raylib lol
sudo pacman -S raylib --noconfirm --needed

# mhmm some mathematics
sudo pacman -S sagemath gnuplot   --noconfirm --needed


# mhmm some video editing
sudo pacman -S kdenlive flowblade --noconfirm --needed

flatpak-install-if-needed() {
    if ! flatpak list --app | grep -q "$1"; then
        flatpak install --noninteractive flathub "$1"
    else
        flatpak update --noninteractive "$1"
    fi
}


flatpak-install-if-needed org.kde.krita
flatpak-install-if-needed org.gimp.GIMP
flatpak-install-if-needed com.orama_interactive.Pixelorama
flatpak-install-if-needed org.inkscape.Inkscape
flatpak-install-if-needed com.chatterino.chatterino
flatpak-install-if-needed org.libreoffice.LibreOffice
flatpak-install-if-needed org.luanti.luanti
flatpak-install-if-needed org.vinegarhq.Vinegar
flatpak-install-if-needed org.vinegarhq.Sober 
flatpak-install-if-needed org.zealdocs.Zeal
flatpak-install-if-needed net.ankiweb.Anki
flatpak-install-if-needed net.nokyan.Resources
flatpak-install-if-needed org.tenacityaudio.Tenacity
flatpak-install-if-needed io.github.ebonjaeger.bluejay
flatpak-install-if-needed org.gnome.Calculator
flatpak-install-if-needed org.kde.labplot
flatpak-install-if-needed org.kde.kalgebra
npm-install-if-needed() {
    if ! npm list -g "$1" --depth=0 | grep -q "$1"; then
        sudo npm install -g "$1" --no-fund --no-audit
    else
        sudo npm update -g "$1" --no-fund --no-audit
    fi
}

 # install language servers for helix
npm-install-if-needed vscode-langservers-extracted
npm-install-if-needed @olrtg/emmet-language-server
npm-install-if-needed typescript
npm-install-if-needed typescript-language-server

sudo pacman -S python-lsp-server --noconfirm --needed
sudo pacman -S lua-language-server --noconfirm --needed


# other cool stuff I use to develop on python
pip3 install pywebview --break-system-packages
# this is an adblock for qutebrowser
pip3 install adblock --break-system-packages


# for godot language server
sudo pacman -S nmap --needed --noconfirm
pipx install "gdtoolkit==4.*"
pipx upgrade "gdtoolkit==4.*"


# darkmode install
sudo pacman -S gsettings-desktop-schemas --needed --noconfirm
sudo pacman -S qt5ct --needed --noconfirm

#prism launcher for minecraft
sudo pacman -S prismlauncher --needed --noconfirm
