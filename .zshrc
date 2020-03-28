source ~/.zplug/init.zsh

# settings

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt share_history
setopt inc_append_history

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
zplug "themes/minimal", from:oh-my-zsh

# Syntax highlighter
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# コード補完
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# fzf
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

# git
zplug "plugins/git", from:oh-my-zsh

ENHANCD_DISABLE_HYPHEN=1
ENHANCD_DOT_ARG=1
zplug "b4b4r07/enhancd", use:init.sh

zplug "chrissicool/zsh-256color"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

# fzfでのコマンド履歴検索
function select-history() {
  # BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  # CURSOR=$#BUFFER
  local tac=${commands[tac]:-"tail -r"}
  BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf +s)
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N select-history
bindkey '^r' select-history

# alias
alias ..='cd ..'
alias ...='cd ../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias c='clear'
alias ls='ls -G'
