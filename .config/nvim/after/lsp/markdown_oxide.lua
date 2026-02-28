return {
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname == '' then
      return
    end

    local root = vim.fs.root(bufnr, { '.obsidian', '.moxide.toml' })
    if root and root ~= '.' then
      on_dir(root)
    end
  end,
}
