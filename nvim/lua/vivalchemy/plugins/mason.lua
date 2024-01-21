return {
	"williamboman/mason",
	config = function()
		-- print("hello")
	end,
	-- -- mason-lspconfig requires that these setup functions are called in this order
	-- -- before setting up the servers.
	-- require("mason").setup()
	-- require("mason-lspconfig").setup()
	-- -- Enable the following language servers
	-- --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
	-- --
	-- --  Add any additional override configuration in the following tables. They will be passed to
	-- --  the `settings` field of the server config. You must look up that documentation yourself.
	-- --
	-- --  If you want to override the default filetypes that your language server will attach to you can
	-- --  define the property 'filetypes' to the map in question.
	-- 	servers = {
	-- 	clangd = {},
	-- 	-- gopls = {},
	-- 	-- pyright = {},
	-- 	rust_analyzer = {},
	-- 	tsserver = {},
	--   tailwindcss = {},
	-- 	html = { filetypes = { "html", "twig", "hbs" } },
	--   eslint = {},
	--
	-- 	lua_ls = {
	-- 		Lua = {
	-- 			workspace = { checkThirdParty = false },
	-- 			telemetry = { enable = false },
	-- 			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
	-- 			-- diagnostics = { disable = { 'missing-fields' } },
	-- 		},
	-- 	},
	-- }
}
