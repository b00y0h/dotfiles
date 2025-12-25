# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is **Ecovim**, a Neovim configuration focused on frontend development (TypeScript, React, Vue, Next.js, etc.). It uses lazy.nvim for plugin management and is written entirely in Lua.

## Architecture

### Entry Point
- `init.lua` - Loads config modules in order: EcoVim → globals → functions → options → lazy → keymappings → autocmds → internal modules

### Directory Structure
```
lua/
├── config/           # Core configuration
│   ├── EcoVim.lua    # Main user config (colorscheme, plugins toggles, UI settings)
│   ├── options.lua   # Vim options
│   ├── keymappings.lua # Global keybindings
│   ├── autocmds.lua  # Autocommands
│   ├── lazy.lua      # Plugin manager setup
│   └── lsp/          # LSP configuration
│       ├── setup.lua # Mason + LSP server setup
│       └── servers/  # Per-server configs (tsserver, eslint, tailwindcss, etc.)
├── plugins/          # Plugin specs (lazy.nvim format)
│   ├── init.lua      # Base plugins + imports ai/ and languages/ subdirs
│   ├── ai/           # AI plugins (copilot, codecompanion, avante)
│   └── languages/    # Language-specific plugins
├── internal/         # Custom internal modules (cursorword, winbar)
└── utils/            # Utility functions, icons, globals
```

### Key Patterns

**Global Config Object**: The `EcoVim` global table (defined in `lua/config/EcoVim.lua`) holds all user-configurable settings. Plugins reference `EcoVim.plugins.*`, `EcoVim.ui.*`, etc.

**LSP Setup**: Uses mason.nvim + mason-lspconfig for automatic LSP installation. Server-specific configs live in `lua/config/lsp/servers/`. The main setup in `lua/config/lsp/setup.lua` uses `setup_handlers` pattern.

**Plugin Structure**: Each plugin file in `lua/plugins/` returns a lazy.nvim spec table. Subdirectories use `{ import = "plugins.subdir" }` pattern.

## Key Bindings

Leader key is `<Space>`. Important mappings:
- `<C-e>` - File explorer toggle
- `<C-p>` - Telescope git files
- `<S-p>` - Telescope live grep
- `gd/gr/gy` - Go to definition/references/type definition
- `<C-Space>` or `<leader>ca` - Code action
- `<leader>cf` - Format document
- `<leader>cr` - Rename symbol
- `<leader>gg` - Lazygit
- `<S-q>` - Close buffer (via Snacks.bufdelete)
- `K` - Hover docs (or peek folded lines via nvim-ufo)

## Working with This Config

- Edit `lua/config/EcoVim.lua` to toggle features (AI plugins, completion behavior, etc.)
- Add new plugins by creating files in `lua/plugins/` or subdirectories
- LSP servers are auto-installed via Mason; add to `ensure_installed` in `lua/config/lsp/setup.lua`
- Custom LSP server configs go in `lua/config/lsp/servers/<name>.lua`
