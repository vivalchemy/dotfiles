return {
	"mason-org/mason.nvim",
	-- cmd = "Mason",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"saghen/blink.cmp",
			cond = function()
				return not pcall(require, "cmp_nvim_lsp")
			end,
		},
		-- "hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Define LSP servers to be installed
		local servers = {
			-- clangd = {}, -- annoying for protobuf files
			gopls = {},
			-- htmx = {
			-- 	filetypes = { "html", "templ", "svelte", "javascriptreact" },
			-- },
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			-- pyright = {},
			rust_analyzer = {},
			-- svelte = {},
			-- templ = {},
			tailwindcss = {},
			ts_ls = {},
		}

		-- Prepare capabilities for LSP servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if ok then
			capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
		else
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))
		end
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		-- Ensure installation of servers and additional tools
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Setup LSP servers
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
