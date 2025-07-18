-- ================================
--         nvim-tree Plugin
-- ================================

return {
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = true,
			auto_reload_on_write = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			view = {
				width = 40,
				side = "left",
				number = false,
				relativenumber = false,
			},
			renderer = {
				highlight_git = true,
				indent_markers = {
					enable = false,
				},
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}

