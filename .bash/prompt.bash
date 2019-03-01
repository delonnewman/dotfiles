# prompt.bash

# work hours
END=16
BEGIN=5

function get-time {
    t=$(date +%I:%M:%S)
    hour=$(date +%k)
    if (( $hour > $END )) || (( $hour < $BEGIN )) ; then
    echo -e '\033[0;31m'$t
    else
    echo $t
    fi
}

function load-prompt {
  GRAD1=`tty|cut -d/ -f3-4`
  
  # change color for root
  if [ $(id -u) -eq 0 ]; then
      C2=$(color $RED $BOLD)
      C4=$(color $RED $BOLD)
  fi
  
  # and here's the prompt
  PS1="$C2[$C4\u@\h$C3:$C5\w$C2] [$C3!$C4\! $C3@$C4$(get-time)$C4 $C3&$C4\j$C2]\n$C2[$C3\$(git-branch)$C4\$$C2>$C5 "
  PS2=" $C3|$C5 "
  PS4=" $C3+$C5 "
}
