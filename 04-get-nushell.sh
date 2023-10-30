#!/usr/bin/env bash
set -euo pipefail

sudo apt update

# install build tools, they are needed for building nushell
sudo apt install -y build-essential gcc-multilib libssl-dev

# the easiest way to get nushell is to use cargo
# we will need rust toolchain anyway, so why not use it now

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh

source "$HOME/.cargo/env"
cargo install nu

nu_path=$(which nu)

if ! grep -q "$nu_path" /etc/shells; then
  # Add Nu to the list of valid shells
  echo "Adding Nu to list of valid shells..."
  echo "$nu_path" | sudo tee -a /etc/shells
fi

chsh -s $USER
