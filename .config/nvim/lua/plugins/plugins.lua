return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'snacks.nvim/lua/snacks' },
      },
    },
  },
  {
    'folke/snacks.nvim',
    event = 'VeryLazy',
    priority = 1000,
    ---@type snacks.Config
    keys = {
      {
        '<leader>p',
        function()
          Snacks.picker()
        end,
        desc = 'Show Picker',
      },
      {
        '<leader>e',
        function()
          Snacks.picker.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<leader>sf',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find File',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Live Grep',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find Buffer',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>dd',
        function()
          Snacks.bufdelete.delete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>do',
        function()
          Snacks.bufdelete.other()
        end,
        desc = 'Delete Other Buffers',
      },
      {
        '<leader>.',
        function()
          Snacks.scratch()
        end,
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>S',
        function()
          Snacks.scratch.select()
        end,
        desc = 'Select Scratch Buffer',
      },
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Show Lazygit',
      },
      {
        '<leader>z',
        function()
          Snacks.zen.zen()
        end,
        desc = 'Zen Mode',
      },
    },
    opts = {
      picker = {
        enabled = true,
        hidden = true,
        ignored = true,
        exclude = { -- add folder names here to exclude
          '.git',
          '.idea',
          '.vscode',
          '.dist',
          '.next',
          '.tamagui',
          'build',
          'dist',
          'out',
          'node_modules',
          'tsconfig.tsbuildinfo',
          'package-lock.json',
          'pnpm-lock.yaml',
        },
      },
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      lazygit = { enabled = true },
      dashboard = { enabled = true },
      scratch = { enabled = true },
      toggle = { enabled = true },
      zen = { enabled = true },
    },
  },
  {
    'dstein64/vim-startuptime',
    event = 'VeryLazy',
  },
  {
    'simeji/winresizer',
    keys = { '<C-e>' },
    init = function()
      vim.g.winrisizer_vert_resize = 1
      vim.g.winresizer_horiz_resize = 1
    end,
  },
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    keys = {
      {
        '<leader>cs',
        '<cmd>CodeSnapSave<cr>',
        mode = 'v',
        desc = 'Save selected code snapshot in ~/Desktop',
      },
    },
    opts = {
      code_font_family = 'Hack Nerd Font',
      watermark_font_family = 'Hack Nerd Font',
      watermark = '',
      save_path = '~/Desktop',
      has_breadcrumbs = true,
      bg_theme = 'grape',
    },
  },
  {
    'vyfor/cord.nvim',
    event = 'VeryLazy',
    build = ':Cord update',
    opts = {
      editor = {
        icon = 'https://styles.redditmedia.com/t5_30kix/styles/communityIcon_n2hvyn96zwk81.png',
      },
      text = {
        editing = 'Editing in ${name}',
        viewing = 'Viewing in ${name}',
        workspace = 'in workspace',
      },
      variables = true, -- Enable string templates
      assets = {
        ['.proto'] = {
          icon = 'https://downloads.marketplace.jetbrains.com/files/14004/874525/icon/default.png',
          tooltip = 'Protocol Buffers',
          name = 'Protocol Buffers',
          text = 'Writing in Protocol Buffers',
        },
      },
    },
  },
  {
    'petertriho/nvim-scrollbar',
    event = {
      'BufWinEnter',
      'CmdwinLeave',
      'TabEnter',
      'TermEnter',
      'TextChanged',
      'VimResized',
      'WinEnter',
      'WinScrolled',
    },
    config = function()
      require('scrollbar').setup()
    end,
  },
  {
    'vuki656/package-info.nvim',
    event = { 'VeryLazy' },
    ft = { 'json', 'jsonc' },
    keys = {
      {
        '<leader>nc',
        function()
          require('package-info').change_version()
        end,
        desc = 'Change Package Version',
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('package-info').setup({})
    end,
  },
  {
    'nvzone/showkeys',
    dependencies = { 'folke/snacks.nvim' },
    keys = {
      {
        '<leader>k',
        function()
          require('showkeys').toggle()
        end,
        desc = 'Toggle Showkeys',
      },
    },
    opts = {
      timeout = 3,
      maxkeys = 5,
    },
  },
  {
    'gen740/SmoothCursor.nvim',
    event = 'VeryLazy',
    config = function()
      require('smoothcursor').setup({
        priority = 10,
        fancy = {
          enable = true,
          head = { cursor = '▷', texthl = 'SmoothCursorCustom', linehl = nil },
          body = {
            { cursor = '󰝥', texthl = 'SmoothCursorCustom' },
            { cursor = '󰝥', texthl = 'SmoothCursorCustom' },
            { cursor = '●', texthl = 'SmoothCursorCustom' },
            { cursor = '●', texthl = 'SmoothCursorCustom' },
            { cursor = '•', texthl = 'SmoothCursorCustom' },
            { cursor = '.', texthl = 'SmoothCursorCustom' },
            { cursor = '.', texthl = 'SmoothCursorCustom' },
          },
          tail = { cursor = nil, texthl = 'SmoothCursorCustom' },
        },
        disabled_filetypes = {
          'TelescopePrompt',
          'TelescopeResults',
          'gitblame',
          'css',
          'noice',
          'LspsagaHover',
          'lazy',
        },
      })
    end,
  },
  {
    event = 'VeryLazy',
    'sphamba/smear-cursor.nvim',
    opts = { -- Default  Range
      stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.5, -- 0.4      [0, 1]
      stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
      trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
      distance_stop_animating = 0.5, -- 0.1      > 0
    },
    config = function()
      require('smear_cursor').setup()
    end,
  },
  {
    'rachartier/tiny-glimmer.nvim',
    event = 'VeryLazy',
    priority = 10,
    opts = {},
  },
  {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    priority = 1000,
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {
          separator_style = 'slant',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
              s = s .. n .. sym
            end
            return s
          end,
        },
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup({})
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    ft = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'vue',
      'svelte',
      'astro',
      'markdown',
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    config = function()
      require('nvim-highlight-colors').setup({
        render = 'virtual',
        virtual_symbol = '●',
        virtual_symbol_position = 'eol',
      })
    end,
  },
  {
    'mvllow/modes.nvim',
    event = 'VeryLazy',
    config = function()
      require('modes').setup({
        colors = {
          bg = '', -- Optional bg param, defaults to Normal hl group
          copy = '#FFEE55',
          delete = '#c75c6a',
          insert = '#55AAEE',
          visual = '#009944',
        },

        -- Set opacity for cursorline and number background
        line_opacity = 0.4,

        -- Enable cursor highlights
        set_cursor = true,

        -- Enable cursorline initially, and disable cursorline for inactive windows
        -- or ignored filetypes
        set_cursorline = true,

        -- Enable line number highlights to match cursorline
        set_number = true,

        -- Enable sign column highlights to match cursorline
        set_signcolumn = true,

        -- Disable modes highlights in specified filetypes
        -- Please PR commonly ignored filetypes
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
      })
    end,
  },
  {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    config = function()
      require('scrollbar.handlers.search').setup()
    end,
  },
  {
    'RRethy/vim-illuminate',
    event = 'VeryLazy',
  },
  {
    'lucamot/chrome-dev-console.nvim',
    dependencies = { 'lucamot/chrome-remote.nvim' },
    keys = {
      {
        '<leader>dc',
        '<cmd>ChromeDevConsole<cr>',
        desc = 'Chrome Dev Console',
      },
    },
  },
  {
    'fei6409/log-highlight.nvim',
    event = 'VeryLazy',
    config = function()
      require('log-highlight').setup({
        patterns = {
          '/var/log/.*',
          'messages%..*',
          '__FLUTTER_DEV_LOG__',
        },
      })
    end,
  },
  {
    'voldikss/vim-translator',
    cmd = {
      'Translate',
      'TranslateW',
      'TranslateR',
      'TranslateX',
      'TranslateH',
      'TranslateL',
    },
  },
  {
    'wakatime/vim-wakatime',
    event = 'VeryLazy',
  },
  {
    'b0o/incline.nvim',
    event = { 'FocusLost', 'CursorHold' },
    config = function()
      local devicons = require('nvim-web-devicons')
      require('incline').setup({
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          local function get_git_diff()
            local icons = { removed = ' ', changed = ' ', added = ' ' }
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { '┊ ' })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = ' ', warn = ' ', info = ' ', hint = '󰌶 ' }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { '┊ ' })
            end
            return label
          end

          return {
            { get_diagnostic_label() },
            { get_git_diff() },
            { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
            {
              filename .. ' ',
              gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold',
            },
            {
              '┊  ' .. vim.api.nvim_win_get_number(props.win),
              group = 'DevIconWindows',
            },
          }
        end,
      })
    end,
  },
  {
    'MaximilianLloyd/ascii.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    ---enables autocomplete for opts
    ---@module 'auto-session'
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'emmanueltouzery/key-menu.nvim',
    event = 'VeryLazy',
    config = function()
      local keyMenu = require('key-menu')
      keyMenu.set('n', '<Space>')
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = function(_, opts)
      return require('indent-rainbowline').make_opts(opts, {
        color_transparency = 0.06,
      })
    end,
    dependencies = { 'TheGLander/indent-rainbowline.nvim' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'lua',
          'vim',
          'vimdoc',
          'javascript',
          'typescript',
          'tsx',
          'markdown',
          'html',
          'css',
          'json',
          'sql',
          'dart',
          'go',
          'proto',
          'terraform',
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'linrongbin16/lsp-progress.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'j-hui/fidget.nvim',
    },
    config = function()
      require('lsp-progress').progress()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    priority = 1000,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local lsp_names = function()
        local clients = vim
          .iter(vim.lsp.get_active_clients({ bufnr = 0 }))
          :map(function(client)
            if client.name == 'null-ls' then
              return ('null-ls(%s)'):format(table.concat(
                vim
                  .iter(require('null-ls.sources').get_available(vim.bo.filetype))
                  :map(function(source)
                    return source.name
                  end)
                  :totable(),
                ', '
              ))
            else
              return client.name
            end
          end)
          :totable()
        return ' ' .. table.concat(clients, ', ')
      end

      local base_config = {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { lsp_names, 'filetype' },
          lualine_y = { 'encoding' },
          lualine_z = { 'progress', 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }

      local function safe_require(module)
        local ok, result = pcall(require, module)
        if ok then
          return result
        end
      end

      local theme_map = {
        ['rainbow-drops'] = 'themes.lualine-rainbow-drops',
        ['rainbow-drops-soft'] = 'themes.lualine-rainbow-drops-soft',
      }

      local function resolve_theme()
        local target = vim.g.rainbow_drops_lualine_theme
        if type(target) == 'string' then
          local applied = safe_require(target)
          if applied then
            return applied
          end
        end

        local colors_name = vim.g.colors_name
        if type(colors_name) == 'string' then
          local module = theme_map[colors_name]
          if module then
            local applied = safe_require(module)
            if applied then
              return applied
            end
          end
        end

        return 'auto'
      end

      local function apply()
        local config = vim.deepcopy(base_config)
        config.options.theme = resolve_theme()
        require('lualine').setup(config)
      end

      apply()

      local group = vim.api.nvim_create_augroup('RainbowDropsLualine', { clear = true })
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = group,
        callback = apply,
      })
      vim.api.nvim_create_autocmd('User', {
        group = group,
        pattern = 'RainbowDropsLualineUpdate',
        callback = apply,
      })
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = {
      {
        'ga',
        function()
          require('actions-preview').code_actions()
        end,
        desc = 'Code Actions (actions-preview)',
      },
    },
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup({
        chunk = {
          enable = true,
          style = '#17C6A3',
        },
        line_num = {
          enable = true,
          style = '#17C6A3',
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'akinsho/toggleterm.nvim',
    keys = {
      {
        '<C-t>',
        function()
          require('toggleterm').toggle()
        end,
        desc = 'Toggle Terminal',
      },
    },
    version = '*',
    config = function()
      require('toggleterm').setup({
        size = 100,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        close_on_exit = true,
        float_opts = {
          border = 'curved',
          width = 180,
          height = 100,
        },
      })
    end,
  },
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        '<cmd>UndotreeToggle<cr>',
        desc = 'Toggle Undotree',
      },
    },
  },
}
