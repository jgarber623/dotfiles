# Apache
alias webstart='sudo apachectl start'
alias webstop='sudo apachectl stop'
alias webrestart='sudo apachectl restart'

# Homebrew
alias brews='brew list'

# MySQL
alias mystart='mysql.server start'
alias mystop='mysql.server stop'
alias mystat='mysql.server status'

# PostgreSQL
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Redis
alias redstart='redis-server /usr/local/etc/redis.conf'

# Miscellaneous
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias ipcp='ipconfig getifaddr en0 | tr -d "\n" | pbcopy'
alias ipshow='ipconfig getifaddr en0'
alias mate='subl' #lolforever
alias pk='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'

# Shortcuts to project files
alias dotcd='cd $ZSH'
alias dotmate='subl $ZSH'

# Unix commands (I know this!)
alias ls='ls -flaG'