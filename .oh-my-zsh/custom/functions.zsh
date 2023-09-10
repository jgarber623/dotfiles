function docker-clobber() {
  docker system prune -f
  docker volume prune -f
  docker system prune -f
}

function git-production-branch-deploy() {
  git checkout production
  git merge main
  git push
  git checkout main
}

function touch() {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
