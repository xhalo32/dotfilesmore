#!/bin/bash
dir=$(dirname "$(realpath $0)")
echo $dir

echo "Installing to $HOME"

echo ".bashrc"
ln -f bashrc $HOME/.bashrc
echo ".gitignore"
ln -f gitignore $HOME/.gitignore
echo ".vimrc"
ln -f vimrc $HOME/.vimrc
echo "bin/"
#rm -ir $HOME/bin
( cd $HOME && ln -s $dir/bin/ . )

git config --global core.excludesfile "$HOME/.gitignore"
