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
alias gba="git branch -a" # see al branches, local and remote

alias gr='git restore .'
alias agg='git branch --show-current | pbcopy && git checkout x &&   git branch --show-current  | pbcopy && git pull && git checkout $pippo[1] && git merge $pippo[2] && git push &&  pbclear'
alias grea='git remote add origin'
alias grev='git remote -v'
alias grerm='git remote remove origin'
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

alias gbrr="git push origin --delete " # delete a remote branch



