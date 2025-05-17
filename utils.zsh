
# execute a command on each line of a stdin
function rwhile() {
  local commands="$*"

  while IFS= read -r l; do
    eval "$commands"
  done 
}

# creation of temp macros scripts
function ac() {
  if [[ "$1" == "-h" ]]; then
    echo "Usage: ct [nome_script]"
    return 0 
  fi

  if [[ -z "$1" ]]; then
    (cd ~/bin && echo '#!/usr/bin/env bash' > t) && chmod +x ~/bin/t
    return 0 
  fi

  (cd ~/bin && echo '#!/usr/bin/env bash' > "$1") && chmod +x ~/bin/"$1"
}

function a() {
  local name="$1"
  local code="$2"

  if [[ -z "$name" || -z "$code"  ]]; then
    echo "Usage: a [nome_script] [comando]"
    echo "Append the commands to the script file"
    return 1
  fi

  (cd ~/bin && echo -e "$code" >> "$name")

}

# questa rimane per la sua utilità in quanto supporta anche stdin 
function at() {
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

