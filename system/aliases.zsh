# dotfiles project aliases
alias dotcd='cd $ZSH'
alias dotmate='atom $ZSH'

# Apache and MySQL-related aliases
alias apache='sudo apachectl'

# alias mygo='mysql.server start'
# alias mystop='mysql.server stop'

# alias amgo='ago && mygo'
# alias amstop='astop && mystop'

# PostgreSQL
# alias pggo='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
# alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Miscellaneous aliases
# alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
# alias ipcp='ipconfig getifaddr en0 | tr -d "\n" | pbcopy'
# alias ipshow='ipconfig getifaddr en0'
alias ls='ls -flaG'
alias mate='atom' #lolforever
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'
