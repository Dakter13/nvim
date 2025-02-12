return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pylsp", "dockerls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Настройка LSP для Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Настройка LSP для TypeScript
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			-- Настройка LSP для Python
			lspconfig.pylsp.setup({ capabilities = capabilities })

			-- Настройка LSP для Docker
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			-- Горячие клавиши для LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
