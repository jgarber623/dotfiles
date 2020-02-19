export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

[[ -d $HOME/.rbenv ]] && eval "$(rbenv init -)"
