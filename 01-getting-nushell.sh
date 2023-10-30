#!/usr/bin/env bash

# upgrade all packages
sudo apt update
sudo apt upgrade -y

# install build tools, they are needed for building nushell
sudo apt install -y build-essential gcc-multilib

# the easiest way to get nushell is to use cargo
# we will need rust toolchain anyway, so why not use it now

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh

source "$HOME/.cargo/env"
cargo install nu

sudo chsh -s $(which nu) $USER
