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


" barbar.nvim 関連
" Move to previous/next
nnoremap <silent> gT :BufferPrevious<CR>
nnoremap <silent> gt :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent> 1gt :BufferGoto 1<CR>
nnoremap <silent> 2gt :BufferGoto 2<CR>
nnoremap <silent> 3gt :BufferGoto 3<CR>
nnoremap <silent> 4gt :BufferGoto 4<CR>
nnoremap <silent> 5gt :BufferGoto 5<CR>
nnoremap <silent> 6gt :BufferGoto 6<CR>
nnoremap <silent> 7gt :BufferGoto 7<CR>
nnoremap <silent> 8gt :BufferGoto 8<CR>
nnoremap <silent> 9gt :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent> <A-p> :BufferPin<CR>
" Close buffek
nnoremap <silent> ct :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>

" close-buffers.vim
nnoremap <silent> <C-q> :Bdelete menu<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> st :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
