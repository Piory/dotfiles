# directory の一覧を fzf して移動
function cd-fzf() {
  dir=$(fd -t d | fzf --height 40%)
  if [ "$(echo $dir)" ]; then
    cd $dir
  fi
}

zle -N cd-fzf
bindkey '^J' cd-fzf

# ghq の一覧を fzf して移動
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf
