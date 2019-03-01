# colors
GREY=30
RED=31
GREEN=32
YELLOW=33
BLUE=34
PURPLE=35
CYAN=36
WHITE=39

# bold / normal
BOLD=1
NORMAL=0

function color {
    COLOR=$1
    BOLD=$2
    if [ -z $2 ]; then
        BOLD=0
    fi
    echo "\[\033[${BOLD};${COLOR}m\]"
}
