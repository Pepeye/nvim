local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
    return
end
rust_tools.setup {
  opts = {
    tools = { -- rust-tools options
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
        runnables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true
            -- rest of the opts are forwarded to telescope
        },

        debuggables = {
            -- whether to use telescope for selection menu or not
            use_telescope = true
            -- rest of the opts are forwarded to telescope
        },

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },

        hover_actions = {
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },
            auto_focus = false
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        -- crate_graph = {
        --     -- Backend used for displaying the graph
        --     -- see: https://graphviz.org/docs/outputs/
        --     -- default: x11
        --     backend = "x11",
        --     -- where to store the output, nil for no output stored (relative
        --     -- path from pwd)
        --     -- default: nil
        --     output = nil,
        --     -- true for all crates.io and external crates, false only the local
        --     -- crates
        --     -- default: true
        --     full = true,
        -- }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    -- server = {} -- rust-analyer options
  },
}
