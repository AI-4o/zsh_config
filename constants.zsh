# This file contains: aliases, hashes, env variables, utility functions

### ALIASES ##
. /users/a.i./zsh/applications.zsh
. /users/a.i./zsh/brew.zsh
. /users/a.i./zsh/conda.zsh
. /users/a.i./zsh/docker.zsh
. /users/a.i./zsh/git.zsh
. /users/a.i./zsh/ollama.zsh
. /users/a.i./zsh/python.zsh
. /users/a.i./zsh/pnpm.zsh
. /users/a.i./zsh/rust.zsh
. /users/a.i./zsh/vercel.zsh
. /users/a.i./zsh/langchain.zsh
. /users/a.i./zsh/digital_ocean.zsh
. /users/a.i./zsh/google.zsh
. /users/a.i./zsh/aisoft_kills.zsh
. /users/a.i./zsh/task_0px.zsh 
. /users/a.i./zsh/task_0px.zsh 
. /users/a.i./zsh/hammerspoon.zsh 
. /users/a.i./zsh/aisoft.zsh 

# stom cli 
alias tsk='llmtask'

# FE

# basic aliases
alias p="pwd | pbcopy && pwd"
alias n='nvim'
alias to='touch'
alias cp='cp -r' # copia directory e subdirectories
alias mv="mv -v"
alias lsa="ls -lah --color=auto"
alias fnd="/Users/a.i./bin/__aisoft_kills__/aisoft_find"
alias ccat="cat <<∆ >" # create a new file and populate it with here-doc redirection

# alias _tt  per appendere riga a t ---> in raycast
 
# alias opa='open -a' ---> in raycast f
# alias scp='pbcopy' ---> in raycast per avere aggiunta di |
# alias spt='$(pbpaste)' ---> in raycast per avere aggiunta di |
alias rmf='rm -rf'
# alias xi='xargs -I {}' ---> in raycast per avere aggiunta di |
alias mkd='mkdir -p'  
alias chx='chmod +x'

### NODE.JS ###
export NODE_OPTIONS="--no-deprecation"

### CUSTOM GLOBAL VARIABLES OF DIRECTORIES ###

export v=~/dev-test/
export c=/Users/a.i./Library/Mobile\ Documents/com~apple~CloudDocs/cloud-docs
export d=/Users/a.i./Downloads
export nt=~/note
export zz=~/.zshrc
export z=~/zsh/
export n=~/.config/nvim/

# appunti 
export td=/Users/a.i./note/todo.md
export e=/Users/a.i./e

export w=/opt/homebrew/var/www
export hs=/Users/a.i./.hammerspoon
export hb=/opt/homebrew

# aisoft
export aik=/Users/a.i./bin/__aisoft_kills__
export b=~/bin
export ais=~/aisoft
export s=~/aisoft/clienti


export t=~/temp # temporary stuff 

### RECURRENT FILES ###
alias otd='nvim /Users/a.i./note/todo.md'
alias ocred='nvim /Users/a.i./note/credenziali.md'
