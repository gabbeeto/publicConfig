echo "=== Starting Update ==="
flatpak update --asumeyes
echo "Updating flatpaks..."
echo "Updating configuration files..."
git pull
echo "Updating normal packages..."
bash ./installStuff.sh
echo "Checking and changing folder layout..."
bash ./structureFolders.sh
echo "=== Update Complete ==="

# restart waybar
pkill waybar
systemctl --user restart waybar
