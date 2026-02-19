

# this will make multilib work to make it possible to install 32bits libraries from steam
sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf


bash ./installStuff.sh

bash ./structureFolders.sh


xdg-settings set default-web-browser firefox.desktop
# downloads minecraft


# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc

# install ripdrag
cargo install ripdrag


# I use hx to enter helix
echo "alias hx='helix'" >> ~/.bashrc

echo "alias download='yt-dlp -f \"bestvideo[height<=720]+bestaudio/best[height<=720]\" --embed-subs  --add-metadata --merge-output-format mkv '" >> ~/.bashrc
echo "alias downloadP='yt-dlp -o  \"%(playlist_index)03d - %(title)s.%(ext)s\" -f \"bestvideo[height<=720]+bestaudio/best[height<=720]\" --embed-subs --add-metadata --merge-output-format mkv '" >> ~/.bashrc


# add update to update packages and updateSystem to update all the changes
echo "alias updateSystem='bash  ~/publicConfig/scripts/systemMenu.sh'" >> ~/.bashrc
echo "alias update='bash ~/publicConfig/scripts/update.sh'" >> ~/.bashrc

# helix is my default editor
echo "export EDITOR=\"helix\"" >> ~/.bashrc

# add cargo to path
echo "export PATH=\$PATH:~/.cargo/bin" >> ~/.bashrc

# I use the y command to navegate through yazi
echo "function y() {
	local tmp=\"\$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"\$@\" --cwd-file=\"\$tmp\"
	IFS= read -r -d '' cwd < \"\$tmp\"
	[ -n \"\$cwd\" ] && [ \"\$cwd\" != \"\$PWD\" ] && builtin cd -- \"\$cwd\"
	rm -f -- \"\$tmp\"
}" >> ~/.bashrc



echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
ls ~/.local/lib | grep python3.*

# for gdshaders and glsl
curl -L --retry 3 -o ~/x86_64-linux-musl.zip "https://github.com/nolanderc/glsl_analyzer/releases/download/v1.7.1/x86_64-linux-musl.zip" \
     --retry 3 \
     --progress-bar

unzip ~/x86_64-linux-musl.zip -d ~/Downloads/

mv ~/Downloads/x86_64-linux-musl/bin/glsl_analyzer ~/.local/bin/glsl_analyzer
# clean stuff
rm ~/x86_64-linux-musl.zip -f
rm ~/Downloads/x86_64-linux-musl -rf





 # -- git section --
# got this on the odin project set up section
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "helix"



# download godot
curl -L --retry 3 -o ~/godot-4.5.1-linux.zip "https://downloads.godotengine.org/?version=4.5.1&flavor=stable&slug=linux.x86_64.zip&platform=linux.64"
unzip ~/godot-4.5.1-linux.zip -d ~/
mv ~/Godot_v4.5.1-stable_linux.x86_64 ~/Godot.x86_64
rm ~/godot-4.5.1-linux.zip
chmod +x ~/Godot.x86_64



sudo systemctl enable keyd --now
sudo systemctl start keyd

sudo keyd reload



source ~/.bashrc

pkill waybar
sudo systemctl --user restart waybar

