-- ================================
--         Mason Configuration
-- ================================

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = {
				"bashls",
				"dockerls",
				"jsonls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"clangd",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
				"markdownlint",
			},
		})
	end,
}
