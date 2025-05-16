# GIT
function gac() {
  if [[ -z "$1" ]]; then
    echo "Errore: devi passare un messaggio di commit."
    return 1
  fi
  git add . && git commit -m "$*"
}

function gacp() {
  if [[ -z "$1" ]]; then
    echo "Errore: devi passare un messaggio di commit."
    return 1
  fi
  git add . && git commit -m "$*" && git push
}

function gpu() {
  local current_branch=$(git branch --show-current 2>/dev/null)
  
  # Check if getting the branch name succeeded
  if [[ $? -ne 0 ]]; then
    echo "Error: Failed to get current branch name. Are you in a git repository?"
    return 1
  fi

  git push -u origin "$current_branch"
}

alias gup="git_update_branch"
function git_update_branch() {
  local x=$1
  if [[ -z "$x" ]]; then
    read -r x
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: gup <branch name>"
    echo " git checkout to the specified branch, merge the current branch with the original branch, then go back to the original branch"
    return 0
  fi

  if [[ -z "$x" ]]; then
    echo "Error: branch name is required."
    echo "Use 'gpr -h' for help."
    return 1
  fi

  b=$(git branch --show-current) 
  git checkout "$x" \
    && git merge "$b" \
    && git checkout "$b" \
}
