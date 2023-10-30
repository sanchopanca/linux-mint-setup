#!/usr/bin/env bash

# the easiest way to get nushell is to use cargo
# we will need rust toolchain anyway, so why not use it now

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install nushell

sudo chsh -s $(which nu) $USER

