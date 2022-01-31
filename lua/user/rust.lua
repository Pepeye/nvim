-- Install Lsp server
-- :LspInstall rust_analyzer

-- Install debugger
-- :DIInstall ccppr_lldb

-- https://github.com/simrat39/rust-tools.nvim#a-better-debugging-experience
    -- remember to keep the path of vscode extension up to date
    -- /Users/{username}/.vscode/extensions/vadimcn.vscode-lldb-{version}
local extension_path = string.format("/User/%s/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/", os.getenv "USER")
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
    return
end

rust_tools.setup {
  {
    -- set other config here
    -- tools = {},

    -- debugging stuff
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
    },
    -- default settings below
    -- dap = {
    --   adapter = {
    --     type = 'executable',
    --     command = 'lldb-vscode',
    --     name = "rt_lldb"
    --   }
    -- }
  }
}
