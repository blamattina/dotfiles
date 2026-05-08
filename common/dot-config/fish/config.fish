set -gx EDITOR nvim

# nodenv
if type -q nodenv
    nodenv init - fish | source
end

# fzf
if type -q fzf
    fzf --fish | source
end

# starship prompt
if type -q starship
    starship init fish | source
end

# atuin history
if type -q atuin
    atuin init fish | source
end

# direnv
if type -q direnv
    direnv hook fish | source
end

fish_vi_key_bindings

# Set empty terminal title for tmux
printf '\033]2;\033\\'

if test -f ~/.config/fish/config.local.fish
    source ~/.config/fish/config.local.fish
end
