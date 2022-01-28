-- Install Lsp server
-- :LspInstall rust_analyzer

-- Install debugger
-- :DIInstall ccppr_lldb

local extension_path = string.format("/User/%s/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/", os.getenv "USER")
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local funcs = require("user.utils.funcs")
local lsp_path = string.format("%s/", vim.fn.stdpath("data"))

local status_ok, dap_install = pcall(require, "dap-install")
if not status_ok then
  return
end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end


if funcs.dir_exists(lsp_path .. "dapinstall/codelldb/") ~= true then
  vim.cmd("DIInstall codelldb")
end

dap_install.config("ccppr_lldb", {})

dap.adapter = require('rust-tools.dap').get_codelldb_adapter(
  codelldb_path, liblldb_path)

dap.configurations.rust = {
  {
    type = "cpp",
    request = "launch",
    name = "Launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    args = {},
    cwd = "${workspaceFolder}",
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
    stopOnEntry = false
  }
}