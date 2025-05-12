# GITHUB

function grpc() {
  if [[ -z "$1" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: gcrepo <repository name>"
    echo "Creates a new repository on GitHub and adds it as the origin remote."
    echo "Example: gcrepo my-new-repo"
    return 0
  fi
  gh repo create "$1" --public --source=. --remote=origin
}

function grpo() {
  if [[ -z "$1" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: grpg <repository name>"
    echo "Opens the repo in the browser"
    echo "Example: grpg repo-name" 
    return 0
  fi
  gh repo view $1 -w
}

function grpsc() {
  if [[ -z "$1" ]]; then
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
  gh repo list | grep -E $1  | awk '{print $1}'
}

function grprm() {
  if [[ -z "$1" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: grprm <repository name>"
    echo "Delete a GitHub repository" 
    echo "Example: grprm my-repo"
    return 0
  fi
  gh repo delete "$1" --yes
}

function grpsc() {
  if [[ -z "$1" ]]; then
    echo "Error: repository name is required."
    echo "Use '-h' for help."
    return 1
  fi
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: grpsc <repository name>"
    echo "greps and prints the name of the grepped repositories"
    echo "Example: grpsc carlino"
    return 0
  fi
  echo $(gh repo list | grep -E $*  | awk '{print $1}' | sed -n 's/AI-4o\///p')
}
