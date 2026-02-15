return {
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    -- denols と競合しないように Deno プロジェクトでは vtsls を無効化する
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end
    local root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' }
    local project_root = vim.fs.root(bufnr, root_markers)
    on_dir(project_root)
  end,
  settings = {},
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
