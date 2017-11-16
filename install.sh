#!/bin/bash

echo "Installing to $HOME"

echo ".bashrc"
ln -f .bashrc $HOME/.bashrc
echo ".gitignore"
ln -f .gitignore $HOME/.gitignore
echo ".vimrc"
ln -f .vimrc $HOME/.vimrc

git config --global core.excludesfile "$HOME/.gitignore"
