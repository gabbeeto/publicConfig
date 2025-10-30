echo "=== Starting Update ==="
flatpak update --assumeyes
echo "Updating flatpaks..."
echo "Updating configuration files..."
git pull
echo "Updating normal packages..."
bash ~/publicConfig/installStuff.sh
echo "Checking and changing folder layout..."
bash ~/publicConfig/structureFolders.sh
echo "=== Update Complete ==="

# restart waybar
pkill waybar
systemctl --user restart waybar
