#!/usr/bin/env bash

# Ask for the sudo password at the beginning
sudo echo "Starting setup..."

# the easiest way to get nushell is to use cargo
# we will need rust toolchain anyway, so why not use it now

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh

source "$HOME/.cargo/env"
cargo install nu

sudo chsh -s $(which nu) $USER
