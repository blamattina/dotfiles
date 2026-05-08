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

## Private overlay (work-confidential config)
For machine- or org-specific config that shouldn't live in this repo (e.g. a work
laptop pulling from a GitHub Enterprise `dotfiles-private` repo), check out the
external repo anywhere and symlink it as `private/` inside this repo. `setup`
auto-detects and stows it on top of `common` + your machine package.

```sh
git clone <host>:me/dotfiles-private.git ~/src/dotfiles-private
ln -s ~/src/dotfiles-private ~/src/dotfiles/private
./scripts/setup work
```

The external repo follows the same conventions as the in-tree packages:
`dot-`-prefixed files, optional `Brewfile`, optional `.stow-local-ignore`. The
`private` symlink is gitignored so it never gets committed back to the public repo.

## Extending
Configuration for a specific computer or environment goes in `.local` files.
Each is sourced if present; you can keep them out of version control entirely,
or commit them to your private overlay (see above) for machine-specific config
that should still be versioned somewhere private.

- `~/.config/fish/config.local.fish`
- `~/.gitconfig.local`
- `~/.tmux.conf.local`
