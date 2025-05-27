return {
  'nvim-lua/lsp-status.nvim',
  'onsails/lspkind.nvim',
  'neovim/nvim-lspconfig',
  'arkav/lualine-lsp-progress',
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      bind = true,
      handler_opts = {
        border = 'rounded'
      },
    },
  },
  {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
    cmd = { 'Mason', 'MasonUpdate', 'MasonLog', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    config = true,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim' },
      { 'neovim/nvim-lspconfig' },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
    keys = {
      { '<C-space>', '<cmd>lua vim.lsp.completion.get()  <CR>', mode = 'i' },
      { 'gh',        '<cmd>lua vim.lsp.buf.hover()       <CR>' },
      { 'gd',        '<cmd>lua vim.lsp.buf.definition()  <CR>' },
      { 'gD',        '<cmd>lua vim.lsp.buf.declaration() <CR>' },
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        finder = {
          max_height = 0.6,
          default = 'tyd+ref+imp+def',
          keys = {
            toggle_or_open = '<CR>',
            vsplit = 'v',
            split = 's',
            tabnew = 't',
            tab = 'T',
            quit = 'q',
            close = '<Esc>',
          },
          methods = {
            tyd = 'textDocument/typeDefinition',
          }
        }
      })

      vim.keymap.set('n', '<leader>,', '<Cmd>Lspsaga finder<CR>', { desc = 'Telescope: live grep args', })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
