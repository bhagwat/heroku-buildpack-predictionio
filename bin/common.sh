#!/usr/bin/env bash

get_property()
{
  local file=${1?"No file specified"}
  local key=${2?"No key specified"}
 
  # escape for regex
  local escaped_key=$(echo $key | sed "s/\./\\\./g")

  [ -f $file ] && \
  grep -E ^$escaped_key[[:space:]=]+ $file | \
  sed -E -e "s/$escaped_key([\ \t]*=[\ \t]*|[\ \t]+)\"?([A-Za-z0-9\.-]*)\"?.*/\2/g"
}

indent() {
  sed -u 's/^/       /'
}

export_env_dir() {
echo "From env_dir function"
echo $1
echo $2
echo $3
  env_dir=$1
  whitelist_regex=${2:-''}
  blacklist_regex=${1:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  echo $whitelist_regex
  echo $blacklist_regex
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
      export "$e=$(cat $env_dir/$e)"
      :
    done
  fi
}