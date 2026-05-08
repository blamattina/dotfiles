# dotfiles
> Configuration files for `fish`, `neovim`, and `tmux`.

## Installation
```sh
# Clone dotfiles
git clone https://github.com/blamattina/dotfiles.git ~/src/dotfiles
cd ~/src/dotfiles

# Install Brewfiles, link files, install fish plugins.
# Pass the machine package: `work` or `personal` (or omit for common only).
./scripts/setup work
# ./scripts/setup personal

# Set fish as default shell
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
```

## Local overlay (private/work-confidential config)
For machine- or org-specific config that shouldn't live in this repo (e.g. a work
laptop pulling from a GitHub Enterprise `dotfiles-local` repo), check out the
external repo anywhere and symlink it as `local/` inside this repo. `setup`
auto-detects and stows it.

```sh
git clone <host>:me/dotfiles-local.git ~/src/dotfiles-local
ln -s ~/src/dotfiles-local ~/src/dotfiles/local
./scripts/setup work
```

The external repo follows the same conventions as the in-tree packages:
`dot-`-prefixed files, optional `Brewfile`, optional `.stow-local-ignore`. The
`local` symlink is gitignored so it never gets committed back to the public repo.

## Customizations
Place configuration for a specific computer or environment in local files (not version controlled):

- `~/.config/fish/config.local.fish`
- `~/.config/fish/config.private.fish`
- `~/.gitconfig.local`
- `~/.tmux.conf.local`
