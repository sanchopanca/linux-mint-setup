#!/usr/bin/env bash
# no -o pipefail because we use git checkout error output
set -eu

sudo apt install -y git

# good time to generate a new ssh key
ssh-keygen -t ed25519 -N "" -C "aleksandr@kovalev.engineer" -f ~/.ssh/id_ed25519

echo "Add the following public key to your github account:"
cat ~/.ssh/id_ed25519.pub

read -p "Press enter to continue"

pushd $HOME

echo ".cfg" >> .gitignore



git clone --bare git@github.com:sanchopanca/dotfiles.git $HOME/.cfg

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# If a config file already exists, move it to .config-backup
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout

config config --local status.showUntrackedFiles no

popd