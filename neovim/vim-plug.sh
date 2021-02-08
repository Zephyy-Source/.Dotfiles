#! /usr/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#https://github.com/junegunn/vim-plug

nvim -c PlugInstall
