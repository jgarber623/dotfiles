# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)

if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

alias hist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias status='git status -sb'