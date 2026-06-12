function programeiro_run_file() {
  local FILE="$1"
  shift
  "${FILE}" "$@"
}
export -f programeiro_run_file
