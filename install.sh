#!/bin/sh

pip3 install neovim

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

# ZSH and other files/tools
test -d ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -f ~/.zshrc ~/.curlrc ~/.tmux.conf ~/.tmux.conf.local
ln -s $DOTFILES_DIR/zsh/.zshrc ~/
ln -s $DOTFILES_DIR/.curlrc ~/
ln -s $DOTFILES_DIR/tmux/.tmux.conf ~/
ln -s $DOTFILES_DIR/tmux/.tmux.conf.local ~/
touch ~/.zshrc.local
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
