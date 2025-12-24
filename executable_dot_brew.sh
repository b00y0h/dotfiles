#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=~/Tools"

# Install command-line tools using Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    brew update
fi

which -s brew
if [[ $? != 0 ]] ; then
    printf "Homebrew not installed"
else
# Upgrade any already-installed formulae
brew upgrade

# brew install shpotify
brew install gh
brew install tmux
brew install youtube-dl
brew install libvpx
brew install trash
brew install tree
brew install ffmpeg
brew install neovim

# https://fig.io/
brew install fig

# install stuff from mac app store
brew install mas

# z hopping around folders
brew install z

brew tap homebrew/cask-fonts
brew install --cask claude-code
brew install --cask ghostty
brew install --cask font-hack-nerd-font
# brew install --cask visual-studio-code
# brew install --cask hyper
# brew install --cask brave-browser
brew install --cask git-credential-manager
brew install --cask raycast

# Remove outdated versions from the cellar
brew cleanup

fi
