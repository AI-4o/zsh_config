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
. /users/a.i./zsh/langchain.zsh
. /users/a.i./zsh/digital_ocean.zsh


# stom cli 
alias tsk='llmtask'
alias oo="open -a 'chatGPT'"

# FE
#
# aider
alias ai='aider --model sonnet' 

# basic aliases
alias e="echo"
alias p="pwd | pbcopy && pwd"
alias n='nvim'
alias nn="nvim temp.txt"
alias cn='/Users/a.i./bin/__aisoft_kills__/create_note'
alias to='touch'
alias cpr='cp -r'
alias we="/Applications/WezTerm.app/Contents/MacOS/wezterm start --cwd \"$PWD\""
alias cl="/Users/a.i./bin/__aisoft_kills__/clean_temp_scripts"
alias dsa="ls -la | awk '{print \$9}' "

alias bb="bash -c \"$b\""
alias fnd="/Users/a.i./bin/__aisoft_kills__/find_files"
alias sw="/Users/a.i./bin/__aisoft_kills__/switch_warp_window"


# hammerspoofunctions

alias ws="hs -c \"sw()\""

# alias _tt  per appendere riga a t ---> in raycast
 
# alias opa='open -a' ---> in raycast f
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
export td=/Users/a.i./dev-test/note/todo.md
export bk=/Users/a.i./dev-test/note/study/books
export w=/opt/homebrew/var/www
export b=~/bin
export hs=/Users/a.i./.hammerspoon

### RECURRENT FILES ###
alias otd='nvim /Users/a.i./dev-test/note/todo.md'
alias ocred='nvim /Users/a.i./dev-test/note/credenziali.md'
