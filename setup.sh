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

ls -la /home
ls -la /home/linuxbrew

for package in "${packages[@]}"; do
  /home/linuxbrew/.linuxbrew/bin/brew install "$package"
done
