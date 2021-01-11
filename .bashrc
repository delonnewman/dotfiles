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
export PATH="$PATH:$HOME/bin"
export CDPATH=.:~:/media:/:/etc/:/var:/usr
export HISTIGNORE="&:ls:[bf]g:exit"
export EDITOR=vim
export BROWSER=firefox
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
source "$HOME/.bash/ruby.bash"
source "$HOME/.bash/colors.bash"
source "$HOME/.bash/themes.bash"
source "$HOME/.bash/prompt.bash"

# guix
GUIX_PROFILE="$HOME/.guix-profile"
source "$GUIX_PROFILE/etc/profile"

# deno
DENO_INSTALL="$HOME/.deno"
export PATH="$PATH:$DENO_INSTALL/bin"

# cargo
source "$HOME/.cargo/env"

#
# Prompt Customization
#
shell-theme solarized
load-prompt

# load perlbrew
#[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

# plenv
#if which plenv > /dev/null; then eval "$(plenv init -)"; fi
