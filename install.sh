#!/usr/bin/env bash

echo "-----------------STARTING: tmux tpm clone-----------------"
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "tpm is alread installed skipping..."
fi
echo "-----------------COMPLETED: tmux tpm clone-----------------"
printf "\n"

DOT_CONFIG="$HOME/.config"
echo "-----------------STARTING: .config symlinks-----------------"
if [[ ! -d "$DOT_CONFIG" ]];then
    echo "Creating .config"
    mkdir "$DOT_CONFIG"
    ls -la "$DOT_CONFIG"
fi
if [[ ! -d "$DOT_CONFIG/nvim" ]];then
    ln -sf "$PWD/config/nvim" "$DOT_CONFIG/nvim" && echo "Neovim Symlink Created"
else
    echo "NEOVIM Symlink Found Skipping..."
fi
if [[ ! -d "$DOT_CONFIG/alacritty" ]];then
    ln -sf "$PWD/config/alacritty" "$DOT_CONFIG/alacritty" && echo "Alacritty Symlink Created"
else
    echo "Alacritty Symlink Found Skipping..."
fi
if [[ ! -d "$DOT_CONFIG/btop" ]];then
    ln -sf "$PWD/config/btop" "$DOT_CONFIG/btop" && echo "BTOP Symlink Created"
else
    echo "Btop Symlink Found Skipping..."
fi

if [[ ! -d "$DOT_CONFIG/awesome" ]];then
    ln -sf "$PWD/config/awesome" "$DOT_CONFIG/awesome" && echo "AwesomeWM Symlink Created"
else
    echo "AwesomeWM config Found Skipping..."
fi
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig" && echo "Gitconfig Symlink Created"
ln -sf "$PWD/.tmux.conf" "$HOME/.tmux.conf" && echo "Tmux Symlink Created"
ln -sf "$PWD/.bashrc" "$HOME/.bashrc" && echo ".bashrc Symlink Created"

echo "-----------------COMPLETED: .config symlinks-----------------"
printf "\n"
echo "-----------------STARTING: zsh custom install-----------------"
touch "$HOME/.zshrc"
./zsh/zshCustomInstall.sh --dry-run=0
ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc" && echo ".zshrc Symlink Created"
echo "-----------------COMPLETED: zsh custom install-----------------"
