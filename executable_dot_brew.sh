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

###############################################################################
# Taps
###############################################################################

brew tap homebrew/cask-fonts

###############################################################################
# Core Utilities
###############################################################################

brew install coreutils
brew install trash
brew install tree
brew install wget
brew install mas              # Mac App Store CLI

###############################################################################
# Shell & Terminal Enhancements
###############################################################################

brew install tmux
brew install z                # Directory jumping
brew install zoxide           # Better cd
brew install direnv           # Environment switcher
brew install fzf              # Fuzzy finder
brew install bat              # Better cat
brew install eza              # Better ls
brew install dust             # Better du

###############################################################################
# Git & Version Control
###############################################################################

brew install gh               # GitHub CLI
brew install git-delta        # Better git diff
brew install git-secrets      # Prevent committing secrets

###############################################################################
# Development Tools
###############################################################################

# Languages & Runtimes
brew install n                # Node version manager
brew install pnpm

# Databases
brew install mongodb/brew/mongodb-community
brew install mongodb-atlas-cli

###############################################################################
# Text Editors & IDEs
###############################################################################

brew install neovim
brew install vim
brew install lua-language-server  # For Neovim LSP

###############################################################################
# Cloud & Infrastructure
###############################################################################

brew install awscli

###############################################################################
# System Monitoring & Management
###############################################################################

brew install btop             # System monitor

###############################################################################
# Web & Network Tools
###############################################################################

brew install links            # Text-based browser
brew install lynx             # Text-based browser

###############################################################################
# Security & Authentication
###############################################################################

brew install chezmoi          # Dotfiles manager

###############################################################################
# Media & Graphics
###############################################################################

brew install ffmpeg           # Video processing

###############################################################################
# Other CLI Tools
###############################################################################

brew install ansiweather      # Weather in terminal

###############################################################################
# GUI Applications (Casks)
###############################################################################

# Terminals
brew install --cask ghostty
brew install --cask warp

# Development
brew install --cask visual-studio-code
brew install --cask claude-code
# brew install --cask orbstack        # Docker alternative
# brew install --cask local           # Local WordPress

# Productivity
brew install --cask raycast
brew install --cask fig

# Utilities
brew install --cask git-credential-manager
brew install --cask 1password-cli
# brew install --cask cscreen
# brew install --cask discord

# Fonts
brew install --cask font-hack-nerd-font

###############################################################################
# Cleanup
###############################################################################

# Remove outdated versions from the cellar
brew cleanup

echo "✓ Homebrew setup complete!"
echo ""
echo "Note: Some apps may require additional configuration:"
echo "  • Run 'gh auth login' for GitHub CLI"
echo "  • Run 'aws configure' for AWS CLI"
echo "  • Run 'op signin' for 1Password CLI"

fi
