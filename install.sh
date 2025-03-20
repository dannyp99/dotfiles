#!/usr/bin/env bash

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

if [[ ! -d "$DOT_CONFIG/tmux" ]];then
    ln -sf "$PWD/config/tmux" "$DOT_CONFIG/tmux" && echo "TMUX Symlink Created"
    printf "\t-----------------STARTING: tmux tpm clone-----------------\n"
    if [[ ! -d "$HOME/.config/tmux/plugins/tpm" ]]; then
        git clone https://github.com/tmux-plugins/tpm "$DOT_CONFIG/tmux/plugins/tpm"
        git clone https://github.com/catppuccin/tmux.git "$DOT_CONFIG/tmux/plugins/catppuccin/tmux"
    else
        echo "tpm is alread installed skipping plugin setup..."
    fi
    printf "\t-----------------COMPLETED: tmux tpm clone-----------------"
    printf "\n"
else
    echo "TMUX config Found Skipping..."
fi

if [[ ! -f "$HOME/.gitconfig" ]];then
    ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig" && echo "Gitconfig Symlink Created"
else
    echo ".gitconfig found skipping..."
fi

if [[ ! -f "$HOME/.bashrc" ]];then
    ln -sf "$PWD/.bashrc" "$HOME/.bashrc" && echo ".bashrc Symlink Created"
else
    echo ".bashrc found skipping..."
fi

echo "-----------------COMPLETED: .config symlinks-----------------"
printf "\n"
echo "-----------------STARTING: zsh custom install-----------------"
if [[ ! -f "$HOME/.zshrc" ]]; then
    touch "$HOME/.zshrc"
    ./zsh/zshCustomInstall.sh --dry-run=0
    ln -sf "$PWD/zsh/.zshrc" "$HOME/.zshrc" && echo ".zshrc Symlink Created"
else
    echo ".zshrc already found skipping installation"
fi
echo "-----------------COMPLETED: zsh custom install-----------------"
