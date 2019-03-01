# vim: set ft=sh
function git_branch
    set -g git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    if [ $status -ne 0 ]
        set -ge git_branch
        set -g git_dirty_count 0
    else
        set -g git_dirty_count (git status --porcelain  | wc -l | sed "s/ //g")
    end
end

function fish_prompt
    # $status gets nuked as soon as something else is run, e.g. set_color
    # so it has to be saved asap.
    set -l last_status $status

    # c0 to c4 progress from dark to bright
    # ce is the error colour
    set -g c0 (set_color 005284)
    set -g c1 (set_color 0075cd)
    set -g c2 (set_color 009eff)
    set -g c3 (set_color 6dc7ff)
    set -g c4 (set_color ffffff)
    set -g ce (set_color $fish_color_error)

    # Clear the line because fish seems to emit the prompt twice. The initial
    # display, then when you press enter.
    printf "\033[K"

    # Current Directory
    # 1st sed for colourising forward slashes
    # 2nd sed for colourising the deepest path (the 'm' is the last char in the
    # ANSI colour code that needs to be stripped)
    printf $c1
    printf "["
    printf $c1
    printf (pwd | sed "s,/,$c0/$c1,g" | sed "s,\(.*\)/[^m]*m,\1/$c3,")
    printf "$c1]"

    # Current time
    printf " [$c0@"
    printf (date "+$c2%H$c0:$c2%M$c0:$c2%S")
    printf "$c1]\n"

    # Git branch and dirty files
    printf "["
    git_branch
    if set -q git_branch
        set out $git_branch
        if test $git_dirty_count -gt 0
            set out "$out$c0:$git_dirty_count"
        end
        printf "git@$out "
    end
    printf "~> "
end
