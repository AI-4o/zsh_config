# everwrite the hs command of hammerspoon for bpp
hs(){
  if [[ $1 == -h ]]; then
    echo "usage..."
    
  fi
  if [[ -z $1 ]]; then
    echo "insert a command in .lua"
    return 1
  fi

  command hs -c "$1"
}
