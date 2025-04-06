alias ls="ls -hFG"
alias l="ls -lF"
alias ll="ls -alF"
alias lt="ls -ltrF"
alias lls="ls -alSrF"
alias llt="ls -altrF"

alias cdtmp=cd "$(mktemp -d)"

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
