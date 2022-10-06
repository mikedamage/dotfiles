export AWS_PROFILE=jane-core-staging

function aws-login() {
  local profile="${1:-jane-core-staging}"
  aws sso login --profile "$profile"
}

function staging-console() {
  local jane_dir="$HOME/dev/iheartjane"
  cd $jane_dir
  script/remote-exec.sh stg rails c
}
