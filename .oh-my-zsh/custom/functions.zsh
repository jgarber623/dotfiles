function touch() {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}
