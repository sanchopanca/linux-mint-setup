#!/usr/bin/env bash
set -euo pipefail

# needed to install carapace
echo "deb [trusted=yes] https://apt.fury.io/rsteube/ /" | sudo tee /etc/apt/sources.list.d/fury.list

sudo add-apt-repository -y ppa:fish-shell/release-4

sudo apt update

# install build tools, they are needed for building nushell and starship
sudo apt install -y build-essential gcc-multilib libssl-dev cmake

# install carapace
sudo apt install -y carapace-bin

# install fish
sudo apt install -y fish

# the easiest way to get nushell is to use cargo
# we will need rust toolchain anyway, so why not use it now

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh

source "$HOME/.cargo/env"
cargo install nu

# starship terminal prompt
cargo install starship

nu_path=$(which nu)

if ! grep -q "$nu_path" /etc/shells; then
  # Add Nu to the list of valid shells
  echo "Adding Nu to list of valid shells..."
  echo "$nu_path" | sudo tee -a /etc/shells
fi

fish_path=$(which fish)

if ! grep -q "$fish_path" /etc/shells; then
  # Add fish to the list of valid shells
  echo "Adding fish to list of valid shells..."
  echo "$fish_path" | sudo tee -a /etc/shells
fi

chsh -s $fish_path

echo "Please logout and log back in for the changes to take effect."
