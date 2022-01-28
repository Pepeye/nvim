local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
local random_headers = function()
  math.randomseed(os.time())
  local headers = {
    {
    [[]],
    [[                      ██████                     ]],
    [[                  ████▒▒▒▒▒▒████                 ]],
    [[                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██               ]],
    [[              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██             ]],
    [[            ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒               ]],
    [[            ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓           ]],
    [[            ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓           ]],
    [[          ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██         ]],
    [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
    [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
    [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
    [[          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██         ]],
    [[          ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██         ]],
    [[          ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██         ]],
    [[          ██      ██      ████      ████         ]],
    [[                                                 ]],
    [[]],
    },
    {
    [[]],
    [[   ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓  ]],
    [[   ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒  ]],
    [[  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░  ]],
    [[  ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██   ]],
    [[  ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒  ]],
    [[  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░  ]],
    [[  ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░  ]],
    [[     ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░     ]],
    [[           ░    ░  ░    ░ ░        ░   ░         ░     ]],
    [[                                  ░                    ]],
    [[]],
    },
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    }
  }
  return headers[math.random(1, #headers)]
end

dashboard.section.header.val = random_headers
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
	dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
	-- dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	-- dashboard.button("s", "  Find Session", ":Telescope sessions save_current=false <CR>"),
	dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}
-- 
local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
  -- string.format("Hello %s, the value of key %s is %s", name, k, v)
	-- return "[  ] | [  ] | [ pepeye.dev ]"
  -- return os.getenv "USER"
  return string.format("[  | %s.dev ]", os.getenv "USER")
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
