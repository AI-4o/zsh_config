# ZSH general plugins
export PATH="/opt/homebrew/bin:$PATH"

### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# HOMEBREW
up() {
  brew update && brew upgrade && brew cleanup && brew doctor
}
