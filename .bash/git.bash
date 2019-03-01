# git.bash

# aliases
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gr='git remote'
alias grm='git rm'
alias gc='git clone'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gbr='git branch'
alias gl='git log'
alias gpush='git push'
alias gpull='git pull'
alias gcommit='git commit'

function git-branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "git@${ref#refs/heads/}:"
}
