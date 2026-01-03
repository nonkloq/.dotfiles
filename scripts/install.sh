#!/usr/bin/env bash
set -e

echo "==> Updating system"
sudo pacman -Syu --noconfirm

echo "==> Installing packages"
sudo pacman -S --noconfirm \
  neovim \
  git \
  tmux \
  zsh \
  fastfetch \
  alacritty \
  kitty 
