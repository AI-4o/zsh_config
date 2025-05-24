# C

call() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ccr path/to/dir"
    echo "Compile and run all .c files in the given directory"
    echo "Example: ccr ."
    return 0
  fi

  

  # Convert to absolute path
  TARGET_DIR=$(realpath "$1" 2>/dev/null) || .

  # Go to that directory
  cd "$TARGET_DIR" || return 1

  # Compile and run
  if ls *.c &>/dev/null; then
    gcc *.c -o anya && ./anya
  else
    echo "No .c files found in $TARGET_DIR"
    return 1
  fi
}

c() {
    if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ccr [path/to/dir]"
    echo "Compile and run the .c file in the current directory"
    echo "Example: ccr cippa_lippa.c"
    return 0
    fi

    file="$1"

    if [[ -z "$file" ]]; then
        echo "No file specified. Please provide a .c file to compile and run."
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        echo "File '$file' does not exist."
        return 1
    fi

    gcc $1 -o anya && ./anya
}


