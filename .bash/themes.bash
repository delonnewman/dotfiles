# themes.bash

SHELL_THEME_PATH="$HOME/.bash/themes"
SHELL_THEME=default

function shell-theme {
  USAGE='Usage: shell-theme [THEME]'

  if [ -z "$1" ]; then
    # echo theme
    echo $SHELL_THEME
  else
    # set theme
    SHELL_THEME=$1
    source "$SHELL_THEME_PATH/${SHELL_THEME}.bash"
    load-theme
  fi
}
