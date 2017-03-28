#!/bin/sh

# Dotfiles location
DOTFILES_DIR=~/.dotfiles

# Vim
mkdir -p ~/.vim-tmp
rm -rf ~/.vim ~/.vimrc
ln -s $DOTFILES_DIR/vim/.vim ~/
ln -s $DOTFILES_DIR/vim/.vimrc ~/
ln -s $DOTFILES_DIR/vim/vim-plug/plug.vim ~/.vim/autoload/
ln -s $DOTFILES_DIR/vim/vim-colorschemes/colors ~/.vim/

# ZSH
rm -f ~/.zshrc
ln -s $DOTFILES_DIR/zsh/.zshrc ~/
