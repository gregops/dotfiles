#!/usr/bin/env bash

# Install command line tools
xcode-select --install

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# Install Brew casks
brew install 1password bettertouchtool caffeine docker firefox google-chrome iterm2 karabiner-elements keybase smoothscroll tigervnc-viewer

# Install Brew packages
brew install autojump bash bat coreutils curl dep direnv docker docker-completion docker-compose dos2unix exiftool ffmpeg flac fontconfig freetype fzf gettext git gnupg go graphviz htop imagemagick jq lua midnight-commander mkcert mplayer mpv neovim nmap openssl perl pwgen python yq ruby screen sshfs telnet tfenv hashicorp/tap/terraform-ls tmux tree unrar wget xz zsh zsh-autosuggestions
