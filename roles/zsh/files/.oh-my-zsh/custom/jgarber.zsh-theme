ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}›%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

ZSH_THEME_NODE_PROMPT_PREFIX="%{$fg[magenta]%}‹node-"
ZSH_THEME_NODE_PROMPT_SUFFIX="%{$fg[magenta]%}›%{$reset_color%} "

ZSH_THEME_RBENV_PROMPT_PREFIX="%{$fg[red]%}‹ruby-"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$fg[red]%}›%{$reset_color%} "

ZSH_THEME_TERM_TITLE_IDLE=""
ZSH_THEME_TERM_TAB_TITLE_IDLE=""

node_prompt_info() {
  [[ -e package.json ]] || return
  NODE_VERSION=$(node -v 2> /dev/null) || return
  echo "${ZSH_THEME_NODE_PROMPT_PREFIX}${NODE_VERSION}${ZSH_THEME_NODE_PROMPT_SUFFIX}"
}

prompt_char() {
  git branch > /dev/null 2> /dev/null && echo '±' && return
  echo '$'
}

rbenv_prompt_info() {
  [[ -e .ruby-version ]] || return
  RUBY_VERSION=$(rbenv version-name 2> /dev/null) || return
  echo "${ZSH_THEME_RBENV_PROMPT_PREFIX}${RUBY_VERSION}${ZSH_THEME_RBENV_PROMPT_SUFFIX}"
}

set_prompt() {
  local _user="%{$fg_bold[yellow]%}%n%{$reset_color%} at %{$fg_bold[blue]%}%m%{$reset_color%}"
  local _pwd=$(pwd | sed -e "s,^$HOME,~,")

  PROMPT="${_user}: ${_pwd} $(git_prompt_info)$(node_prompt_info)$(rbenv_prompt_info)"
  PROMPT+=$'\n$(prompt_char) '
}

setopt prompt_subst
precmd_functions+=set_prompt