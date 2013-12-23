# Set terminal window title to display current path
case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
  ;;
esac