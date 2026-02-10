# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

################### 自分で設定したやつ ###################
autoload -U compinit
compinit

export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/.local/bin/:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/git/github.com/flutter/flutter/bin:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH
export PATH=$HOME/.volta/bin:$PATH
export PATH=/Applications/Docker.app/Contents/Resources/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# peco
## コマンドの履歴をみるやつ ##
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

## エイリアス
alias vim='nvim'
alias ctags="`brew --prefix`/bin/ctags"

export TERM=xterm-256color

## PC 毎の固有の設定
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

[[ -e "$HOME/bin/functions.zsh" ]] && source "$HOME/bin/functions.zsh"
[[ -e "$HOME/bin/tmux-ide.zsh" ]] && source "$HOME/bin/tmux-ide.zsh"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/piory/.lmstudio/bin"


# pnpm
export PNPM_HOME="/Users/piory/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export VOLTA_FEATURE_PNPM=1
# pnpm end
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/piory/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="/Users/piory/.antigravity/antigravity/bin:$PATH"

# Prefer mise-managed tools in projects that define mise.toml while keeping Volta as fallback elsewhere.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Keep Volta available, but resolve pnpm from PATH so mise can take precedence in mise.toml projects.
pnpm() {
  command pnpm "$@"
}
