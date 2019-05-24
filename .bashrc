# .bashrc

#
# Shell Options
#
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob

#
# Envorionment Variables
#
export PROJECTS=$HOME/Projects
export PATH="$PATH:$HOME/bin"
export CDPATH=.:~:/media:/:/etc/:/var:/usr
export HISTIGNORE="&:ls:[bf]g:exit"
export EDITOR=vim
export BROWSER=open
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
#if [ $(pwd) != $HOME ]; then
#  context="$(pwd)/.bashrc"
#  if [ -e $context ]; then
#    source "$(pwd)/.bashrc"
#  fi
#fi

source "$HOME/.bash/web.bash"
source "$HOME/.bash/git.bash"
source "$HOME/.bash/colors.bash"
source "$HOME/.bash/themes.bash"
source "$HOME/.bash/prompt.bash"

#
# Prompt Customization
#
shell-theme solarized
load-prompt

# rbenv
#export PATH="$HOME/.rbenv/libexec:$PATH"
#eval "$(rbenv init -)"

# load perlbrew
#[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

# plenv
#if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# android sdk
#export ANDROID_HOME=/usr/local/opt/android-sdk

#[ -s "/Users/cherub/.dnx/dnvm/dnvm.sh" ] && . "/Users/cherub/.dnx/dnvm/dnvm.sh" # Load dnvm

#export NVM_DIR="/Users/cherub/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
