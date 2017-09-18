#!/bin/bash
#This'll have to be run from the dotfiles directory.

dir=$(pwd);

# install vundle
if ! [ -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi

# install vim plug
if ! [ -e ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
fi

# copy over all the rc files
for file in .tmux.conf .zshrc .vimrc.plugins .vimrc .xinitrc .gitconfig
do

if [ -e ~/$file ]; then
    mv ~/$file ~/"${file}.old"
fi
cp "${dir}/$file" "$HOME/$file";

done
