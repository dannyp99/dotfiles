#!/bin/bash

echo "-----------------STARTING: tmux tpm clone-----------------"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "-----------------COMPLETED: tmux tpm clone-----------------"
echo ""

DOT_CONFIG="$HOME/.config"
echo "-----------------STARTING: .config symlinks-----------------"

if [[ -L "$DOT_CONFIG/nvim" ]];then
    ln -sf "$PWD/config/nvim" "$DOT_CONFIG/nvim" && echo "Neovim Symlink Created"
fi
if [[ -L "$DOT_CONFIG/alacritty" ]];then
    ln -sf "$PWD/config/alacritty" "$DOT_CONFIG/alacritty" && echo "Alacritty Symlink Created"
fi
if [[ -L "$DOT_CONFIG/btop" ]];then
    ln -sf "$PWD/config/btop" "$DOT_CONFIG/btop" && echo "BTOP Symlink Created"
fi
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig" && echo "Gitconfig Symlink Created"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf" && echo "Tmux Symlink Created"
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc" && echo ".zshrc Symlink Created"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc" && echo ".bashrc Symlink Created"

echo "-----------------COMPLETED: .config symlinks-----------------"

