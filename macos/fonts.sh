#!/usr/bin/env bash

# Install fonts
for font in $(brew search nerd-font | cat | cut -f3 -d/ | grep ^font | grep -v -- -mono$); do
  brew install homebrew/cask-fonts/${font}
done
cd
git clone https://github.com/2players/sfmono-nerd-font
cp ~/sfmono-nerd-font/*.otf ~/Library/Fonts/
rm -rf sfmono-nerd-font

