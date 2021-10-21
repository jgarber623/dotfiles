ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}›%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[magenta]%}‹node-"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$fg[magenta]%}›%{$reset_color%} "

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹ruby-"
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$fg[red]%}›%{$reset_color%} "

ZSH_THEME_TERM_TITLE_IDLE=""
ZSH_THEME_TERM_TAB_TITLE_IDLE=""

function prompt_char() {
  git branch > /dev/null 2> /dev/null && echo '±' && return
  echo '$'
}

function prompt_context() {
  echo "%{$fg_bold[yellow]%}%n%{$reset_color%} @ %{$fg_bold[blue]%}%m%{$reset_color%}"
}

function prompt_dir() {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_node() {
  [[ -e .nvmrc ]] && nvm_prompt_info || return
}

function prompt_ruby() {
  [[ -e .ruby-version ]] && rbenv_prompt_info || return
}

function prompt_status() {
  echo "%(?:%{$fg_bold[green]%}●:%{$fg_bold[red]%}●)%{$reset_color%}"
}

function set_prompt() {
  PROMPT="$(prompt_status) $(prompt_context): $(prompt_dir) "
  PROMPT+="$(git_prompt_info)$(prompt_node)$(prompt_ruby)"
  PROMPT+=$'\n$(prompt_char) '
}

setopt prompt_subst
precmd_functions+=set_prompt
