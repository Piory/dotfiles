return {
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
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run(vim.fn.expand('%'))
        end,
        desc = 'Run File',
      },
      {
        '<leader>tT',
        function()
          require('neotest').run.run(vim.loop.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open({ enter = true, auto_close = true })
        end,
        desc = 'Show Output',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop',
      },
    },
    config = function()
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
    end,
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      {
        'rcarriga/nvim-dap-ui',
        opts = {},
      },
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
    },
    keys = {
      {
        '<leader>td',
        function()
          require('neotest').run.run({ strategy = 'dap' })
        end,
        desc = 'Debug Nearest',
      },
    },
    config = function()
      local dap, dapui = require('dap'), require('dapui')

      --          ╭─────────────────────────────────────────────────────────╮
      --          │               Dap UI を自動で開閉する設定               │
      --          ╰─────────────────────────────────────────────────────────╯
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      --          ╭─────────────────────────────────────────────────────────╮
      --          │                    Dart DAP Settings                    │
      --          ╰─────────────────────────────────────────────────────────╯
      -- Dart CLI adapter (recommended)
      dap.adapters.dart = {
        type = 'executable',
        command = 'dart', -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
        args = { 'debug_adapter' },
        -- windows users will need to set 'detached' to false
        options = {
          detached = false,
        },
      }
      dap.adapters.flutter = {
        type = 'executable',
        command = 'flutter', -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
        args = { 'debug_adapter' },
        -- windows users will need to set 'detached' to false
        options = {
          detached = false,
        },
      }
    end,
  },
}
