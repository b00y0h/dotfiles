#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=~/Tools"

# Helper function to install brew formula only if not already installed
brew_install() {
    if brew list --formula "$1" &>/dev/null; then
        echo "✓ $1 already installed"
    else
        echo "Installing $1..."
        brew install "$1"
    fi
}

# Helper function to install brew cask only if not already installed
brew_install_cask() {
    if brew list --cask "$1" &>/dev/null; then
        echo "✓ $1 already installed"
    else
        echo "Installing $1..."
        brew install --cask "$1"
    fi
}

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
# Core Utilities
###############################################################################

brew_install coreutils
brew_install trash
brew_install tree
brew_install wget
brew_install mas              # Mac App Store CLI
brew_install atuin
brew install ripgrep

###############################################################################
# Shell & Terminal Enhancements
###############################################################################

brew_install tmux
brew_install z                # Directory jumping
brew_install zoxide           # Better cd
brew_install direnv           # Environment switcher
brew_install fzf              # Fuzzy finder
brew_install bat              # Better cat
brew_install eza              # Better ls
brew_install dust             # Better du

###############################################################################
# Git & Version Control
###############################################################################

brew_install gh               # GitHub CLI
brew_install git-delta        # Better git diff
brew_install git-secrets      # Prevent committing secrets

###############################################################################
# Development Tools
###############################################################################

# Languages & Runtimes
brew_install n                # Node version manager
brew_install pnpm

# Databases
brew_install mongodb/brew/mongodb-community
brew_install mongodb-atlas-cli

###############################################################################
# Text Editors & IDEs
###############################################################################

brew_install neovim
brew_install vim
brew_install lua-language-server  # For Neovim LSP

###############################################################################
# Cloud & Infrastructure
###############################################################################

brew_install awscli

###############################################################################
# System Monitoring & Management
###############################################################################

brew_install btop             # System monitor

###############################################################################
# Web & Network Tools
###############################################################################

brew_install links            # Text-based browser
brew_install lynx             # Text-based browser

###############################################################################
# Security & Authentication
###############################################################################

brew_install chezmoi          # Dotfiles manager

###############################################################################
# Media & Graphics
###############################################################################

brew_install ffmpeg           # Video processing

###############################################################################
# Other CLI Tools
###############################################################################

brew_install ansiweather      # Weather in terminal
brew_install pygments         # Syntax highlighting (needed for common-aliases plugin)

###############################################################################
# GUI Applications (Casks)
###############################################################################

# Terminals
# brew_install_cask ghostty
# brew_install_cask warp

# Development
# brew_install_cask visual-studio-code
brew_install_cask claude-code
# brew_install_cask orbstack        # Docker alternative
# brew_install_cask local           # Local WordPress

# Productivity
brew_install_cask raycast

# Utilities
brew_install_cask git-credential-manager
brew_install_cask 1password-cli
brew_install_cask 1password
# brew_install_cask cscreen
# brew_install_cask discord

# Fonts
brew_install_cask font-hack-nerd-font

###############################################################################
# Oh My Zsh Plugins
###############################################################################

# Install pnpm plugin for oh-my-zsh
PNPM_PLUGIN_DIR="$HOME/.oh-my-zsh-custom/plugins/pnpm"
if [ -d "$PNPM_PLUGIN_DIR" ]; then
    echo "✓ omz-plugin-pnpm already installed"
else
    echo "Installing omz-plugin-pnpm..."
    git clone --depth=1 https://github.com/ntnyq/omz-plugin-pnpm.git "$PNPM_PLUGIN_DIR"
fi

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
