return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatting
				null_ls.builtins.formatting.clang_format, -- c++ formatting
				null_ls.builtins.formatting.prettierd, -- js, ts, html ... formatting
				-- null_ls.builtins.diagnostics.eslint_d, -- some issue with this so install eslint-lsp instead
				null_ls.builtins.formatting.shfmt, -- shell formatting
			},
			-- on_attach = function(client, bufnr)
			-- 	if client.support_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 		})
			-- 		vim.api.nvim_create_autocmd("BufWritePre",{
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function ()
			-- 				vim.lsp.buf.format({ bufnr = bufnr })
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
