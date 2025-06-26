
# execute a command on each line of a stdin
rwhile() {
  local commands="$*"

  while IFS= read -r l; do
    eval "$commands"
  done 
}

function cdn() {
  target_dir=$1
  
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        echo "Usage: cdn [path/to/dir]"
        return 0 
  fi

  if [[ -z "$1" ]]; then
    echo "error: missing argument"
    echo "Usage: cdn [path/to/dir]"
    return 1
  fi

  if [[ ! -d "$target_dir" ]]; then
        echo "Error: Directory '$target_dir' does not exist"
        return 1
  fi

  cd "$target_dir" && nvim
}





_x() {
  if [[ -z "$1" ]]; then
    x="$(cat)"
  else
    x="$(eval "$1")"
  fi
}

#  go up of n=number-of-points dirs and save the starting dir in a variable m
for i in $(seq 2 10); do
    dots=$(printf '.%.0s' $(seq 1 $i))
    body=$(printf 'cd ..; %.0s' $(seq 1 $((i - 1))
))
    eval "function $dots() { export m=\"\$(pwd)\"; $body }"
done
