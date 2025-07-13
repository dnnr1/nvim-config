-- ================================
--          Illuminate
-- ================================

return {
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 100,
			under_cursor = false,
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
}
