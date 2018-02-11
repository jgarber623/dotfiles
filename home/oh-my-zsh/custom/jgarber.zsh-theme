ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}›%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[magenta]%}‹node-"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$fg[magenta]%}›%{$reset_color%} "

ZSH_THEME_RBENV_PROMPT_PREFIX="%{$fg[yellow]%}‹ruby-"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$fg[yellow]%}›%{$reset_color%} "

ZSH_THEME_TERM_TITLE_IDLE=""
ZSH_THEME_TERM_TAB_TITLE_IDLE=""

nvm_prompt_info() {
  if [[ $(nvm_find_nvmrc) ]]; then
    echo "${ZSH_THEME_NVM_PROMPT_PREFIX}$(node -v)${ZSH_THEME_NVM_PROMPT_SUFFIX}"
  fi
}

prompt_char() {
  git branch > /dev/null 2> /dev/null && echo '±' && return
  echo '$'
}

rbenv_prompt_info() {
  RUBY_VERSION=$(rbenv local 2> /dev/null) || return
  echo "${ZSH_THEME_RBENV_PROMPT_PREFIX}${RUBY_VERSION}${ZSH_THEME_RBENV_PROMPT_SUFFIX}"
}

set_prompt() {
  local _user="%{$fg_bold[yellow]%}%n%{$reset_color%} at %{$fg_bold[blue]%}%m%{$reset_color%}"
  local _pwd=$(pwd | sed -e "s,^$HOME,~,")

  PROMPT="${_user}: ${_pwd} $(git_prompt_info)$(nvm_prompt_info)$(rbenv_prompt_info)"
  PROMPT+=$'\n$(prompt_char) '
}

setopt prompt_subst
precmd_functions+=set_prompt
