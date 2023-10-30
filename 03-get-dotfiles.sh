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

# If a config file already exists, move it to .config-backup
mkdir -p .config-backup && \
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout

git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

popd