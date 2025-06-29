# git aliases
alias ga='git add'
alias gck='git checkout'
alias gckb='git checkout -b'
alias gp='git push'
alias gpl='git pull'
alias gcz='git cz'
alias gs='git status'

alias gb="git branch"
alias gbc='git branch --show-current'
alias gbm="git branch -m"
alias gbv='git branch -v'
alias gbd='git branch -D'
alias gba="git fetch --prune && git branch -a" # see al branches, local and remote
alias gclone="git clone"

alias grs='git restore'
alias agg='git branch --show-current | pbcopy && git checkout x &&   git branch --show-current  | pbcopy && git pull && git checkout $pippo[1] && git merge $pippo[2] && git push &&  pbclear'
alias grao='git remote add origin'
alias grv='git remote -v'
alias gr='git remote'

alias gm='git merge'
alias gff='git diff'

alias gst='git stash'
alias gsa='git stash apply'
alias gsp='git stash push'
alias gsl='git stash list'
alias gsc='git stash clear'
alias gsr='git stash drop'
alias gl="git log"
alias gbrename="git branch -m"

alias gft="git fetch"

alias gbrd="git push origin --delete " # delete a remote branch
alias guig= "git rm --cached" # aggiorna la cache di git rimuovendo i files indicati (utile per aggioprnare quando si aggiungono percorsi al .gitignore)



# git worktree 
alias gwt="git worktree"
alias gwtl="git worktree list"

gwtrm() { # rimuove worktrees che matchano con pattern di $1
  if [[ -z "$1" ]]; then
    echo "Usage: gtrm <pattern>"
    return 1
  fi

  local pattern="$1"
  local worktrees

  # Ottieni i path delle worktree che matchano il pattern
  worktrees=$(git worktree list --porcelain | awk '/worktree / {print $2}' | grep -e "$pattern")

  if [[ -z "$worktrees" ]]; then
    echo "Nessuna worktree trovata con il pattern: $pattern"
    return 0
  fi

  # Itera e rimuovi ciascuna worktree trovata
  for w in $worktrees; do
    echo "Rimuovo worktree: $w"
    git worktree remove "$w"
  done
}

gwtc() {
  out_dir=$2
  branch_name=$1
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: gtc <branch_name> <output_directory>"
    return 1
  fi
  git worktree $1 $2
}
 
