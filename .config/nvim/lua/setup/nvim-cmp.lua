-- nvim-cmp の設定
local cmp = require("cmp") -- nvim-cmp のメインモジュールをロード
local luasnip = require("luasnip") -- LuaSnip のモジュールをロード
require("luasnip/loaders/from_vscode").lazy_load() -- VSCode スタイルのスニペットをロード

cmp.setup({
     formatting = {
        format = require("nvim-highlight-colors").format,
     },
    snippet = {
        -- スニペット展開方法を定義
        expand = function(args)
            luasnip.lsp_expand(args.body) -- LuaSnip を使ってスニペットを展開
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 補完候補のドキュメントを上にスクロール
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- 補完候補のドキュメントを下にスクロール
        ["<C-Space>"] = cmp.mapping.complete(), -- 手動で補完候補を表示
        ["<C-e>"] = cmp.mapping.abort(), -- 補完を中断して閉じる
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 補完確定 (現在選択中の候補を使用)
    }),
    sources = cmp.config.sources({
        { name = "luasnip", priority_weight = 20 }, -- LuaSnip を補完候補に含める
    }, {
        { name = "buffer" }, -- バッファの内容を補完候補に含める
    }),
})

