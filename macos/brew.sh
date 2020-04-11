#!/usr/bin/env bash

# Install command line tools
xcode-select --install

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# Install Brew casks
brew cask install 1password bettertouchtool caffeine calibre docker drawio dropbox firefox google-chrome google-cloud-sdk google-photos-backup-and-sync iterm2 java karabiner-elements keybase lastpass osxfuse skype slack smoothscroll spotify tigervnc-viewer tunnelblick vagrant vault virtualbox visual-studio-code vlc xquartz

# Install Brew packages
brew install ansible autojump awscli coreutils curl dep direnv docker docker-completion docker-compose dos2unix azure/draft/draft exiftool ffmpeg flac fontconfig freetype fzf gettext git gnupg go graphviz helm htop imagemagick irssi jq derailed/k9s/k9s kubernetes-cli kubernetes-helm lua midnight-commander minikube mkcert mplayer mpv neovim nmap openssl packer perl pwgen python yq ruby versent/homebrew-taps/saml2aws screen scrub skaffold sqlite sshfs telnet terraform terragrunt tmux todo-txt tree unrar weechat wget xz zsh zsh-autosuggestions
