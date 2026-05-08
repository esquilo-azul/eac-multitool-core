#!/bin/bash

set -u
set -e

PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

export PROGRAMEIRO_ROOT="$(readlink -f $(dirname "$PRG"))"
source "$PROGRAMEIRO_ROOT/lib.sh"
p_run "$@"
