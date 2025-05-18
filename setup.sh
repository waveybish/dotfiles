#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim

packages=(
  fd
  ripgrep
  npm
  lazygit
)

for package in "${packages[@]}"; do
  apt-get install "$package"
done
