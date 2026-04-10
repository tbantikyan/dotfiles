#!/bin/bash

link_file() {
    local src=$1
    local dst=$2

    if [ -d "$dst" ] && [ ! -L "$dst" ]; then
        echo "Moving existing directory $dst to ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi

    ln -sfn "$src" "$dst"
}

link_file ~/dotfiles/zsh-custom ~/.oh-my-zsh/custom
link_file ~/dotfiles/nvim ~/.config/nvim
link_file ~/dotfiles/kitty ~/.config/kitty

mkdir -p ~/.config/tmux
link_file ~/dotfiles/tmux.conf ~/.config/tmux/tmux.conf
