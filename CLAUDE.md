# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with GNU Stow. Top-level subdirectories are stow **packages**; per machine you stow `common` plus exactly one machine-specific package (`work` or `personal`). Stow uses `--dotfiles` mode, mapping `dot-NAME` files/dirs to `~/.NAME`.

Primary shell is **fish**, configured in `common/dot-config/fish/`. Zsh config (`common/dot-zshrc`) is retained for compatibility.

### Package layout
- `common/` — shared across all machines (shell, editor, git, terminal configs, plus `Brewfile` of shared CLI tools and casks).
- `work/` — work-laptop-only (e.g. Slack, Granola).
- `personal/` — personal-laptop-only.
- `private/` — **optional** overlay sourced from a separate repo (e.g. a private `dotfiles-private` on GitHub Enterprise for work-confidential config). Conventionally a symlink at the repo root pointing at an external clone. Auto-stowed by `scripts/setup` / `scripts/teardown` when the path exists. Listed in `.gitignore` so the symlink isn't committed.

Each package has its own `Brewfile` and `.stow-local-ignore`. Brewfiles live inside packages and are excluded from stow via `.stow-local-ignore`. The external `private/` repo should follow the same conventions (`dot-`-prefixed files, optional `Brewfile`, optional `.stow-local-ignore`).

## Setup Commands

### Initial Installation
```bash
# Automated setup — picks the machine package (work or personal)
./scripts/setup work       # work laptop
./scripts/setup personal   # personal laptop
./scripts/setup            # common only

# Optional: link an external "private" overlay repo (e.g. work-confidential config on GH Enterprise)
git clone <internal-host>:me/dotfiles-private.git ~/src/dotfiles-private
ln -s ~/src/dotfiles-private ~/src/dotfiles/private
./scripts/setup work       # auto-detects ./private and stows it

# Manual installation
brew install stow
stow --dotfiles --target="$HOME" --dir=~/src/dotfiles common work
```

### Update Dotfiles
```bash
cd ~/src/dotfiles
git pull
stow --dotfiles --target="$HOME" --dir=. common work  # or 'common personal'
```

### Package Management
```bash
# Install Homebrew packages for this machine
brew bundle --file=~/src/dotfiles/common/Brewfile
brew bundle --file=~/src/dotfiles/work/Brewfile

# Update a Brewfile to match currently installed packages (be careful — dumps EVERYTHING installed)
brew bundle dump --force --file=~/src/dotfiles/common/Brewfile
```

### Neovim Plugin Management
Plugins are managed by lazy.nvim and auto-install on first launch:
```bash
nvim           # Auto-bootstraps lazy.nvim and installs plugins
:Lazy          # Interactive plugin manager UI
:Lazy sync     # Update all plugins
```

## Architecture

### GNU Stow Symlink System
- Stow creates symlinks: repository files → home directory
- Files prefixed with `dot-` are symlinked as dotfiles (e.g., `dot-zshrc` → `~/.zshrc`)
- `dot-config/` directory contents → `~/.config/` (XDG Base Directory)
- Per-package exclusions in `<package>/.stow-local-ignore` (e.g. `Brewfile`, `.DS_Store`)
- Command: `stow --dotfiles --target="$HOME" common work` (or `common personal`)
- To remove symlinks: `stow --dotfiles --target="$HOME" --delete common work`

### Fish Shell Configuration
Fish config lives in `common/dot-config/fish/`:
- `config.fish` — main config: editor, nodenv, fzf, starship, atuin, direnv, vim keybindings
- `conf.d/aliases.fish` — shell aliases
- `functions/` — autoloaded functions (g, git-safety-dance, fzf-checkout, etc.)
- `fish_plugins` — Fisher plugin list (install with `fisher update`)

**Plugins (via Fisher):** `oh-my-fish/plugin-osx`, `oh-my-fish/plugin-brew`, `oh-my-fish/plugin-extract`, `jethrokuan/z`

**Local/private overrides:** `~/.config/fish/config.local.fish`, `~/.config/fish/config.private.fish`

### Machine-Specific Customization Pattern
Use `.local` files for machine-specific overrides (not version controlled):
- `~/.aliases.local`
- `~/.gitconfig.local`
- `~/.tmux.conf.local`
- `~/.zshrc.local`

Use `~/.zshrc.private` for sensitive environment variables or credentials.

