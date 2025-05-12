# PYTHON, PYENV, CONDA
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Activate conda environment
conda activate AI
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PATH:$HOME/.composer/vendor/bin"

printenv | sort > "$HOME/.zsh_initial_env"


# utility functions
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
