local kind = require("user.lsp.kind").symbols_outline
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	width = 50,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = kind.File, hl = "CmpItemKindFile" },
		Module = { icon = kind.Module, hl = "CmpItemKindModule" },
		Namespace = { icon = kind.Namespace, hl = "CmpItemKindModule" },
		Package = { icon = kind.Package, hl = "CmpItemKindModule" },
		Class = { icon = kind.Class, hl = "CmpItemKindClass" },
		Method = { icon = kind.Method, hl = "CmpItemKindMethod" },
		Property = { icon = kind.Property, hl = "CmpItemKindProperty" },
		Field = { icon = kind.File, hl = "CmpItemKindField" },
		Constructor = { icon = kind.Constructor, hl = "CmpItemKindConstructor" },
		Enum = { icon = kind.Enum, hl = "CmpItemKindEnum" },
		Interface = { icon = kind.Interface, hl = "CmpItemKindInterface" },
		Function = { icon = kind.Function, hl = "CmpItemKindFunction" },
		Variable = { icon = kind.Variable, hl = "CmpItemKindVariable" },
		Constant = { icon = kind.Constant, hl = "CmpItemKindConstant" },
		String = { icon = kind.String, hl = "TSString" },
		Number = { icon = kind.Number, hl = "TSNumber" },
		Boolean = { icon = kind.Boolean, hl = "TSBoolean" },
		Array = { icon = kind.Array, hl = "TSKeyword" },
		Object = { icon = kind.Object, hl = "TSKeyword" },
		Key = { icon = kind.Key, hl = "CmpItemKeyword" },
		Null = { icon = kind.Null, hl = "TSKeyword" },
		EnumMember = { icon = kind.EnumMember, hl = "CmpItemKindEnumMember" },
		Struct = { icon = kind.Struct, hl = "CmpItemKindStruct" },
		Event = { icon = kind.Event, hl = "CmpItemKindEvent" },
		Operator = { icon = kind.Operator, hl = "CmpItemKindOperator" },
		TypeParameter = { icon = kind.TypeParameter, hl = "CmpItemKindTypeParameter" },
	},
}