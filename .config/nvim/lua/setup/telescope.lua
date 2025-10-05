local telescope = require('telescope')
telescope.load_extension('flutter')
telescope.setup({
  defaults = {
    -- メモリ使用量を抑制
    cache_picker = {
      num_pickers = 5, -- キャッシュするpickerの数を制限
    },

    -- プレビューのメモリ使用量を制限
    preview = {
      filesize_limit = 5, -- 5MB以上のファイルはプレビューしない
      timeout = 250,      -- プレビューのタイムアウト
    },

    -- 結果数を制限
    results_limit = 1000, -- 検索結果を1000件に制限

    -- バッファサイズを制限
    max_results = 1000,
  },

  file_ignore_patterns = {
    '.git',
    '.tmux',
    '.zprezto',
    'node_modules',
    'dist',
    'build',
  },
  mappings = {
    i = {
      ['<C-u>'] = false, -- Disable clearing the prompt
      ['<C-d>'] = false, -- Disable deleting half of the prompt
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false,
      follow = false,
    },

    live_grep = {
      max_results = 1000,
      additional_args = function()
        return { '--max-count=1000' } -- ripgrepの結果を制限
      end,
    },
  },
})
