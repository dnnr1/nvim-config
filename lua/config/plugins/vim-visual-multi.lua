-- ================================
--     Vim visual multi Plugin
-- ================================

return {
	"mg979/vim-visual-multi",
	lazy = false,
	keys = {
		{ "<C-n>", mode = { "n", "v" }, desc = "Select next occurrence" },
		{ "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", mode = "n", desc = "Add cursor Down" },
		{ "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", mode = "n", desc = "Add cursor Up" },
		{ "<C-a>", "<Plug>(VM-Select-All)", mode = "n", desc = "Select all occurrences" },
	},
}
