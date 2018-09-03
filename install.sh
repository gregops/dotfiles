#!/bin/sh

# Dotfiles location
DOTFILES_DIR=~/.dotfiles

# Vim & NeoVim
rm -rf ~/.vim ~/.vimrc ~/.config/nvim
mkdir -p ~/.vim-tmp ~/.config/nvim/autoload
ln -sf $DOTFILES_DIR/vim/.vim ~/
ln -sf $DOTFILES_DIR/vim/.vim ~/.config/nvim
ln -sf $DOTFILES_DIR/vim/.vimrc ~/
ln -sf $DOTFILES_DIR/vim/.vimrc ~/.config/nvim/init.vim
ln -sf $DOTFILES_DIR/vim/vim-plug/plug.vim ~/.vim/autoload/
ln -sf $DOTFILES_DIR/vim/vim-plug/plug.vim ~/.config/nvim/autoload/
ln -sf $DOTFILES_DIR/vim/vim-colorschemes/colors ~/.vim/
ln -sf $DOTFILES_DIR/vim/vim-colorschemes/colors ~/.config/nvim/
sudo pip3 install neovim

# ZSH
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f ~/.zshrc
ln -s $DOTFILES_DIR/zsh/.zshrc ~/
touch ~/.zshrc.local
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
brew install zsh-syntax-highlighting
