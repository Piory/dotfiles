local compose_filenames = {
  ['docker-compose.yml'] = true,
  ['docker-compose.yaml'] = true,
  ['compose.yml'] = true,
  ['compose.yaml'] = true,
}

local root_markers = {
  'Dockerfile',
  'docker-compose.yaml',
  'docker-compose.yml',
  'compose.yaml',
  'compose.yml',
  'docker-bake.json',
  'docker-bake.hcl',
  'docker-bake.override.json',
  'docker-bake.override.hcl',
}

return {
  filetypes = { 'dockerfile', 'yaml', 'yaml.docker-compose' },
  get_language_id = function(_, ftype)
    if ftype == 'yaml' or ftype == 'yaml.docker-compose' then
      return 'dockercompose'
    end
    return ftype
  end,
  root_dir = function(bufnr, on_dir)
    local ftype = vim.bo[bufnr].filetype
    local basename = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))

    if (ftype == 'yaml' or ftype == 'yaml.docker-compose') and not compose_filenames[basename] then
      return
    end

    local project_root = vim.fs.root(bufnr, root_markers)
    if project_root then
      on_dir(project_root)
    end
  end,
}
