function git-delete-merged-branches
    git-list-merged-branches | xargs -n 1 git branch -d
end
