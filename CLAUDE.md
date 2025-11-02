# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with RCM (thoughtbot's RC file management tool). Files are symlinked from this repository to the home directory, with the `config/` directory mapping to `~/.config/`.

## Setup Commands

### Initial Installation
```bash
# Automated setup (installs rcm, creates symlinks, clones oh-my-zsh)
./scripts/setup

# Manual installation
brew install rcm
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
rcup -d ~/src/dotfiles
```

### Update Dotfiles
```bash
cd ~/src/dotfiles
git pull
rcup  # Re-create symlinks if needed
```

### Package Management
```bash
# Install all Homebrew packages from Brewfile
brew bundle --file=~/src/dotfiles/Brewfile

# Update Brewfile to match currently installed packages
cd ~/src/dotfiles
brew bundle dump --force
```

### Neovim Plugin Management
Plugins are managed by lazy.nvim and auto-install on first launch:
```bash
nvim           # Auto-bootstraps lazy.nvim and installs plugins
:Lazy          # Interactive plugin manager UI
:Lazy sync     # Update all plugins
```

## Architecture

### RCM Symlink System
- RCM creates symlinks: repository files → home directory
- Files without `.` prefix get symlinked as dotfiles (e.g., `zshrc` → `~/.zshrc`)
- `config/` directory contents → `~/.config/` (XDG Base Directory)
- Exclusions defined in `rcrc`: README, LICENSE, scripts, examples
- Command: `rcup` creates symlinks, `rcdn` removes them

### Shell Configuration Loading Order
The `zshrc` sources configurations in this specific order:
1. oh-my-zsh framework
2. `~/.aliases` (git functions, tmux shortcuts, search tools)
3. `~/.zshrc.local` (machine-specific, not version controlled)
4. `~/.zshrc.private` (sensitive data, not version controlled)
5. `~/.fzf.zsh` (fuzzy finder integration)

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
config/nvim/
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
- **ag**: Silver Searcher (`agignore` excludes common dirs)
- **ripgrep**: Fast grep alternative
- **Telescope**: Neovim fuzzy finder (Ctrl-p for files, Space+s+g for grep)

## Adding New Dotfiles

1. Add file to repository (with or without `.` prefix)
2. If it should NOT be symlinked, add to EXCLUDES in `rcrc`
3. Run `rcup` to create symlink
4. For config files in XDG directories, use `config/` subdirectory

Example:
```bash
# Add new zsh function file
echo 'my_function() { ... }' > ~/src/dotfiles/functions
rcup -d ~/src/dotfiles
# Now ~/.functions exists and is sourced
```

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
- **rcm**: Dotfile symlink manager
- **oh-my-zsh**: Zsh framework (cloned by setup script)
- **neovim**: Modern Vim fork
- **tmux**: Terminal multiplexer
- **fzf**: Fuzzy finder
- **ag / ripgrep**: Code search tools
- **z**: Directory jumper
- **nodenv**: Node.js version manager
- **diff-so-fancy**: Git diff enhancement

## Important Notes

- Editor: Neovim is aliased as `vim` in aliases file
- Git config: `gitconfig.dotfiles` is symlinked to `~/.gitconfig` (RCM behavior)
- Git ignore: Global excludesfile at `~/.gitignore`
- Git commit template: `~/.gitmessage` provides 7 rules of good commits
- oh-my-zsh: Currently using minimal config (just git plugin, robbyrussell theme)
- Colors: Tmux and Neovim configured for 256-color terminals
- rcup -vd . from the repo root will link new files