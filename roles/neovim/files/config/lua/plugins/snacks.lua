---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(table.concat(msg, "\n"), "info", {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

function QueryChtsh()
	local language = vim.bo.filetype
	if not language then
		return
	end

	vim.ui.input({ prompt = "Enter query: " }, function(query)
		if not query then
			return
		end

		local urlEncodedQuery = query:gsub(" ", "+")
		local url = string.format("https://cht.sh/%s/%s?qT", language, urlEncodedQuery)

		local handle = io.popen("curl -s " .. url)
		local result = handle:read("*a")
		handle:close()

		if result == "" then
			result = "No results found. Please check your query or try again later."
		else
			result = result:gsub("\n+", "\n")
		end

		Snacks.win({
			text = vim.split(result, "\n"),
			file = nil,
			position = "float",
			width = 0.8,
			height = 0.6,
			ft = language,
			border = "rounded", -- Add this line to create a rounded border
			wo = {
				spell = false,
				wrap = true,
				signcolumn = "no",
				statuscolumn = "",
				conceallevel = 3,
			},
			keys = {
				q = "close",
			},
			minimal = true,
			show = true,
			fixbuf = true,
		})
	end)
end

vim.api.nvim_create_user_command("QueryChtsh", QueryChtsh, {})

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>n",
			function()
				Snacks.scratch({ ft = "markdown" })
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>N",
			function()
				Snacks.scratch()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>tn",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Toggle notifier",
		},
		{
			"<leader>hn",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Toggle notifier",
		},
	},
	opts = {
		-- Enable or disable specific features
		bigfile = { enabled = true },
		dashboard = {
			width = 60,
			row = nil, -- Dashboard position: nil for center
			col = nil, -- Dashboard position: nil for center
			pane_gap = 4, -- Empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- Autokey sequence

			-- Preset settings for dashboard sections
			preset = {
				-- Picker configuration: supports `fzf-lua`, `telescope.nvim`, and `mini.pick`
				pick = nil,
				-- Custom keymaps for dashboard keys section
				keys = {
					{ icon = " ", key = "f", desc = "[F]ind File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "[N]ew File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "[G]rep Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "[R]ecent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Neovim [C]onfig",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "l",
						desc = "[L]azy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "[Q]uit", action = ":qa" },
				},
				-- Dashboard header ASCII art
				header = [[
██████╗  █████╗ ██████╗ ██╗  ██╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ████╗  ██║██║   ██║██║████╗ ████║
██║  ██║███████║██████╔╝█████╔╝     ██╔██╗ ██║██║   ██║██║██╔████╔██║
██║  ██║██╔══██║██╔══██╗██╔═██╗     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝██║  ██║██║  ██║██║  ██╗    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},

			-- Item field formatters
			formats = {
				icon = function(item)
					if item.file and (item.icon == "file" or item.icon == "directory") then
						return M.icon(item.file, item.icon)
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},

			-- Dashboard sections
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},

		-- Additional feature configurations
		gitbrowse = { enabled = true },
		input = { enabled = true },
		lazygit = { configure = false },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = {
			left = { "git", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "mark" }, -- priority of signs on the right (high to low)
		},
		words = { enabled = true },
		win = {},
	},
}
