local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

--   git add
--   git mod
--   git remove
--   git ignore
--   git rename
--   error
--   info
--   question
--   warning
--   lightbulb

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = "ﯦ " },
  -- diagnostics_color = {
  --   color_error = { fg = colors.red },
  --   color_warn = { fg = colors.yellow },
  --   color_info = { fg = colors.cyan },
  --   color_hint = { fg = colors.violet },
  -- },
  -- diagnostics_color = {
  --   -- Same values as the general color option can be used here.
  --   error = 'DiagnosticError', -- Changes diagnostics' error color.
  --   warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
  --   info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
  --   hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
  -- },
	-- colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = hide_in_width
}

local mode = {
	"mode",
	icons_enabled = true, -- Enables the display of icons alongside the component.
  icon = "",           -- Defines the icon to be displayed in front of the component.
  padding = 1,          -- Adds padding to the left and right of components.
  -- section_separators = { left = "", right = "" },
  separator = { left = "", right = "" },
	fmt = function(str)
		-- return "-- " .. str .. " --"
    return str
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- https://copyglyphs.com/
-- https://www.glyphy.io/
-- component_separators = { left = "", right = "" },
-- section_separators = { left = "", right = "" },
-- component_separators = { left = "", right = "" },
-- section_separators = { left = "", right = "" },
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "ayu_mirage",
    component_separators = "",
    section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { 
      {
        progress,
        padding = 1,          -- Adds padding to the left and right of components.
        -- separator = { left = "", right = "" },
      },
    },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})
-- mode_icons = {
--   n = " NORMAL",
--   i = " INSERT",
--   c = " COMMAND",
--   v = " VISUAL",
--   V = " VISUAL"
-- },