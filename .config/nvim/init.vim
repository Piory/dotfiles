runtime! init/*.vim
runtime! dein/*.vim
runtime! colors/*.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin("$HOME/.cache/dein")

" Let dein manage dein
" Required:
call dein#add("$HOME/.cache/dein/repos/github.com/Shougo/dein.vim")

" 自分で追加したやつ
call dein#load_toml('$HOME/.config/nvim/dein/plugins.toml', {'lazy': 0})
call dein#load_toml('$HOME/.config/nvim/dein/coc.toml', {'lazy': 0})
call dein#load_toml('$HOME/.config/nvim/dein/plugins_lazy.toml', {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

"End dein Scripts-------------------------

lua <<EOF
 require'nvim-treesitter.configs'.setup {
   highlight = {
     enable = true,
   },
   indent = {
     enable = true,
   },
   ensure_installed = 'maintained'
 }
EOF

colorscheme iceberg
set bg=dark
