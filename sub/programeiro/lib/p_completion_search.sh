function p_completion_search() {
  programeiro_paths | while read path; do
    p_completion_search_dir "$path" '' "$1" "$(_ends_with_slash "$1")"
  done
}
export -f p_completion_search
