function data-url() {
  local file="$1"
  local mime_type="$(file --mime-type -b $file)"
  local encoded="$(base64 $file)"
  echo "data:${mime_type};base64,${encoded}"
}
