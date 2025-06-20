#!/usr/bin/env nu

# installing vscode
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O ~/Downloads/vscode.deb
sudo apt install ~/Downloads/vscode.deb
rm ~/Downloads/vscode.deb

# obs studio
sudo add-apt-repository -y ppa:obsproject/obs-studio
# helix
sudo add-apt-repository -y ppa:maveonair/helix-editor

sudo apt update

# all the software that i need
sudo apt install -y anki audacity cheese ffmpeg helix kdenlive meld mintnanny obs-studio vlc-bin

# all the rust based tools that i need
cargo install ripgrep
cargo install cargo-watch
cargo install evcxr_repl


# Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -O ~/Downloads/FiraCode.zip
sudo unzip ~/Downloads/FiraCode.zip FiraCodeNerdFontMono-Regular.ttf FiraCodeNerdFontMono-Light.ttf FiraCodeNerdFontMono-Bold.ttf FiraCodeNerdFontMono-SemiBold.ttf FiraCodeNerdFontMono-Medium.ttf FiraCodeNerdFontMono-Retina.ttf -d /usr/local/share/fonts
rm ~/Downloads/FiraCode.zip

sudo wget -O /usr/local/share/fonts/NotoColorEmoji.ttf https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf

echo "Change Terminal Font to FiraCode Nerd Font Mono"
