#!/bin/bash

###############################################################################
# Bootstrap Script for Fresh Mac Setup
# Usage: curl -fsSL https://raw.githubusercontent.com/b00y0h/dotfiles/main/install.sh | bash
###############################################################################

set -e

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

GITHUB_USER="b00y0h"

clear
echo ""
echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}${BLUE}  🚀 Mac Setup Bootstrap${NC}"
echo -e "${BOLD}${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "This will set up your Mac with:"
echo "  • Homebrew package manager"
echo "  • All your applications and tools"
echo "  • Development environment"
echo "  • System preferences"
echo ""
echo "Everything is automated via chezmoi scripts!"
echo ""

# Install chezmoi if needed and initialize from GitHub
if ! command -v chezmoi >/dev/null 2>&1; then
    echo "Installing chezmoi..."

    # Use the official chezmoi installer
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
fi

echo ""
echo -e "${GREEN}▸${NC} Initializing dotfiles from GitHub..."
echo ""

# Initialize and apply in one go
# The chezmoi scripts will handle:
# - Installing Homebrew
# - Installing oh-my-zsh
# - Running .brew.sh
# - Setting up tools
# - (Optionally) applying macOS preferences
chezmoi init --apply "https://github.com/${GITHUB_USER}/dotfiles.git"

echo ""
echo -e "${BOLD}${GREEN}✓ Setup Complete!${NC}"
echo ""
echo "Restart your terminal: ${BLUE}exec zsh${NC}"
echo ""
