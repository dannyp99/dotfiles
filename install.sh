#!/bin/bash

DOT_CONFIG="$HOME/.config"
echo "-----------------STARTING: .config symlinks-----------------"

ln -sf "$PWD/config/nvim" "$DOT_CONFIG/nvim" && echo "Neovim Symlink Created"
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig" && echo "Gitconfig Symlink Created"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf" && echo "Tmux Symlink Created"
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc" && echo ".zshrc Symlink Created"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc" && echo ".bashrc Symlink Created"

echo "-----------------COMPLETED: .config symlinks-----------------"

