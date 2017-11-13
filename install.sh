#!/bin/bash

echo "Installing to $HOME"
ln -f .bashrc $HOME/.bashrc
ln -f .gitignore $HOME/.gitignore

git config --global core.excludesfile "$HOME/.gitignore"
