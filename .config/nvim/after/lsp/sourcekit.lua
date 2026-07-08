-- Swift / Objective-C（sourcekit-lsp・Xcode 同梱バイナリを使うため mason 管理外）。
-- xcodeproj ベースのプロジェクトは sourcekit-lsp 単体ではビルド設定を解決できないため、
-- xcode-build-server が生成する buildServer.json をプロジェクトルートに置く必要がある:
--   brew install xcode-build-server
--   xcode-build-server config -project <名前>.xcodeproj -scheme <スキーム>
return {
  cmd = { 'xcrun', 'sourcekit-lsp' },
  filetypes = { 'swift', 'objc', 'objcpp' },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    -- buildServer.json（xcodeproj 用）と Package.swift（SwiftPM）を最優先で探す。
    -- SwiftPM パッケージ内のファイルはパッケージ自身をルートにする（モノレポ対応）
    local root_files = { 'buildServer.json', 'Package.swift', 'compile_commands.json' }
    local root = vim.fs.find(root_files, { path = fname, upward = true })[1]
    if not root then
      root = vim.fs.find(function(name)
        return name:match('%.xcodeproj$') ~= nil
      end, { path = fname, upward = true })[1]
    end
    if not root then
      root = vim.fs.find('.git', { path = fname, upward = true })[1]
    end
    if root then
      on_dir(vim.fs.dirname(root))
    end
  end,
}
