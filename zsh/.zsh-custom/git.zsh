alias g="git"

function deploydiff() {
  sha=$(git rev-parse HEAD | cut -c 1-8)
  echo "preparing to deploy to production with \`${sha}\`"
  echo "\`\`\`"
  git --no-pager log --no-merges --topo-order --pretty="format:%h %<(20,trunc)%an %s" origin/production.."${sha}"
  echo "\n\`\`\`"
}

# Use fzf to select a branch to checkout:
function gco() {
  local branch="$(git branch --all | fzf | tr -d '[:space:]' | sed -e 's/remotes\/origin\///g')"

  if [[ -z "$branch" ]]; then
    echo "No branch selected"
    return 1
  fi

  git checkout "$branch"
}

# get version of installed npm dependency
function moduleversion() {
  cat node_modules/$1/package.json | jq .version
}

# Get current git repo branch:
function branch() {
  git rev-parse --abbrev-ref HEAD
}

function publish-branch() {
  git push -u origin $(branch)
}

function force-push() {
  git push -f origin $(branch)
}
