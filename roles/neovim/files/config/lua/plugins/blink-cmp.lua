return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source

	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = { vim.fn.stdpath("data") .. "/vscode-snippets/" },
				})
				require("luasnip.loaders.from_lua").lazy_load({
					paths = { vim.fn.stdpath("data") .. "/lua-snippets/" },
				})
				require("luasnip").filetype_extend("typescript", { "tsdoc" })
				require("luasnip").filetype_extend("javascript", { "jsdoc" })
				require("luasnip").filetype_extend("lua", { "luadoc" })
				require("luasnip").filetype_extend("python", { "pydoc" })
				require("luasnip").filetype_extend("rust", { "rustdoc" })
				require("luasnip").filetype_extend("cs", { "csharpdoc" })
				require("luasnip").filetype_extend("java", { "javadoc" })
				require("luasnip").filetype_extend("c", { "cdoc" })
				require("luasnip").filetype_extend("cpp", { "cppdoc" })
				require("luasnip").filetype_extend("php", { "phpdoc" })
				require("luasnip").filetype_extend("kotlin", { "kdoc" })
				require("luasnip").filetype_extend("ruby", { "rdoc" })
				require("luasnip").filetype_extend("sh", { "shelldoc" })
				require("luasnip").filetype_extend("javascriptreact", { "html" })
				require("luasnip").filetype_extend("typescriptreact", { "html" })
			end,
		},
		{

			-- `friendly-snippets` contains a variety of premade snippets.
			--    See the README about individual language/framework/plugin snippets:
			--    https://github.com/rafamadriz/friendly-snippets
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		-- {
		--
		-- 	"saadparwaiz1/cmp_luasnip",
		-- 	-- Adds other completion capabilities.
		-- 	--  nvim-cmp does not ship with all sources by default. They are split
		-- 	--  into multiple repos for maintenance purposes.
		-- },
		-- {
		--
		-- 	"hrsh7th/cmp-nvim-lsp",
		-- },
		-- {
		--
		-- 	"hrsh7th/cmp-path",
		-- },
	},
	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---module 'blink.cmp' (add @ at the start for autocompletion)
	---type blink.cmp.Config
	opts = {
		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = {
			preset = "default",
			-- ["K"] = { "show", "show_documentation", "hide_documentation" },
			--   ['<C-e>'] = { 'hide' },
			-- ["<CR>"] = { "select_and_accept" }, -- enter is hijacked so don't use it for now
			-- ["<C-CR>"] = { "select_and_accept" },
			--
			--   ['<C-p>'] = { 'select_prev', 'fallback' },
			--   ['<C-n>'] = { 'select_next', 'fallback' },
			--
			--   ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			--   ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			-- These are the defaults
			--   ['<Tab>'] = { 'snippet_forward', 'fallback' },
			--   ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			-- Might as well work with default
			-- ["<C-l>"] = { "snippet_forward", "fallback" },
			-- ["<C-h>"] = { "snippet_backward", "fallback" },
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

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		--
		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`

		--- @module 'blink.cmp'
		completion = {
			menu = {
				border = "rounded",
				--- @type blink.cmp.Draw
				draw = {
					columns = {
						{ "item_idx", "label", "label_description", gap = 1 },
						{ "kind_icon", "source_name", gap = 1 },
						-- label, label_description, kind, kind_icon, source_name,
					},
					components = {
						item_idx = {
							text = function(ctx)
								return tostring(ctx.idx)
							end,
							-- highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
						},
					},
				},
			},
			documentation = {
				auto_show = false,
				window = {
					border = "rounded",
					max_width = 60,
					max_height = 20,
				},
			},
		},
		sources = {
			default = { "lsp", "luasnip", "path", "snippets", "buffer" },
			--   -- optionally disable cmdline completions
			--   cmdline = {},
			providers = {
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					opts = {
						friendly_snippets = true,
						search_paths = {
							vim.fn.stdpath("data") .. "/vscode-snippets",
							vim.fn.stdpath("data") .. "/lua-snippets",
						},
						global_snippets = { "all" },
						extended_filetypes = {},
						ignored_filetypes = {},
						get_filetype = function(context)
							return vim.bo.filetype
						end,
					},
				},
				luasnip = {
					name = "Luasnip",
					module = "blink.cmp.sources.luasnip",
					opts = {
						-- Whether to use show_condition for filtering snippets
						use_show_condition = true,
						-- Whether to show autosnippets in the completion list
						show_autosnippets = true,
					},
				},
			},
		},

		-- experimental signature help support
		signature = { enabled = true },
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	-- opts_extend = { "sources.default" },
}

-- TODO: Remove the abomination of a code
-- TODO: Get the luasnip working. it loads the snippets but doesn't show them in them
