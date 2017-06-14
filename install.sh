#!/bin/sh

# Dotfiles location
DOTFILES_DIR=~/.dotfiles

# Vim
mkdir -p ~/.vim-tmp
rm -rf ~/.vim ~/.vimrc
ln -s $DOTFILES_DIR/vim/.vim ~/
ln -s $DOTFILES_DIR/vim/.vimrc ~/
ln -sf $DOTFILES_DIR/vim/vim-plug/plug.vim ~/.vim/autoload/
ln -sf $DOTFILES_DIR/vim/vim-colorschemes/colors ~/.vim/

# ZSH
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f ~/.zshrc
ln -s $DOTFILES_DIR/zsh/.zshrc ~/
touch ~/.zshrc.local
