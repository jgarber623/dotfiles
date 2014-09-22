# Lifted from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

# The following is based on https://github.com/gma/bundler-exec

bundled_commands=(berks cap capify chefspec chef-apply chef-client chef-shell chef-solo cucumber foodcritic foreman guard haml html2haml jasmine kitchen knife middleman pry rackup rake rake2thor rspec ruby sass sass-convert serve shotgun spec spork strainer thin thor tilt tt turn unicorn unicorn_rails)

## Functions

_bundler-installed() {
	which bundle > /dev/null 2>&1
}

_within-bundled-project() {
	local check_dir=$PWD
	while [ $check_dir != "/" ]; do
		[ -f "$check_dir/Gemfile" ] && return
		check_dir="$(dirname $check_dir)"
	done
	false
}

_run-with-bundler() {
	if _bundler-installed && _within-bundled-project; then
		bundle exec $@
	else
		$@
	fi
}

## Main program

for cmd in $bundled_commands; do
	eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"
	alias $cmd=bundled_$cmd

	if which _$cmd > /dev/null 2>&1; then
		compdef _$cmd bundled_$cmd=$cmd
	fi
done