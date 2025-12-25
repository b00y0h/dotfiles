# Ecovim: Frontend Neovim Config

[![Last commit](https://img.shields.io/github/last-commit/ecosse3/nvim?style=for-the-badge)](https://github.com/ecosse3/nvim/commits/master)
![Stars](https://img.shields.io/github/stars/ecosse3/nvim?style=for-the-badge)
![License](https://img.shields.io/github/license/ecosse3/nvim?style=for-the-badge)
![Neovim Version](https://img.shields.io/badge/For%20Neovim-0.9+-yellowgreen?style=for-the-badge&logo=neovim&logoColor=d8abbb&color=d8abbb)

### A non-minimal Neovim config built to work most efficiently with Frontend Development.

## Features

- Configured for TypeScript Development (React.js, Next.js, Vue.js, Angular, Node.js etc.)
- Great default theme: [Tokyonight](https://github.com/folke/tokyonight.nvim)
- Lazy loaded via [lazy.nvim](https://github.com/folke/lazy.nvim)
- Highly performant (90ms load time)
- Extendable LSP configuration via [mason.nvim](https://github.com/williamboman/mason.nvim)
- Support for :robot: AI: [ChatGPT](https://openai.com/blog/chatgpt/), [GitHub Copilot](https://github.com/features/copilot), [Codeium](https://codeium.com/) and [Tabnine](https://www.tabnine.com/)
- Support for [TailwindCSS](https://tailwindcss.com/) with highlighted colors
- JSON autocompletion for most popular Frontend configs
- NPM packages autocompletion in _package.json_
- Internal [Jest](https://github.com/facebook/jest) testing and [Coverage](https://github.com/andythigpen/nvim-coverage) support
- Debugging with [nvim-dap](https://github.com/mfussenegger/nvim-dap) (works with React.js & React Native)
- Automatic Treesitter-based folding with imports folded by default
- Current code context via [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- Beautiful and functional custom statusline built with [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) 
- Git management with [Lazygit](https://github.com/jesseduffield/lazygit), custom telescope commits view with [git-delta](https://github.com/dandavison/delta), [gitsigns](https://github.com/lewis6991/gitsigns.nvim) & [diffview](https://github.com/sindrets/diffview.nvim), custom git blame

And of course usage of [telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua), [barbar](https://github.com/romgrk/barbar.nvim), [cmp](https://github.com/hrsh7th/nvim-cmp), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [blankline](https://github.com/lukas-reineke/indent-blankline.nvim) & more!

## Plugins

<details>
<summary>Core/UI</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| lazy.nvim | Plugin manager | https://www.youtube.com/watch?v=6mxWayq-s9I |
| tokyonight.nvim | Colorscheme | - |
| alpha-nvim | Dashboard/start screen | https://www.youtube.com/watch?v=Ul_WPhS2bis |
| bufferline.nvim | Tab/buffer line | https://www.youtube.com/watch?v=vJAmjAax2H0 |
| galaxyline.nvim | Statusline | - |
| nvim-web-devicons | File icons | - |
| noice.nvim | UI for messages/cmdline | https://www.youtube.com/watch?v=xJVVqP4_SCE |
| nui.nvim | UI components library | - |
| which-key.nvim | Keybinding popup | https://www.youtube.com/watch?v=xJVVqP4_SCE |
| snacks.nvim | Utility functions | - |

</details>

<details>
<summary>File Navigation</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| telescope.nvim | Fuzzy finder | https://www.youtube.com/watch?v=indguFY7wJ0 |
| fzf-lua | FZF integration | - |
| nvim-tree.lua | File explorer | https://www.youtube.com/watch?v=SpexCBrZ1pQ |
| harpoon | Quick file navigation | https://www.youtube.com/watch?v=Qnos8aApa9g |
| flash.nvim | Jump/motion plugin | https://www.youtube.com/watch?v=HQZfYYYLcFs |

</details>

<details>
<summary>LSP & Completion</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| nvim-lspconfig | LSP configurations | https://www.youtube.com/watch?v=puWgHa7k3SY |
| mason.nvim | LSP/tool installer | https://www.youtube.com/watch?v=2iczAXDdgTE |
| mason-lspconfig.nvim | Mason + lspconfig bridge | (same as above) |
| blink.cmp | Completion engine | - |
| LuaSnip | Snippet engine | https://www.youtube.com/watch?v=Dn800rlPIho |
| friendly-snippets | Snippet collection | - |
| nvim-autopairs | Auto close brackets | - |
| nvim-ts-autotag | Auto close HTML tags | - |
| fidget.nvim | LSP progress indicator | - |

</details>

<details>
<summary>AI Assistants</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| copilot.lua | GitHub Copilot | https://www.youtube.com/watch?v=eMnZBaOs4vM |
| CopilotChat.nvim | Chat with Copilot | https://www.youtube.com/watch?v=2mH8n4GfcUg |
| codecompanion.nvim | AI coding companion | - |
| avante.nvim | AI assistant | - |
| blink-copilot | Copilot + blink.cmp | - |

</details>

<details>
<summary>Git</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| gitsigns.nvim | Git decorations | https://www.youtube.com/watch?v=ZgyVY7tArwg |
| diffview.nvim | Git diff viewer | https://www.youtube.com/watch?v=aJikrPnWlqQ |
| git-conflict.nvim | Conflict resolution | - |
| git-worktree.nvim | Worktree management | https://www.youtube.com/watch?v=2uUqFiBbDNI |
| gitlinker.nvim | Generate git permalinks | - |
| blame.nvim | Git blame | - |
| octo.nvim | GitHub PR/issues | https://www.youtube.com/watch?v=pwTZm_RqHLg |

</details>

<details>
<summary>Treesitter</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| nvim-treesitter | Syntax highlighting | https://www.youtube.com/watch?v=CEMPq_r8UYQ |
| nvim-treesitter-textobjects | TS text objects | (same as above) |
| nvim-treesitter-textsubjects | Smart text selection | - |
| rainbow-delimiters.nvim | Rainbow brackets | - |
| treesj | Split/join blocks | - |

</details>

<details>
<summary>Testing & Debugging</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| neotest | Test runner | https://www.youtube.com/watch?v=7NTeEbHiJz4 |
| neotest-jest | Jest adapter | - |
| nvim-dap | Debug adapter | https://www.youtube.com/watch?v=0moS8UHupGc |
| nvim-dap-ui | Debug UI | (same as above) |
| nvim-coverage | Test coverage | - |

</details>

<details>
<summary>Code Editing</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| Comment.nvim | Commenting | - |
| nvim-surround | Surround text | https://www.youtube.com/watch?v=ooHZPRnEpAg |
| mini.ai | Enhanced text objects | - |
| mini.align | Text alignment | - |
| refactoring.nvim | Refactoring tools | https://www.youtube.com/watch?v=5j5hVDhZ7e8 |
| multicursors.nvim | Multiple cursors | - |
| nvim-spectre | Search & replace | - |
| text-case.nvim | Change text case | - |

</details>

<details>
<summary>TypeScript/Frontend</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| typescript-tools.nvim | TS language server | - |
| ts-error-translator.nvim | Human-readable TS errors | - |
| tsc.nvim | TypeScript compiler | - |
| package-info.nvim | NPM package info | - |
| tailwind-fold.nvim | Fold Tailwind classes | - |
| tailwind-sorter.nvim | Sort Tailwind classes | - |
| tw-values.nvim | Tailwind value preview | - |
| template-string.nvim | Auto template strings | - |

</details>

<details>
<summary>Utilities</summary>

| Plugin | Description | YouTube |
|--------|-------------|---------|
| toggleterm.nvim | Terminal integration | https://www.youtube.com/watch?v=5OD-7h7gzxU |
| todo-comments.nvim | Highlight TODOs | - |
| nvim-ufo | Better code folding | - |
| indent-blankline.nvim | Indent guides | - |
| marks.nvim | Better marks | - |
| numb.nvim | Peek line numbers | - |
| neovim-session-manager | Session management | - |
| nvim-scissors | Snippet manager | - |
| printer.nvim | Print debug statements | - |
| codesnap.nvim | Code screenshots | - |
| markdown-preview.nvim | Preview markdown | - |
| render-markdown.nvim | Render markdown in buffer | - |

</details>

### Best YouTube Channels for Neovim

1. **TJ DeVries** - Core Neovim maintainer: https://www.youtube.com/@telorided
2. **ThePrimeagen** - Vim motions & workflow: https://www.youtube.com/@ThePrimeagen
3. **chris@machine** - Plugin configs: https://www.youtube.com/@chrisatmachine
4. **DevOps Toolbox** - Modern Neovim: https://www.youtube.com/@devopstoolbox
5. **typecraft** - Neovim tutorials: https://www.youtube.com/@typecraft_dev

## Screenshots

Dashboard

![Dashboard](./.screenshots/6-alpha.png)

Overview

![Neovim](./.screenshots/5-main.png)

<details>
<summary>More screenshots</summary>

Some of screenshots can be old

TailwindCSS with nvim-cmp

![TailwindCSS](./.screenshots/5-tailwind.png)

Which Key Menu

![WhichKey](./.screenshots/4-which-key.png)

Lazygit

![Lazygit](./.screenshots/4-lazygit.png)

Telescope

![Telescope](./.screenshots/4-telescope.png)

Git Commits w/ Telescope

![Commits](./.screenshots/4-bcommits.png)

Git Side Blame

![Side Blame](./.screenshots/4-side-blame.png)
</details>

## Installation

**Just clone GitHub repo into ~/.config/nvim.**

**Prerequisities**

- Make sure you have installed the latest version of Neovim v0.9.0+ (nightly is preferred).
- Have wget, curl, unzip, git, make, pip, python, npm, node, luarocks, fd, ripgrep and cargo installed on your system. You can check if you are missing anything with `:checkhealth` command.
- Have any nerd font installed. *Fira Code* has been used in screenshots. You can download it from [nerdfonts.com](https://www.nerdfonts.com/font-downloads).

**After install configuration:**

1. Selected treesitter Languages are installed by default.
To check it run `:TSInstallInfo`.
Make sure to run `:TSInstall <lang>` for specific language you want to install.
2. LSP servers are enabled by default. You can check installed LSP servers by `:Mason` command.

## Configuration

To change EcoVim related config use the `config/EcoVim.lua` file.

To change vim settings use the `config/options.lua` file.

To change plugin related settings use the specific `plugins/[name].lua` file. Some of the plugin config can be set up during plugin installation in `config/plugins.lua` file, where you can add new plugins.

## Keybindings

Currently I have no idea how to write for you my whole workflow of using Ecovim config in React.js projects I am working on,\
but I can write you the most useful custom key bindings by the frequency I use them.

Space (SPC) is my Leader key.

<details>
<summary>File Explorer</summary>

### File Explorer

| Key Bindings | Description                                   |
|--------------|-----------------------------------------------|
| <C - e>      | Open File Explorer                            |
| Backspace    | Back to file explorer (in editor normal mode) |
| g?           | Open commands menu                            |
| a            | Create new file/directory                     |
| x            | Cut                                           |
| c            | Copy                                          |
| y            | Copy name                                     |
| r            | Rename                                        |
| I            | Toggle git ignore files                       |

</details>

<details>
<summary>Searching</summary>

### Searching

| Key Bindings | Description         |
|--------------|---------------------|
| <C - p>      | Telescope git files |
| <S - p>      | Telescope live grep |
| s            | Enables lightspeed  |
| SPC s d      | Search dotfiles     |
| SPC s h      | Search file history |
| SPC s s      | Search history      |

</details>

<details>
<summary>Working with LSP</summary>

### Working with LSP:

| Key Bindings           | Description                                       |
|------------------------|---------------------------------------------------|
| <C - Space> or SPC c a | Code action                                       |
| <S - K>                | Show documentation under cursor                   |
| gd                     | Go to definition                                  |
| gr                     | Go to references                                  |
| ]g                     | Go to next diagnostic                             |
| [g                     | Go to prev diagnostic                             |
| SPC c f                | Format document (usually ESLint/Prettier)         |
| SPC c r                | Rename                                            |
| SPC c q                | Quick fix - when I exactly know if it will fix it |
| SPC c d                | Local diagnostics list                            |
| SPC c o                | Organize imports                                  |

</details>

<details>
<summary>Working with Git</summary>

### Working with Git:

| Key Bindings | Description                                                                                                                              |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------|
| SPC g g      | Lazygit - for committing and branch change                                                                                               |
| SPC g s      | Telescope status - when I want to change/search file I am working on with git changes                                                    |
| ]c           | Go to next change hunk                                                                                                                   |
| [c           | Go to prev change hunk                                                                                                                   |
| SPC g d      | Advanced powerful diff view with many filters for debugging code, checking previous changes etc.                                         |
| SPC g m      | View hunk diff of a line under cursor                                                                                                    |
| SPC g h r    | Reset changed hunk under cursor - I like to check quickly what I have changed in that line and then just type 'u' to go back             |
| SPC g h s    | Stage hunk under cursor - Sometimes it's faster than selecting lines in Lazygit, so I can stage specific lines and then just do a commit |
| SPC g l c    | Quick check of previous commit in current buffer, <C-s> inside to switch preview                                                         |
| SPC g w c    | Creates a new worktree. Recommended directory is `../path`                                                                               |
| SPC g w w    | Switches to a worktree. <C-d> removes worktree.                                                                                          |

</details>

<details>
<summary>Working with Project</summary>

### Working with Project:

| Key Bindings | Description                                                                                                                                                                                                                                                                             |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <C - e>      | Toggles nvim-tree file explorer                                                                                                                                                                                                                                                         |
| SPC p w      | Find word under cursor in project - very useful to find where component is used. Just use binding and type '<'. There is a lot of alternatives like LSP references but I like it with telescope and to not find only references but whole text under cursor.                            |
| SPC p f      | Find file under cursor in project - it finds files in project which contains text under cursor. Useful when you name directories by component name in React and wants to go quickly to file. 'gd' is better but in some projects without TS or with mixed JS/TS it cannot work properly |
| SPC p t      | Finds TODOs/NOTES in project                                                                                                                                                                                                                                                            |
| SPC p l      | Switch between projects                                                                                                                                                                                                                                                                 |
| SPC p s      | Save session to load it later from Dashboard                                                                                                                                                                                                                                            |

</details>

<details>
<summary>Commenting</summary>

### Commenting

| Key Bindings | Description                |
|--------------|----------------------------|
| gcc          | Create/remove comment      |
| gc (visual)  | Create/remove comment      |
| gcO          | Create comment line before |
| gco          | Create comment line after  |

</details>

<details>
<summary>Table Mode / Alignment</summary>

### Table Mode / Alignment

| Key Bindings | Description                                                                       |
|--------------|-----------------------------------------------------------------------------------|
| ga (visual)  | Aligns selection based on separator (comma, semi-colon, colon etc.)               |
| SPC t m      | Enables Table Mode. Do it in markdown file with some table and you will see magic |
| SPC t i C    | (Only when Table Mode Enabled) Insert column before                               |
| SPC t i c    | (Only when Table Mode Enabled) Insert column after                                |
| SPC t d c    | (Only when Table Mode Enabled) Delete column                                      |
| SPC t d r    | (Only when Table Mode Enabled) Delete row                                         |
| SPC t s      | (Only when Table Mode Enabled) Sort table alphabetically                          |

</details>

<details>
<summary>Other</summary>

### Other VERY useful bindings

| Key Bindings | Description                                                                                                                                                                               |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <S - q>      | Smartly closes current buffer without breaking UI                                                                                                                                         |
| <C - a>      | It is not only increases number, but switches between true/false/const/let/function/arrow function/increment dates etc.                                                                   |
| <C - n>      | Finds next occurrence (like *) of word and puts multi-cursor there. Then you can go to Insert mode, Append, Change or Delete. [Read more](https://github.com/mg979/vim-visual-multi/wiki) |
| <C - o>      | Jumps to previous cursor in jumplist. I use it very often.                                                                                                                                |
| v <ENTER>    | Smartly selects next subjects of current treesitter context                                                                                                                               |
| s            | Standalone jump to any word with `folke/flash.nvim`                                                                                                                                       |
| ciq          | Change inside ANY quotes (`` or '' or "" etc.) with `mini.ai`                                                                                                                             |
| cib          | Change inside ANY brackets ({} or [] or () etc.) with `mini.ai`                                                                                                                           |
| za           | Toggle folds. By LSP and nvim-ufo they are automatically added to supported files in smart way.                                                                                           |
| zM           | Close all folds                                                                                                                                                                           |
| zR           | Open all folds                                                                                                                                                                            |
| zr           | Open all folds except imports/comments                                                                                                                                                    |
| gJ           | Smartly joins lines based on treesitter                                                                                                                                                   |
| gS           | Smartly splits lines based on treesitter. I do if VERY often when I want to put import element to new lines (e.g. import { A, B, C, D, E } from ...)                                      |
| < F12 >      | Opens/closes terminal                                                                                                                                                                     |
| ~            | Switch function arguments smartly                                                                                                                                                         |

</details>

Check out the which-key menu and [keymappings.lua](https://github.com/ecosse3/nvim/blob/master/lua/config/keymappings.lua) for most used maps. 


## Performance

Measured on M1.

Ecovim started in 91.13ms 

## Future Todo 

| Description                                                          | Progress                                                           |
|----------------------------------------------------------------------|--------------------------------------------------------------------|
| Support more LSPs (not only frontend? - already possible via Mason)  | ![50%](https://progress-bar.dev/50/?title=progres)                 |
| Better configuration of additional LSPs (already possible via Mason) | ![50%](https://progress-bar.dev/50/?title=planned)                 |
| Project Logo                                                         | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Auto resize for more consistent UI behavior                          | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |
| Reload in-time support                                               | ![Planned](https://progress-bar.dev/0/?title=planned&color=b8860b) |


<details>
<summary>Done</summary>

| Description                                     | Progress                                                       |
|-------------------------------------------------|----------------------------------------------------------------|
| lazy.nvim instead of packer                     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Better support for null-ls and local formatting | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Better support to project word refactor         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support for nvim-dap debugger for React         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support ESLint & Prettier in Native LSP         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace coc-explorer with nvim-tree.lua         | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Replace coc.nvim with Native LSP                | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Change fzf.nvim to telescope.nvim               | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Update statusline to support LSP diagnostics    | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Rewrite most config to lua                      | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Support TailwindCSS with colors                 | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Provide current screenshots                     | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |
| Create shell installer for Linux & MacOS        | ![100%](https://progress-bar.dev/100/?title=done&color=555555) |

</details>
