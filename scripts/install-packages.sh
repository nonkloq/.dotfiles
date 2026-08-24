#!/usr/bin/env bash
set -e

echo "==> Updating system"
sudo pacman -Syuu --noconfirm

echo "==> Installing packages"
sudo pacman -S --noconfirm \
  neovim \
  git \
  tmux \
  zsh \
  fastfetch \
  kitty \
  zoxide \
  bat \
  eza \
  ripgrep \
  fzf \
  tree-sitter-cli \
  npm \
  go \
  vlc \
  mpv \
  code \
  libreoffice-fresh \
  tealdeer \
  starship \
  oh-my-zsh-git \
  stow \
  rclone \
  age \
  obsidian \
  ttf-jetbrains-mono-nerd ttf-firacode-nerd
echo "Manually install cargo and rust using rustup"

