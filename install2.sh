#!/bin/bash

sudo apt install -y \
    python3-dev python3-venv python3-pip python-is-python3 \
    build-essential ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make -j4 CMAKE_BUILD_TYPE=Release
# sudo make install

