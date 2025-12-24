# Dotfiles

My macOS development environment, managed with [chezmoi](https://www.chezmoi.io/).

## Features

- 🍺 **Homebrew** package management with automatic installation
- 💻 **Neovim** configuration with plugins
- 🐚 **Zsh** with Oh My Zsh and custom themes
- 🔧 **Dev tools** pre-configured: fzf, atuin, git, aws-cli, and more
- 🍎 **macOS** system preferences automation
- 🔐 **Secure** credential handling (excluded from version control)

## Quick Start

### Fresh Mac Setup (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/b00y0h/dotfiles/main/install.sh | bash
```

This will:
1. Install chezmoi
2. Clone this repository
3. Install Homebrew (if needed)
4. Install Oh My Zsh (if needed)
5. Install all packages from `.brew.sh`
6. Set up development tools (fzf, atuin, etc.)
7. Apply dotfiles to your system

### What Gets Installed

The `.brew.sh` script installs:
- CLI tools: tmux, tree, trash, ffmpeg, youtube-dl
- Development: git, node, python tools
- macOS apps: Raycast, Git Credential Manager
- Fonts: Hack Nerd Font

### Manual Steps After Setup

Some things require manual setup (because they contain secrets):

```bash
# 1. NPM authentication
npm login

# 2. GitHub CLI
gh auth login

# 3. AWS credentials
aws configure sso

# 4. SSH keys
ssh-keygen -t ed25519 -C "your_email@example.com"
gh ssh-key add ~/.ssh/id_ed25519.pub
```

## Daily Usage

### Update Dotfiles

Pull latest changes from this repo and apply:

```bash
chezmoi update
```

### Edit Config Files

Edit and automatically apply changes:

```bash
chezmoi edit ~/.zshrc
chezmoi edit ~/.config/nvim/init.lua
```

### Add New Files

Track a new file:

```bash
chezmoi add ~/.gitconfig
```

### Sync Changes to GitHub

After making local changes:

```bash
chezmoi cd
git add .
git commit -m "Update config"
git push
```

## What's Included

### Shell Configuration
- `.zshrc` - Main shell configuration
- `.oh-my-zsh-custom/` - Custom aliases, themes, and plugins
  - `aliases.zsh` - Custom command aliases
  - `zshrc-custom.zsh` - Additional shell customizations

### Editor
- `.config/nvim/` - Complete Neovim configuration with LSP, plugins, and themes

### Git
- `.gitconfig` - Git global configuration
- `.gitignore_global` - Global ignore patterns

### System Setup
- `.brew.sh` - Homebrew package installation script
- `.osx` - macOS system preferences and defaults

### SSH
- `.ssh/config` - SSH connection configuration
- Public keys (private keys are excluded)

## Security

Sensitive files are automatically excluded via `.chezmoiignore`:
- `.npmrc` (NPM tokens)
- `.netrc` (API credentials)
- `.git-credentials` (GitHub tokens)
- `.aws/credentials` (AWS keys)
- `.ssh/id_*` (Private SSH keys)

These must be set up manually on each machine.

## How It Works

This setup uses [chezmoi](https://www.chezmoi.io/) with automatic run scripts:

1. `run_once_before_*` - Run once before applying dotfiles (install Homebrew, oh-my-zsh)
2. `run_onchange_after_*` - Run when file content changes (install packages)
3. `run_once_after_*` - Run once after applying (setup tools, show manual steps)

When you run `chezmoi init --apply`, all these scripts execute automatically in order.

## Customization

Fork this repo and customize:

1. Update `.brew.sh` with your preferred packages
2. Modify `.osx` for your macOS preferences
3. Customize `.zshrc` and aliases
4. Update `install.sh` to point to your fork:
   ```bash
   GITHUB_USER="your-username"
   ```

## Troubleshooting

### See what would change

```bash
chezmoi diff
```

### Conflicts between source and destination

```bash
# Prefer your current file (update chezmoi source)
chezmoi add ~/.zshrc

# Prefer chezmoi source (overwrite local file)
chezmoi apply --force
```

### Start over

```bash
rm -rf ~/.local/share/chezmoi
curl -fsSL https://raw.githubusercontent.com/b00y0h/dotfiles/main/install.sh | bash
```

## Resources

- [Chezmoi Documentation](https://www.chezmoi.io/)
- [My .osx inspiration](https://mths.be/osx)
- [Oh My Zsh](https://ohmyz.sh/)

## License

Feel free to use anything from this repo for your own dotfiles!
