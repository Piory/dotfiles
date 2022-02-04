" プロジェクト毎の設定読み込み
augroup init_vim_local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:init_vim_local(expand('<afile>:p:h'))
  autocmd BufReadPre .init.vim.local setfiletype=vim
augroup END
" init.vim.local を探して読み込む
function! s:init_vim_local(loc)
  let files = findfile('init.vim.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
