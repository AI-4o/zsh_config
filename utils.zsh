# execute a command on each line of a stdin
rwhile() {
  local commands="$*"

  while IFS= read -r l; do
    eval "$commands"
  done 
}

_cdn() {
  # go to provided dir and open it with nvim 
  
  if [[ -n "$1" ]]; then  # an argument is provided   
    target_dir=$1
    
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
          echo "Usage: cdn [path/to/dir]"
          echo "also supports piped input: hr_bukkake_face_droplets_container | cdn"
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
    cd $target_dir && nvim 

  elif [ -p /dev/stdin ]; then   # there is a stdin that is given by a pipe
    read -r firstline
    _cdn "$firstline"
    return 0
  fi
}



# create a family of functions for storing piped stdin into variables
alphabet=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
for letter in ${alphabet[@]}; do
    eval "_$letter() { 
        if [[ -z \$1 ]]; then 
            $letter=\$(cat)
        else 
            $letter=\$(eval \"\$1\")
        fi 
    }"
done

#  go up of n=number-of-points dirs and save the starting dir in a variable m
for i in $(seq 2 10); do
    dots=$(printf '.%.0s' $(seq 1 $i))
    body=$(printf 'cd ..; %.0s' $(seq 1 $((i - 1))
))
    eval "function $dots() { export m=\"\$(pwd)\"; $body }"
done
