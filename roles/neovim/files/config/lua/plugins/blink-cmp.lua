-- @blink.opts
local opts = {
	cmdline = { enabled = false },
	snippets = {
		preset = "luasnip",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	signature = {
		enabled = true,
	},
	completion = {
		menu = {
			border = "rounded",
			draw = {
				columns = {
					{ "item_idx", "label", "label_description", gap = 1 },
					{ "kind_icon" },
					-- { "kind", "kind_icon", "source_name", gap = 1 },
				},
				components = {
					item_idx = {
						text = function(ctx)
							return tostring(ctx.idx)
						end,
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			window = {
				border = "rounded",
				max_width = 60,
				max_height = 20,
			},
		},
	},

	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		["<A-1>"] = {
			function(cmp)
				cmp.accept({ index = 1 })
			end,
		},
		["<A-2>"] = {
			function(cmp)
				cmp.accept({ index = 2 })
			end,
		},
		["<A-3>"] = {
			function(cmp)
				cmp.accept({ index = 3 })
			end,
		},
		["<A-4>"] = {
			function(cmp)
				cmp.accept({ index = 4 })
			end,
		},
		["<A-5>"] = {
			function(cmp)
				cmp.accept({ index = 5 })
			end,
		},
	},
}
return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = {
				vim.fn.stdpath("data") .. "/lazy/friendly-snippets",
				vim.fn.stdpath("data") .. "/vscode-snippets",
			},
		})
		require("luasnip.loaders.from_lua").lazy_load({
			paths = { vim.fn.stdpath("data") .. "/lua-snippets" },
		})
		require("blink.cmp").setup(opts)
	end,
}
