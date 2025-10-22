
# niri and wayland
sudo pacman -S niri
sudo pacman -S wayland
sudo pacman -S wayland-utils wayland-protocols
sudo pacman -S libinput mesa vulkan-icd-loader

# bar on top
sudo pacman -S waybar

# waybar fonts
# sudo pacman -S ttf-material-design-icons
sudo pacman -S nerd-fonts
sudo pacman -S ttf-font-awesome
sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -S ttf-roboto-mono noto-fonts
sudo pacman -S otf-font-awesome

# app to search on niri
sudo pacman -S fuzzel

# manage x11 apps
sudo pacman -S xwayland-satellite
# sudo pacman -S xorg-xwayland


# notification
sudo pacman -S mako

# lock screen
sudo pacman -S swaylock
