bash ./mainSetup.sh

git config --global user.name "gabbeeto"
git config --global user.email "124828006+gabbeeto@users.noreply.github.com"
# generate key for github
ssh-keygen -t ed25519
# shows key
cat ~/.ssh/id_ed25519.pub | wl-copy
# opens firefox in this website so I can add my key
firefox https://github.com/settings/keys
