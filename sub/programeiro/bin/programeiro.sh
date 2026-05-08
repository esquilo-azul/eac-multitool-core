#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export PROGRAMEIRO_BIN="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

export PROGRAMEIRO_ROOT="$(dirname "$PROGRAMEIRO_BIN")"
source "$PROGRAMEIRO_ROOT/lib.sh"

if [[ ${BASH_SOURCE[0]} == $0 ]]; then
  programeiro_run "${@}"
  exit $?
fi
