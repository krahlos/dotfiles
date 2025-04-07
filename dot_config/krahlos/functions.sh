#!/usr/bin/env bash

colortest() {
  # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

  T='gYw' # The test text

  echo -e "               40m     41m     42m     43m\
       44m     45m     46m     47m";

  for FGs in '  m' ' 1m' '30m' '90m' '31m' '91m' '32m' \
             '92m' '33m' '93m' '34m' '94m' '35m' '95m' \
             '36m' '96m' '37m' '97m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
}

passgen() {
  local block_length=6
  local block_count=4
  local to_clipboard=0

  while [ $# -gt 0 ]; do
    case "$1" in
      --length|-l)
        block_length="$2"
        shift 2
        ;;
      --count|-c)
        block_count="$2"
        shift 2
        ;;
      --clip|-x)
        to_clipboard=1
        shift
        ;;
      --help|-h)
        echo "Usage: passgen [--length N] [--count N] [--clip]"
        echo ""
        echo "Options:"
        echo "  --help,   -h    show this help message"
        echo "  --length, -l    number of characters per block (default: 6)"
        echo "  --count,  -c    number of blocks (default: 4)"
        echo "  --clip,   -x    copy output to clipboard (macOS only)"
        return 0
        ;;
      *)
        echo "Unknown option: $1"
        return 1
        ;;
    esac
  done

  local block_size=$((block_length * block_count))
  local secret
  secret=$(openssl rand -base64 48 \
    | tr -dc 'a-zA-Z0-9' \
    | head -c "$block_size" \
    | sed "s/.\\{$block_length\\}/&-/g; s/-$//")

  echo "$secret"

  if [ "$to_clipboard" -eq 1 ]; then
    if command -v pbcopy &> /dev/null; then
      echo -n "$secret" | pbcopy
      echo "(Copied to clipboard)"
    else
      echo "Clipboard copy not supported on this system." >&2
    fi
  fi
}
