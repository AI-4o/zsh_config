# GITHUB

function ghc() {
  if [[ -z "$1" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Create a new GitHub repository and add it as the origin remote."
    echo "Usage: ghc [option]"
    echo "option can be:"
    echo "  -h, --help: Show this help message"
    echo "  -p: Create a public repository"
    echo "no option: Create a private repository"

    echo "Creates a new repository on GitHub and adds it as the origin remote."
    echo "Example: gcrepo my-new-repo"
    return 0
  fi
  if [[ "$2" == "-p" ]]; then
    gh repo create "$1" --source=. --public --remote=origin
    return 0
  fi
  gh repo create "$1" --source=. --private --remote=origin
}


function ghl() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ghl"
    echo "Lists all GitHub repositories"
    return 0
  fi
  gh repo list
}

function gho() {
  local repo="$1"
  if [[ -z "$repo" ]]; then
    read -r repo
  fi
  if [[ -z "$repo" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: gho <repository name>"
    echo "Opens the repo in the browser"
    echo "Example: grpg repo-name" 
    return 0
  fi
  gh repo view $repo -w
}

function ghsc() {
  local repo="$1"
  if [[ -z "$repo" ]]; then
    read -r repo
  fi
  if [[ -z "$repo" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: grpf <repository name>"
    echo "lists the gh repos that have name containing the given string"
    echo "Example: grpf repo-name" 
    return 0
  fi
  gh repo list | grep -E $repo  | awk '{print $1}'
}

function ghrm() {
  local repo="$1"
  if [[ -z "$repo" ]]; then
    read -r repo
  fi  
  if [[ -z "$repo" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ghrm <repository name>"
    echo "Delete a GitHub repository" 
    echo "Example: grprm my-repo"
    return 0
  fi
  gh repo delete "$repo" --yes
}

function ghsc() {
  local repo="$1"
  if [[ -z "$repo" ]]; then
    read -r repo
  fi
  if [[ -z "$repo" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ghsc <repository name>"
    echo "greps and prints the name of the grepped repositories"
    echo "Example: grpsc carlino"
    return 0
  fi
  echo $(gh repo list | grep -E $repo  | awk '{print $1}' | sed -n 's/AI-4o\///p')
}

function ghurl() {
  local repo="$1"
  if [[ -z "$repo" ]]; then
    read -r repo
  fi
  if [[ -z "$repo" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi

  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ghurl <repository name>"
    echo "Prints the URL of the given repository"
    echo "Example: grurl my-repo"
    return 0
  fi
  echo "https://github.com/AI-4o/$repo"
}
