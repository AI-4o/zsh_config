
# execute a command on each line of a stdin
rwhile() {
  local commands="$*"

  while IFS= read -r l; do
    eval "$commands"
  done 
}

# creation of temp macros scripts
ac() {
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

a() {
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

# questa rimane per la sua utilità in quanto supporta anche stdin 
at() {
  local code=""

  if [[ -z "$1" ]]; then
    while IFS= read -r line; do
      code+="$line"$'\n'
    done
  else
    code="$*"
  fi

  (cd ~/bin && echo -e "$code" >> t)
}

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
  export x=$(pwd)

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
