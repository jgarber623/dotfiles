ZSH_THEME_TERM_TITLE_IDLE=""
ZSH_THEME_TERM_TAB_TITLE_IDLE=""

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_no_bold[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[green]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_no_bold[red]%}✗%{$reset_color%}"

ZSH_THEME_RBENV_PROMPT_PREFIX=" %{$fg_no_bold[yellow]%}‹"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$fg_no_bold[yellow]%}›%{$reset_color%}"

function collapse_pwd() {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char() {
  git branch > /dev/null 2> /dev/null && echo '±' && return
  echo '○'
}

function rbenv_prompt_info() {
  rbv=$(rbenv local 2> /dev/null) || return
  RUBY_VERSION="ruby-${rbv}" && echo "$ZSH_THEME_RBENV_PROMPT_PREFIX$RUBY_VERSION$ZSH_THEME_RBENV_PROMPT_SUFFIX"
}

PROMPT='%{$fg_bold[yellow]%}%n%{$reset_color%} at %{$fg_bold[cyan]%}%m%{$reset_color%}: $(collapse_pwd)$(rbenv_prompt_info)$(git_prompt_info)
$(prompt_char) '
