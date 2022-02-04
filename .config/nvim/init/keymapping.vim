" 自動でカッコ等を閉じる
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"" coc.nvim
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l

" ファイル検索
nnoremap <silent> ff :FZF<CR>
" ファインダー表示
nnoremap <silent> <Space>f :NERDTreeToggle<CR>

" coc.nvim 関連
" スペース2回 で CocList
nmap <silent> <space><space> :<C-u>CocList<cr>
" スペース + hで Hover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
" Ctrl + ] で Definition
nmap <silent> <C-]> <Plug>(coc-definition)
" スペース + rf で Referknces
nmap <silent> <space>rf <Plug>(coc-references)
" スペース + rn で Rename
nmap <silent> <space>rn <Plug>(coc-rename)
" スペース + fmt でFormat
nmap <silent> <space>fmt <Plug>(coc-format)
