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
    set -g c0 (set_color 586e75)
    set -g c1 (set_color 93a1a1)
    set -g c2 (set_color 268bd2)
    set -g c3 (set_color 2aa198)
    set -g c4 (set_color eee8d5)
    set -g ce (set_color dc322f)

    # Clear the line because fish seems to emit the prompt twice. The initial
    # display, then when you press enter.
    printf "\033[K"

    # Current Directory & Hostname
    printf $c1
    printf "["
    printf $c3
    printf $USER
    printf $c0
    printf "@"
    printf $c1
    printf (prompt_hostname)
    printf $c4
    printf " "
    printf (echo $PWD | sed s!$HOME!\~!)
    printf $c1
    printf "]"

    # Current time
    printf " [$c0@"
    printf (date "+$c0%H$c0:$c0%M$c0:$c0%S")
    printf " $c0!"
    printf $last_status
    printf "$c1]\n"

    # Git branch and dirty files
    printf "["
    git_branch
    if set -q git_branch
        set out $git_branch
        if test $git_dirty_count -gt 0
            set out "$out$c0:$ce$git_dirty_count"
        end
        printf $c0
        printf "git$c0@"
        printf $c0
        printf "$out "
    end
    printf $c1
    printf "~> "
end
