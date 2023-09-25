#!/bin/bash

# Define the directory where your dotfiles are located (current directory)
DOTFILES_DIR="$(pwd)"

# Function to create a backup of existing files and create symlinks (ty https://github.com/victoriadrake)
linkDotfile() {
    local dest="${HOME}/${1}"
    local dateStr=$(date +%Y-%m-%d-%H%M)

    if [ -h "$dest" ]; then
        # Existing symlink
        echo "Removing existing symlink: $dest"
        rm "$dest"

    elif [ -f "$dest" ]; then
        # Existing file
        echo "Backing up existing file: $dest"
        mv "$dest" "${dest}.${dateStr}"

    elif [ -d "$dest" ]; then
        # Existing directory
        echo "Backing up existing directory: $dest"
        mv "$dest" "${dest}.${dateStr}"
    fi

    echo "Creating new symlink: $dest"
    ln -s "${DOTFILES_DIR}/${1}" "$dest"
}

# Ensure the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory not found at: $DOTFILES_DIR"
    exit 1
fi

# Use the linkDotfile function to create symlinks
linkDotfile .vimrc
linkDotfile .tmux.conf
linkDotfile .zshrc

echo "Dotfiles setup complete!"
