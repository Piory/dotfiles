# directory の一覧を fzf して移動
function cd-fzf() {
  dir=$(fd -t d | fzf --height 40%)
  if [ "$(echo $dir)" ]; then
    cd $dir
  fi
}

zle -N cd-fzf
bindkey '^J' cd-fzf
