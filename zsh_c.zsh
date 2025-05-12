# C

ccr() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ccr path/to/dir"
    echo "Compile and run all .c files in the given directory"
    echo "Example: ccr ."
    return 0
  fi

  if [[ -z "$1" ]]; then
    echo "Error: path is required."
    echo "Use '-h' for help."
    return 1
  fi

  # Convert to absolute path
  TARGET_DIR=$(realpath "$1" 2>/dev/null)

  if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: '$1' is not a valid directory."
    return 1
  fi

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
