# utilities associated to the scripts in __aisoft_kills__

# creation of temp macros scripts
alias scc="script_create"
alias sca="script_add"
alias sccl="/Users/a.i./bin/__aisoft_kills__/clean_temp_scripts"
alias scl="/Users/a.i./bin/__aisoft_kills__/list_temp_scripts"

# cursor
alias acr="/Users/a.i./bin/__aisoft_kills__/inject_cursor_rules"

# other utilities
alias cnm="/Users/a.i./bin/__aisoft_kills__/clean_node_modules"
alias olh="/Users/a.i./bin/__aisoft_kills__/open_localhost"
alias open-localhost="/Users/a.i./bin/__aisoft_kills__/open_localhost"

script_create() {
  if [[ "$1" == "-h" ]]; then
    echo "create a script template in ~/bin with given name."
    echo "Usage: ct [nome_script]"

    return 0 
  fi

  if [[ -z "$1" ]]; then
    (cd ~/bin && echo '#!/usr/bin/env bash' > t) && chmod +x ~/bin/t
    return 0 
  fi

  (cd ~/bin && echo '#!/usr/bin/env bash' > "$1") && chmod +x ~/bin/"$1"
}

script_add() {
  local name="$1"
  local code="$2"

  if [[ "$1" == "-h" ]]; then
    echo "Append the commands to the script file"
    echo "Usage: a [nome_script] [comando]"
    return 0 
  fi


  if [[ -z "$name" || -z "$code"  ]]; then
    echo "Usage: a [nome_script] [comando]"
    echo "Append the commands to the script file"
    return 1
  fi

  (cd ~/bin && echo -e "$code" >> "$name")

}

