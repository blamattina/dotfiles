function pipe-git-command-to-diff-so-fancy
    git $argv | diff-so-fancy | less --tabs=4 -RFX
end
