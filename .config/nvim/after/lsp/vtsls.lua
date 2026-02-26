return {
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    -- denols と競合しないように Deno プロジェクトでは vtsls を無効化する
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end
    -- pnpm workspace を跨いだ参照検索のため、package 単位ではなく
    -- ワークスペースルート（lockfile / .git）を優先して vtsls を起動する
    local root_markers = {
      'pnpm-workspace.yaml',
      'pnpm-lock.yaml',
      'package-lock.json',
      'yarn.lock',
      'bun.lockb',
      'bun.lock',
      '.git',
    }
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    on_dir(project_root)
  end,
  settings = {},
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
