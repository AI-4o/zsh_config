# appendi contenuto a t
function at() {
  if [[ -z "$1" ]]; then
    echo "Usage: _tt <"string">"
    return 1
  fi

  (cd ~/bin && echo "$*" >> t) 
}

# fai modifica veloce a t
function mt() {
  (cd ~/bin && nvim t)
}
