# helper functions for productivity

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

function gup() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: gup <branch name>"
    echo " git checkout to the specified branch, merge the current branch with the original branch, then go back to the original branch"
    return 0
  fi

  if [[ -z "$1" ]]; then
    echo "Error: branch name is required."
    echo "Use 'gpr -h' for help."
    return 1
  fi

  b=$(git branch --show-current) 
  git checkout "$1" \
    && git merge "$b" \
    && git checkout "$b" \
}



function prod() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: prod <commit message>"
    echo ""
    echo "Does the following:"
    echo "1. git add ."
    echo "2. git commit -m <message>"
    echo "3. git push"
    echo "4. git checkout main"
    echo "5. git merge develop"
    echo "6. git push"
    echo "7. git checkout develop"
    return 0
  fi

  if [[ -z "$1" ]]; then
    echo "Error: commit message is required."
    echo "Use 'prod -h' for help."
    return 1
  fi

  git add . \
    && git commit -m "$*" \
    && git push \
    && git checkout main \
    && git merge develop \
    && git push \
    && git checkout develop
}

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

function grpg() {
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

function grpf() {
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

# GREP

function sc() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "this is a custom grep function"
    echo "Usage: grep -E <string>"
    return 0
  fi
  if [[ -z "$1" ]]; then
    echo "Error: command is required."
    echo "Use '-h' for help."
    return 1
  fi
  grep -E "$*" 
}

function scv() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "this is a custom grep function"
    echo "Usage: grep -E -v <string>"
    return 0
  fi
  if [[ -z "$1" ]]; then
    echo "Error: command is required."
    echo "Use '-h' for help."
    return 1
  fi
  grep -E -v "$*" 
}


# CONDA

function cndrg() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: conda_env <environment grep name>"
    echo "deletes the envs that have a name that matches the grep"
    return 0
  fi
  if [[ -z "$1" ]]; then
    echo "Error: environment name is required."
    echo "Use '-h' for help."
    return 1
  fi
  conda env list | grep "$*"  | awk '{print $1}' | xargs -I {} conda env remove -y --name {}
}


# C
ccr() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ccr path/to/dir"
    echo "Compile and run all .c files in the given directory"
    echo "Example: ccr ."
    return 0
  fi

  if [[ -z "$1" ]]; then
    echo "Error: path is required."
    echo "Use '-h' for help."
    return 1
  fi

  # Convert to absolute path
  TARGET_DIR=$(realpath "$1" 2>/dev/null)

  if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: '$1' is not a valid directory."
    return 1
  fi

  # Go to that directory
  cd "$TARGET_DIR" || return 1

  # Compile and run
  if ls *.c &>/dev/null; then
    gcc *.c -o anya && ./anya
  else
    echo "No .c files found in $TARGET_DIR"
    return 1
  fi
}
