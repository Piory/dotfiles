set tags=.tags;~

augroup ctags
  autocmd!
  autocmd BufWritePost * silent !ctags -R -f .tags
augroup END
