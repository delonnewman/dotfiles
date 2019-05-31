set -U fish_greeting "Hello Delon!"

set -gx PATH $PATH $HOME/bin
set -gx BROWSER open
set -gx EDITOR vim 
set -gx GITHUB_USER delonnewman
set -gx GITLAB_USER delnewman

# Abbriviations
abbr -a ls ls -sFk -h -G
abbr -a ll ls -lA -G
abbr -a du du -h
abbr -a df df -hT
abbr -a rm rm -r
abbr -a cp cp -r

# Git
abbr -a gs git status
abbr -a ga git add
abbr -a gd git diff
abbr -a gl git log
abbr -a gbr git branch
abbr -a gco git checkout
abbr -a gpush git push
abbr -a gpull git pull
abbr -a gcommit git commit

# Ruby / Rails
set -gx PATH $PATH $HOME/.rvm/bin
rvm default

abbr -a rcreds rails credentials:edit
abbr -a rc rails console
abbr -a rs rails server
