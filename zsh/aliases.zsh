# Apache
alias webstart="sudo apachectl start"
alias webstop="sudo apachectl stop"
alias webrestart="sudo apachectl restart"

# MySQL
alias mystart="mysql.server start"
alias mystop="mysql.server stop"
alias mystat="mysql.server status"

# PostgreSQL
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Miscellaneous
alias ipcopy="ipconfig getifaddr en0 | pbcopy"

# Shortcuts to project files
alias dotcd="cd $ZSH"
alias dotmate="subl $ZSH"