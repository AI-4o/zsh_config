# appendi contenuto a t
function tt() {
  if [[ -z "$1" ]]; then
    echo "Usage: _tt <"string">"
    return 1
  fi

  (cd ~/bin && echo "$*" >> t) 
}

# fai modifica veloce a t
function ttm() {
  (cd ~/bin && nvim t)
}
