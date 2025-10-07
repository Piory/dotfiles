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
    priority = 1000,
    lazy = false,
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
    },
    opts = {
      picker = { enabled = true },
      bufdelete = { enabled = true },
      lazygit = { enabled = true },
      dashboard = { enabled = true },
      scratch = { enabled = true },
      toggle = { enabled = true },
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
        editing = 'Editing [${name}] ${filename} (${cursor_line}:${cursor_char})',
        viewing = 'Viewing [${name}] ${filename} (${cursor_line}:${cursor_char})',
      },
      variables = true, -- Enable string templates
    },
  },
  {
    'nvzone/showkeys',
    dependencies = { 'folke/snacks.nvim' },
    opts = {
      timeout = 3,
      maxkeys = 5,
    },
    init = function()
      local showkeys = require('showkeys')
      Snacks.toggle({
        name = 'Showkeys',
        get = function()
          return require('showkeys.state').visible
        end,
        set = function()
          showkeys.toggle()
        end,
      }):map('<leader>uk')
    end,
  },
  {
    'gen740/SmoothCursor.nvim',
    event = 'VeryLazy',
  },
  {
    event = 'VeryLazy',
    'sphamba/smear-cursor.nvim',
    opts = {                                -- Default  Range
      stiffness = 0.8,                      -- 0.6      [0, 1]
      trailing_stiffness = 0.5,             -- 0.4      [0, 1]
      stiffness_insert_mode = 0.6,          -- 0.4      [0, 1]
      trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
      distance_stop_animating = 0.5,        -- 0.1      > 0
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
    lazy = false,
    priority = 1000,
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
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
  'brenoprata10/nvim-highlight-colors',
  'mvllow/modes.nvim',
  {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
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
            local icons = { removed = '', changed = '', added = '' }
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
            local icons = { error = '', warn = '', info = '', hint = '' }
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
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
  {
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = require('ascii').art.text.neovim.sharp
      return dashboard.opts
    end,
  },
  {
    'MaximilianLloyd/ascii.nvim',
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
    'Pocco81/auto-save.nvim',
    event = 'VeryLazy',
    config = function()
      require('auto-save').setup({
        -- your config goes here
        -- or just leave it empty :)
      })
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'modern',
      win = {
        border = 'rounded',
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    -- 今使っていないから一旦 lazy = true にしておく
    lazy = true,
    version = '*',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = function(_, opts)
      return require('indent-rainbowline').make_opts(opts, {
        color_transparency = 0.15,
      })
    end,
    dependencies = { 'TheGLander/indent-rainbowline.nvim' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'aznhe21/actions-preview.nvim',
    config = function()
      vim.keymap.set('n', 'ga', require('actions-preview').code_actions)
    end,
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
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
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    config = true,
  },
}
