#!/usr/bin/env bash

DOT_CONFIG="$HOME/.config"
echo "-----------------STARTING: .config dir symlinks-----------------"
if [[ ! -d "$DOT_CONFIG" ]];then
    echo "Creating .config"
    mkdir "$DOT_CONFIG"
    ls -la "$DOT_CONFIG"
fi

for CONFIG_DIR in config/*; do
    IFS='/' read -r -a ITEM_SPLIT <<< "$CONFIG_DIR"
    ITEM="${ITEM_SPLIT[1]}"
    if [[ -e "$CONFIG_DIR" ]]; then
        if [[ ! -d "$DOT_CONFIG/$ITEM" ]]; then
            ln -sf "$PWD/$CONFIG_DIR" "$DOT_CONFIG/$ITEM" && echo "$ITEM Symlink Created"
        else
            echo "$ITEM config found skipping..."
        fi
    fi
done
echo "-----------------STARTING: .config dir symlinks-----------------"
printf "\n"
echo "-----------------STARTING: tmux tpm clone-----------------"
if [[ ! -d "$HOME/.config/tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$DOT_CONFIG/tmux/plugins/tpm"
    git clone https://github.com/catppuccin/tmux.git "$DOT_CONFIG/tmux/plugins/catppuccin/tmux"
else
    echo "tpm is alread installed skipping plugin setup..."
fi
echo "-----------------COMPLETED: tmux tpm clone-----------------"
printf "\n"
echo "-----------------STARTED: config file symlinks-----------------"
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

echo "-----------------COMPLETED: config file symlinks-----------------"
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
