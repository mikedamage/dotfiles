export HISTFILE="$HOME/.zhistory"
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history

setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups

export CLICOLOR=1

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
setopt brace_ccl
setopt rc_quotes

unsetopt mail_warning
setopt long_list_jobs
setopt auto_resume
setopt notify
unsetopt bg_nice
unsetopt hup
unsetopt check_jobs

autoload -Uz colors zcalc regexp-replace allopt zmv zargs

autoload compinit && compinit

export EDITOR="nvim"
export VISUAL="nvim"

alias vim="nvim"

typeset -U path
path=(
  $HOME/bin
  $HOME/.local/bin
  /opt/homebrew/opt/postgresql@13/bin
  /opt/homebrew/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
  /usr/games
  /usr/local/games
)

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/optnssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

export ZPLUG_HOME=/opt/homebrew/opt/zplug
# source $ZPLUG_HOME/init.zsh


# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read; then
#     echo; zplug install
#   fi
# fi
#
# zplug load

export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh" # loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # loads shell completion

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \

### End of Zinit's installer chunk

zinit lucid light-mode for \
  zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \
  zdharma-continuum/zui \
  zdharma-continuum/zbrowse \
  Tarrasch/zsh-colors \
  zsh-users/zsh-completions \
  caarlos0/ports \
  arzzen/calc.plugin.zsh \
  jreese/zsh-titles \
  redxtech/zsh-kitty

zinit ice from"local" multisrc"*.zsh"
zinit light "$HOME/.zsh-custom"

# Load starship theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
zinit light starship/starship

# FZF config
export FZF_DEFAULT_COMMAND="fd"

__kitty_complete
