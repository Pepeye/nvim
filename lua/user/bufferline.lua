local icons = require("user.lsp.kind").bufferline
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = icons.indicator_icon,
    buffer_close_icon = icons.buffer_close_icon,
    -- buffer_close_icon = '',
    modified_icon = icons.modified_icon,
    close_icon = icons.close_icon,
    -- close_icon = '',
    left_trunc_marker = icons.left_trunc_marker,
    right_trunc_marker= icons.left_trunc_marker,
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    -- diagnostics = false, -- | "nvim_lsp" | "coc",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
      {
        filetype = "DiffviewFiles",
        text = "Diff",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
      {
        filetype = "flutterToolsOutline",
        text = "Flutter Outline",
        highlight = "PanelHeading",
        text_align = "left"
      },
      {
        -- ensure symbols outline order has scopes first
        filetype = "dapui",
        text = "Debugger",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
      {
        -- ensure symbols outline order has scopes first
        filetype = "dapui_scopes",
        text = "Debugger",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
      {
        filetype = "Outline",
        text = "Symbols",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
      {
        filetype = "undotree",
        text = "Undotree",
        highlight = "PanelHeading",
        padding = 1,
        text_align = "left"
      },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Tests", -- Mandatory
          highlight = {gui = "underline", guisp = "#98c379"}, -- Optional
          icon = icons.groups.test, -- Optional
          matcher = function(buf) -- Mandatory
            return buf.filename:match('%.test') or buf.filename:match('%.spec')
          end,
        },
        {
          name = "Docs",
          highlight = {gui = "undercurl", guisp = "#56b6c2"},
          icon = icons.groups.docs,
          matcher = function(buf)
            return buf.filename:match('%.md') or buf.filename:match('%.txt')
          end,
        },
      },
    },
  },
  highlights = {
    fill = {
      guifg = { attribute = "fg", highlight = "#ff0000" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    background = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    -- buffer_selected = {
    --   guifg = {attribute='fg',highlight='#ff0000'},
    --   guibg = {attribute='bg',highlight='#0000ff'},
    --   gui = 'none'
    --   },
    buffer_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    close_button = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    close_button_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    -- close_button_selected = {
    --   guifg = {attribute='fg',highlight='TabLineSel'},
    --   guibg ={attribute='bg',highlight='TabLineSel'}
    --   },

    tab_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    tab = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    tab_close = {
      -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },

    duplicate_selected = {
      guifg = { attribute = "fg", highlight = "TabLineSel" },
      guibg = { attribute = "bg", highlight = "TabLineSel" },
      gui = "italic",
    },
    duplicate_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },
    duplicate = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
      gui = "italic",
    },

    modified = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    modified_selected = {
      guifg = { attribute = "fg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    modified_visible = {
      guifg = { attribute = "fg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },

    separator = {
      guifg = { attribute = "bg", highlight = "TabLine" },
      guibg = { attribute = "bg", highlight = "TabLine" },
    },
    separator_selected = {
      guifg = { attribute = "bg", highlight = "Normal" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
    -- separator_visible = {
    --   guifg = {attribute='bg',highlight='TabLine'},
    --   guibg = {attribute='bg',highlight='TabLine'}
    --   },
    indicator_selected = {
      guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
      guibg = { attribute = "bg", highlight = "Normal" },
    },
  },
}
