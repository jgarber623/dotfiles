export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
export RUBYOPT="-W0"

[[ -d $HOME/.rbenv ]] && eval "$(rbenv init -)"
