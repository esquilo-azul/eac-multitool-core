#!/bin/bash

source "$PROGRAMEIRO_ROOT/lib.sh"
TERM=''
if [ $# -gt 0 ]; then
  TERM=$1
fi
>&2 echo "Searched: \"$TERM\""
p_completion_search "$TERM"
