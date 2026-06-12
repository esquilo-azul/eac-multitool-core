function p_paths {
  set +u
  local paths=$PROGRAMEIRO_PATH
  set -u
  local OIFS=$IFS
  IFS=':'
  for path in $paths; do
    readlink -f "$path"
  done
  IFS=$OIFS
  echo "$PROGRAMEIRO_ROOT/programs"
}
