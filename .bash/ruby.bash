# ruby.bash

# aliases

alias rc='rake console'
alias rdb='rake db:console'
alias rs='rake server'
alias rds='rake gem:server'

# TODO: make this work with asdf
function ruby-version {
  if [ -f ./.ruby-version ]; then
    cat ./.ruby-version
  fi
}
