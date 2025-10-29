# update system
sudo pacman -Syu --noconfirm

# niri and wayland
sudo pacman -S niri --noconfirm --needed
sudo pacman -S wayland --noconfirm --needed
sudo pacman -S wayland-utils wayland-protocols --noconfirm --needed
sudo pacman -S libinput mesa vulkan-icd-loader --noconfirm --needed
# download firefox
sudo pacman -S firefox chromium  --noconfirm --needed

# I like this window manager lol
sudo pacman -S nautilus --needed --noconfirm


# for when firefox cannot handle 360p and you're in a very old devie
sudo pacman -S yt-dlp --noconfirm --needed

# bar on top
sudo pacman -S waybar --noconfirm --needed


# app to search on niri
sudo pacman -S fuzzel --noconfirm --needed



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


# apps for that I use daily
sudo pacman -S curl kitty unzip obs-studio go helix tmux zellij npm nodejs python-pip python-pipx python discord flatpak fzf arch-wiki-docs jre-openjdk mpv blender pavucontrol wf-recorder man-db man-pages less --noconfirm --needed


# install gaming stuff
sudo pacman -S lutris wine-staging winetricks steam gamemode lib32-gamemode --noconfirm --needed
# install retroarch
sudo pacman -S retroarch --noconfirm --needed



# dependencies for raylib
sudo pacman -S alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama libxkbcommon lib32-wayland lib32-libxkbcommon --noconfirm --needed


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
flatpak-install-if-needed org.kde.kdenlive
flatpak-install-if-needed org.libreoffice.LibreOffice
flatpak-install-if-needed org.luanti.luanti
flatpak-install-if-needed org.vinegarhq.Vinegar
flatpak-install-if-needed org.vinegarhq.Sober 
flatpak-install-if-needed io.github.jliljebl.Flowblade
flatpak-install-if-needed org.zealdocs.Zeal

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
pipx install pyside6 --include-deps
pipx upgrade PySide6
# pyside6-designer



# for godot language server
sudo pacman -S nmap --needed --noconfirm
pipx install "gdtoolkit==4.*"
pipx upgrade "gdtoolkit==4.*"


