return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    dependencies = {
      'fang2hou/blink-copilot',
      {
        'MattiasMTS/cmp-dbee',
        enabled = false,
        ft = { 'sql' },
        dev = true,
        dependencies = { 'kndndrj/nvim-dbee' },
      },
    },
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = {
          function(cmp)
            local has_words_before = function()
              unpack = unpack or table.unpack
              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
              return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
            end
            if cmp.is_visible() then
              return cmp.select_next()
            elseif has_words_before() then
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback',
        },
      },
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
            columns = {
              { 'kind_icon' },
              { 'kind' },
              { 'label', 'label_description', gap = 1 },
              { 'source_name' },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  -- default kind icon
                  local icon = ctx.kind_icon
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == 'LSP' then
                    local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
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
                    local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          },
        },
      },
      signature = {
        window = {
          border = 'rounded',
        },
      },
      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          'buffer',
          'copilot',
          'dbee',
        },
        providers = {
          copilot = {
            name = 'Copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
            opts = {
              -- Local options override global ones
              max_completions = 3, -- Override global max_completions

              -- Final settings:
              -- * max_completions = 3
              -- * max_attempts = 2
              -- * all other options are default
            },
          },
          dbee = {
            name = 'DBee',
            module = 'blink.compat.source',
          },
        },
      },
      fuzzy = {
        -- versionを指定してないとバイナリが特定できずLuaにfallbackするwarningが表示される
        implementation = 'prefer_rust_with_warning',
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        options = {
          show_source = true,
          multilines = {
            enabled = true,
            always_show = false,
          },
        },
      })
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
  },
  {
    'nanotee/sqls.nvim',
    ft = 'sql',
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      local flutter_tools = require('flutter-tools')
      flutter_tools.setup({
        debugger = {
          enabled = false,
        },
      })
      flutter_tools.setup_project({
        {
          name = 'Localhost',
          target = 'lib/main.dart',
          cwd = 'apps/r4b_app',
          dart_define_from_file = 'dart_defines/local.json',
        },
        {
          name = 'Development',
          target = 'lib/main.dart',
          cwd = 'apps/r4b_app',
          dart_define_from_file = 'dart_defines/dev-development.json',
        },
        {
          name = 'Production',
          target = 'lib/main.dart',
          cwd = 'apps/r4b_app',
          dart_define_from_file = 'dart_defines/prd-production.json',
        },
      })
    end,
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require('go').setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
    },
  },
  {
    'VidocqH/lsp-lens.nvim',
    event = 'LspAttach',
    config = function()
      require('lsp-lens').setup({})
    end,
  },
  {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
    cmd = {
      'Mason',
      'MasonUpdate',
      'MasonLog',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
    },
    config = true,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim' },
    },
    event = { 'VeryLazy' },
    config = function()
      require('lsp')
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    cmd = 'Lspsaga',
    keys = {
      { '<C-r>',  '<Cmd>Lspsaga rename<CR>',      desc = 'Lspsaga rename' },
      { '<leader>,',  '<Cmd>Lspsaga finder<CR>',      desc = 'Lspsaga finder' },
      { 'K', '<Cmd>Lspsaga hover_doc<CR>',   desc = 'Lspsaga hover_doc' },
      { '<leader>la', '<Cmd>Lspsaga code_action<CR>', desc = 'Lspsaga code_action' },
    },
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
          },
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
