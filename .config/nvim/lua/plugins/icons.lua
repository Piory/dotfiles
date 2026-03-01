local mini_icons_opts = {
  file = {
    ['package.json'] = { glyph = '', hl = 'DevIconPackageJson' },
    ['package-lock.json'] = { glyph = '', hl = 'DevIconPackageLockJson' },
    ['npm-shrinkwrap.json'] = { glyph = '', hl = 'DevIconJson' },
    ['.npmrc'] = { glyph = '', hl = 'DevIconNPMrc' },
    ['.npmignore'] = { glyph = '', hl = 'DevIconNPMIgnore' },
    ['pnpm-lock.yaml'] = { glyph = '', hl = 'DevIconPNPMLock' },
    ['pnpm-workspace.yaml'] = { glyph = '', hl = 'DevIconPNPMWorkspace' },
    ['.pnpmfile.cjs'] = { glyph = '', hl = 'DevIconPNPMFile' },
    ['tsconfig.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.app.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.base.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.build.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.dev.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.eslint.json'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['tsconfig.lib.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.node.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.prod.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.spec.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['tsconfig.test.json'] = { glyph = '', hl = 'DevIconTSConfig' },
    ['.eslintrc'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.js'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.cjs'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.mjs'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.json'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.yaml'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintrc.yml'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['.eslintignore'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['eslint.config.js'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['eslint.config.cjs'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['eslint.config.mjs'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['eslint.config.ts'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['eslint.config.mts'] = { glyph = '', hl = 'DevIconEslintrc' },
    ['tailwind.config.js'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['tailwind.config.cjs'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['tailwind.config.mjs'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['tailwind.config.ts'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['tailwind.config.mts'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['tailwind.config.cts'] = { glyph = '󱏿', hl = 'DevIconTailwindConfig' },
    ['deno.json'] = { glyph = '', hl = 'IconDeno' },
    ['deno.jsonc'] = { glyph = '', hl = 'IconDeno' },
    ['deno.lock'] = { glyph = '', hl = 'IconDeno' },
    ['deno.ts'] = { glyph = '', hl = 'IconDeno' },
    ['deno.config.ts'] = { glyph = '', hl = 'IconDeno' },
    ['deno.config.js'] = { glyph = '', hl = 'IconDeno' },
    ['deno.config.mjs'] = { glyph = '', hl = 'IconDeno' },
    ['deno.config.cjs'] = { glyph = '', hl = 'IconDeno' },
  },
}

local function set_icon_highlights()
  vim.api.nvim_set_hl(0, 'IconDeno', { fg = '#000000' })
end

return {
  {
    'echasnovski/mini.icons',
    lazy = false,
    opts = mini_icons_opts,
    init = function()
      local group = vim.api.nvim_create_augroup('MiniIconsCustomHighlights', { clear = true })
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = group,
        callback = set_icon_highlights,
      })
      set_icon_highlights()
    end,
  },
}
