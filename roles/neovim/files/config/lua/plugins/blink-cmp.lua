return {
	"saghen/blink.cmp",
	-- version = "v0.*",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
		},
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	version = "v2.*",
		-- 	config = function()
		-- 		require("luasnip.loaders.from_vscode").lazy_load({
		-- 			paths = { vim.fn.stdpath("data") .. "/vscode-snippets/" },
		-- 		})
		-- 		require("luasnip.loaders.from_lua").lazy_load({
		-- 			paths = { vim.fn.stdpath("data") .. "/lua-snippets" },
		-- 		})
		-- 		require("luasnip").filetype_extend("typescript", { "tsdoc" })
		-- 		require("luasnip").filetype_extend("javascript", { "jsdoc" })
		-- 		require("luasnip").filetype_extend("lua", { "luadoc" })
		-- 		require("luasnip").filetype_extend("python", { "pydoc" })
		-- 		require("luasnip").filetype_extend("rust", { "rustdoc" })
		-- 		require("luasnip").filetype_extend("cs", { "csharpdoc" })
		-- 		require("luasnip").filetype_extend("java", { "javadoc" })
		-- 		require("luasnip").filetype_extend("c", { "cdoc" })
		-- 		require("luasnip").filetype_extend("cpp", { "cppdoc" })
		-- 		require("luasnip").filetype_extend("php", { "phpdoc" })
		-- 		require("luasnip").filetype_extend("kotlin", { "kdoc" })
		-- 		require("luasnip").filetype_extend("ruby", { "rdoc" })
		-- 		require("luasnip").filetype_extend("sh", { "shelldoc" })
		-- 		require("luasnip").filetype_extend("javascriptreact", { "html" })
		-- 		require("luasnip").filetype_extend("typescriptreact", { "html" })
		-- 	end,
		-- },
	},
	opts = {
		-- snippets = {
		-- 	expand = function(snippet)
		-- 		require("luasnip").lsp_expand(snippet)
		-- 	end,
		-- 	active = function(filter)
		-- 		if filter and filter.direction then
		-- 			return require("luasnip").jumpable(filter.direction)
		-- 		end
		-- 		return require("luasnip").in_snippet()
		-- 	end,
		-- 	jump = function(direction)
		-- 		require("luasnip").jump(direction)
		-- 	end,
		-- },
		keymap = {
			preset = "default",
			["<Tab>"] = { "select_and_accept" },
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
			["<A-6>"] = {
				function(cmp)
					cmp.accept({ index = 6 })
				end,
			},
			["<A-7>"] = {
				function(cmp)
					cmp.accept({ index = 7 })
				end,
			},
			["<A-8>"] = {
				function(cmp)
					cmp.accept({ index = 8 })
				end,
			},
			["<A-9>"] = {
				function(cmp)
					cmp.accept({ index = 9 })
				end,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },

			providers = {
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					opts = {
						friendly_snippets = true,
						search_paths = {
							vim.fn.stdpath("data") .. "/vscode-snippets",
						},
						global_snippets = { "all" },
						extended_filetypes = {},
						ignored_filetypes = {},
						get_filetype = function(context)
							return vim.bo.filetype
						end,
					},
				},
				-- luasnip = {
				-- 	name = "Luasnip",
				-- 	module = "blink.cmp.sources.luasnip",
				-- 	opts = {
				-- 		--      search_paths = {
				-- 		-- vim.fn.stdpath("data") .. "/vscode-snippets",
				-- 		-- vim.fn.stdpath("data") .. "/lua-snippets",
				-- 		--      }
				-- 		-- Whether to use show_condition for filtering snippets
				-- 		use_show_condition = true,
				-- 		-- Whether to show autosnippets in the completion list
				-- 		show_autosnippets = true,
				-- 	},
				-- },
			},
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
	},
}
