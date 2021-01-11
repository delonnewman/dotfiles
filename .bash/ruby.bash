# ruby.bash

# aliases

alias rc='rails console'
alias rs='rails server'
alias rcreds='rails credentials:edit'

# rvm
export PATH="$HOME/.rvm/bin:$PATH"
source "$HOME/.rvm/scripts/rvm"

# rbenv
#export PATH="$HOME/.rbenv/libexec:$PATH"
#eval "$(rbenv init -)"

function ruby-version {
  if [ -f ./.ruby-version ]; then
    cat ./.ruby-version
  fi
}
