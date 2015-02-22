# dotfiles
alias dotcd='cd $ZSH'
alias dotmate='subl $ZSH'

# Apache
alias apache='sudo apachectl'
alias apacheconf='subl /etc/apache2'
alias hosts='subl /etc/hosts'
alias vhosts='subl /etc/apache2/extra/httpd-vhosts.conf'

# nginx
alias nginx='sudo nginx'
alias nginxconf='subl /usr/local/etc/nginx/nginx.conf'

# PostgreSQL
alias pg='pg_ctl -D /usr/local/var/postgres'

# Miscellaneous
# alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
# alias ipcp='ipconfig getifaddr en0 | tr -d "\n" | pbcopy'
# alias ipshow='ipconfig getifaddr en0'
alias ls='ls -flaG'
alias mate='subl' #lolforever
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'
