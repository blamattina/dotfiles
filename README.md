# dotfiles
> Configuration files for `fish`, `neovim`, and `tmux`.

## Installation
```sh
# Clone dotfiles
git clone https://github.com/blamattina/dotfiles.git ~/src/dotfiles
cd ~/src/dotfiles

# Install packages
brew bundle

# Link files and install fish plugins
./scripts/setup

# Set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
```

## Customizations
Place configuration for a specific computer or environment in local files (not version controlled):

- `~/.config/fish/config.local.fish`
- `~/.config/fish/config.private.fish`
- `~/.gitconfig.local`
- `~/.tmux.conf.local`
