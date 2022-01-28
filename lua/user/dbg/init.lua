require("telescope").load_extension("dap")

-- loop to configure every installed debugger with defaults
local status_ok, dap_install = pcall(require, "dap-install")
if not status_ok then
  return
end

local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

-- custom debugger configs
-- require "user.dbg.node"
-- require "user.dbg.rust"