# This file contains: aliases, hashes, env variables, utility functions

### ALIASES ###

# Application
alias och='open -a "Google Chrome"'

# custom cli 
alias tsk='llmtask'


# FE
#
# REACT
alias nextc='npx create-next-app@latest'
alias ol='open-localhost'

# brew 
alias w='brew'
alias wl='brew list'
alias wss='brew services start'
alias wsl='brew services list'
alias wsp='brew services stop'
alias wsrm='brew services remove'

# docker
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dpr='docker pull'
alias dr='docker run'
alias dprr='docker run -it --rm'
alias dprrm='docker run -it --rm -v $(pwd):/app -w /app'

# basic aliases
alias n='nvim'
alias to='touch'
alias cpr='cp -r'
# alias scp='pbcopy' ---> in raycast per avere aggiunta di |
# alias spt='$(pbpaste)' ---> in raycast per avere aggiunta di |
alias rmf='rm -rf'
# alias xi='xargs -I {}' ---> in raycast per avere aggiunta di |
alias mkd='mkdir'  
alias lcl='open-localhost'
alias chx='chmod +x'

# ### comandi delegati a raycast ###
#
# sccp =  pbcopy  && {cursor} $(pbpaste) 
# 
# µ0, µ1, ... = prompts per llm 
# 
# chmx = chmod +x
# internet = look on the internet for details

# git aliases
alias ga='git add'
alias gck='git checkout'
alias gckb='git checkout -b'
alias gp='git push'
alias gpl='git pull'
alias gcz='git cz'
alias gs='git status'
alias gbc='git branch --show-current'
alias gbv='git branch -v'
alias gbd='git branch -D'
alias gr='git restore'
alias agg='git branch --show-current | pbcopy && git checkout x &&   git branch --show-current  | pbcopy && git pull && git checkout $pippo[1] && git merge $pippo[2] && git push &&  pbclear'
alias grea='git remote add origin'
alias grev='git remote -v'
alias grerm='git remote remove origin'
alias grpl='gh repo list'
alias gm='git merge'
alias gff='git diff'
alias gst='git stash'
alias gsa='git stash apply'
alias gsp='git stash push'
alias gsl='git stash list'
alias gsr='git stash drop'

#pip aliases

alias pipi='pip install'
alias pipu='pip uninstall'
alias pipf='pip freeze > requirements.txt'
alias pipir='pip install -r requirements.txt'
alias pipl='pip list'


# awk aliases
#
# comandi delegati a raycast
#
# awkp = awk '{print ${cursor}}'

# rust
alias crr='cargo run'
alias crb='cargo build'
alias cra='cargo add'
alias crt='cargo test'

# vercel cli
alias vr='vercel'
alias vrd='vercel deploy'
alias vre='vercel env'
alias vrl='vercel link'
alias vrp='vercel pull'

# pnpm aliases
alias pa='pnpm add'
alias dev='pnpm run dev'
alias serve='pnpm run serve'
alias build='pnpm run build'
alias test='pnpm run test'
alias start='pnpm run start'
alias isd='pnpm i  && open-localhost  &&  pnpm run dev'

# python aliases
alias pn='python3'
alias cndl="conda env list"
alias cnda="conda activate"
alias cndd="conda deactivate"
alias cndr="conda env remove -y --name"
alias cndc="conda env create -f environment.yml"
alias cnde="conda env export > environment.yml"

# ollama aliases
alias ll='ollama'
alias lll='ollama list'
alias llr='ollama run'
alias llpl='ollama pull'
alias llp='ollama push'
alias llrm='ollama remove'
alias lls='ollama show'

alias clc='claude code'

# c 


# utmcl aliases
alias uu='utmctl'


### NODE.JS ###
export NODE_OPTIONS="--no-deprecation"

### CUSTOM GLOBAL VARIABLES ###
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
