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

    -- server
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
      -- on_attach is a callback called when the language server attachs to the buffer
      -- on_attach = on_attach,
      settings = {
        -- to enable rust-analyzer settings visit:
        -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
        ["rust-analyzer"] = {
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
          diagnostics = {
            enable = true,
            -- disabled = { "unresolved-proc-macro" },
            enableExperimental = true,
          },
          -- enable clippy on save
          checkOnSave = {
            command = "clippy"
          },
        }
      }
    },
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
