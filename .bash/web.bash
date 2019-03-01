# web.bash

alias web=open

GOOGLE="https://encrypted.google.com/search?hl=en&q="
DDG="https://duckduckgo.com/?q="
MCPAN="https://metacpan.org/search?q="
CPAN="http://search.cpan.org/search?q="

function url-encode {
  perl -MURL::Encode -e "print URL::Encode::url_encode(\"$@\")"
}

function dash {
    USAGE="Usage: dash QUERY"

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        open "dash://$q"
    fi
}

function google {
    USAGE="Usage: google QUERY"

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        web "$GOOGLE"$q
    fi
}

function mcpan {
    USAGE="Usage: mcpan QUERY"

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        web "$MCPAN"$q
    fi
}

function cpan {
    USAGE="Usage: cpan QUERY"

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        web "$CPAN"$q
    fi
}

function ddg {
    USAGE="Usage: ddg QUERY"

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        web "$DDG"$q
    fi
}

function rubydoc {
    USAGE="Usage: ruby-doc QUERY" 

    if [ -z "$@" ]; then
    echo $USAGE
    else
        q=$@
        q=${q// /+}
        web "http://ruby-doc.com/search.html?q="$(url-encode $q)
    fi
}

function rubygems {
  USAGE="Usage: rubygems QUERY"
  if [ -z "$@" ]; then
  echo $USAGE
  else
    q=$@
    q=${q// /+}
    web "https://rubygems.org/search?utf8=✓&query="$(url-encode $q)
  fi
}
