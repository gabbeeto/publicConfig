# got this on the odin project set up section
git config --global user.name "gabbeeto"
git config --global user.email "124828006+gabbeeto@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "hx"

# generate key for github
ssh-keygen -t ed25519

# shows key
cat ~/.ssh/id_ed25519.pub
# opens firefox in this website so I can add my key
firefox https://github.com/settings/keys
