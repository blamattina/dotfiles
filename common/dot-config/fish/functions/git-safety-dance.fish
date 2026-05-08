function git-safety-dance
    set branch (git rev-parse --abbrev-ref HEAD)
    set timestamp (date +%s)
    git checkout -b "$branch-backup-$timestamp" && git checkout -
end
