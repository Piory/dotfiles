return {
  {
    'sidlatau/neotest-dart',
    dependencies = {
      'nvim-neotest/neotest',
    },
    lazy = false,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
      'fredrikaverpil/neotest-golang',
      'sidlatau/neotest-dart',
    },
  },
}