### Neovim Lua Configuration Structure
Modern Lua-based setup with lazy.nvim:
```
common/dot-config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager bootstrap
│   │   ├── options.lua        # Editor settings (tabs, search, etc.)
│   │   ├── keymaps.lua        # Key mappings
│   │   └── autocmds.lua       # Auto-format on save
│   └── plugins/               # Individual plugin configs
│       ├── telescope.lua      # Fuzzy finder (Ctrl-p)
│       ├── conform.nvim       # Auto-formatting
│       ├── avante.nvim        # AI coding assistant
│       └── colorscheme.lua    # tokyonight-moon theme
└── snippets/                  # JavaScript snippets
```

Key settings:
- Leader key: Space
- Auto-format on save with conform.nvim (stylua, prettierd)
- No swap/backup files
- 2-space indentation
- Relative line numbers

## Key Features & Workflows

### Git Workflows
Custom aliases and safety functions in `~/.aliases`:

**Safety Functions:**
- `git-safety-dance`: Creates backup branch before risky operations
  ```bash
  # Usage: git-safety-dance <branch-to-backup> <operation>
  git-safety-dance develop "git rebase master"
  ```

**Cleanup Functions:**
- `git-remove-merged-branches`: Removes local branches merged to master/main
- `git-remove-remote-merged-branches`: Removes remote branches merged to master/main

**Fuzzy Checkout:**
- `fco`: fzf-powered branch checkout (requires fzf)

**Custom Aliases:**
- `git branches`: Shows branches sorted by commit date with author info
- `git l`: Pretty colored log format
- `g`: Without args runs `git status`, with args passes through to git

### Tmux + Neovim Integration
Seamless navigation between tmux panes and Neovim splits:
- Uses vim-tmux-navigator plugin
- Ctrl-hjkl works across tmux and nvim boundaries
- Secondary tmux prefix: Ctrl-s (in addition to Ctrl-b)

### AI Coding Assistant
Avante.nvim is configured with OpenAI o1-preview model:
- Provides AI-powered code suggestions and completions
- Requires OpenAI API key (should be in `~/.zshrc.private`)

### Search Tools
Multiple search utilities configured:
- **fzf**: Fuzzy finder (Ctrl-R for history, Ctrl-T for files)
- **ag**: Silver Searcher (`dot-agignore` excludes common dirs)
- **ripgrep**: Fast grep alternative
- **Telescope**: Neovim fuzzy finder (Ctrl-p for files, Space+s+g for grep)

## Adding New Dotfiles

1. Decide which package: `common/` (shared) or `work/` / `personal/` (machine-specific).
2. Add file with `dot-` prefix (e.g., `common/dot-myconfig`).
3. For XDG config files, add under `<package>/dot-config/` (e.g., `common/dot-config/myapp/config`).
4. If it should NOT be symlinked, add a pattern to `<package>/.stow-local-ignore`.
5. Re-stow: `stow --dotfiles --target="$HOME" --dir=~/src/dotfiles common work` (or whichever packages apply).

## Testing Configuration Changes

### Shell Changes
```bash
# Test zshrc changes
source ~/.zshrc

# Or start new shell
zsh
```

### Neovim Changes
```bash
# Restart Neovim to reload config
# Or use :source ~/.config/nvim/init.lua inside nvim
```

### Tmux Changes
```bash
# Reload tmux config
tmux source-file ~/.tmux.conf
# Or inside tmux: Ctrl-b : source-file ~/.tmux.conf
```

## Dependencies

Core tools required (most in Brewfile):
- **Homebrew**: Package manager for macOS
- **stow**: Dotfile symlink manager
- **neovim**: Modern Vim fork
- **tmux**: Terminal multiplexer
- **fzf**: Fuzzy finder
- **ag / ripgrep**: Code search tools
- **z**: Directory jumper
- **nodenv**: Node.js version manager
- **diff-so-fancy**: Git diff enhancement

## Important Notes

- Editor: Neovim is aliased as `vim` in aliases file
- Git config: `dot-gitconfig` is symlinked to `~/.gitconfig`
- Git ignore: Global excludesfile at `~/.gitignore`
- Git commit template: `~/.gitmessage` provides 7 rules of good commits
- oh-my-zsh: Currently using minimal config (just git plugin, robbyrussell theme)
- Colors: Tmux and Neovim configured for 256-color terminals
