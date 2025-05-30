require('neotest').setup({
  adapters = {
    require('neotest-jest'),
    require('neotest-golang'),
    require('neotest-dart')({
      command = 'flutter',
      use_lsp = true,
    }),
  },
})
