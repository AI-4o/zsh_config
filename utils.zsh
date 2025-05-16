function ct() {
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

function at() {
  if [[ -z "$1" ]]; then
    echo "Usage: at <"string">"
    return 1
  fi

  (cd ~/bin && echo "$*" >> t) 
}

function ab() {
  if [[ -z "$1" ]]; then
    echo "Usage: ab <"string">"
    return 1
  fi

  (cd ~/bin && echo "$*" >> b) 
}

function ac() {
  if [[ -z "$1" ]]; then
    echo "Usage: ac <"string">"
    return 1
  fi

  (cd ~/bin && echo "$*" >> c) 
}

# todo: edit at so that it can add new lines to a custom script, not only
# the t script
