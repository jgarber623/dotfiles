autoload colors && colors

function collapse_pwd() {
	echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char() {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	echo '○'
}

export PROMPT='%{$fg_bold[white]%}%n%{$reset_color%} at %{$fg_bold[cyan]%}%m%{$reset_color%}: $(collapse_pwd) $(git_prompt_info) $(prompt_char) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"