# .bashrc

#
# Shell Options
#
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob

# Vi mode
set -o vi

#
# Envorionment Variables
#
export PROJECTS=$HOME/Projects
export PATH="$PATH:$HOME/bin:$HOME/Library/Python/3.9/bin:/usr/local/Cellar/rakudo/2020.08/share/perl6/site/bin"
export CDPATH=.:~:/media:/:/etc/:/var:/usr
export HISTIGNORE="&:ls:[bf]g:exit"
export EDITOR="emacsclient -a emacs"
export BROWSER='open -a "Firefox Developer Edition"'
export GITHUB=https://delonnewman@github.com/delonnewman
export GITHUB_USER=delonnewman

#
# Aliases
# 
alias ls='ls -sFk -h -G' 
alias ll='ls -lA -G'
alias reload='source ~/.bashrc'
alias dir='dir --color=auto -1'
alias du='du -h'
alias df='df -hT'
alias r='fc -s'
alias mime='file -i'
alias rm='rm -r'
alias cp='cp -r'
alias grep='grep --color=auto'

#alias vim='screen vim'
alias edit=$EDITOR

#
# Modules
#

# for project specific modifications
if [ $(pwd) != $HOME ]; then
  context="$(pwd)/.bashrc"
  if [ -e $context ]; then
    source "$(pwd)/.bashrc"
  fi
fi

source "$HOME/.bash/web.bash"
source "$HOME/.bash/git.bash"
source "$HOME/.bash/colors.bash"
source "$HOME/.bash/themes.bash"
source "$HOME/.bash/prompt.bash"

source "$HOME/.bash/heroku.bash"
source "$HOME/.bash/macos.bash"
source "$HOME/.bash/postgres.bash"
source "$HOME/.bash/ruby.bash"
source "$HOME/.bash/mongo.bash"

#
# Prompt Customization
#
shell-theme solarized
load-prompt

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
