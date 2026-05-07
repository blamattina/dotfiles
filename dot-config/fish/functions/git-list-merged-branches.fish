function git-list-merged-branches
    git checkout master --quiet && git branch --merged | grep -v "\*"
end
