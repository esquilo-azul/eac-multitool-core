SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
PROGRAMEIRO_ROOT_ROOT="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

export PROGRAMEIRO_NOT_FOUND_ERROR=6

for file in "${PROGRAMEIRO_ROOT_ROOT}/lib/"*.sh; do
  source "$file"
done

programeiro_paths | while read path; do
  if [ ! -d "$path" ]; then
    >&2 echo "\"$path\" in \$PROGRAMEIRO_PATH is not a directory"
    exit 2
  fi
done
