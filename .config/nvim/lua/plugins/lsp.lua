return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'enter' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = 'rounded',
          },
        },
        menu = {
          border = 'rounded',
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  -- default kind icon
                  local icon = ctx.kind_icon
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == 'LSP' then
                    local color_item = require('nvim-highlight-colors').format(ctx.item.documentation,
                      { kind = ctx.kind })
                    if color_item and color_item.abbr ~= '' then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  -- default highlight group
                  local highlight = 'BlinkCmpKind' .. ctx.kind
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == 'LSP' then
                    local color_item = require('nvim-highlight-colors').format(ctx.item.documentation,
                      { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          }
        },
      },
      signature = {
        window =
        {
          border = 'rounded',
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = {
        -- versionを指定してないとバイナリが特定できずLuaにfallbackするwarningが表示される
        implementation = 'prefer_rust_with_warning',
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp'
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
  },
  'nvim-lua/lsp-status.nvim',
  'arkav/lualine-lsp-progress',
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = true,
  },
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
