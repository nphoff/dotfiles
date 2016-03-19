#!/bin/bash

# install vundle
#git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;

#simlink files
#This'll have to be run from the dotfiles directory.

dir=$(pwd);

for file in .tmux.conf .zshrc .vimrc.plugins .vimrc .xinitrc
do

if [ -e ~/$file ]; then
    mv ~/$file ~/"${file}.old"
fi
ln -s "${dir}/$file" "$HOME/$file";

done
