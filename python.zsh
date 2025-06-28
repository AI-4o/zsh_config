#pip aliases


# python3

alias vvini='python3 -m venv .venv' 
alias vvc="/Users/a.i./bin/__aisoft_kills__/scaffolding/python"
alias vva=". .venv/bin/activate" 
alias vvi="pip install"
alias vvf='pip freeze > requirements.txt'
alias vvir='pip install -r requirements.txt'
alias vvl='pip list'
alias vvs="pip show"
alias vvu="pip uninstall"


alias pn='python3'
alias pnc="python3 cli.py"
alias pni="python3 -i "


# python versions 

alias pn11="python3.11"
alias pn12="python3.12"


# other utilities

mkpy(){
  # Create a Python package directory with __init__.py file
  # Usage: mkdpy <package_name>
  # Args:
  #   $1 - Name of the package directory to create
  
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: mkdpy <package_name>"
    echo "Create a Python package directory with __init__.py file"
    echo ""
    echo "Args:"
    echo "  package_name    Name of the package directory to create"
    return 0
  fi
  
  if [[ -z "$1" ]]; then
    echo "error: missing argument"
    echo "Usage: mkdpy <package_name>"
    return 1
  fi
  
  mkdir -p "$1" && touch "$1/__init__.py"
}


