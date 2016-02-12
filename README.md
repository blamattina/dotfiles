# dotfiles
> Configuration files for `zsh`, `vim`, and `tmux` heavily inspired by https://github.com/thoughtbot/dotfiles.

## Installation
```sh
# Install configuration management tools
brew tap thoughtbot/formulae
brew install rcm

# Clone dotfiles
git clone https://github.com/blamattina/dotfiles.git

# Link files
rcup -d .
```

## Customizations
Place configuration for a specific computer or environment in files with the
`.local` extension.

Supported Local Files:
- `~/.aliases.local`
- `~/.tmux.conf.local`
- `~/.vimrc.local`
- `~/.vimrc.bundles.local`
- `~/.zshrc.local`
