function p_completion_search_dir() {
  local root_dir=$1
  local subdir=$2
  local subpath=$(echo $3 | sed 's|^/\+||g' | sed 's|/\+$||g')
  local ends_with_slash=$4
  subpath_fn=$(echo "$subpath" | sed 's|/.*$||g')
  subpath_left=$(echo "$subpath" | sed 's|^[^/]*/||g')
  if [ "$subpath_left" == "$subpath" ]; then
    subpath_left=''
  fi
  find "$root_dir/$subdir" -mindepth 1 -maxdepth 1 -name "$subpath_fn*" | while read line; do
    item=$(basename "$line")
    if [ -z "$subpath_left" ]; then
      if [ -d "$line" ]; then
        if [ "$ends_with_slash" == 'true' ] && [ -n "$subpath" ]; then
          p_completion_search_dir "$root_dir" "$subdir/$item" '' "$ends_with_slash"
        else
          echo "$subdir/$item/"
        fi
      else
        echo "$subdir/${item%.*}"
      fi
    elif [ -d "$line" ]; then
      p_completion_search_dir "$root_dir" "$subdir/$item" "$subpath_left" "$ends_with_slash"
    fi
  done
}
