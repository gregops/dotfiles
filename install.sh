#!/bin/sh
mkdir -p ~/.vim-tmp
ln -s ~/.dotfiles/vim/.vim ~/
ln -s ~/.dotfiles/vim/.vimrc ~/
ln -s ~/.dotfiles/vim/vim-plug/plug.vim ~/.vim/autoload/
ln -s ~/.dotfiles/vim/vim-colorschemes/colors ~/.vim/
