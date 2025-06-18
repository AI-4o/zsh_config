
# execute a command on each line of a stdin
rwhile() {
  local commands="$*"

  while IFS= read -r l; do
    eval "$commands"
  done 
}

# creation of temp macros scripts
sc() {
  if [[ "$1" == "-h" ]]; then
    echo "create a script template in ~/bin with given name."
    echo "Usage: ct [nome_script]"

    return 0 
  fi

  if [[ -z "$1" ]]; then
    (cd ~/bin && echo '#!/usr/bin/env bash' > t) && chmod +x ~/bin/t
    return 0 
  fi

  (cd ~/bin && echo '#!/usr/bin/env bash' > "$1") && chmod +x ~/bin/"$1"
}

sa() {
  local name="$1"
  local code="$2"

  if [[ "$1" == "-h" ]]; then
    echo "Append the commands to the script file"
    echo "Usage: a [nome_script] [comando]"
    return 0 
  fi


  if [[ -z "$name" || -z "$code"  ]]; then
    echo "Usage: a [nome_script] [comando]"
    echo "Append the commands to the script file"
    return 1
  fi

  (cd ~/bin && echo -e "$code" >> "$name")

}

alias sclean="/Users/a.i./bin/__aisoft_kills__/clean_temp_scripts"
alias slist="/Users/a.i./bin/__aisoft_kills__/list_temp_scripts"


_x() {
  if [[ -z "$1" ]]; then
    x="$(cat)"
  else
    x="$(eval "$1")"
  fi
}

updir() {
  # updir -- salva in x il valore della dir attuale e risale di n dir (default 1)
  local n=1
  export m=$(pwd)

  if [[ "$1" == "-h" ]]; then
    echo "Go up of n dirs (default 1) and save the current dir in the exported variable x"
    echo "Usage: updir [N]"
    return 0
  fi

  if [[ -n "$1" ]]; then
    n="$1"
  fi

  for ((i=0; i<n; i++)); do
    cd .. || return 1
  done
}
alias upd="updir"

# alternative to updir using a sequence of points
for i in $(seq 2 10); do
    dots=$(printf '.%.0s' $(seq 1 $i))
    body=$(printf 'cd ..; %.0s' $(seq 1 $((i - 1))
))
    eval "function $dots() { export m=\"\$(pwd)\"; $body }"
done
