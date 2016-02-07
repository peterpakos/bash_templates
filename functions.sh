die() {
  local code=${1:-0}
  local msg="${2:-}"

  if [[ -n "$msg" ]]; then
    printf "%s\n" "$msg" >&2
  fi
  exit "$code"
}

display_version() {
  printf "%s version %s\n" "$APP_NAME" "$APP_VER"
}

cleanup() {
  [[ -d "$APP_TMP" ]] && rm -rf "$APP_TMP"
}
