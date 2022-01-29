-- Install Lsp server
-- :LspInstall rust_analyzer

-- Install debugger
-- :DIInstall ccppr_lldb

local extension_path = string.format("/User/%s/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/", os.getenv "USER")
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
    return
end

rust_tools.setup {
  {
    -- set other config
    -- debugging stuff
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
    }
  }
}
