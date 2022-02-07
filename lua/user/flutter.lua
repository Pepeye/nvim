local status_ok, flutter = pcall(require, "flutter-tools")
if not status_ok then
	return
end

flutter.setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    }
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
    run_via_dap = true,
  },-- use dap instead of a plenary job to run flutter apps 
  widget_guides = { enabled = true, debug = true },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    }
  }
}
