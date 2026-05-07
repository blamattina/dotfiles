function fzf-checkout
    set tags (git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}')
    set branches (git branch --all | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}')
    set target (begin; echo $tags; echo $branches; end | fzf --no-hscroll --ansi +m -d "\t" -n 2)
    if test -n "$target"
        git checkout (echo $target | awk '{print $2}')
    end
end
