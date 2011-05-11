# Apache
alias webstart="sudo apachectl start"
alias webstop="sudo apachectl stop"
alias webrestart="sudo apachectl restart"

# Git
alias add="git add"
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias co="git checkout"
alias commit="git commit"
alias diff="git diff"
alias merge="git merge"
alias pull="git pull"
alias push="git push"
alias rebase="git rebase"
alias stash="git stash"
alias status="git status -sb"
alias tag="git tag"

# MySQL
alias mystart="mysql.server start"
alias mystop="mysql.server stop"

# PostgreSQL
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Python/Django
alias pyshell="python manage.py shell"
alias runserver="python manage.py runserver"
alias startapp="python manage.py startapp"
alias syncdb="python manage.py syncdb"

# Ruby on Rails
alias migrate="rake db:migrate"
alias raketest="rake test; open coverage/index.html -a /Applications/Firefox.app;"
alias setup="bundle install; rake db:drop:all db:setup"