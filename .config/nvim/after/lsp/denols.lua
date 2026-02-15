return {
  workspace_required = true,
  root_dir = function(bufnr, on_dir)
    local root_markers = { 'deno.json', 'deno.jsonc', 'deno.lock' }
    local project_root = vim.fs.root(bufnr, root_markers)
    if project_root then
      on_dir(project_root)
    end
  end,
}
