# This file contains: aliases, hashes, env variables, utility functions

### ALIASES ##
. /users/a.i./zsh/applications.zsh
. /users/a.i./zsh/brew.zsh
. /users/a.i./zsh/conda.zsh
. /users/a.i./zsh/docker.zsh
. /users/a.i./zsh/git.zsh
. /users/a.i./zsh/ollama.zsh
. /users/a.i./zsh/pip.zsh
. /users/a.i./zsh/pnpm.zsh
. /users/a.i./zsh/react.zsh
. /users/a.i./zsh/rust.zsh
. /users/a.i./zsh/vercel.zsh

# stom cli 
alias tsk='llmtask'

# FE
#
# aider
alias ai='aider --model sonnet' 

# basic aliases
alias e="echo"
alias n='nvim'
alias cn='create_note'
alias to='touch'
alias cpr='cp -r'

alias bb="bash -c \"$b\""

# similarly to vim macros, create a temp executable bash file to run later 
alias ct="(cd ~/bin && echo '#!/usr/bin/env bash' > t ) && chmod +x ~/bin/t"

# alias _tt  per appendere riga a t ---> in raycast
 
# alias opa='open -a' ---> in raycast 
# alias scp='pbcopy' ---> in raycast per avere aggiunta di |
# alias spt='$(pbpaste)' ---> in raycast per avere aggiunta di |
alias rmf='rm -rf'
# alias xi='xargs -I {}' ---> in raycast per avere aggiunta di |
alias mkd='mkdir'  
alias lcl='open-localhost'
alias chx='chmod +x'

alias venv='python3 -m venv'

# awk aliases
#
# comandi delegati a raycast
#
# awkp = awk '{print ${cursor}}'

alias pn='python3'

# c 


# utmcl aliases
alias uu='utmctl'


### NODE.JS ###
export NODE_OPTIONS="--no-deprecation"

### CUSTOM GLOBAL VARIABLES OF DIRECTORIES ###
export v=~/dev-test/
export c=/Users/a.i./Library/Mobile\ Documents/com~apple~CloudDocs/cloud-docs
export d=/Users/a.i./Downloads
export nt=~/dev-test/note
export s=~/dev-test/soft
export sc=~/dev-test/scripts/
export zz=~/.zshrc
export z=~/zsh/
export n=~/.config/nvim/
export st=~/dev-test/note/study 
export esp="~/Library/Application Support/espanso/match" 
export td=/Users/a.i./dev-test/note/todo.md
export bk=/Users/a.i./dev-test/note/study/books
export w=/opt/homebrew/var/www
export b=~/bin

### RECURRENT FILES ###
alias todo='nvim /Users/a.i./dev-test/note/todo.md'
alias cred='nvim /Users/a.i./dev-test/note/credenziali.md'
